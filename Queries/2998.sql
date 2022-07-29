select 
name,
investment,
(
   select t1.id, SUM(t2.profit) as sum
   from operations t1
   inner join operations t2 on t1.id >= t2.id
   where t1.client_id =clients.id and t2.client_id = clients.id
   group by t1.id, t1.profit
   order by t1.id
   ) as month_of_payback
from clients
inner join 
(select c.id as id_valid, sum(o.profit) as soma_investimentos from clients as c inner join operations as o on c.id = o.client_id GROUP by c.id) as valid_clients
on clients.id = valid_clients.id_valid
where clients.investment<=valid_clients.soma_investimentos
GROUP by clients.id
order by clients.name


select soma.sum from clients as c
inner join 
(select t1.client_id as client_id, SUM(t2.profit) as sum
   from operations t1
   inner join operations t2 on t1.id >= t2.id
   where t1.client_id =2 and t2.client_id = 2
   group by t1.id, t1.profit
   order by t1.id) as soma
on soma.client_id = c.id
where soma.sum>=c.investment
order by soma.sum
limit 1