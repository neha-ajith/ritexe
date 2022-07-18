# from datetime import datetime
from pydantic import BaseModel
# from typing import Optional

class Item(BaseModel):
    name: str
    quantity:int
    # date: Optional[datetime]