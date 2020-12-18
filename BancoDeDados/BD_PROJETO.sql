CREATE DATABASE BD_PROJETO;
USE BD_PROJETO;

CREATE TABLE  clientes
(
  cliente_codigo INT AUTO_INCREMENT,
  cliente_nome VARCHAR(255) NULL,
  cliente_email VARCHAR(50) NULL,
  cliente_cpf VARCHAR(14) NULL,
  cliente_telefone VARCHAR(15) NULL,
  cliente_sexo VARCHAR(15) NULL,
  cliente_regiao VARCHAR(30) NULL,
  PRIMARY KEY (cliente_codigo)
);

CREATE TABLE restaurantes
(
  restaurante_codigo INT AUTO_INCREMENT,
  restaurante_nome VARCHAR(255) NULL,
  restaurante_email VARCHAR(45) NULL,
  restaurante_cnpj VARCHAR(20) NULL,
  restaurante_telefone VARCHAR(15) NULL,
  restaurante_fantasia VARCHAR(100) NULL,
  restaurante_regiao VARCHAR(45) NULL,
  restaurante_descicao VARCHAR(255) NULL,
  PRIMARY KEY (restaurante_codigo)
);

CREATE TABLE mesas
(
  mesa_codigo INT AUTO_INCREMENT,
  mesa_data_hora DATETIME NULL,
  mesa_quant_mesas INT NULL,
  mesa_quant_pessoas VARCHAR(45) NULL,
  mesa_restaurante_codigo INT NOT NULL,
  PRIMARY KEY (mesa_codigo)
);

CREATE TABLE reservas
(
  reserva_codigo INT AUTO_INCREMENT,
  reserva_cliente_codigo INT NOT NULL,
  reserva_mesa_codigo INT NOT NULL,
  reserva_restaurante_codigo INT NOT NULL,
  reserva_data DATETIME,
  PRIMARY KEY (reserva_codigo)
);

CREATE TABLE pratos
(
  prato_codigo INT AUTO_INCREMENT,
  prato_nome VARCHAR(50) NULL,
  prato_categoria VARCHAR(20) NULL,
  prato_quantidade INT NULL,
  prato_descricao VARCHAR(255) NULL,
  prato_preco DOUBLE NOT NULL,
  Prato_restaurante_codigo INT NOT NULL,
  PRIMARY KEY (prato_codigo)
);

CREATE TABLE reservas_has_pratos 
(
  reserva_has_prato_codigo INT AUTO_INCREMENT,
  reserva_has_prato_quant_prato INT NOT NULL,
  reserva_has_prato_reserva_codigo INT NOT NULL,
  reserva_has_prato_prato_codigo INT NOT NULL,
  PRIMARY KEY (reserva_has_prato_codigo)
 );

#FOREIGN KEYS DA TABELA RESTAURANTES
ALTER TABLE reservas ADD CONSTRAINT fk_cliente FOREIGN KEY (reserva_cliente_codigo)
REFERENCES clientes (cliente_codigo);
ALTER TABLE reservas ADD CONSTRAINT fk_restaurante FOREIGN KEY (reserva_restaurante_codigo)
REFERENCES restaurantes (restaurante_codigo);
ALTER TABLE reservas ADD CONSTRAINT fk_mesa FOREIGN KEY (reserva_mesa_codigo)
REFERENCES mesas (mesa_codigo);

#FOREIGN KEY DA TABELA PRATOS
ALTER TABLE pratos ADD CONSTRAINT fk_prato_restaurante FOREIGN KEY (prato_restaurante_codigo)
REFERENCES restaurantes (restaurante_codigo);
#FOREIGN KEY DA TABELA MESAS
ALTER TABLE mesas ADD CONSTRAINT fk_mesa_rest FOREIGN KEY (mesa_restaurante_codigo)
REFERENCES restaurantes (restaurante_codigo);

#FOREIGN KEY DA TABELA RESERVAS_HAS_PRATOS
ALTER TABLE reservas_has_pratos ADD CONSTRAINT fk_has_reserva_cod FOREIGN KEY (reserva_has_prato_reserva_codigo)
REFERENCES reservas (reserva_codigo);
ALTER TABLE reservas_has_pratos ADD CONSTRAINT fk_has_prato_cod FOREIGN KEY (reserva_has_prato_prato_codigo)
REFERENCES pratos (prato_codigo);

