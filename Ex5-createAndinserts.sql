-- Criação da tabela FUNCIONARIO
CREATE TABLE FUNCIONARIO (
    Pnome VARCHAR(100),
    Minicial VARCHAR(1),
    Unome VARCHAR(100),
    Cpf CHAR(11),
    Datanasc DATE,
    Endereco VARCHAR(200),
    Sexo CHAR(1),
    Salario DECIMAL(10, 2),
    Cpf_supervisor CHAR(11),
    Dnr INTEGER,
    PRIMARY KEY (Cpf),
    FOREIGN KEY (Cpf_supervisor) REFERENCES FUNCIONARIO(Cpf)
);

-- Criação da tabela DEPARTAMENTO
CREATE TABLE DEPARTAMENTO (
    Dnome VARCHAR(100),
    Dnumero INTEGER,
    Cpf_gerente CHAR(11),
    Data_inicio_gerente DATE,
    PRIMARY KEY (Dnumero),
    FOREIGN KEY (Cpf_gerente) REFERENCES FUNCIONARIO(Cpf)
);

-- Criação da tabela LOCALIZACAO_DEP
CREATE TABLE LOCALIZACAO_DEP (
    Dnumero INTEGER,
    Dlocal VARCHAR(100),
    PRIMARY KEY (Dnumero, Dlocal),
    FOREIGN KEY (Dnumero) REFERENCES DEPARTAMENTO(Dnumero)
);

-- Criação da tabela PROJETO
CREATE TABLE PROJETO (
    Projnome VARCHAR(100),
    Projnumero INTEGER,
    Projlocal VARCHAR(100),
    Dnum INTEGER,
    PRIMARY KEY (Projnumero),
    FOREIGN KEY (Dnum) REFERENCES DEPARTAMENTO(Dnumero)
);

-- Criação da tabela TRABALHA_EM
CREATE TABLE TRABALHA_EM (
    Fcpf CHAR(11),
    Pnr INTEGER,
    Horas INTEGER,
    PRIMARY KEY (Fcpf, Pnr),
    FOREIGN KEY (Fcpf) REFERENCES FUNCIONARIO(Cpf),
    FOREIGN KEY (Pnr) REFERENCES PROJETO(Projnumero)
);

-- Criação da tabela DEPENDENTE
CREATE TABLE DEPENDENTE (
    Fcpf CHAR(11),
    Nome_dependente VARCHAR(100),
    Sexo CHAR(1),
    Datanasc DATE,
    Parentesco VARCHAR(50),
    PRIMARY KEY (Fcpf, Nome_dependente),
    FOREIGN KEY (Fcpf) REFERENCES FUNCIONARIO(Cpf)
);


INSERT INTO FUNCIONARIO (Pnome, Minicial, Unome, Cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr) VALUES 
('João', 'A', 'Silva', '11111111111', '1990-05-10', 'Rua A, 123', 'M', 9000.00, NULL, 1),
('Maria', 'B', 'Santos', '22222222222', '1988-12-15', 'Avenida B, 456', 'F', 4500.00, '11111111111', 2),
('Pedro', 'C', 'Ferreira', '33333333333', '1995-07-20', 'Rua C, 789', 'M', 5500.00, '11111111111', 1),
('Ana', 'D', 'Oliveira', '44444444444', '1992-02-12', 'Avenida D, 987', 'F', 95000.00, NULL, 2),
('Carlos', 'E', 'Santana', '55555555555', '1991-09-25', 'Rua E, 654', 'M', 77500.00, '11111111111', 1),
('Mariana', 'F', 'Costa', '66666666666', '1994-11-08', 'Avenida F, 321', 'F', 100000.00, '22222222222', 2),
('Rafael', 'G', 'Pereira', '77777777777', '1993-06-30', 'Rua G, 876', 'M', 4800.00, '22222222222', 1);

INSERT INTO DEPARTAMENTO (Dnome, Dnumero, Cpf_gerente, Data_inicio_gerente) VALUES 
('Vendas', 1, '11111111111', '2022-01-01'),
('Financeiro', 2, '22222222222', '2022-03-15');

INSERT INTO LOCALIZACAO_DEP (Dnumero, Dlocal) VALUES
(1, 'São Paulo'),
(2, 'Rio de Janeiro');

INSERT INTO PROJETO (Projnome, Projnumero, Projlocal, Dnum) VALUES 
('Projeto A', 1, 'São Paulo', 1),
('Projeto B', 2, 'Rio de Janeiro', 2),
('Projeto C', 3, 'Belo Horizonte', 2),
('Projeto D', 4, 'Brasília', 2),
('Projeto E', 5, 'Porto Alegre', 1),
('Projeto F', 6, 'Curitiba', 1),
('Projeto G', 7, 'Salvador',1),
('Projeto H', 8, 'Recife', 1),
('Projeto I', 9, 'Fortaleza', 2),
('Projeto J', 10, 'Manaus', 1);

INSERT INTO TRABALHA_EM (Fcpf, Pnr, Horas) VALUES 
('11111111111', 1, 40),
('22222222222', 2, 30),
('33333333333', 3, 20),
('44444444444', 4, 35),
('55555555555', 5, 25),
('66666666666', 6, 30),
('77777777777', 7, 40),
('11111111111', 8, 35),
('44444444444', 9, 20),
('22222222222', 10, 25);

INSERT INTO DEPENDENTE (Fcpf, Nome_dependente, Sexo, Datanasc, Parentesco) VALUES 
('11111111111', 'João', 'M', '2005-05-10', 'Filho'),
('22222222222', 'Maria', 'F', '2008-08-15', 'Filha'),
('33333333333', 'Pedro', 'M', '2003-02-20', 'Filho'),
('44444444444', 'Ana', 'F', '2010-10-05', 'Filha'),
('55555555555', 'Lucas', 'M', '2006-06-25', 'Filho'),
('66666666666', 'Mariana', 'F', '2004-04-15', 'Filha'),
('77777777777', 'Gabriel', 'M', '2007-07-12', 'Filho');
