ALTER TABLE Oficina_DB.Funcionario DROP CONSTRAINT IF EXISTS ADDOFICINAFK;
ALTER TABLE Oficina_DB.Oficina DROP CONSTRAINT IF EXISTS ADDGERENTEFK;
DROP FUNCTION IF EXISTS Oficina_DB.MecanicoServico

GO

DROP TABLE IF EXISTS Oficina_DB.Revisao;
DROP TABLE IF EXISTS Oficina_DB.Necessita;
DROP TABLE IF EXISTS Oficina_DB.Reparacao;
DROP TABLE IF EXISTS Oficina_DB.Efetua;
DROP TABLE IF EXISTS Oficina_DB.Peca;
DROP TABLE IF EXISTS Oficina_DB.Servico;
DROP TABLE IF EXISTS Oficina_DB.Veiculo;
DROP TABLE IF EXISTS Oficina_DB.TipoVeiculo;
DROP TABLE IF EXISTS Oficina_DB.Possui;
DROP TABLE IF EXISTS Oficina_DB.Oficina;
DROP TABLE IF EXISTS Oficina_DB.Mecanico;
DROP TABLE IF EXISTS Oficina_DB.Gerente;
DROP TABLE IF EXISTS Oficina_DB.Cliente;
DROP TABLE IF EXISTS Oficina_DB.Funcionario;
DROP TABLE IF EXISTS Oficina_DB.Pessoa;

GO

DROP SCHEMA IF EXISTS Oficina_DB;

GO

CREATE SCHEMA Oficina_DB;

GO


CREATE TABLE Oficina_DB.Pessoa (
    nif                 INT                     NOT NULL
        CHECK (nif > 99999999 AND nif < 1000000000),
    telefone            INT             UNIQUE  NOT NULL
        CHECK (telefone > 99999999 AND telefone < 1000000000),
    endereco            VARCHAR(50)             NULL,
    nome                VARCHAR(20)             NOT NULL,
    apelido             VARCHAR(50)             NULL,
    PRIMARY KEY (nif)
);

GO

CREATE TABLE Oficina_DB.Funcionario (
    nif                 INT                     NOT NULL
        CHECK (nif > 99999999 AND nif < 1000000000),
    salario             MONEY                   NULL,
    n_oficina           INT                     NULL
        CHECK (n_oficina > 0),
    FOREIGN KEY (nif) REFERENCES Oficina_DB.Pessoa(nif)
        ON UPDATE CASCADE,
    PRIMARY KEY (nif)
);

GO

CREATE TABLE Oficina_DB.Cliente (
    nif                 INT                     NOT NULL
        CHECK (nif > 99999999 AND nif < 1000000000),
    parceiro            BIT                     NULL			DEFAULT (0),        -- 0 -> base; 1 -> parceiro
    FOREIGN KEY (nif) REFERENCES Oficina_DB.Pessoa(nif)
        ON UPDATE CASCADE,
    PRIMARY KEY (nif)
);

GO

CREATE TABLE Oficina_DB.Gerente (
    nif                 INT                     NOT NULL
        CHECK (nif > 99999999 AND nif < 1000000000),
    bonus               MONEY                   NULL,
    FOREIGN KEY (nif) REFERENCES Oficina_DB.Pessoa(nif)
        ON UPDATE CASCADE,
    PRIMARY KEY (nif)
);

GO

/*CREATE TABLE Oficina_DB.GerenteTEMP (
    nif                 INT                     NOT NULL
    PRIMARY KEY(id)
);*/

GO

CREATE TABLE Oficina_DB.Mecanico (
    nif                 INT                     NOT NULL
        CHECK (nif > 99999999 AND nif < 1000000000),
    especialidade       VARCHAR(20)             NULL,
    FOREIGN KEY (nif) REFERENCES Oficina_DB.Pessoa(nif)
        ON UPDATE CASCADE,
    PRIMARY KEY (nif)
);

GO

CREATE TABLE Oficina_DB.Oficina (
    numero              INT                     NOT NULL        IDENTITY(1,1)
        CHECK (numero > 0),
    telefone            INT             UNIQUE  NOT NULL
        CHECK (telefone > 99999999 AND telefone < 1000000000),
    cidade              VARCHAR(10)             NULL,
    email               VARCHAR(30)     UNIQUE  NOT NULL,
    gerente             INT                     NULL,
       -- CHECK (gerente > 99999999 AND gerente < 1000000000),
    PRIMARY KEY (numero)
);

