from src.Application.Entities.Negotiation import Negotiation, \
    LocationPriceModel, LocationPrice, CityPriceModel, CityPrice, StatePriceModel, StatePrice
from src.Application.Exceptions.NotFoundException import NotFoundException


class PromotionNegotiation(Negotiation):

    def get_location_price(self: object):
        try:
            location_price: LocationPrice = LocationPrice(
                **LocationPriceModel.query
                .filter(
                    LocationPriceModel.location_id == self.location.id
                ).filter(
                    LocationPriceModel.product_id == self.product.id
                ).first().as_dict()
            )
            return location_price
        except Exception:
            raise NotFoundException(LocationPriceModel)

    def get_city_price(self: object):
        try:
            city_price: CityPrice = CityPrice(
                **CityPriceModel.query
                .filter(
                    CityPriceModel.city_id == self.city.id
                ).filter(
                    CityPriceModel.product_id == self.product.id
                ).first().as_dict()
            )
            return city_price
        except Exception:
            raise NotFoundException(CityPriceModel)

    def get_state_price(self: object):
        try:
            state_price: StatePrice = StatePrice(
                **StatePriceModel.query.filter(
                    StatePriceModel.state_id == self.state.id
                ).filter(
                    StatePriceModel.product_id == self.product.id
                ).first().as_dict()
            )
            return state_price
        except Exception:
            raise NotFoundException(StatePriceModel)
