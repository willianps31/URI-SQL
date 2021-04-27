-- URI Online Judge SQL
-- Copyright URI Online Judge
-- www.urionlinejudge.com.br
-- Problem 2614

CREATE TABLE customers (
  id int PRIMARY KEY,
  name varchar(50),
  street varchar(50),
  city varchar(50)
);

CREATE TABLE rentals (
  id numeric PRIMARY KEY,
  rentals_date date,
  id_customers int REFERENCES customers (id)
);

INSERT INTO customers (id, name, street, city)
VALUES
  (1,	'Giovanna Goncalves Oliveira',	'Rua Mato Grosso',	'Canoas'),
  (2,	'Kauã Azevedo Ribeiro',	'Travessa Ibiá',	'Uberlândia'),
  (3,	'Rebeca Barbosa Santos',	'Rua Observatório Meteorológico',	'Salvador'),
  (4,	'Sarah Carvalho Correia',	'Rua Antônio Carlos da Silva',	'Apucarana'),
  (5,	'João Almeida Lima',	'Rua Rio Taiuva',	'Ponta Grossa'),
  (6,	'Diogo Melo Dias',	'Rua Duzentos e Cinqüenta',	'Várzea Grande');
  
INSERT INTO rentals (id, rentals_date, id_customers)
VALUES
  (1,	'2016-10-09',	3),
  (2,	'2016-09-02',	1),
  (3,	'2016-08-02',	4),
  (4,	'2015-09-02',	2),
  (5,	'2016-03-02',	6),
  (6,	'2016-04-04',	4);
  
  /*  Execute this query to drop the tables */
  -- DROP TABLE rentals, customers; --

select c.name, r.rentals_date from rentals as r inner join customers as c on r.id_customers = c.id where EXTRACT(month FROM r.rentals_date) = 9 and EXTRACT(year from r.rentals_date) = 2016