GO
/*
CREATE TABLE Oficina_DB.Possui (
    oficina             INT                     NOT NULL
        CHECK (oficina > 0),
    cliente             INT                     NOT NULL
        CHECK (cliente > 99999999 AND cliente < 1000000000),
    FOREIGN KEY (oficina) REFERENCES Oficina_DB.Oficina(numero)
        ON UPDATE CASCADE,
    FOREIGN KEY (cliente) REFERENCES Oficina_DB.Cliente(nif)
        ON UPDATE CASCADE,
    PRIMARY KEY (oficina, cliente)
);

GO
*/
CREATE TABLE Oficina_DB.TipoVeiculo (
    id                INT                     NOT NULL
        CHECK (id >= 0 AND id <= 3),
    nome              VARCHAR(10)             NOT NULL,
    PRIMARY KEY (id)
);

GO

CREATE TABLE Oficina_DB.Veiculo (
    matricula           CHAR(6)                 NOT NULL
        CHECK (matricula like '[A-Z][A-Z][0-9][0-9][0-9][0-9]'
            OR matricula like '[0-9][0-9][A-Z][A-Z][0-9][0-9]'
            OR matricula like '[0-9][0-9][0-9][0-9][A-Z][A-Z]'
            OR matricula like '[0-9][0-9][A-Z][A-Z][A-Z][A-Z]'
            OR matricula like '[A-Z][A-Z][0-9][0-9][A-Z][A-Z]'
            OR matricula like '[A-Z][A-Z][A-Z][A-Z][0-9][0-9]'),
    marca               VARCHAR(20)             NULL,
    tipo                INT                     NULL,
    dono                INT                     NOT NULL
        CHECK (dono > 99999999 AND dono < 1000000000),
    oficina             INT                     NOT NULL
        CHECK (oficina > 0),
    data_in             DATETIME                NULL,
    data_out            DATETIME                NULL,
        --CHECK (data_out > data_in),
    FOREIGN KEY (tipo) REFERENCES Oficina_DB.TipoVeiculo(id)
        ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (dono) REFERENCES Oficina_DB.Pessoa(nif)
        ON UPDATE CASCADE,
    FOREIGN KEY (oficina) REFERENCES Oficina_DB.Oficina(numero)
        ON UPDATE CASCADE,
    PRIMARY KEY (matricula)
);

GO

CREATE TABLE Oficina_DB.Servico (
    id                  INT                     NOT NULL        IDENTITY(1,1),
        --CHECK (id > 0),
    preco               MONEY                   NULL,
    oficina             INT                     NOT NULL
        CHECK (oficina > 0),
    veiculo             CHAR(6)                 NOT NULL
        CHECK (veiculo like '[A-Z][A-Z][0-9][0-9][0-9][0-9]'
            OR veiculo like '[0-9][0-9][A-Z][A-Z][0-9][0-9]'
            OR veiculo like '[0-9][0-9][0-9][0-9][A-Z][A-Z]'
            OR veiculo like '[0-9][0-9][A-Z][A-Z][A-Z][A-Z]'
            OR veiculo like '[A-Z][A-Z][0-9][0-9][A-Z][A-Z]'
            OR veiculo like '[A-Z][A-Z][A-Z][A-Z][0-9][0-9]'),
	preco_final         MONEY                   NULL,
    data_inic           DATETIME                NULL,
    data_conc           DATETIME                NULL,
        CHECK (data_conc > data_inic),
    FOREIGN KEY (oficina) REFERENCES Oficina_DB.Oficina(numero),
    FOREIGN KEY (veiculo) REFERENCES Oficina_DB.Veiculo(matricula),
    PRIMARY KEY (id)
);

GO

CREATE TABLE Oficina_DB.Peca (
    referencia          VARCHAR(10)             NOT NULL,
    nome                VARCHAR(30)             NOT NULL,
    preco               MONEY                   NULL,
    num_stock           INT                     NULL
        CHECK (num_stock >= 0),
    PRIMARY KEY (referencia)
);

GO

CREATE TABLE Oficina_DB.Efetua (
    servico             INT                     NOT NULL
        CHECK (servico > 0),
    mecanico            INT                     NOT NULL
        CHECK (mecanico > 99999999 AND mecanico < 1000000000),
    FOREIGN KEY (servico) REFERENCES Oficina_DB.Servico(id)
        ON UPDATE CASCADE,
    FOREIGN KEY (mecanico) REFERENCES Oficina_DB.Mecanico(nif)
        ON UPDATE CASCADE,
    PRIMARY KEY (servico, mecanico)
);

GO

CREATE TABLE Oficina_DB.Reparacao (
    id                  INT                     NOT NULL
        CHECK (id > 0),
    peca                VARCHAR(10)             NULL,
	n_pecas             INT                     NULL
        CHECK (n_pecas >= 0),
    FOREIGN KEY (id) REFERENCES Oficina_DB.Servico(id)
        ON UPDATE CASCADE,
    FOREIGN KEY (peca) REFERENCES Oficina_DB.Peca(referencia),
    PRIMARY KEY (id)
);

