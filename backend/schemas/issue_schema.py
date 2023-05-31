import datetime
from pydantic import BaseModel

class IssueBase(BaseModel):
    title:str
    description:str
    image:str
    video:str
    audio:str
    location:str
    owner_id:str