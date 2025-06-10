use routeFinder;


CREATE TABLE company (

id_company INT AUTO_INCREMENT PRIMARY KEY,
corporate_name VARCHAR(45),
address VARCHAR(100),
CNPJ CHAR(14)

);

ALTER TABLE company AUTO_INCREMENT = 1000;

insert into company (corporate_name, address, CNPJ) values ("RouteFinder", "Rua Haddock Lobo, 123", "12345678911111");

CREATE TABLE access_level (

id_access_level INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(45),
description VARCHAR(200)

);


insert INTO access_level (name, description) values ("Administrador", "Acesso a todas as telas e funções do cliente master"),
("Funcionário","Acesso restrito, apenas consultar a Dashboard");


CREATE TABLE position (

id_position INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(45),
description VARCHAR(255),
fk_company INT,
FOREIGN KEY (fk_company) REFERENCES company(id_company),
fk_access_level INT,
FOREIGN KEY (fk_access_level) REFERENCES access_level(id_access_level)

);

CREATE TABLE user (

id_user INT AUTO_INCREMENT PRIMARY KEY,
name_user VARCHAR(45),
password VARCHAR(45),
email VARCHAR(45),
fk_company INT,
FOREIGN KEY (fk_company) REFERENCES company(id_company),
fk_position INT,
FOREIGN KEY (fk_position) REFERENCES position (id_position),
fK_access_level INT,
FOREIGN KEY(fk_access_level) REFERENCES access_level(id_access_level)

);

INSERT INTO user VALUES (default, 'Routefinder', 'route123@', 'routefinder@gmail.com', 1000, null, 1);


CREATE TABLE category (

id_category INT AUTO_INCREMENT PRIMARY KEY,
type VARCHAR(45),
description VARCHAR(255)

);

INSERT INTO category VALUES (default,"INFO","Log inserido com sucesso");
INSERT INTO category VALUES (default, "ERRO", "Log não inserido");

CREATE TABLE alert (

id_alert INT AUTO_INCREMENT PRIMARY KEY,
name_alert VARCHAR(45),
description VARCHAR(500)

);

CREATE TABLE log (

id_log INT AUTO_INCREMENT PRIMARY KEY,
date_time DATETIME DEFAULT CURRENT_TIMESTAMP,
description VARCHAR(500),
fk_alert INT,
FOREIGN KEY (fk_alert) REFERENCES alert(id_alert),
fk_category INT,
FOREIGN KEY (fk_category) REFERENCES category(id_category)

);

CREATE TABLE passage (

id_passage INT AUTO_INCREMENT PRIMARY KEY,
name_passage VARCHAR(300),
region VARCHAR(10),
type CHAR(1)

);


CREATE TABLE direction (

id_direction INT AUTO_INCREMENT PRIMARY KEY,
name_direction VARCHAR(200),
fk_passage INT,
FOREIGN KEY (fk_passage) REFERENCES passage(id_passage)

);


CREATE TABLE segment (

id_segment INT AUTO_INCREMENT PRIMARY KEY,
name_segment VARCHAR(500),
fk_direction INT,
FOREIGN KEY (fk_direction) REFERENCES direction(id_direction)

);


CREATE TABLE timestamp (

id_timestamp INT AUTO_INCREMENT PRIMARY KEY,
date_time DATETIME,
jam_size INT,
fk_segment INT,
FOREIGN KEY (fk_segment) REFERENCES segment(id_segment)

);