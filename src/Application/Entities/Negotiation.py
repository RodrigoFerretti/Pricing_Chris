from decimal import Decimal

from src.Domain.Entities.Client import Client
from src.Domain.Entities.Seller import Seller
from src.Domain.Entities.Product import Product
from src.Domain.Entities.Location import Location
from src.Domain.Entities.LocationPrice import LocationPrice
from src.Domain.Entities.City import City
from src.Domain.Entities.CityPrice import CityPrice
from src.Domain.Entities.State import State
from src.Domain.Entities.StatePrice import StatePrice
from src.Domain.Entities.Segment import Segment

from src.Domain.DBModels.LocationPrice import LocationPriceModel, LocationModel
from src.Domain.DBModels.CityPrice import CityPriceModel, CityModel
from src.Domain.DBModels.StatePrice import StatePriceModel, StateModel
from src.Domain.DBModels.Segment import SegmentModel
from src.Domain.DBModels.Client import ClientModel

from src.Application.Entities.ProfitsAndLooses import ProfitsAndLooses
from src.Application.Exceptions.NotFoundException import NotFoundException


class Negotiation:
    def __init__(self: object, client: Client, seller: Seller, 
                 product: Product, price_offer: Decimal):
        self.client: Client = client
        self.seller: Seller = seller
        self.product: Product = product
        self.price_offer: Decimal = price_offer
        self.segment: Segment = self.get_segment()
        self.location: Location = self.get_location()
        self.location_price: LocationPrice = self.get_location_price()
        self.city: City = self.get_city()
        self.city_price: CityPrice = self.get_city_price()
        self.state: State = self.get_state()
        self.state_price: StatePrice = self.get_state_price()
        self.level: int = self.get_negotiation_level()
        self.possible_prices: list = self.get_possible_prices()
        self.minimum_price: Decimal = self.get_minimum_price()
        self.price_offer_is_higher_than_minimum: bool = self.get_price_offer_is_higher_than_minimum()
        self.final_price: Decimal = self.get_final_price()
        self.monthly_profits_and_looses: ProfitsAndLooses = self.get_monthly_profits_and_looses()

    def get_segment(self: object):
        try:
            segment: Segment = Segment(
                **SegmentModel.query.filter(
                    SegmentModel.id == self.client.segment_id
                ).first().as_dict()
            )
            return segment
        except Exception:
            raise NotFoundException(SegmentModel)

    def get_location(self: object):
        try:
            location: Location = Location(
                **LocationModel.query
                .filter(
                    LocationModel.id == self.client.location_id
                ).first().as_dict()
            )
            return location
        except Exception:
            raise NotFoundException(LocationModel)

    def get_location_price(self: object):
        try:
            location_price: LocationPrice = LocationPrice(
                **LocationPriceModel.query
                .filter(
                    LocationPriceModel.location_id == self.location.id
                ).filter(
                    LocationPriceModel.product_id == self.product.id
                ).filter(
                    LocationPriceModel.segment_id == self.segment.id
                ).first().as_dict()
            )
            return location_price
        except Exception:
            raise NotFoundException(LocationPriceModel)

    def get_city(self: object):
        try:
            city: City = City(
                **CityModel.query
                .filter(
                    CityModel.id == self.location.city_id
                ).first().as_dict()
            )
            return city
        except Exception:
            raise NotFoundException(CityModel)

    def get_city_price(self: object):
        try:
            city_price: CityPrice = CityPrice(
                **CityPriceModel.query
                .filter(
                    CityPriceModel.city_id == self.city.id
                ).filter(
                    CityPriceModel.product_id == self.product.id
                ).filter(
                    CityPriceModel.segment_id == self.segment.id
                ).first().as_dict()
            )
            return city_price
        except Exception:
            raise NotFoundException(CityPriceModel)

    def get_state(self: object):
        try:
            state: State = State(
                **StateModel.query.filter(
                    StateModel.id == self.location.state_id
                ).first().as_dict()
            )
            return state
        except Exception:
            raise NotFoundException(StateModel)

    def get_state_price(self: object):
        try:
            state_price: StatePrice = StatePrice(
                **StatePriceModel.query.filter(
                    StatePriceModel.state_id == self.state.id
                ).filter(
                    StatePriceModel.product_id == self.product.id
                ).filter(
                    StatePriceModel.segment_id == self.segment.id
                ).first().as_dict()
            )
            return state_price
        except Exception:
            raise NotFoundException(StatePriceModel)

    def get_possible_prices(self: object):
        possible_prices: list(Decimal) = [
            self.location_price.price, 
            self.city_price.price, 
            self.state_price.price
        ]
        possible_prices.sort()
        possible_prices.reverse()
        return possible_prices

    def get_highest_client_tpv(self):
        highest_tpv: Decimal = ClientModel(
            **ClientModel.query.order_by(
                ClientModel.tpv.desc()
                ).first().as_dict()
            ).tpv
        return highest_tpv

    def get_negotiation_level(self: object):
        negotiation_levels: list(int) = [
            self.seller.type, 
            self.client.get_client_level(
                self.get_highest_client_tpv()
            )
        ]
        highest_level: int = max(negotiation_levels)
        return highest_level

    def get_minimum_price(self: object):
        minimum_price: Decimal = self.possible_prices[self.level - 1]
        return minimum_price

    def get_price_offer_is_higher_than_minimum(self: object):
        price_offer_is_higher_than_minimum: bool = True if self.price_offer >= self.minimum_price else False
        return price_offer_is_higher_than_minimum

    def get_final_price(self: object):
        final_price: Decimal = self.price_offer if self.price_offer_is_higher_than_minimum else self.minimum_price
        return final_price

    def get_revenue(self: object):
        if self.product.id == 1:
            revenue: Decimal = self.final_price * self.client.tpv / 10
        elif self.product.id == 2:
            revenue: Decimal = self.final_price / 10
        elif self.product.id == 3:
            revenue: Decimal = self.final_price
        return revenue

    def get_monthly_profits_and_looses(self: object):
        revenue: Decimal = self.get_revenue()
        expenses: Decimal = (self.product.fabrication_costs / 10) + (self.location_price.transportation_price / 10) + (revenue * Decimal(0.1125))
        profit: Decimal = revenue - expenses
        profits_and_looses: ProfitsAndLooses = ProfitsAndLooses(revenue, expenses, profit)
        return profits_and_looses
