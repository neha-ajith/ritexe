from pydantic import BaseModel

class DownVote(BaseModel):
    ans_id: int
    user_id: int