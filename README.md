# Teste de Nivelamento - Processamento de Dados e Desenvolvimento

Este repositório contém as soluções para os testes de nivelamento propostos, abrangendo Web Scraping, Transformação de Dados, Banco de Dados e Desenvolvimento de API. Cada tarefa foi implementada conforme as especificações fornecidas.

## Tarefas Implementadas

### 1. Teste de Web Scraping
- **Objetivo**: Acessar o site da ANS, baixar os Anexos I e II em PDF e compactá-los em um único arquivo.
- **Tecnologias**: Python (zipfile)
- **Arquivos**:
  - `main.py`: Script para download e compactação dos arquivos.
  - `pdfs_compactados.zip`: Arquivo compactado resultante.

### 2. Teste de Transformação de Dados
- **Objetivo**: Extrair dados da tabela "Rol de Procedimentos" do Anexo I, salvar em CSV, compactar e substituir abreviações das colunas.
- **Tecnologias**: Python (pdfplumber, pandas, zipfile)
- **Arquivos**:
  - `main.py`: Script para extração e transformação dos dados.
  - `Teste_Raul_Migliari.zip`: Arquivo compactado resultante.

### 3. Teste de Banco de Dados
- **Objetivo**: Criar scripts SQL para estruturar tabelas, importar dados e realizar consultas analíticas.
- **Tecnologias**: MySQL
- **Arquivos**:
  - `demonstracoes_contabeis.sql`: Scripts para criação de tabelas, importação de dados e consultas analíticas
- **Fontes de Dados**:
  - [Demonstrações Contábeis](https://dadosabertos.ans.gov.br/FTP/PDA/demonstracoes_contabeis/)

### 4. Teste de API
- **Objetivo**: Desenvolver uma interface web (Vue.js) e um servidor Python para busca textual de operadoras.
- **Tecnologias**: Vue.js, Python (FastAPI), Postman
- **Arquivos**:
  - `backend/main.py`: Servidor com rota de busca.
  - `frontend/src/App.vue`: Interface web em Vue.js.
  - `API_de_Busca.postman_collection.json`: Coleção do Postman para testes.
- **Fontes de Dados**:
  - [Operadoras Ativas](https://dadosabertos.ans.gov.br/FTP/PDA/operadoras_de_plano_de_saude_ativas/)
