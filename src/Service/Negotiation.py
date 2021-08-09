from decimal import Decimal
from Domain.Entities.Client import Client
from Domain.Entities.Seller import Seller
from Domain.Entities.Product import Product
from Domain.DTO.Negotiation import NegotiationDTO


class Negotiation:
    def __init__(self: object, client: Client, seller: Seller, 
                 product: Product, price_offer: Decimal):
        self.client = client
        self.seller = seller
        self.product = product
        self.price_offer = price_offer
