from secrets import token_hex
from sqlalchemy import Column, ForeignKey,Integer,String,Date
from database import Base
from sqlalchemy.orm import relationship

def generate_uuid():
    return token_hex(16)

class Users(Base):
    __tablename__="users"

    user_id= Column(String,primary_key=True,default=generate_uuid,index=True)
    full_name= Column(String,nullable= False)
    aadhaar_no = Column(String,nullable=False)
    dob= Column(Date,nullable=False)
    phone_no= Column(Integer,nullable=True)
    address= Column(String,nullable=False)

    issues = relationship('Issues', back_populates='owner')

class Issues(Base):
    __tablename__="issues"

    issue_id= Column(String,primary_key=True,default=generate_uuid,index=True)
    title=  Column(String,nullable= False)
    description = Column(String,nullable= False)
    image =  Column(String,nullable= False)
    video =  Column(String,nullable= False)
    audio=  Column(String,nullable= False)
    location=  Column(Integer,nullable= False)
    owner_id = Column(String, ForeignKey('users.user_id'))
    


    owner = relationship('Users', back_populates='issues')