GO
/*
CREATE TABLE Oficina_DB.Necessita (
    referencia          VARCHAR(10)             NOT NULL,
    reparacao           INT                     NOT NULL
        CHECK (reparacao > 0),
	n_pecas             INT                     NULL
        CHECK (n_pecas >= 0),
    FOREIGN KEY (referencia) REFERENCES Oficina_DB.Peca(referencia)
        ON UPDATE CASCADE,
    FOREIGN KEY (reparacao) REFERENCES Oficina_DB.Reparacao(id)
        ON UPDATE CASCADE,
    PRIMARY KEY (referencia, reparacao)
);

GO
*/
CREATE TABLE Oficina_DB.Revisao (
    id                  INT                     NOT NULL
        CHECK (id > 0),
    tipo                VARCHAR(50)             NULL,
    FOREIGN KEY (id) REFERENCES Oficina_DB.Servico(id)
        ON UPDATE CASCADE,
    PRIMARY KEY (id)
);

GO


insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (111111000, 111111000, 'rua primeira de aveiro, 110', 'Andre', 'Gomes Amador')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (111222000, 111222000, 'rua primeira do porto, 120', 'Andre', 'Fernandes Ferreira')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (111333000, 111333000, 'rua primeira de lisboa, 130', 'Andre', 'Santos Guedes')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (222111111, 222111111, 'rua primeira de aveiro, 211', 'Bernardo', 'Silva Bento')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (222111222, 222111222, 'rua primeira de aveiro, 212', 'Bernardo', 'Silva Dias')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (222111333, 222111333, 'rua primeira de aveiro, 213', 'Bernardo', 'Silva Domingues')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (222222111, 222222111, 'rua primeira do porto, 221', 'Bernardo', 'Figueiredo Henriques')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (222222222, 222222222, 'rua primeira do porto, 222', 'Bernardo', 'Figueiredo Lopes')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (222222333, 222222333, 'rua primeira do porto, 223', 'Bernardo', 'Figueiredo Antunes')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (222333111, 222333111, 'rua primeira de lisboa, 231', 'Bernardo', 'Luis Viegas')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (222333222, 222333222, 'rua primeira de lisboa, 232', 'Bernardo', 'Luis Esteves')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (222333333, 222333333, 'rua primeira de lisboa, 233', 'Bernardo', 'Luis Egas')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (333111111, 333111111, 'rua primeira de aveiro, 311', 'Carlos', 'Almeida Costa')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (333111222, 333111222, 'rua primeira de aveiro, 312', 'Carlos', 'Almeida Goncalves')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (333111333, 333111333, 'rua primeira de aveiro, 313', 'Carlos', 'Almeida Geraldes')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (333111444, 333111444, 'rua primeira de aveiro, 314', 'Carlos', 'Almeida Teles')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (333111555, 333111555, 'rua primeira de aveiro, 315', 'Carlos', 'Almeida Godins')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (333222111, 333222111, 'rua primeira do porto, 321', 'Carlos', 'Soares Marques')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (333222222, 333222222, 'rua primeira do porto, 322', 'Carlos', 'Soares Pinheiro')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (333222333, 333222333, 'rua primeira do porto, 323', 'Carlos', 'Soares Castro')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (333222444, 333222444, 'rua primeira do porto, 324', 'Carlos', 'Soares Santos')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (333222555, 333222555, 'rua primeira do porto, 325', 'Carlos', 'Soares Tavares')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (333333111, 333333111, 'rua primeira de lisboa, 331', 'Carlos', 'Nunes Pais')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (333333222, 333333222, 'rua primeira de lisboa, 332', 'Carlos', 'Nunes Ramires')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (333333333, 333333333, 'rua primeira de lisboa, 333', 'Carlos', 'Nunes Vasques')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (333333444, 333333444, 'rua primeira de lisboa, 334', 'Carlos', 'Nunes Guimaraes')
insert into Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) 
    values (333333555, 333333555, 'rua primeira de lisboa, 335', 'Carlos', 'Nunes Amador')

insert into Oficina_DB.Funcionario (nif, salario, n_oficina) 
    values (111111000, 2100, 1)
insert into Oficina_DB.Funcionario (nif, salario, n_oficina) 
    values (111222000, 2200, 2)
insert into Oficina_DB.Funcionario (nif, salario, n_oficina) 
    values (111333000, 2300, 3)
insert into Oficina_DB.Funcionario (nif, salario, n_oficina) 
    values (222111111, 1100, 1)
insert into Oficina_DB.Funcionario (nif, salario, n_oficina) 
    values (222111222, 1100, 1)
