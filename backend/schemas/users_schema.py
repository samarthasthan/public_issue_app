import datetime
from pydantic import BaseModel

class UserBase(BaseModel):
    full_name:str
    aadhaar_no:str
    dob:datetime.date
    profile:str
    phone_no:int
    address:str
    mail:str

class UserAuthBase(BaseModel):
    aadhaar_no:str
    phone_no:int