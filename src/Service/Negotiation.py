from decimal import Decimal

from Domain.Entities.Client import Client
from Domain.Entities.Seller import Seller
from Domain.Entities.Product import Product
from Domain.Entities.Location import Location
from Domain.Entities.LocationPrice import LocationPrice
from Domain.Entities.City import City
from Domain.Entities.CityPrice import CityPrice
from Domain.Entities.State import State
from Domain.Entities.StatePrice import StatePrice
from Domain.Entities.Segment import Segment

from Domain.DBModels.LocationPrice import LocationPriceModel, LocationModel
from Domain.DBModels.CityPrice import CityPriceModel, CityModel
from Domain.DBModels.StatePrice import StatePriceModel, StateModel
from Domain.DBModels.Segment import SegmentModel
from Domain.DBModels.Client import ClientModel

from Domain.DTO.Negotiation import NegotiationDTO


def get_highest_client_tpv():
    highest_tpv = ClientModel(
        **ClientModel.query.order_by(
            ClientModel.tpv.desc()
            ).first().as_dict()
        ).tpv
    return highest_tpv


class Negotiation:
    def __init__(self: object, client: Client, seller: Seller, 
                 product: Product, price_offer: Decimal):
        self.client = client
        self.seller = seller
        self.product = product
        self.price_offer = price_offer
        self.segment = self.get_segment()
        self.location = self.get_location()
        self.location_price = self.get_location_price()
        self.city = self.get_city()
        self.city_price = self.get_city_price()
        self.state = self.get_state()
        self.state_price = self.get_state_price()
        self.level = self.get_negotiation_level()
        self.minimum_price = self.get_minimum_price()
        self.final_price = self.get_final_price()


    def get_segment(self):
        segment = Segment(
            **SegmentModel.query.filter(
                SegmentModel.id == self.client.segment_id
            ).first().as_dict()
        )
        return segment

    def get_location(self):
        location = Location(
            **LocationModel.query
            .filter(
                LocationModel.id == self.client.location_id
            ).first().as_dict()
        )
        return location

    def get_location_price(self):
        location_price = LocationPrice(
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

    def get_city(self):
        city = City(
            **CityModel.query
            .filter(
                CityModel.id == self.location.city_id
            ).first().as_dict()
        )
        return city
    
    def get_city_price(self):
        city_price = CityPrice(
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

    def get_state(self):
        state = State(
            **StateModel.query.filter(
                StateModel.id == self.location.state_id
            ).first().as_dict()
        )
        return state

    def get_state_price(self):
        state_price = StatePrice(
            **StatePriceModel.query.filter(
                StatePriceModel.state_id == self.state.id
            ).filter(
                StatePriceModel.product_id == self.product.id
            ).filter(
                StatePriceModel.segment_id == self.segment.id
            ).first().as_dict()
        )
        return state_price

    def get_possible_prices(self):
        prices = [
            self.location_price.price, 
            self.city_price.price, 
            self.state_price.price
        ]
        prices.sort()
        prices.reverse()
        return prices

    def get_negotiation_level(self):
        highest_level = max(
            [
                self.seller.type, 
                self.client.get_client_level(
                    get_highest_client_tpv()
                )
            ]
        )
        return highest_level

    def get_minimum_price(self):
        possible_prices = self.get_possible_prices()
        minimum_price = possible_prices[self.level - 1]
        return minimum_price

    def price_offer_is_higher_than_minimum(self):
        return True if self.price_offer >= self.minimum_price else False

    def get_final_price(self):
        final_price = self.price_offer if self.price_offer_is_higher_than_minimum() else self.minimum_price
        return final_price

    def monthly_profits_and_looses(self):
        if self.product.id == 1:
            revenue = self.final_price * self.client.tpv / 10
            income_taxes = revenue * 0.1125
            expenses = (self.product.fabrication_costs / 10) + (self.location_price.transportation_price / 10) + income_taxes
            profit = revenue - income_taxes - expenses

        elif self.prduct.id == 2:
            revenue = (self.final_price / 10)
            income_taxes = revenue * 0.1125
            expenses = (self.product.fabrication_costs / 10) + (self.location_price.transportation_price / 10) + income_taxes
            profit = revenue - income_taxes - expenses

        elif self.product.id == 3:
            revenue = self.final_price
            income_taxes = revenue * 0.1125
            expenses = (self.product.fabrication_costs / 10) + (self.location_price.transportation_price / 10) + income_taxes
            profit = revenue - income_taxes - expenses



new_negotiation = Negotiation(
    **NegotiationDTO(
        **{
            "client_id": 1, 
            "seller_id": 3, 
            "product_id": 3, 
            "price_offer": 500.00
        }
    ).__dict__
)

print(new_negotiation.level)

print(new_negotiation.get_possible_prices())

print(new_negotiation.get_minimum_price())
