from enforce_typing import enforce_types


@enforce_types
class Client:
    def __init__(self: object, id: int, name: str, 
                 tpv: float, segment_id: int, location_id: int):
        self.id = id
        self.name = name
        self.tpv = tpv
        self.segment_id = segment_id
        self.location_id = location_id

    @enforce_types
    def set_client_level(self: object, highest_tpv_in_schema: float):
        tpv_levels = {
            "1": 
            {
                "threshold": highest_tpv_in_schema / 3
            },
            "2":
            {
                "threshold": highest_tpv_in_schema * 2 / 3
            },
            "3":
            {
                "thershold": highest_tpv_in_schema
            }
        }

        for level, level_properties in tpv_levels.items():
            if self.tpv <= level_properties['threshold']:
                self.level = level
