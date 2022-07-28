from pydantic import BaseModel

class UpVote(BaseModel):
    ans_id: int
    user_id: int