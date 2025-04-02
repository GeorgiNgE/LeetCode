/* Write your T-SQL query statement below */
select s.product_id,f.fyear as first_year,s.quantity ,s.price
from sales s,
(select product_id, min(year) fyear from sales group by product_id) f
where s.product_id=f.product_id and s.year=f.fyear