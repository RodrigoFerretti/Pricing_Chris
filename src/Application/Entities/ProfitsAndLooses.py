from decimal import Decimal


class ProfitsAndLooses:
    def __init__(self, revenue: Decimal, expenses: Decimal, profit: Decimal):
        self.revenue: Decimal = round(revenue, 2)
        self.expenses: Decimal = round(expenses, 2)
        self.expenses_percentage: Decimal = round(expenses / revenue, 2)
        self.profit: Decimal = round(profit, 2)
        self.profit_percentage: Decimal = round(profit / revenue, 2)
