from decimal import Decimal
from src.Application.DTO.Request.Negotiation import NegotiationRequestDTO
from src.Application.Entities.Negotiation import Negotiation
from src.Application.Entities.Promotion import PromotionNegotiation
from src.Application.Service.Negotiation import negotiation_service


def test_low_client_high_seller_first_product_low_price_offer():
    new_negotiation: Negotiation = Negotiation(
        **NegotiationRequestDTO(
            **{
                "client_id": 1, 
                "seller_id": 3, 
                "product_id": 1, 
                "price_offer": 0.10
            }
        ).__dict__
    )

    assert new_negotiation.level == 3
    assert new_negotiation.price_offer_is_higher_than_minimum == False
    assert new_negotiation.minimum_price == new_negotiation.possible_prices[new_negotiation.level -1]
    assert new_negotiation.final_price == new_negotiation.minimum_price
    assert new_negotiation.monthly_profits_and_looses.revenue == Decimal('125.00')
    assert new_negotiation.monthly_profits_and_looses.profit_percentage == Decimal('0.46')


def test_low_client_low_seller_first_product_high_price_offer():
    new_negotiation: Negotiation = Negotiation(
        **NegotiationRequestDTO(
            **{
                "client_id": 1, 
                "seller_id": 1, 
                "product_id": 1, 
                "price_offer": 1.60
            }
        ).__dict__
    )

    assert new_negotiation.level == 1
    assert new_negotiation.price_offer_is_higher_than_minimum == True
    assert new_negotiation.minimum_price == new_negotiation.possible_prices[new_negotiation.level -1]
    assert new_negotiation.final_price == new_negotiation.price_offer
    assert new_negotiation.monthly_profits_and_looses.revenue == Decimal('160.00')
    assert new_negotiation.monthly_profits_and_looses.profit_percentage == Decimal('0.55')


def test_high_client_high_seller_first_product_low_price_offer():
    new_negotiation: Negotiation = Negotiation(
        **NegotiationRequestDTO(
            **{
                "client_id": 3, 
                "seller_id": 3, 
                "product_id": 1, 
                "price_offer": 1.20
            }
        ).__dict__
    )
    
    assert new_negotiation.level == 3
    assert new_negotiation.price_offer_is_higher_than_minimum == False
    assert new_negotiation.minimum_price == new_negotiation.possible_prices[new_negotiation.level -1]
    assert new_negotiation.final_price == new_negotiation.minimum_price
    assert new_negotiation.monthly_profits_and_looses.revenue == Decimal('1980.00')
    assert new_negotiation.monthly_profits_and_looses.profit_percentage == Decimal('0.86')


def test_mid_client_low_seller_second_product_low_price_offer():
    new_negotiation: Negotiation = Negotiation(
        **NegotiationRequestDTO(
            **{
                "client_id": 2, 
                "seller_id": 1, 
                "product_id": 2, 
                "price_offer": 250.00
            }
        ).__dict__
    )

    assert new_negotiation.level == 2
    assert new_negotiation.price_offer_is_higher_than_minimum == False
    assert new_negotiation.minimum_price == new_negotiation.possible_prices[new_negotiation.level -1]
    assert new_negotiation.final_price == new_negotiation.minimum_price
    assert new_negotiation.monthly_profits_and_looses.revenue == Decimal('27.00')
    assert new_negotiation.monthly_profits_and_looses.profit_percentage == Decimal('0.41')


def test_promotion_mid_client_low_seller_second_product_low_price_offer():
    new_negotiation: PromotionNegotiation = PromotionNegotiation(
        **NegotiationRequestDTO(
            **{
                "client_id": 2, 
                "seller_id": 1, 
                "product_id": 2, 
                "price_offer": 250.00
            }
        ).__dict__
    )

    assert new_negotiation.level == 2
    assert new_negotiation.price_offer_is_higher_than_minimum == False
    assert new_negotiation.minimum_price == new_negotiation.possible_prices[new_negotiation.level -1]
    assert new_negotiation.final_price == new_negotiation.minimum_price
    assert new_negotiation.monthly_profits_and_looses.revenue == Decimal('26.00')
    assert new_negotiation.monthly_profits_and_looses.profit_percentage == Decimal('0.39')


def test_low_client_mid_seller_third_product_low_price_offer():
    new_negotiation: Negotiation = Negotiation(
        **NegotiationRequestDTO(
            **{
                "client_id": 1, 
                "seller_id": 2, 
                "product_id": 3, 
                "price_offer": 325.00
            }
        ).__dict__
    )

    assert new_negotiation.level == 2
    assert new_negotiation.price_offer_is_higher_than_minimum == True
    assert new_negotiation.minimum_price == new_negotiation.possible_prices[new_negotiation.level -1]
    assert new_negotiation.final_price == new_negotiation.price_offer
    assert new_negotiation.monthly_profits_and_looses.revenue == Decimal('325.00')
    assert new_negotiation.monthly_profits_and_looses.profit_percentage == Decimal('0.57')


def test_client_not_found():
    try:
        negotiation_service(
            {
                "client_id": 5, 
                "seller_id": 2, 
                "product_id": 3, 
                "price_offer": 325.00
            }
        )
    except Exception as e:
        assert e.message == 'client not found'


def test_client_not_found():
    try:
        negotiation_service(
            {
                "client_id": 5, 
                "seller_id": 2, 
                "product_id": 3, 
                "price_offer": 325.00
            }
        )
    except Exception as e:
        assert e.message == 'client not found'

def test_price_offer_wrong_type():
    try:
        negotiation_service(
            {
                "client_id": 1, 
                "seller_id": 2, 
                "product_id": 3, 
                "price_offer": "R$300,00"
            }
        )
    except Exception as e:
        assert e.message == 'Excpeted type number for price_offer but received string'


def test_missing_product_id():
    try:
        negotiation_service(
            {
                "client_id": 1, 
                "seller_id": 2,
                "price_offer": 325.00
            }
        )
    except Exception as e:
        assert e.message == "missing 1 required positional argument: 'product_id'"


def test_unexpected_argument():
    try:
        negotiation_service(
            {
                "random_argument": "random_value",
                "client_id": 1, 
                "seller_id": 2,
                "product_id": 3, 
                "price_offer": 325.00
            }
        )
    except Exception as e:
        assert e.message == "Unexpected argument: random_argument"
