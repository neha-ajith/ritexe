# from datetime import datetime
from pydantic import BaseModel
# from typing import Optional

class Question(BaseModel):
    qs_title:str
    qs_desc:str
    # date: Optional[datetime]