from decimal import Decimal


class Client:
    def __init__(self: object, id: int, name: str, 
                 tpv: Decimal, segment_id: int, location_id: int):
        self.id = id
        self.name = name
        self.tpv = tpv
        self.segment_id = segment_id
        self.location_id = location_id

    
    def get_client_level(self: object, highest_tpv: Decimal):
        tpv_levels = {
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
        client_level = 1
        for level, level_properties in tpv_levels.items():
            if self.tpv <= level_properties['threshold']:
                client_level = int(level)
                return client_level
        return client_level
