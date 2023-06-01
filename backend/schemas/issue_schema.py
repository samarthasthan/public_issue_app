import datetime

from pydantic import BaseModel

class UserBaseOut(BaseModel):
    full_name:str
    phone_no:int
    address:str

    class Config:
        orm_mode = True

class IssueBaseIn(BaseModel):
    title:str
    description:str
    image:str
    video:str
    audio:str
    location:str
    owner_id:str


    class Config:
        orm_mode = True

class IssueBaseOut(BaseModel):
    title:str
    description:str
    image:str
    video:str
    audio:str
    location:str
    owner:UserBaseOut


    class Config:
        orm_mode = True