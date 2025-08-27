from typing import Annotated
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, Session
from sqlalchemy.ext.declarative import declarative_base
from fastapi import Depends

SQLALCHEMY_DATA_URI = "postgresql://admin:admin@localhost:5432/DungeonsAndDragons"

# DEF ENGINE

engine = create_engine(SQLALCHEMY_DATA_URI)

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


