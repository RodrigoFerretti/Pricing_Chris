from decimal import Decimal
from Domain.DTO.Negotiation import NegotiationDTO
from Service.Negotiation import Negotiation


def low_client_high_seller_first_product_low_price_offer_test():
    new_negotiation: Negotiation = Negotiation(
        **NegotiationDTO(
            **{
                "client_id": 1, 
                "seller_id": 3, 
                "product_id": 1, 
                "price_offer": 0.10
            }
        ).__dict__
    )

    print(new_negotiation.minimum_price)
    print(new_negotiation.monthly_profits_and_looses.__dict__)

    assert new_negotiation.level == 3
    assert new_negotiation.price_offer_is_higher_than_minimum == False
    assert new_negotiation.minimum_price == new_negotiation.possible_prices[new_negotiation.level -1]
    assert new_negotiation.final_price == new_negotiation.minimum_price
    assert new_negotiation.monthly_profits_and_looses.revenue == Decimal('125.00')
    assert new_negotiation.monthly_profits_and_looses.profit_percentage == Decimal('0.46')


def low_client_low_seller_first_product_high_price_offer_test():
    new_negotiation: Negotiation = Negotiation(
        **NegotiationDTO(
            **{
                "client_id": 1, 
                "seller_id": 1, 
                "product_id": 1, 
                "price_offer": 1.60
            }
        ).__dict__
    )
    
    print(new_negotiation.minimum_price)
    print(new_negotiation.monthly_profits_and_looses.__dict__)

    assert new_negotiation.level == 1
    assert new_negotiation.price_offer_is_higher_than_minimum == True
    assert new_negotiation.minimum_price == new_negotiation.possible_prices[new_negotiation.level -1]
    assert new_negotiation.final_price == new_negotiation.price_offer
    assert new_negotiation.monthly_profits_and_looses.revenue == Decimal('160.00')
    assert new_negotiation.monthly_profits_and_looses.profit_percentage == Decimal('0.55')


def high_client_high_seller_first_product_low_price_offer_test():
    new_negotiation: Negotiation = Negotiation(
        **NegotiationDTO(
            **{
                "client_id": 3, 
                "seller_id": 3, 
                "product_id": 1, 
                "price_offer": 1.20
            }
        ).__dict__
    )
    
    print(new_negotiation.minimum_price)
    print(new_negotiation.monthly_profits_and_looses.__dict__)

    assert new_negotiation.level == 3
    assert new_negotiation.price_offer_is_higher_than_minimum == False
    assert new_negotiation.minimum_price == new_negotiation.possible_prices[new_negotiation.level -1]
    assert new_negotiation.final_price == new_negotiation.minimum_price
    assert new_negotiation.monthly_profits_and_looses.revenue == Decimal('1980.00')
    assert new_negotiation.monthly_profits_and_looses.profit_percentage == Decimal('0.86')


def mid_client_low_seller_second_product_low_price_offer_test():
    new_negotiation: Negotiation = Negotiation(
        **NegotiationDTO(
            **{
                "client_id": 2, 
                "seller_id": 1, 
                "product_id": 2, 
                "price_offer": 250.00
            }
        ).__dict__
    )
    
    print(new_negotiation.minimum_price)
    print(new_negotiation.monthly_profits_and_looses.__dict__)

    assert new_negotiation.level == 2
    assert new_negotiation.price_offer_is_higher_than_minimum == False
    assert new_negotiation.minimum_price == new_negotiation.possible_prices[new_negotiation.level -1]
    assert new_negotiation.final_price == new_negotiation.minimum_price
    assert new_negotiation.monthly_profits_and_looses.revenue == Decimal('27.00')
    assert new_negotiation.monthly_profits_and_looses.profit_percentage == Decimal('0.41')


def low_client_mid_seller_third_product_low_price_offer_test():
    new_negotiation: Negotiation = Negotiation(
        **NegotiationDTO(
            **{
                "client_id": 1, 
                "seller_id": 2, 
                "product_id": 3, 
                "price_offer": 325.00
            }
        ).__dict__
    )
    
    print(new_negotiation.minimum_price)
    print(new_negotiation.monthly_profits_and_looses.__dict__)

    assert new_negotiation.level == 2
    assert new_negotiation.price_offer_is_higher_than_minimum == True
    assert new_negotiation.minimum_price == new_negotiation.possible_prices[new_negotiation.level -1]
    assert new_negotiation.final_price == new_negotiation.price_offer
    assert new_negotiation.monthly_profits_and_looses.revenue == Decimal('325.00')
    assert new_negotiation.monthly_profits_and_looses.profit_percentage == Decimal('0.57')


def client_not_found_test():
    try:
        NegotiationDTO(
            **{
                "client_id": 5, 
                "seller_id": 2, 
                "product_id": 3, 
                "price_offer": 325.00
            }
        )
    except Exception as e:
        assert e.message == 'client not found'
