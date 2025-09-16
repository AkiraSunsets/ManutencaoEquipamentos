CREATE database ManutencaoEquipamentos;
USE ManutencaoEquipamentos;

CREATE TABLE Equipamento (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR (255) NOT NULL,
    Setor VARCHAR (255) NOT NULL
);

CREATE TABLE Manutencao (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR (255) NOT NULL,
    Data DATE,
    Status VARCHAR (255) NOT NULL,
    Resultado VARCHAR (255),
    ProximaData DATE,
    PecasUsadas VARCHAR (255) NOT NULL,
    QuantidadePecas VARCHAR (255) NOT NULL
);

CREATE TABLE EquipamentoManutencao (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    id_equipamento INT NOT NULL,
    id_manutencao INT NOT NULL,
    FOREIGN KEY (id_equipamento) REFERENCES Equipamento(id),
    FOREIGN KEY (id_manutencao) REFERENCES Manutencao(id)
);

CREATE TABLE Tecnico (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR (255) NOT NULL, /*Considero campo essencial por ser a forma de contato com o técnico*/
    Descricao TEXT (255)
);

CREATE TABLE TecnicoManutencao (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    id_tecnico INT NOT NULL,
    id_manutencao INT NOT NULL,
    FOREIGN KEY (id_tecnico) REFERENCES Tecnico(id),
    FOREIGN KEY (id_manutencao) REFERENCES Manutencao(id)
);

CREATE TABLE CadastroPecas (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Codigo INT NOT NULL,
    NomePeca VARCHAR (255) NOT NULL,
    Fabricante VARCHAR (255)
);

CREATE TABLE PecasManutencao (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    id_cadastro_pecas INT NOT NULL,
    id_manutencao INT NOT NULL,
    FOREIGN KEY (id_cadastro_pecas) REFERENCES CadastroPecas(id),
    FOREIGN KEY (id_manutencao) REFERENCES Manutencao(id)
);

CREATE TABLE LaudoTecnico (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Data DATE NOT NULL,
    Observacao TEXT,
    Resultado VARCHAR (255) NOT NULL
);

CREATE TABLE LaudoManutencao (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    id_laudo_tecnico INT NOT NULL,
    id_manutencao INT NOT NULL,
    FOREIGN KEY (id_laudo_tecnico) REFERENCES LaudoTecnico(id),
    FOREIGN KEY (id_manutencao) REFERENCES Manutencao(id)
);

INSERT INTO Equipamento (Nome, Setor)
VALUES
("Prensa", "ETS"),
("Injetora", "MA"),
("Forno de secagem", "PT");

INSERT INTO Manutencao (Tipo, Data, Status, Resultado, ProximaData, PecasUsadas, QuantidadePecas)
VALUES
("Preventiva", "2025-03-01", "Concluída", "Sucesso", "2025-10-01", "Parafuso Francês", 5),
("Corretiva", "2025-07-30", "Em andamento", null, null, "Parafuso Philips", 30),
("Preventiva", "2025-01-30", "Concluída", "Sucesso", "2025-09-30", "Parafuso Allen", 15);

INSERT INTO EquipamentoManutencao (id_equipamento, id_manutencao)
VALUES
(1,3),
(2,1),
(3,2);

INSERT INTO Tecnico (Nome, Email, Descricao)
VALUES 
("Josevaldo Firmino dos Santos Pereira da Costa", "josevalcosta@exemplo,com", "Um ótimo técnico, atento aos detalhes"),
("Marcelo Oliveira de Araújo Amorim", "marceloaamorim@exemplo.com", "Técnico dedicado e atento aos detalhes"),
("Cleber José Xavier Rodrigues do Carmo", "cleberxavier@exemplo.com", "Técnico preciso e atento aos detalhes");

INSERT INTO TecnicoManutencao (id_manutencao, id_tecnico)
VALUES
(2, 1),
(3, 2),
(1, 3);

INSERT INTO CadastroPecas (Codigo, NomePeca, Fabricante)
VALUES
(2030302, "Parafuso Francês", "Jomarca"),
(3283828, "Parafuso Philips", "Jomarca"),
(3828388, "Parafuso Allen", "Jomarca");

INSERT INTO PecasManutencao (id_cadastro_pecas, id_manutencao)
VALUES 
(1, 1),
(2, 2),
(3, 3);

INSERT INTO LaudoTecnico (Data, Observacao, Resultado)
VALUES
("2025-07-30", null, "Sucesso"),
("2025-03-01", "Dar atenção ao mandril na próxima visita", "Sucesso"),
("2025-01-30", null, "Sucesso");

INSERT INTO LaudoManutencao (id_manutencao, id_laudo_tecnico)
VALUES
(1, 3),
(2, 1),
(3, 2);

SELECT * FROM Equipamento;
SELECT * FROM Manutencao;
SELECT * FROM EquipamentoManutencao;
SELECT * FROM Tecnico;
SELECT * FROM TecnicoManutencao;
SELECT * FROM CadastroPecas;
SELECT * FROM PecasManutencao;
SELECT * FROM LaudoTecnico;
SELECT * FROM LaudoManutencao;
