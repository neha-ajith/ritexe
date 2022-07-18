# from datetime import datetime
from pydantic import BaseModel
# from typing import Optional

class Answer(BaseModel):
    downVote:int
    ans:str
    upVote:int
    # date: Optional[datetime]