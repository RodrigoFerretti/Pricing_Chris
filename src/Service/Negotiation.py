class Negotiation:
    def __init__(self, client, seller, product, offered_price_by_client):
        self.client = client
        self.seller = seller
        self.product = product
        self.offered_price_by_client = offered_price_by_client



    def client_offered_price_is_above_minimum(client, seller, product, client_offered_price):
