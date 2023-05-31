import datetime
from pydantic import BaseModel

class UserBase(BaseModel):
    full_name:str
    aadhaar_no:str
    dob:datetime.date
    phone_no:int
    address:str