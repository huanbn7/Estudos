from sqlalchemy import create_engine
import pandas as pd
import os


DATA_DIR = os.path.dirname( os.path.abspath(__file__) )

# Acessando os arquivos do diretorio 'data'
arquivos = os.listdir( DATA_DIR )

# Excluindo da lista 'arquivos' o arquivo que faz o upload dos dados
arquivos.remove('upload_data.py')

# Criar uma conexão com o banco de dados
engine = create_engine('mysql+pymysql://root:Soakgrid_**19@127.0.0.1:3306/olist')

for arq in arquivos:
    # lendo o arquivo
    print(arq)
    data = pd.read_csv( os.path.join( DATA_DIR, arq ) )
    
    # Salvar o dataframe no banco de dados
    nome = arq.replace('olist', 'tb').rstrip('dataset.csv').rstrip('_')
    data.to_sql(nome, engine, if_exists='replace', index=False)


