import zipfile
import os

def zipPDF(inputFolder, outputZip):

    """
    Compacta todos os arquivos PDF de uma pasta de entrada em um arquivo ZIP.

    Esta função percorre recursivamente a pasta de entrada, localiza todos os arquivos
    com extensão .pdf (case insensitive) e os compacta em um arquivo ZIP no local especificado.

    Parâmetros:
        inputFolder (str): Caminho da pasta contendo os arquivos PDF a serem compactados.
        outputZip (str): Caminho completo do arquivo ZIP de saída a ser criado.

    Retorno:
        None: A função não retorna valores, mas pode imprimir mensagens de status/erro.
    """
    
    # Verifica se a pasta de entrada existe
    if not os.path.exists(inputFolder):
        print(f"Erro: Pasta '{inputFolder}' não encontrada!")
        return

    # Remove o ZIP anterior se existir
    if os.path.exists(outputZip):
        os.remove(outputZip)

    print(f"\nCompactando PDFs de '{inputFolder}' em '{outputZip}'...")

    with zipfile.ZipFile(outputZip, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for root, _, files in os.walk(inputFolder):
            for file in files:
                if file.lower().endswith('.pdf'):
                    filePath = os.path.join(root, file)
                    zipf.write(filePath, os.path.basename(filePath))
                    print(f"Adicionado: {file}")

    # Verifica se o ZIP foi criado
    if os.path.exists(outputZip):
        print(f"\nSucesso! Arquivo criado: {outputZip}")
    else:
        print("\nFalha ao criar o arquivo ZIP.")

# Exemplo de uso
zipPDF(
    "/home/raulmgl/Documentos/Anexos-TesteDeNivelamento-IntuitiveCare",
    "/home/raulmgl/TesteDeNivelamento-IntuitiveCare/ex1-web-scraping/pdfs_compactados.zip"
)