insert into Oficina_DB.Funcionario (nif, salario, n_oficina) 
    values (222111333, 1100, 1)
insert into Oficina_DB.Funcionario (nif, salario, n_oficina) 
    values (222222111, 1200, 2)
insert into Oficina_DB.Funcionario (nif, salario, n_oficina) 
    values (222222222, 1200, 2)
insert into Oficina_DB.Funcionario (nif, salario, n_oficina) 
    values (222222333, 1200, 2)
insert into Oficina_DB.Funcionario (nif, salario, n_oficina) 
    values (222333111, 1300, 3)
insert into Oficina_DB.Funcionario (nif, salario, n_oficina) 
    values (222333222, 1300, 3)
insert into Oficina_DB.Funcionario (nif, salario, n_oficina) 
    values (222333333, 1300, 3)

insert into Oficina_DB.Cliente (nif, parceiro) 
    values (333111111, 0)
insert into Oficina_DB.Cliente (nif, parceiro) 
    values (333111222, 0)
insert into Oficina_DB.Cliente (nif, parceiro) 
    values (333111333, 0)
insert into Oficina_DB.Cliente (nif, parceiro) 
    values (333111444, 1)
insert into Oficina_DB.Cliente (nif, parceiro) 
    values (333111555, 1)
insert into Oficina_DB.Cliente (nif, parceiro) 
    values (333222111, 0)
insert into Oficina_DB.Cliente (nif, parceiro) 
    values (333222222, 0)
insert into Oficina_DB.Cliente (nif, parceiro) 
    values (333222333, 0)
insert into Oficina_DB.Cliente (nif, parceiro) 
    values (333222444, 1)
insert into Oficina_DB.Cliente (nif, parceiro) 
    values (333222555, 1)
insert into Oficina_DB.Cliente (nif, parceiro) 
    values (333333111, 0)
insert into Oficina_DB.Cliente (nif, parceiro) 
    values (333333222, 0)
insert into Oficina_DB.Cliente (nif, parceiro) 
    values (333333333, 0)
insert into Oficina_DB.Cliente (nif, parceiro) 
    values (333333444, 1)
insert into Oficina_DB.Cliente (nif, parceiro) 
    values (333333555, 1)

insert into Oficina_DB.Gerente (nif, bonus) 
    values (111111000, 1)
insert into Oficina_DB.Gerente (nif, bonus) 
    values (111222000, 1.5)
insert into Oficina_DB.Gerente (nif, bonus) 
    values (111333000, 2)

insert into Oficina_DB.Mecanico (nif, especialidade) 
    values (222111111, 'motor')
insert into Oficina_DB.Mecanico (nif, especialidade) 
    values (222111222, 'pneus, carroçaria')
insert into Oficina_DB.Mecanico (nif, especialidade) 
    values (222111333, 'revisao, pintura')
insert into Oficina_DB.Mecanico (nif, especialidade) 
    values (222222111, 'motor')
insert into Oficina_DB.Mecanico (nif, especialidade) 
    values (222222222, 'pneus, carroçaria')
insert into Oficina_DB.Mecanico (nif, especialidade) 
    values (222222333, 'revisao, pintura')
insert into Oficina_DB.Mecanico (nif, especialidade) 
    values (222333111, 'motor')
insert into Oficina_DB.Mecanico (nif, especialidade) 
    values (222333222, 'pneus, carroçaria')
insert into Oficina_DB.Mecanico (nif, especialidade) 
    values (222333333, 'revisao, pintura')

insert into Oficina_DB.Oficina (telefone, cidade, email, gerente) 
    values (999999111, 'aveiro', 'aveiro@oficina.pt', 111111000)
insert into Oficina_DB.Oficina (telefone, cidade, email, gerente) 
    values (999999222, 'porto', 'porto@oficina.pt', 111222000)
insert into Oficina_DB.Oficina (telefone, cidade, email, gerente) 
    values (999999333, 'lisboa', 'lisboa@oficina.pt', 111333000)
