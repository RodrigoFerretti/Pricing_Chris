from decimal import Decimal

from src.Domain.DBModels.Client import ClientModel
from src.Domain.DBModels.Seller import SellerModel
from src.Domain.DBModels.Product import ProductModel

from src.Domain.Entities.Client import Client
from src.Domain.Entities.Seller import Seller
from src.Domain.Entities.Product import Product

from src.Application.Exceptions.NotFoundException import NotFoundException


class NegotiationRequestDTO:
    def __init__(self: object, client_id: int, seller_id: int, product_id: int, price_offer: float):
        self.client: Client = self.get_client_by_id(client_id)
        self.seller: Seller = self.get_seller_by_id(seller_id)
        self.product: Product = self.get_product_by_id(product_id)
        self.price_offer: Decimal = Decimal(price_offer)

    def get_client_by_id(self: object, client_id: int):
        try:
            client: Client = Client(
                **ClientModel.query.filter(
                    ClientModel.id == client_id
                ).first().as_dict()
            )
            return client
        except Exception:
            raise NotFoundException(ClientModel)

    def get_seller_by_id(self: object, seller_id: int):
        try:
            seller: Seller = Seller(
                **SellerModel.query.filter(
                    SellerModel.id == seller_id
                ).first().as_dict()
            )
            return seller
        except Exception:
            raise NotFoundException(SellerModel)

    def get_product_by_id(self: object, product_id: int):
        try:
            product: Product = Product(
                **ProductModel.query.filter(
                    ProductModel.id == product_id
                ).first().as_dict()
            )
            return product
        except Exception:
            raise NotFoundException(ProductModel)
