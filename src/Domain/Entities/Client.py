from decimal import Decimal


class Client:
    def __init__(self: object, id: int, name: str, 
                 tpv: Decimal, segment_id: int, location_id: int):
        self.id: int = id
        self.name: str = name
        self.tpv: Decimal = tpv
        self.segment_id: int = segment_id
        self.location_id: int = location_id

    def get_client_level(self: object, highest_tpv: Decimal):
        tpv_levels: dict = {
            "1": 
            {
                "threshold": highest_tpv / 3
            },
            "2": 
            {
                "threshold": highest_tpv * 2 / 3
            },
            "3": 
            {
                "threshold": highest_tpv
            }
        }
        client_level: int = 1
        for level, level_properties in tpv_levels.items():
            if self.tpv <= level_properties['threshold']:
                client_level: int = int(level)
                return client_level
        return client_level
