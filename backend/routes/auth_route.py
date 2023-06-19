import models
from fastapi import APIRouter, Depends
from schemas import users_schema
from database import SessionLocal, get_db
from secuirty import API_KEYS, get_api_key

router = APIRouter(
    tags=["Authentication"],
)


@router.post("/login")
def login(phone: int, db: SessionLocal = Depends(get_db)):
    user = db.query(models.Users).filter(models.Users.phone_no == phone).first()
    if user:
        return "success"
    else:
        return "User not found"


@router.post(
    "/signup",
)
def sing_up(user_data: users_schema.UserBase, db: SessionLocal = Depends(get_db)):
    user = db.query(models.Users).filter(models.Users.mail == user_data.mail).first()
    if user:
        return {
            "success": False,
            "message": "User already exists!",
        }
    else:
        user = models.Users(**user_data.dict())
        db.add(user)
        db.commit()
        db.refresh(user)
        return {
            "success": True,
            "message": "Accound created",
            "data":user.user_id
        }
