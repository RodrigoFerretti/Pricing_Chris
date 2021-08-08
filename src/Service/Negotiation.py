from Domain.Client import Client
from Domain.Seller import Seller
from Domain.Product import Product

from enforce_typing import enforce_types


@enforce_types
class Negotiation:
    def __init__(self: object, client: Client, seller: Seller, 
                 product: Product, price_offer: float):
        self.client = client
        self.seller = seller
        self.product = product
        self.price_offer = price_offer

