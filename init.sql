CREATE TABLE motorista (
id SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cnh VARCHAR(20) unique NOT NULL,
telefone VARCHAR(20),
status_ativo BOOLEAN DEFAULT TRUE 
);

CREATE TABLE veiculos (
id SERIAL PRIMARY KEY,
placa VARCHAR(20) UNIQUE NOT NULL,
marca VARCHAR(50) NOT NULL,
modelo VARCHAR(50) NOT NULL,
km_atual INT NOT NULL,
status_uso VARCHAR(20) DEFAULT 'Disponível' -- Pode ser "Disponível", "Em uso", "Manutenção", etc.
);

CREATE TABLE controle_viagens (
id SERIAL PRIMARY KEY,
veiculo_id INT NOT NULL REFERENCES veiculos(id),
motorista_id INT NOT NULL REFERENCES motorista(id),
destino_id VARCHAR(200) NOT NULL,
data_saida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
km_saida INT NOT NULL,
data_retorno TIMESTAMP,
km_retorno INT,
status VARCHAR(20) DEFAULT 'Em andamento'
);

CREATE TABLE itens_inspecao (
id SERIAL PRIMARY KEY,
viagem_id INT NOT NULL REFERENCES controle_viagens(id),
momento_inspecao VARCHAR(20) NOT NULL, -- Valores (Saída ou Retorno)
farois_ok BOOLEAN NOT NULL,
estepes_ok BOOLEAN NOT NULL,
macaco_triangulo_ok BOOLEAN NOT NULL,
buzina_ok BOOLEAN NOT NULL,
pneus_ok BOOLEAN NOT NULL
);

CREATE TABLE registro_avaria (
id SERIAL PRIMARY KEY,
viagen_id INT NOT NULL REFERENCES controle_viagens(id),
momento_registro VARCHAR(10) NOT NULL, -- Valores (Saída ou Retorno)
peca_afetada VARCHAR(50) NOT NULL, -- Parachoque dianteiro, retrovisor, porta direita
tipo_avaria VARCHAR(50) NOT NULL -- Riscado, Amassado, Quebrado
)