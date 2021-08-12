from src.Application.Entities.Promotion import PromotionNegotiation

from src.Application.DTO.Request.Negotiation import NegotiationRequestDTO
from src.Application.DTO.Request.TypeValidator import RequestTypeValidator
from src.Application.DTO.Response.ProfitsAndLooses import ProfitsAndLoosesResponseDTO

from src.Application.Exceptions.ApplicationException import ApplicationException


def promotion_service(request_json):
    try:
        RequestTypeValidator(
            NegotiationRequestDTO,
            request_json
        )
        promotion_negotiation: PromotionNegotiation = PromotionNegotiation(
            **NegotiationRequestDTO(
                **request_json
            ).__dict__
        )
        profits_and_looses_response: dict = ProfitsAndLoosesResponseDTO(
            promotion_negotiation.monthly_profits_and_looses, promotion_negotiation.price_offer_is_higher_than_minimum
        ).__dict__
        return profits_and_looses_response
    except Exception as e:
        raise ApplicationException(e)