/*
insert into Oficina_DB.Possui (oficina, cliente) 
    values (1, 333111111)
insert into Oficina_DB.Possui (oficina, cliente) 
    values (1, 333111222)
insert into Oficina_DB.Possui (oficina, cliente) 
    values (1, 333111333)
insert into Oficina_DB.Possui (oficina, cliente) 
    values (1, 333111444)
insert into Oficina_DB.Possui (oficina, cliente) 
    values (1, 333111555)
insert into Oficina_DB.Possui (oficina, cliente) 
    values (2, 333222111)
insert into Oficina_DB.Possui (oficina, cliente) 
    values (2, 333222222)
insert into Oficina_DB.Possui (oficina, cliente) 
    values (2, 333222333)
insert into Oficina_DB.Possui (oficina, cliente) 
    values (2, 333222444)
insert into Oficina_DB.Possui (oficina, cliente) 
    values (2, 333222555)
insert into Oficina_DB.Possui (oficina, cliente) 
    values (3, 333333111)
insert into Oficina_DB.Possui (oficina, cliente) 
    values (3, 333333222)
insert into Oficina_DB.Possui (oficina, cliente) 
    values (3, 333333333)
insert into Oficina_DB.Possui (oficina, cliente) 
    values (3, 333333444)
insert into Oficina_DB.Possui (oficina, cliente) 
    values (3, 333333555)
*/
insert into Oficina_DB.TipoVeiculo (id, nome) 
    values (1, 'Ligeiro')
insert into Oficina_DB.TipoVeiculo (id, nome)
    values (2, 'Pesado')
insert into Oficina_DB.TipoVeiculo (id, nome)
    values (3, 'Motociclo')

insert into Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out) 
    values ('AA1111', 'audi', 1, 333111111, 1, '2020-04-01 10:34:09 AM', '2020-04-01 05:21:05 PM')
insert into Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out) 
    values ('AA2211', 'bmw', 1, 333111222, 1, '2020-04-02 09:21:16 AM', '2020-04-02 03:49:30 PM')
insert into Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out) 
    values ('AA3311', 'renault', 1, 333111333, 1, '2020-04-03 10:49:59 AM', '2020-04-10 11:07:15 AM')
insert into Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out) 
    values ('AA4411', 'ferrari', 1, 333111444, 1, '2020-04-01 10:50:45 AM', '2020-04-02 04:20:56 PM')
insert into Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out) 
    values ('AA4422', 'ducati', 3, 333111444, 1, '2020-04-20 02:34:24 PM', '2020-04-21 02:21:54 PM')
insert into Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out) 
    values ('AA5511', 'mercedes', 2, 333111555, 1, '2020-03-20 09:45:11 AM', '2020-03-22 05:10:46 PM')
insert into Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out) 
    values ('AA5522', 'man', 2, 333111555, 1, '2020-04-20 10:01:25 AM', '2020-04-25 11:21:05 AM')
insert into Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out) 
    values ('11BB11', 'audi', 1, 333222111, 2, '2020-04-01 10:35:09 AM', '2020-04-01 05:22:05 PM')
insert into Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out) 
    values ('22BB11', 'bmw', 1, 333222222, 2, '2020-04-02 09:22:16 AM', '2020-04-02 03:50:30 PM')
insert into Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out) 
    values ('33BB11', 'renault', 1, 333222333, 2, '2020-04-03 10:50:59 AM', '2020-04-10 11:08:15 AM')
insert into Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out) 
    values ('44BB11', 'porsche', 1, 333222444, 2, '2020-04-01 10:51:45 AM', '2020-04-02 04:21:56 PM')
insert into Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out) 
    values ('44BB22', 'ducati', 3, 333222444, 2, '2020-04-20 02:35:24 PM', '2020-04-21 02:22:54 PM')
insert into Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out) 
    values ('55BB11', 'mercedes', 2, 333222555, 2, '2020-03-20 09:46:11 AM', '2020-03-22 05:11:46 PM')
insert into Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out) 
    values ('55BB22', 'man', 2, 333222555, 2, '2020-04-20 10:02:25 AM', '2020-04-25 11:22:05 AM')
insert into Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out) 
    values ('1111CC', 'audi', 1, 333333111, 3, '2020-04-01 10:36:09 AM', '2020-04-01 05:23:05 PM')
insert into Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out) 
    values ('2211CC', 'bmw', 1, 333333222, 3, '2020-04-02 09:23:16 AM', '2020-04-02 03:51:30 PM')
insert into Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out) 
    values ('3311CC', 'renault', 1, 333333333, 3, '2020-04-03 10:51:59 AM', '2020-04-10 11:09:15 AM')
insert into Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out) 
    values ('4411CC', 'mercedes', 1, 333333444, 3, '2020-04-01 10:52:45 AM', '2020-04-02 04:22:56 PM')
insert into Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out) 
    values ('4422CC', 'bmw', 3, 333333444, 3, '2020-04-20 02:36:24 PM', '2020-04-21 02:23:54 PM')
insert into Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out) 
    values ('5511CC', 'mercedes', 2, 333333555, 3, '2020-03-20 09:47:11 AM', '2020-03-22 05:12:46 PM')
insert into Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out) 
    values ('5522CC', 'man', 2, 333333555, 3, '2020-04-20 10:03:25 AM', '2020-04-25 11:23:05 AM')
insert into Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out)
	values ('AA00AA', 'volkswagen', 1, 111111000, 1, NULL, NULL)

insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (238.00, 1, 'AA5511', 268.94, '2020-02-02 09:45:11 AM', '2020-02-02 05:10:46 PM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (238.00, 2, '55BB11', 268.94, '2020-02-02 09:46:11 AM', '2020-02-02 05:11:46 PM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (238.00, 3, '5511CC', 268.94, '2020-02-02 09:47:11 AM', '2020-02-02 05:12:46 PM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (241.00, 1, 'AA5522', 272.33, '2020-02-10 11:13:25 AM', '2020-02-11 10:10:05 AM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (241.00, 2, '55BB22', 272.33, '2020-02-10 11:14:25 AM', '2020-02-11 10:11:05 AM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (241.00, 3, '5522CC', 272.33, '2020-02-10 11:15:25 AM', '2020-02-11 10:12:05 AM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (3256.00, 1, 'AA5511', 3679.28, '2020-03-20 09:55:11 AM', '2020-03-22 05:03:46 PM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (3256.00, 2, '55BB11', 3679.28, '2020-03-20 09:56:11 AM', '2020-03-22 05:04:46 PM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (3256.00, 3, '5511CC', 3679.28, '2020-03-20 09:57:11 AM', '2020-03-22 05:05:46 PM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (153.00, 1, 'AA4411', 172.89, '2020-04-01 10:53:45 AM', '2020-04-02 04:03:56 PM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (153.00, 2, '44BB11', 172.89, '2020-04-01 10:54:45 AM', '2020-04-02 04:04:56 PM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (153.00, 3, '4411CC', 172.89, '2020-04-01 10:55:45 AM', '2020-04-02 04:05:56 PM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (104.00, 1, 'AA1111', 127.92, '2020-04-01 10:50:09 AM', '2020-04-01 05:11:05 PM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (104.00, 2, '11BB11', 127.92, '2020-04-01 10:51:09 AM', '2020-04-01 05:12:05 PM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (104.00, 3, '1111CC', 127.92, '2020-04-01 10:52:09 AM', '2020-04-01 05:13:05 PM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (93.00, 1, 'AA2211', 114.39, '2020-04-02 09:56:16 AM', '2020-04-02 03:14:30 PM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (93.00, 2, '22BB11', 114.39, '2020-04-02 09:57:16 AM', '2020-04-02 03:15:30 PM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (93.00, 3, '2211CC', 114.39, '2020-04-02 09:58:16 AM', '2020-04-02 03:16:30 PM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (2134.00, 1, 'AA3311', 2624.82, '2020-04-03 10:57:59 AM', '2020-04-10 11:00:15 AM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (2134.00, 2, '33BB11', 2624.82, '2020-04-03 10:58:59 AM', '2020-04-10 11:01:15 AM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (2134.00, 3, '3311CC', 2624.82, '2020-04-03 10:59:59 AM', '2020-04-10 11:02:15 AM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (1038.00, 1, 'AA5522', 1172.94, '2020-04-20 10:20:25 AM', '2020-04-25 11:06:05 AM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (1038.00, 2, '55BB22', 1172.94, '2020-04-20 10:21:25 AM', '2020-04-25 11:07:05 AM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (1038.00, 3, '5522CC', 1172.94, '2020-04-20 10:22:25 AM', '2020-04-25 11:08:05 AM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (71.00, 1, 'AA4422', 80.23, '2020-04-20 02:40:24 PM', '2020-04-21 02:10:54 PM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (71.00, 2, '44BB22', 80.23, '2020-04-20 02:41:24 PM', '2020-04-21 02:11:54 PM')
insert into Oficina_DB.Servico (preco, oficina, veiculo, preco_final, data_inic, data_conc) 
    values (71.00, 3, '4422CC', 80.23, '2020-04-20 02:42:24 PM', '2020-04-21 02:12:54 PM')

insert into Oficina_DB.Peca (referencia, nome, preco, num_stock) 
    values ('A112345678', 'filtro de ar bmw', 30.0, 1)
insert into Oficina_DB.Peca (referencia, nome, preco, num_stock) 
    values ('A122345678', 'filtro de ar audi', 30.0, 3)
insert into Oficina_DB.Peca (referencia, nome, preco, num_stock) 
    values ('A123345678', 'filtro de ar renault', 30.0, 5)
insert into Oficina_DB.Peca (referencia, nome, preco, num_stock) 
    values ('A123445678', 'filtro de ar ferrari', 30.0, 0)
insert into Oficina_DB.Peca (referencia, nome, preco, num_stock) 
    values ('A123455678', 'filtro de ar ducatti', 28.0, 0)
insert into Oficina_DB.Peca (referencia, nome, preco, num_stock) 
    values ('A123456678', 'filtro de ar mercedes', 42.0, 0)
insert into Oficina_DB.Peca (referencia, nome, preco, num_stock) 
    values ('A123456778', 'filtro de ar man', 41.0, 0)
insert into Oficina_DB.Peca (referencia, nome, preco, num_stock) 
    values ('B11', 'pneu ligeiro', 40.0, 40)
insert into Oficina_DB.Peca (referencia, nome, preco, num_stock) 
    values ('B22', 'pneu motociclo', 30.0, 12)
insert into Oficina_DB.Peca (referencia, nome, preco, num_stock) 
    values ('B33', 'pneu pesado', 60.0, 8)
insert into Oficina_DB.Peca (referencia, nome, preco, num_stock) 
    values ('ABCD1111', 'motor de arranque ligeiro', 200.00, 2)
insert into Oficina_DB.Peca (referencia, nome, preco, num_stock) 
    values ('ABCD2222', 'motor de arranque motociclo', 150.00, 1)
insert into Oficina_DB.Peca (referencia, nome, preco, num_stock) 
    values ('ABCD3333', 'motor de arranque pesado', 400.00, 0)

insert into Oficina_DB.Efetua (servico, mecanico) 
    values (1, 222111333)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (2, 222222333)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (3, 222333333)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (4, 222111333)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (5, 222222333)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (6, 222333333)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (7, 222111222)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (8, 222222222)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (9, 222333222)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (10, 222111333)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (11, 222222333)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (12, 222333333)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (13, 222111333)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (14, 222222333)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (15, 222333333)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (16, 222111333)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (17, 222222333)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (18, 222333333)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (19, 222111111)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (20, 222222111)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (21, 222333111)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (22, 222111111)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (23, 222222111)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (24, 222333111)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (25, 222111222)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (26, 222111222)
insert into Oficina_DB.Efetua (servico, mecanico) 
    values (27, 222111222)

insert into Oficina_DB.Reparacao (id, peca, n_pecas) 
    values (7, 'B33',4)
insert into Oficina_DB.Reparacao (id, peca, n_pecas) 
    values (8, 'B33',2)
insert into Oficina_DB.Reparacao (id, peca, n_pecas) 
    values (9, 'B33',4)
insert into Oficina_DB.Reparacao (id, peca, n_pecas) 
    values (19, 'A123345678',1)
insert into Oficina_DB.Reparacao (id, peca, n_pecas) 
    values (20, 'A123345678',1)
insert into Oficina_DB.Reparacao (id, peca, n_pecas) 
    values (21, 'A123345678',1)
insert into Oficina_DB.Reparacao (id, peca, n_pecas) 
    values (22, 'A123456778',1)
insert into Oficina_DB.Reparacao (id, peca, n_pecas) 
    values (23, 'A123456778',1)
insert into Oficina_DB.Reparacao (id, peca, n_pecas) 
    values (24, 'A123456778',1)
insert into Oficina_DB.Reparacao (id, peca, n_pecas) 
    values (25, 'B22',4)
insert into Oficina_DB.Reparacao (id, peca, n_pecas) 
    values (26, 'B22',2)
insert into Oficina_DB.Reparacao (id, peca, n_pecas) 
    values (27, 'B22',4)
/*
insert into Oficina_DB.Necessita (referencia, reparacao, n_pecas) 
    values ('B33', 7, 6)
insert into Oficina_DB.Necessita (referencia, reparacao, n_pecas) 
    values ('B33', 8, 6)
insert into Oficina_DB.Necessita (referencia, reparacao, n_pecas) 
    values ('B33', 9, 6)
insert into Oficina_DB.Necessita (referencia, reparacao, n_pecas) 
    values ('A123345678', 19, 1)
insert into Oficina_DB.Necessita (referencia, reparacao, n_pecas) 
    values ('A123345678', 20, 1)
insert into Oficina_DB.Necessita (referencia, reparacao, n_pecas) 
    values ('A123345678', 21, 1)
insert into Oficina_DB.Necessita (referencia, reparacao, n_pecas) 
    values ('A123456778', 22, 2)
insert into Oficina_DB.Necessita (referencia, reparacao, n_pecas) 
    values ('ABCD3333', 22, 1)
insert into Oficina_DB.Necessita (referencia, reparacao, n_pecas) 
    values ('A123456778', 23, 2)
insert into Oficina_DB.Necessita (referencia, reparacao, n_pecas) 
    values ('ABCD3333', 23, 1)
insert into Oficina_DB.Necessita (referencia, reparacao, n_pecas) 
    values ('A123456778', 24, 2)
insert into Oficina_DB.Necessita (referencia, reparacao, n_pecas) 
    values ('ABCD3333', 24, 1)
insert into Oficina_DB.Necessita (referencia, reparacao, n_pecas) 
    values ('B22', 25, 2)
insert into Oficina_DB.Necessita (referencia, reparacao, n_pecas) 
    values ('B22', 26, 2)
insert into Oficina_DB.Necessita (referencia, reparacao, n_pecas) 
    values ('B22', 27, 2)
*/
insert into Oficina_DB.Revisao (id, tipo) 
    values (1, 'inspeçao')
insert into Oficina_DB.Revisao (id, tipo) 
    values (2, 'inspeçao')
insert into Oficina_DB.Revisao (id, tipo) 
    values (3, 'inspeçao')
insert into Oficina_DB.Revisao (id, tipo) 
    values (4, 'inspeçao')
insert into Oficina_DB.Revisao (id, tipo) 
    values (5, 'inspeçao')
insert into Oficina_DB.Revisao (id, tipo) 
    values (6, 'inspeçao')
insert into Oficina_DB.Revisao (id, tipo) 
    values (10, 'revisao periodica')
insert into Oficina_DB.Revisao (id, tipo) 
    values (11, 'revisao periodica')
insert into Oficina_DB.Revisao (id, tipo) 
    values (12, 'revisao periodica')
insert into Oficina_DB.Revisao (id, tipo) 
    values (13, 'revisao periodica')
insert into Oficina_DB.Revisao (id, tipo) 
    values (14, 'revisao periodica')
insert into Oficina_DB.Revisao (id, tipo) 
    values (15, 'revisao periodica')
insert into Oficina_DB.Revisao (id, tipo) 
    values (16, 'revisao periodica')
insert into Oficina_DB.Revisao (id, tipo) 
    values (17, 'revisao periodica')
insert into Oficina_DB.Revisao (id, tipo) 
    values (18, 'revisao periodica')

GO


ALTER TABLE Oficina_DB.Funcionario
	ADD CONSTRAINT ADDOFICINAFK FOREIGN KEY (n_oficina) REFERENCES Oficina_DB.Oficina(numero);

ALTER TABLE Oficina_DB.Oficina
	ADD CONSTRAINT ADDGERENTEFK FOREIGN KEY (gerente) REFERENCES Oficina_DB.Gerente(nif);

GO

/*
SELECT * FROM Oficina_DB.Pessoa;
SELECT * FROM Oficina_DB.Funcionario;
SELECT * FROM Oficina_DB.Cliente;
SELECT * FROM Oficina_DB.Gerente;
SELECT * FROM Oficina_DB.Mecanico;*/
--SELECT * FROM Oficina_DB.Oficina;
/*SELECT * FROM Oficina_DB.Possui;
SELECT * FROM Oficina_DB.TipoVeiculo;
SELECT * FROM Oficina_DB.Veiculo;*/
--SELECT * FROM Oficina_DB.Servico;
/*SELECT * FROM Oficina_DB.Peca;
SELECT * FROM Oficina_DB.Efetua;
SELECT * FROM Oficina_DB.Reparacao;
SELECT * FROM Oficina_DB.Necessita;
SELECT * FROM Oficina_DB.Revisao;
*/

CREATE TRIGGER TRIGGER_CreateGerente ON Oficina_DB.Gerente 
AFTER INSERT
AS

SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;

        DECLARE @nif INT = (
                SELECT nif 
                FROM inserted
            );
            
        UPDATE Oficina_DB.Oficina SET
                gerente = @nif
				WHERE numero = (
					SELECT n_oficina
					FROM Oficina_DB.Gerente AS G JOIN Oficina_DB.Funcionario AS F ON G.nif=F.nif
					WHERE G.nif = @nif
				);

	COMMIT TRANSACTION;
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;

GO

CREATE TRIGGER TRIGGER_DeleteGerente ON Oficina_DB.Gerente 
INSTEAD OF DELETE
AS


SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;

        DECLARE @nif INT = (
            SELECT nif 
            FROM deleted
            );

        UPDATE Oficina_DB.Oficina SET
            gerente = NULL
        WHERE gerente = @nif;

        UPDATE Oficina_DB.Funcionario SET 
            n_oficina = NULL
        WHERE nif = @nif;

        DELETE FROM Oficina_DB.Veiculo WHERE dono = @nif;

        DELETE FROM Oficina_DB.Gerente WHERE nif = @nif;

    COMMIT TRANSACTION;
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;


GO

CREATE FUNCTION Oficina_DB.MecanicoServico (@id INT) RETURNS INT
AS
BEGIN

DECLARE @nif INT;

SET @nif = (
    SELECT mecanico
    FROM Oficina_DB.Efetua
    WHERE servico = @id
)

RETURN @nif

END

GO