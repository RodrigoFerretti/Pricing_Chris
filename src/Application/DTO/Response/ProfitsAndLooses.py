from src.Application.Entities.ProfitsAndLooses import ProfitsAndLooses


class ProfitsAndLoosesResponseDTO:
    def __init__(self, profits_and_looses: ProfitsAndLooses, price_offer_is_higher_than_minimum: bool):
        self.price_offer_is_higher_than_minimum: bool = price_offer_is_higher_than_minimum
        self.pnl: dict = {
            "revenue": f'R$ {str(profits_and_looses.revenue)}',
            "expenses": f'R$ {str(profits_and_looses.expenses)}',
            "expenses_percentage": f'{str(int(profits_and_looses.expenses_percentage * 100))}%',
            "profit": f'R$ {str(profits_and_looses.profit)}',
            "profit_percentage": f'{str(int(profits_and_looses.profit_percentage * 100))}%'
        }

        # self.revenue: str = f'R$ {str(profits_and_looses.revenue)}'
        # self.expenses: str = f'R$ {str(profits_and_looses.expenses)}'
        # self.expenses_percentage: str = f'{str(int(profits_and_looses.expenses_percentage * 100))}%'
        # self.profit: str = f'R$ {str(profits_and_looses.profit)}'
        # self.profit_percentage: str = f'{str(int(profits_and_looses.profit_percentage * 100))}%'
