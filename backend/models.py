from secrets import token_hex
from sqlalchemy import Column, ForeignKey,Integer,String,Date,Double
from database import Base
from sqlalchemy.orm import relationship

def generate_uuid():
    return token_hex(16)

class Users(Base):
    __tablename__="users"

    user_id= Column(String,primary_key=True,default=generate_uuid,index=True)
    full_name= Column(String,nullable= False)
    aadhaar_no = Column(String,nullable=False)
    profile= Column(String,nullable=False)
    dob= Column(Date,nullable=False)
    phone_no= Column(Integer,nullable=True)
    address= Column(String,nullable=False)
    mail= Column(String,nullable=False)

    issues = relationship('Issues', back_populates='owner')
    incharges = relationship('Incharges', back_populates='users')

class Issues(Base):
    __tablename__="issues"

    issue_id= Column(String,primary_key=True,default=generate_uuid,index=True)
    title=  Column(String,nullable= False)
    description = Column(String,nullable= False)
    image =  Column(String,nullable= False)
    video =  Column(String,nullable= False)
    audio=  Column(String,nullable= False)
    latitude=  Column(Double,nullable= False)
    longitude=  Column(Double,nullable= False)
    pluscode = Column(String,nullable= False)
    # category_id=Column(String, ForeignKey('categories.category_id'))
    owner_id = Column(String, ForeignKey('users.user_id'))
    location= Column(String, ForeignKey('locations.location_id'))
    

    owner = relationship('Users', back_populates='issues')
    incharges = relationship('Incharges', back_populates='issues')
    # category = relationship('Category', back_populates='issues')
    locations = relationship('Locations', back_populates='issues')

class Incharges(Base):
    __tablename__="incharges"

    incharge_id= Column(String,primary_key=True,default=generate_uuid,index=True)
    user_id= Column(String, ForeignKey('users.user_id'))
    issue_id = Column(String, ForeignKey('issues.issue_id'))

    users = relationship('Users', back_populates='incharges')
    issues = relationship('Issues', back_populates='incharges')


# class Category(Base):
#     __tablename__="categories"

#     category_id= Column(String,primary_key=True,default=generate_uuid,index=True)
#     category_title=  Column(String,nullable= False)
#     category_slug= Column(String,nullable= False)
#     issues = relationship('Issues', back_populates='category')

class Locations(Base):
    __tablename__ = "locations"

    location_id = Column(String, primary_key=True, default=generate_uuid, index=True)
    continent = Column(String, nullable=False)
    continentCode = Column(String, nullable=False)
    countryName = Column(String, nullable=False)
    countryCode = Column(String, nullable=False)
    principalSubdivision = Column(String, nullable=False)
    principalSubdivisionCode = Column(String, nullable=False)
    city = Column(String,  nullable=False) 
    locality = Column(String, nullable=False)
    postcode = Column(Integer, unique=True, nullable=True)  # Keeping unique constraint for postcode

    issues = relationship('Issues', back_populates='locations')


