import pdfplumber
import pandas as pd
import zipfile
import os

# Configurações de caminhos dos arquivos
PDF_PATH = "./Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf" 
CSV_PATH = "Teste_Raul_Migliari.csv"
ZIP_PATH = "Teste_Raul_Migliari.zip"

# Mapeamento das abreviações para os significados completos
ABREVIACOES = {
    "OD": "Seg. Odontológico",
    "AMB": "Seg. Ambulatorial"
}

def extrair_tabela_do_pdf(pdf_path):
    """
    Extrai todas as tabelas do PDF especificado.

    Args:
        pdf_path (str): Caminho do arquivo PDF.

    Returns:
        list: Lista de listas contendo os dados extraídos das tabelas.

    """
    dados_tabela = []
    with pdfplumber.open(pdf_path) as pdf:
        for pagina in pdf.pages:
            tabelas = pagina.extract_tables()
            for tabela in tabelas:
                dados_tabela.extend(tabela)
    return dados_tabela

def salvar_csv(dados, csv_path):
    """
    Salva os dados extraídos do PDF em um arquivo CSV estruturado.

    Args:
        dados (list): Lista de listas representando a tabela extraída.
        csv_path (str): Caminho para salvar o arquivo CSV.

    Returns:
        None
    """
    df = pd.DataFrame(dados[1:], columns=dados[0])  # Cabeçalhos e dados
    df = df.rename(columns=ABREVIACOES)  # Substituir abreviações das colunas
    df.to_csv(csv_path, index=False, encoding="utf-8")
    print(f"Arquivo CSV salvo em: {csv_path}")

def compactar_csv(csv_path, zip_path):
    """
    Compacta o arquivo CSV gerado em um arquivo ZIP.

    Args:
        csv_path (str): Caminho do arquivo CSV.
        zip_path (str): Caminho do arquivo ZIP de saída.

    Returns:
        None
    """
    with zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
        zipf.write(csv_path, os.path.basename(csv_path))
    print(f"Arquivo ZIP gerado: {zip_path}")

def main():
    # 1. Extração da Tabela do PDF
    dados_tabela = extrair_tabela_do_pdf(PDF_PATH)

    # 2. Salvar os dados extraídos como CSV
    salvar_csv(dados_tabela, CSV_PATH)

    # 3. Compactar o arquivo CSV
    compactar_csv(CSV_PATH, ZIP_PATH)

    # 4. Remover CSV após compactação
    os.remove(CSV_PATH)

if __name__ == "__main__":
    main()
