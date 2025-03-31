from fastapi import FastAPI, Query
import pandas as pd
from typing import List

app = FastAPI()

# Carregar o CSV previamente preparado
csv_path = "Relatorio_cadop.csv" 

try:
    df = pd.read_csv(csv_path, delimiter=";") 
except FileNotFoundError:
    raise Exception("Arquivo CSV não encontrado. Verifique o caminho do arquivo.")

@app.get("/buscar", response_model=dict)
def buscar(query: str, page: int = 1, page_size: int = 10):
    resultados = df[df.astype(str).apply(lambda row: query in row.to_string(), axis=1)]
    total = len(resultados)
    resultados = resultados.iloc[(page - 1) * page_size : page * page_size].to_dict(orient="records")
    
    return {
        "total": total,
        "page": page,
        "page_size": page_size,
        "results": resultados
    }