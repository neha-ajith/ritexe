from datetime import datetime
from pydantic import BaseModel

class Answer(BaseModel):
    downVote:int
    ans:str
    upVote:int
    date: datetime
    qs_id: int
    user_id: int