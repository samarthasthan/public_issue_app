import models
from fastapi import APIRouter, Depends
from schemas import users_schema
from database import SessionLocal, get_db

router= APIRouter(tags=["Authentication"])


@router.post("/users",)
def read_customers(user_data:users_schema.UserBase, db: SessionLocal = Depends(get_db)):
    user = models.Users(**user_data.dict())
    db.add(user)
    db.commit()
    db.refresh(user)
    return user