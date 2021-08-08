from Domain.Client import Client
from Domain.Seller import Seller
from Domain.Product import Product


from enforce_typing import enforce_types
from decimal import Decimal

@enforce_types
class Negotiation:
    def __init__(self: object, client: Client, seller: Seller, 
                 product: Product, price_offer: Decimal):
        self.client = client
        self.seller = seller
        self.product = product
        self.price_offer = price_offer
