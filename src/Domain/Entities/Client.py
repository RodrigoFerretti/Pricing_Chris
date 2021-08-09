from decimal import Decimal


class Client:
    def __init__(self: object, id: int, name: str, 
                 tpv: Decimal, segment_id: int, location_id: int):
        self.id = id
        self.name = name
        self.tpv = tpv
        self.segment_id = segment_id
        self.location_id = location_id
