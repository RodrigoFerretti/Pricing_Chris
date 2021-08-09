from decimal import Decimal
from Domain.Entities.Client import Client
from Domain.Entities.Seller import Seller
from Domain.Entities.Product import Product

from Domain.Entities.LocationPrice import LocationPrice
from Domain.Entities.Location import Location

from Domain.DBModels.LocationPrice import LocationPriceModel, LocationModel
from Domain.DBModels.Product import ProductModel

from Domain.DTO.Negotiation import NegotiationDTO

class Negotiation:
    def __init__(self: object, client: Client, seller: Seller, 
                 product: Product, price_offer: Decimal):
        self.client = client
        self.seller = seller
        self.product = product
        self.price_offer = price_offer
        self.location = self.get_location()
        self.location_price = self.get_location_price()

    def get_location(self):
        location = Location(
            **LocationModel.query.filter(
                LocationModel.id == self.client.location_id
            ).first().as_dict()
        )
        return location

    def get_location_price(self):
        location_price = LocationPrice(
            **LocationPriceModel.query.filter(
                ProductModel.id == self.product.id
            ).filter(
                LocationModel.id == self.location.id
            ).first().as_dict()
        )
        return location_price

new_negotiation = Negotiation(**NegotiationDTO(**{"client_id": 1, "seller_id": 2, "product_id": 3, "price_offer": 500.00}).__dict__)

x = ''