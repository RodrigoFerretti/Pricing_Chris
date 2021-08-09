from decimal import Decimal
from Domain.DBModels.Client import ClientModel
from Domain.DBModels.Seller import SellerModel
from Domain.DBModels.Product import ProductModel

from Domain.Entities.Client import Client
from Domain.Entities.Seller import Seller
from Domain.Entities.Product import Product


class NegotiationDTO:
    def __init__(self: object, client_id: int, seller_id: int, product_id: int, price_offer: float):
        self.client = Client(**ClientModel.query.filter(ClientModel.id == client_id).first().as_dict())
        self.seller = Seller(**SellerModel.query.filter(SellerModel.id == seller_id).first().as_dict())
        self.product = Product(**ProductModel.query.filter(ProductModel.id == product_id).first().as_dict())
        self.price_offer = Decimal(price_offer)