# SCRIPT DE DADOS DE TESTE
INSERT INTO clientes (cliente_nome, cliente_email, cliente_cpf, cliente_telefone, cliente_sexo, cliente_regiao) 
VALUES 
('THIAGO DE MELO', 'THIAGO@TESTE.COM', '000.000.000-01', '(84)99999-9999', 'MASCULINO', 'PB'),
('VICTOR OLIVEIRA', 'VICTOR@TESTE.COM', '000.000.000-02', '(84)99999-0000', 'MASCULINO', 'RN'),
('AILTON CAMILO', 'AILTON@TESTE.COM', '000.000.000-03', '(84)98888-0000', 'MASCULINO', 'RN'),
('MILENA ALVES', 'MILENA@TESTE.COM', '000.000.000-04', '(85)90000-0000', 'FEENINOE', 'CE');

INSERT INTO restaurantes (restaurante_nome, restaurante_email, restaurante_cnpj, restaurante_telefone, restaurante_fantasia, restaurante_regiao, restaurante_descicao)
VALUES 
('MAURICIO RABELLO', 'MAURICIO@TESTE.COM', ' XX.XXX.XXX/0001-XX', '(84)99111-1111', 'RESTAURANTE RABELLO', 'RN', 'O MELHOR RESTAURANTE DE MASSAS ITALIANA'),
('LUCAS VIEIRA', 'LUCAS@TESTE.COM', ' XX.XXX.XXX/0002-XX', '(85)99888-0011', 'RESTAURANTE DA REPROVAÇÃO', 'PB', 'A MELHOR CARNE DO NORDESTE'),
('JANE QUEIROZ', 'JANE@TESTE.COM', ' XX.XXX.XXX/0003-XX', '(84)98778-9876', 'RESTAURANTE QUEIROZ', 'CE', 'AS MELHORES SOBREMESAS ENCONTRAM-SE AQUI'),
('ALAN KLINGER', 'ALAN@TESTE.COM', ' XX.XXX.XXX/0004-XX', '(86)98765-5432', 'SHUSHI DO KLINGER', 'RN', 'O MELHOR JAPONÊS ');

INSERT INTO mesas (mesa_data_hora, mesa_quant_mesas, mesa_quant_pessoas, mesa_restaurante_codigo) 
VALUES 
('2020-11-25 15:00', 3, 4,1),
('2020-11-25 15:00', 2, 6,1),
('2020-11-25 12:00', 4, 2,2),
('2020-11-25 18:00', 6, 6,2),
('2020-12-01 12:00', 3, 2,4),
('2020-11-30 15:00', 5, 4,4),
('2020-11-30 15:00', 5, 4,3),
('2020-11-30 15:00', 5, 2,3),
('2020-11-30 18:00', 5, 4,3);

INSERT INTO pratos (prato_nome, prato_categoria, prato_quantidade, prato_descricao, prato_preco, Prato_restaurante_codigo) 
VALUES 
('LASANHA DE CARNE', 'PRINCIPAL', 3, 'LASANHA COM RECHEIO DE CRENE E MOLHO DE TOMATE', 40.00, 1),
('MACARRONADA', 'PRINCIPAL', 2, 'MACARRÃO AO MOLHO BRANCO', 10.00, 2),
('TÁBUA DE CARNES FRIAS', 'ENTRADA', 1, 'GALATINES VARIADOS,CHOURIÇÃO, MORTADELA, PRESUNTO ENTRE OUTROS', 10.00, 1),
('CUSCUZ REFOGADO', 'PRINCIPAL', 3, 'CUSCUZ REFORGADO COM ALHO, BACON, MORTADELA DEFUMADA.', 15.00, 3),
('SORVETE DE CHOCOLATE', 'SOBREMESA', 1, 'SORVETE DE CHOCOLATE COM CALDA DE CHOCOLATE.', 5.00, 1),
('SALADA', 'ENTRADA', 1, 'SALADA TEMPERADA', 5.50, 2),
('SUSHI HOSSOMAKI', 'PRINCIPAL', 2, 'ROLINHOS FINOS', 10.00, 4),
('TEMAKI', 'PRINCIPAL', 2, 'ROLINHOS DE MÃO', 10.00,4);

INSERT INTO reservas (reserva_cliente_codigo, reserva_mesa_codigo, reserva_restaurante_codigo, reserva_data) 
VALUES 
(1, 1, 1, NOW()),
(2, 2, 1, NOW()),
(2, 3, 2, NOW()),
(4, 1, 4, NOW());

INSERT INTO RESERVAS_has_pratos (reserva_has_prato_quant_prato, reserva_has_prato_reserva_codigo, reserva_has_prato_prato_codigo) 
VALUES 
('1', '1', '1'),
('2', '1', '5'),
('1', '2', '1'),
('2', '3', '2'),
('2', '4', '7');

SELECT * FROM RESERVAS_has_pratos; 