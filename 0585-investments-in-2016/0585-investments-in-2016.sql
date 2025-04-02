/* Write your T-SQL query statement below */
select round(sum(i.tiv_2016*1.0),2) as tiv_2016
from insurance i
where exists (select pid from insurance p where i.tiv_2015=p.tiv_2015 and i.pid<>p.pid)
and not exists (select pid from insurance p where i.lat=p.lat and i.lon=p.lon and i.pid<>p.pid)