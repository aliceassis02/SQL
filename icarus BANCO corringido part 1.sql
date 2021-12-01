create database icarus;

use icarus;



/* a tabela Icarus é apenas para guardar informações ficticias da nossa empresa*/
CREATE TABLE Icarus (
idicarus int primary key auto_increment,
    endereco VARCHAR (255),
    email VARCHAR(255),
    CNPJ INTEGER,
    nro_comercial INTEGER,
    direitos_autorais integer,
    nome VARCHAR(255),
    UNIQUE (nro_comercial, direitos_autorais)
);

/* ATENCAO AQUI FUNDI AS TABELAS QUE VOCES PEDIRAM, DEIXEI A AUTENTIFICACAO COMO UMA TABELA SO, ABAIXO */


CREATE TABLE usuario (
    id_usuario int primary key auto_increment,
	senha VARCHAR (255),
    dt_nasc DATE,
    nome VARCHAR(255),
    sobrenome VARCHAR(255),
    estado VARCHAR(255),
    cidade VARCHAR(255),
    nro_telefone INTEGER,
    email VARCHAR(255),
    cpf varchar (255),
  unique ( cpf)
);


/* ATENÇAO AQUI EU FUNDI AS DUAS TABELAS LOGIN E ESQUECI SENHA EM UMA SÓ DND.*/
create table autentificacao (
id_autentificacao int primary key auto_increment,
autentificacao_credencial_login boolean,
autentificacao_email_senha Boolean,
redefinir_senha varchar (255),
id_usuario int not null
);

CREATE TABLE preco_m4 (
    Id_preco int primary key auto_increment,
    media_preco DOUBLE,
    armazenamento_valor DOUBLE
);

CREATE TABLE estacionamento (
    id_estacionamento int primary key auto_increment,
    custo DOUBLE,
    nro_vagas INTEGER,
    subsolo BOOLEAN,
    compartilhado BOOLEAN
);


CREATE TABLE imovel(
id_imovel int primary key auto_increment,
    nome varchar (255),
    ano_construido int,
    tamanho DOUBLE,
    preco_aluguel DOUBLE,
    banheiro_qtda int,
    descricao varchar (255),
    condominio DOUBLE,
    IPTU DOUBLE UNIQUE,
    piso int,
    tp_espaço varchar (255),
    opcionais varchar (255),
    id_preco int not null,
    id_estacionamento int not null,
   FOREIGN KEY(id_preco)
REFERENCES preco_m4 (id_preco),
   FOREIGN KEY(id_estacionamento)
REFERENCES estacionamento (id_estacionamento)
);
 




/* ESTA TABELA É UMA TABELA AUXILIO DA DO ENDERECO PARA FICAR MAIS FACIL PARA VC6S, AUXILIO PARA AS TABELAS QUE IREMOS COLOCAR AS INFORMAÇÕES */
create table bairro (
idbairro int primary key auto_increment,
estado_bairro varchar(255),
cidade_bairro varchar (255),
nome_bairro varchar (255),
zona VARCHAR (255) 
);





CREATE TABLE cadastrar_imovel (
    id_cadastrar_imovel INTEGER primary key auto_increment,
    id_imovel int not null,
    id_usuario int not null,
       FOREIGN KEY(id_imovel)
REFERENCES imovel (id_imovel),
   FOREIGN KEY(id_usuario)
REFERENCES Usuario (id_usuario)
);
CREATE TABLE meus_imoveis (
    id_meusimoveis INTEGER PRIMARY KEY,
    id_cadastrar_imovel  int not null,
     FOREIGN KEY(id_cadastrar_imovel )
REFERENCES cadastrar_imovel (id_cadastrar_imovel )
);

CREATE TABLE endereco (
idendereco int primary key auto_increment,
    CEP VARCHAR (255),
    rua VARCHAR (255),
    nro_imovel int,
    pais VARCHAR (255),
    complemento VARCHAR (255),
    id_estacionamento int not null,
    id_imovel int not null,
    idbairro int not null,
    FOREIGN KEY(id_estacionamento)
REFERENCES estacionamento (id_estacionamento),
    FOREIGN KEY(id_imovel)
REFERENCES imovel (id_imovel),
FOREIGN KEY (idbairro)
references bairro (idbairro)
);

CREATE TABLE favoritos (
    id_favoritos int primary key auto_increment,
    id_usuario int not null,
    id_imovel integer not null,
     FOREIGN KEY(id_imovel)
REFERENCES imovel (id_imovel),
 FOREIGN KEY(id_usuario)
REFERENCES Usuario (id_usuario)
);

CREATE TABLE usuario_interessado (
    id_interessado int primary key auto_increment,
    dt_acesso DATE,
    horario TIME,
    UNIQUE (dt_acesso, horario),
    id_usuario int not null,
    FOREIGN KEY(id_usuario)
REFERENCES Usuario (id_usuario)
);
 
-------------------------------------------------------------------------------------------------------
/* essas duas deu erro */
 
ALTER TABLE meus_imoveis ADD CONSTRAINT Imovel_Comercial
  FOREIGN KEY(idimovel)
REFERENCES imovel (idimovel);

/* essa tabela o andre disse que ainda iria olhar, mas o contador não tera no id.*/

ALTER TABLE visualizacoes ADD CONSTRAINT id_usuario
 FOREIGN KEY(id_usuario)
REFERENCES Usuario (id_usuario);


