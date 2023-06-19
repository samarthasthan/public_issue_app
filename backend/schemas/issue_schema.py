import datetime

from pydantic import BaseModel

class CategoryOut(BaseModel):
    category_title:str

    class Config:
        orm_mode = True

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
    category_id:str
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
    category:CategoryOut
    owner:UserBaseOut


    class Config:
        orm_mode = True