from pydantic import BaseModel

class Notification(BaseModel):
    username:str
    prodName: str
    userId: int