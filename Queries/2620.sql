-- URI Online Judge SQL
-- Copyright URI Online Judge
-- www.urionlinejudge.com.br
-- Problem 2620

CREATE TABLE customers (
  id numeric PRIMARY KEY,
  name varchar(255),
  street varchar(255),
  city varchar(255),
  state char(2),
  credit_limit numeric
);

CREATE TABLE orders (
  id numeric PRIMARY KEY,
  orders_date date,
  id_customers numeric REFERENCES customers (id)
);


INSERT INTO customers (id, name, street, city, state, credit_limit)
VALUES
  (1,	'Nicolas Diogo Cardoso',	'Acesso Um',	'Porto Alegre',	'RS',	475),
  (2,	'Cecília Olivia Rodrigues',	'Rua Sizuka Usuy',	'Cianorte',	'PR',	3170),
  (3,	'Augusto Fernando Carlos Eduardo Cardoso',	'Rua Baldomiro Koerich',	'Palhoça',	'SC',	1067),
  (4,	'Pedro Cardoso',	'Acesso Um',	'Porto Alegre',	'RS',	475),
  (5,	'Sabrina Heloisa Gabriela Barros',	'Rua Engenheiro Tito Marques Fernandes',	'Porto Alegre',	'RS',	4312),
  (6,	'Joaquim Diego Lorenzo Araújo',	'Rua Vitorino',	'Novo Hamburgo',	'RS',	2314);

INSERT INTO orders (id, orders_date, id_customers)
VALUES
  (2,	'2016-01-12',	2),
  (3,	'2016-04-18',	5),
  (1,	'2016-05-13',	3),
  (4,	'2016-09-07',	4),
  (5,	'2016-02-13',	6),
  (6,	'2016-08-05',	3);


  /*  Execute this query to drop the tables */
  -- DROP TABLE orders, customers; --

select customers.name, orders.id from customers inner join orders on orders.id_customers = customers.id where orders.orders_date between '20160101' and'20160630' ;