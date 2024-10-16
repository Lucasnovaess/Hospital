CREATE DATABASE hospital;
USE hospital;

-- DESC de todos as relações
DESC paciente; DESC medico; DESC consulta; DESC medicamento; DESC procedimento; DESC medico_procedimento;

-- Criando a tabela paciente
CREATE TABLE paciente (
idPaciente INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(90),
idade INT,
sexo CHAR(1) CHECK (sexo IN ('M', 'F')),
endereco VARCHAR(120) NOT NULL,
telefone VARCHAR(15) NOT NULL,
profissao VARCHAR(50),
PRIMARY KEY (idPaciente)
)DEFAULT CHARSET=utf8mb4;

-- Criando a tabela medico
CREATE TABLE medico (
idMedico INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(90),
especialidade VARCHAR(30),
telefone VARCHAR(15) NOT NULL,
idade INT,
sexo CHAR(1) CHECK (sexo IN ('M', 'F')), 
endereco VARCHAR(120) NOT NULL,
PRIMARY KEY (idMedico)
)DEFAULT CHARSET=utf8mb4;

-- Criando a tabela consulta
CREATE TABLE consulta (
idConsulta INT NOT NULL AUTO_INCREMENT,
data_consulta DATE,
horario TIME,
diagnostico TEXT,
PRIMARY KEY (idConsulta)
)DEFAULT CHARSET=utf8mb4;

-- Adicionando as colunas em consulta
ALTER TABLE consulta
ADD COLUMN idPaciente INT;

ALTER TABLE consulta
ADD COLUMN idMedico INT;

-- Transformando em Foreign Key na tabela consulta
ALTER TABLE consulta
ADD FOREIGN KEY (idPaciente)
REFERENCES paciente(idPaciente);

ALTER TABLE consulta
ADD FOREIGN KEY (idMedico)
REFERENCES medico(idMedico);

-- Criando a tabela medicamento
CREATE TABLE medicamento (
idMedicamento INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(30) DEFAULT 'Genérico',
descricao TEXT,
substancia VARCHAR(120),
PRIMARY KEY (idMedicamento)
)DEFAULT CHARSET=utf8mb4;

-- Adicionando a coluna idPaciente em medicamento
ALTER TABLE medicamento
ADD COLUMN idPaciente INT;

-- Transformando em Foreign Key a coluna idPaciente na tabela medicamento
ALTER TABLE medicamento
ADD FOREIGN KEY (idPaciente)
REFERENCES paciente(idPaciente);

-- Criando a tabela procedimento
CREATE TABLE procedimento (
idProcedimento INT NOT NULL AUTO_INCREMENT,
nome_procedimento VARCHAR(40),
data_procedimento DATE,
PRIMARY KEY (idProcedimento)
)DEFAULT CHARSET=utf8mb4;

-- Adicionando a coluna idPaciente em procedimento
ALTER TABLE procedimento
ADD COLUMN idPaciente INT;

-- Transformando em Foreign Key a coluna idPaciente na tabela procedimento
ALTER TABLE procedimento
ADD FOREIGN KEY (idPaciente)
REFERENCES paciente(idPaciente);

-- Criando a tabela medico_procedimento
CREATE TABLE medico_procedimento (
idMedico INT, 
idProcedimento INT,
PRIMARY KEY (idMedico, idProcedimento)
)DEFAULT CHARSET=utf8mb4;

-- Transformando em Foreign Key na tabela medico_procedimento
ALTER TABLE medico_procedimento
ADD FOREIGN KEY (idMedico)
REFERENCES medico(idMedico);

ALTER TABLE medico_procedimento
ADD FOREIGN KEY (idProcedimento)
REFERENCES procedimento(idProcedimento);

-- Populando as relações com valores

-- Paciente
INSERT INTO paciente (nome, idade, sexo, endereco, telefone, profissao) VALUES
('Alice Silva', 30, 'F', 'Rua A, 123', '11987654321', 'Professora'),
('Bruno Costa', 45, 'M', 'Rua B, 456', '11998765432', 'Engenheiro'),
('Carlos Souza', 25, 'M', 'Rua C, 789', '11912345678', 'Estudante'),
('Diana Lima', 35, 'F', 'Rua D, 321', '11923456789', 'Médica'),
('Elena Santos', 28, 'F', 'Rua E, 654', '11934567890', 'Arquiteta'),
('Felipe Almeida', 40, 'M', 'Rua F, 987', '11945678901', 'Advogado'),
('Gabriela Mendes', 50, 'F', 'Rua G, 159', '11956789012', 'Psicóloga'),
('Henrique Oliveira', 60, 'M', 'Rua H, 753', '11967890123', 'Aposentado'),
('Isabela Rocha', 32, 'F', 'Rua I, 258', '11978901234', 'Contadora'),
('João Pereira', 55, 'M', 'Rua J, 369', '11989012345', 'Funcionário Público');

-- Medico
INSERT INTO medico (nome, especialidade, telefone, idade, sexo, endereco) VALUES
('Dr. André Martins', 'Cardiologia', '11912345678', 50, 'M', 'Avenida X, 111'),
('Dra. Beatriz Rocha', 'Pediatria', '11923456789', 38, 'F', 'Avenida Y, 222'),
('Dr. Carlos Mendes', 'Ortopedia', '11934567890', 45, 'M', 'Avenida Z, 333'),
('Dra. Daniela Lima', 'Ginecologia', '11945678901', 42, 'F', 'Avenida W, 444'),
('Dr. Eduardo Alves', 'Dermatologia', '11956789012', 40, 'M', 'Avenida V, 555'),
('Dra. Fernanda Silva', 'Oftalmologia', '11967890123', 35, 'F', 'Avenida U, 666'),
('Dr. Gabriel Santos', 'Neurologia', '11978901234', 55, 'M', 'Avenida T, 777'),
('Dra. Helena Costa', 'Nutrição', '11989012345', 33, 'F', 'Avenida S, 888'),
('Dr. Igor Fernandes', 'Psiquiatria', '11990123456', 48, 'M', 'Avenida R, 999'),
('Dra. Juliana Rocha', 'Anestesiologia', '11901234567', 39, 'F', 'Avenida Q, 101');

