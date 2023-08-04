import datetime

from pydantic import BaseModel


class UserBaseOut(BaseModel):
    full_name:str
    phone_no:int
    address:str

    class Config:
        orm_mode = True

class LocationIn(BaseModel):
    continent:str
    continentCode:str
    countryName:str
    countryCode:str
    principalSubdivision:str
    principalSubdivisionCode:str
    city:str
    locality:str
    postcode:int

class IssueBaseIn(BaseModel):
    title:str
    description:str
    image:str
    video:str
    audio:str
    latitude:float
    longitude:float
    pluscode:str
    owner_id:str

    location:LocationIn


    class Config:
        orm_mode = True


class IssueBaseOut(BaseModel):
    title:str
    description:str
    image:str
    video:str
    audio:str
    latitude:float
    longitude:float
    pluscode:str
    owner:UserBaseOut

    locations:LocationIn


    class Config:
        orm_mode = True

