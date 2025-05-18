use routeFinder;



CREATE TABLE company (

id_company INT AUTO_INCREMENT PRIMARY KEY,

address VARCHAR(50),

corporate_name VARCHAR(45),

CNPJ CHAR(14)

);



CREATE TABLE user (

id_user INT AUTO_INCREMENT PRIMARY KEY,

name_user VARCHAR(45),

password VARCHAR(45),

email VARCHAR(45),

phone VARCHAR(45),

created_at DATETIME,

fk_company INT,

FOREIGN KEY (fk_company) REFERENCES company(id_company)

);

CREATE TABLE passage (
id_passage INT AUTO_INCREMENT PRIMARY KEY,
name_passage VARCHAR(200),
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
name_segment VARCHAR(100),
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

CREATE TABLE log (
id_log INT AUTO_INCREMENT PRIMARY KEY,
category VARCHAR(45),
date_time DATETIME DEFAULT CURRENT_TIMESTAMP,
description VARCHAR(200)
);



CREATE TABLE alert (

id_alert INT AUTO_INCREMENT PRIMARY KEY,
name_alert VARCHAR(45),
description VARCHAR(45),
fk_user INT,
fk_log INT,
FOREIGN KEY (fk_user) REFERENCES user(id_user),
FOREIGN KEY (fk_log) REFERENCES log(id_log)

);