-- Consulta
INSERT INTO consulta (data_consulta, horario, diagnostico, idPaciente, idMedico) VALUES
('2024-10-01', '10:00:00', 'Exame de rotina', 1, 1),
('2024-10-02', '11:00:00', 'Consulta pediátrica', 2, 2),
('2024-10-03', '14:00:00', 'Fratura no braço', 3, 3),
('2024-10-04', '15:00:00', 'Check-up ginecológico', 4, 4),
('2024-10-05', '09:00:00', 'Alergia de pele', 5, 5),
('2024-10-06', '08:30:00', 'Problemas de visão', 6, 6),
('2024-10-07', '16:00:00', 'Dor de cabeça frequente', 7, 7),
('2024-10-08', '10:30:00', 'Avaliação nutricional', 8, 8),
('2024-10-09', '13:00:00', 'Ansiedade', 9, 9),
('2024-10-10', '11:30:00', 'Consulta de retorno', 10, 10);

-- Medicamento
INSERT INTO medicamento (nome, descricao, substancia) VALUES
('Paracetamol', 'Analgésico e antipirético', 'Paracetamol'),
('Ibuprofeno', 'Antiinflamatório', 'Ibuprofeno'),
('Amoxicilina', 'Antibiótico', 'Amoxicilina'),
('Cetirizina', 'Antialérgico', 'Cetirizina'),
('Losartana', 'Antihipertensivo', 'Losartana'),
('Metformina', 'Antidiabético', 'Metformina'),
('Simvastatina', 'Redutor de colesterol', 'Simvastatina'),
('Omeprazol', 'Inibidor de bomba de prótons', 'Omeprazol'),
('Salbutamol', 'Broncodilatador', 'Salbutamol'),
(DEFAULT, 'Antiinflamatório e anticoagulante', 'Ácido acetilsalicílico');

-- Procedimento
INSERT INTO procedimento (idProcedimento, nome_procedimento, data_procedimento, idPaciente)
VALUES
(1, 'Cateterismo', '2024-10-11', 1),
(2, 'Biópsia de pele', '2024-10-13', 2),
(3, 'Cirurgia ortopédica', '2024-10-16', 3),
(4, 'Vacina contra gripe', '2024-10-19', 4),
(5, 'Ressonância magnética', '2024-10-21', 5),
(6, 'Exame de Sangue', '2024-11-01', 6),
(7, 'Ultrassonografia', '2024-11-03', 7),
(8, 'Endoscopia', '2024-11-05', 8),
(9, 'Consulta de Retorno', '2024-11-07', 9),
(10, 'Transfusão de Sangue', '2024-11-09', 10);

-- medico_procedimento
INSERT INTO medico_procedimento (idMedico, idProcedimento) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10);

-- Prática
-- 1 Crie um código que liste o nome de todos os pacientes.
SELECT nome FROM paciente;

-- 2 Escreva uma consulta que conte quantos médicos estão cadastrados no sistema.
SELECT COUNT(idMedico) FROM medico;

-- 3 Crie uma consulta que selecione todos os pacientes do sexo feminino.
SELECT nome FROM paciente
WHERE sexo = 'F';

-- 4 Elabore uma consulta que mostre todas as consultas realizadas, incluindo o nome do paciente e a data da consulta.
SELECT p.nome, c.data_consulta
FROM paciente p JOIN consulta c
ON p.idPaciente = c.idPaciente;

-- 5 Desenvolva uma consulta que encontre o médico que possui a especialidade "Cardiologia".
SELECT m.nome, m.especialidade 
FROM medico m JOIN consulta c
ON m.idMedico = c. idMedico
WHERE m.especialidade = 'Cardiologista';

-- 6 Crie um código que liste todos os medicamentos prescritos para um paciente com ID 2.
SELECT p.nome AS paciente, medic.nome AS medicamento, medic.descricao, medic.substancia
FROM medicamento medic JOIN paciente p
ON medic.idMedicamento = p.idPaciente
WHERE p.idPaciente = '2';

-- 7 Escreva uma consulta que conte o número total de consultas realizadas por cada paciente.
SELECT p.nome, COUNT(c.idConsulta) AS total_consultas
FROM paciente p JOIN consulta c
ON p.idPaciente = c.idPaciente
GROUP BY idConsulta;

-- 8 Crie uma consulta que mostre todos os pacientes que têm procedimentos registrados, incluindo o nome do paciente e o nome do procedimento.
SELECT pa.nome, pro.nome_procedimento
FROM paciente pa JOIN procedimento pro
ON pa.idPaciente = pro.idPaciente;

-- 9 Desenvolva uma consulta que liste os pacientes que não possuem consultas registradas no sistema.
SELECT pa.nome
FROM paciente pa LEFT JOIN consulta c
ON pa.idPaciente = c.idPaciente
WHERE c.idConsulta IS NULL;

-- 10 Escreva uma consulta que mostre a idade média dos pacientes cadastrados.
SELECT AVG(idade) AS Idade_Media
FROM paciente;