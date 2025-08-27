from pydantic import Field

from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    jwt_secret: str  #= Field(env="JWT_SECRET_KEY")
    jwt_algorithm: str  #= Field(env="JWT_ALGORITHM")

    db_user: str
    db_password: str
    db_host: str
    db_port: int
    db_name: str


    class Config:
        env_file = ".env"


settings = Settings()