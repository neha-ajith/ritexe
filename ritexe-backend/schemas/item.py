from datetime import datetime
from pydantic import BaseModel

class Item(BaseModel):
    name: str
    quantity:int
    date: datetime
    user_id: int