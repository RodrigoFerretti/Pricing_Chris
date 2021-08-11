from decimal import Decimal

from Domain.DBModels.Client import ClientModel
from Domain.DBModels.Seller import SellerModel
from Domain.DBModels.Product import ProductModel

from Domain.Entities.Client import Client
from Domain.Entities.Seller import Seller
from Domain.Entities.Product import Product

from Service.NotFoundException import NotFoundException



class NegotiationDTO:
    def __init__(self: object, client_id: int, seller_id: int, product_id: int, price_offer: float):
        self.client: Client = self.get_client_by_id(client_id)
        self.seller: Seller = self.get_seller_by_id(seller_id)
        self.product: Product = self.get_product_by_id(product_id)
        self.price_offer: Decimal = Decimal(price_offer)

    def get_client_by_id(self, client_id):
        try:
            client: Client = Client(
                **ClientModel.query.filter(
                    ClientModel.id == client_id
                ).first().as_dict()
            )
            return client
        except Exception:
            raise NotFoundException(ClientModel)
    
    def get_seller_by_id(self, seller_id):
        try:
            seller: Seller = Seller(
                **SellerModel.query.filter(
                    SellerModel.id == seller_id
                ).first().as_dict()
            )
            return seller
        except Exception:
            raise NotFoundException(SellerModel)
    
    def get_product_by_id(self, product_id):
        try:
            product: Product = Product(
                **ProductModel.query.filter(
                    ProductModel.id == product_id
                ).first().as_dict()
            )
            return product
        except Exception:
            raise NotFoundException(ProductModel)
