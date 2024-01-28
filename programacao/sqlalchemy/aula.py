from sqlalchemy import create_engine

dialeto = "mysql"
driver = "pymysql"
usuario = "huan"
senha = "A-queseja1genio"
host = "127.0.0.1"
porta = "3306"
db = "olist"


engine = create_engine(f"{dialeto}+{driver}://{usuario}:{senha}@{host}:{porta}/{db}")

print(engine.connect())