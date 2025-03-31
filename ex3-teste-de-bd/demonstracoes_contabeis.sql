-- Criando a tabela para armazenar os dados dos arquivos CSV
CREATE TABLE dados_financeiros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE,
    reg_ans INT,
    cd_conta_contabil INT,
    descricao TEXT,
    vl_saldo_inicial DECIMAL(15,2),
    vl_saldo_final DECIMAL(15,2)
);

-- Carregando dados dos 8 arquivos CSV 
LOAD DATA INFILE 'C:\Users\Pichau\Documents\demonstracoes-contabeis\1T2023.csv' INTO TABLE dados_financeiros
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET data = STR_TO_DATE(@data, '%Y-%m-%d');

LOAD DATA INFILE 'C:\Users\Pichau\Documents\demonstracoes-contabeis\1T2024.csv' INTO TABLE dados_financeiros
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET data = STR_TO_DATE(@data, '%Y-%m-%d');

LOAD DATA INFILE 'C:\Users\Pichau\Documents\demonstracoes-contabeis\2t2023.csv' INTO TABLE dados_financeiros
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET data = STR_TO_DATE(@data, '%Y-%m-%d');

LOAD DATA INFILE 'C:\Users\Pichau\Documents\demonstracoes-contabeis\2T2024.csv' INTO TABLE dados_financeiros
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET data = STR_TO_DATE(@data, '%Y-%m-%d');

LOAD DATA INFILE 'C:\Users\Pichau\Documents\demonstracoes-contabeis\3T2023.csv' INTO TABLE dados_financeiros
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET data = STR_TO_DATE(@data, '%Y-%m-%d');

LOAD DATA INFILE 'C:\Users\Pichau\Documents\demonstracoes-contabeis\3T2024.csv' INTO TABLE dados_financeiros
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET data = STR_TO_DATE(@data, '%Y-%m-%d');

LOAD DATA INFILE 'C:\Users\Pichau\Documents\demonstracoes-contabeis\4T2023.csv' INTO TABLE dados_financeiros
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET data = STR_TO_DATE(@data, '%Y-%m-%d');

LOAD DATA INFILE 'C:\Users\Pichau\Documents\demonstracoes-contabeis\4T2024.csv' INTO TABLE dados_financeiros
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET data = STR_TO_DATE(@data, '%Y-%m-%d');

-- 10 operadoras com maiores despesas no último trimestre
SELECT 
    reg_ans AS Operadora,
    SUM(vl_saldo_final - vl_saldo_inicial) AS Despesa_Total
FROM 
    dados_financeiros
WHERE 
    descricao LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
    AND data >= DATE_SUB((SELECT MAX(data) FROM dados_financeiros), INTERVAL 3 MONTH)
GROUP BY 
    reg_ans
ORDER BY 
    Despesa_Total DESC
LIMIT 10;

-- 10 operadoras com maiores despesas no último ano
SELECT 
    reg_ans AS Operadora,
    SUM(vl_saldo_final - vl_saldo_inicial) AS Despesa_Anual
FROM 
    dados_financeiros
WHERE 
    descricao LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
    AND data >= DATE_SUB((SELECT MAX(data) FROM dados_financeiros), INTERVAL 1 YEAR)
GROUP BY 
    reg_ans
ORDER BY 
    Despesa_Anual DESC
LIMIT 10;
