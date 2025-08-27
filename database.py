from typing import Annotated
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, Session
from sqlalchemy.ext.declarative import declarative_base
from fastapi import Depends

from config import settings

SQLALCHEMY_DATA_URI = (
    f"postgresql://{settings.db_user}:{settings.db_password}"
    f"@{settings.db_host}:{settings.db_port}/{settings.db_name}"
)

# DEF ENGINE
engine = create_engine(SQLALCHEMY_DATA_URI, echo=False)

# DEF SESSION
SessionLocal = sessionmaker(autoflush=False, autocommit=False, bind=engine)

# DEF OF AS AN OBJECT TO USE
Base = declarative_base()


# DEPENDENCY
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


# DEPENDENCY ANNOTATED
db_dependency = Annotated[Session, Depends(get_db)]


