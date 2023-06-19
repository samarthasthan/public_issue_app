import datetime
from typing import List
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

class HomePage(BaseModel):
    registered_complaint:int
    closed_complaint:int
    issues:List[IssueBaseOut]
    
    class Config:
        orm_mode = True

