import time
import jwt
import models
from fastapi import APIRouter, Depends, HTTPException, status
from schemas import users_schema
from database import SessionLocal, get_db
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm

router = APIRouter(
    tags=["Authentication"],
)


JWT_SECRET = "9d207bf0-10f5-4d8f-a479-22ff5aeff8d1"

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")


async def get_current_user(token: str = Depends(oauth2_scheme),db: SessionLocal = Depends(get_db)):
    try:
        payload = jwt.decode(token, JWT_SECRET, algorithms=['HS256'])
        user = db.query(models.Users).filter(models.Users.phone_no == payload.get('phone_no')).first()
    except:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED, 
            detail='Invalid username or password'
        )

    return user

@router.post("/login")
async def login(
    user_data: users_schema.UserAuthBase, db: SessionLocal = Depends(get_db)
):
    time.sleep(2)
    check_user_phone = (
        db.query(models.Users)
        .filter(models.Users.phone_no == user_data.phone_no)
        .first()
    )
    check_user_aadhaar = (
        db.query(models.Users)
        .filter(models.Users.aadhaar_no == user_data.aadhaar_no)
        .first()
    )
    if check_user_aadhaar and check_user_phone:
        user_model = {
            "aadhaar_no": check_user_aadhaar.aadhaar_no,
            "phone_no": check_user_phone.phone_no,
        }
        token = jwt.encode(user_model, JWT_SECRET)
        return {"access_token": token, "token_type": "bearer"}

    raise HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid username or password"
    )


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
        return {"success": True, "message": "Accound created", "data": user.user_id}


@router.get('/checktoken')
async def get_user(user: users_schema.UserAuthBase=Depends(get_current_user)):
    return user  