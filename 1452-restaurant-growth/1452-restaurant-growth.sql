/* Write your T-SQL query statement below */
with cte as (select visited_on, sum(amount) total,lead(visited_on,6) over (order by visited_on) wind
from customer group by visited_on) 
select t.visited_on,t.amount, round(t.average_amount ,2) as average_amount
from (
select wind as visited_on
, sum(total) over(order by visited_on rows between current row and 6 following) as amount,
avg (total*1.00) over (order by visited_on rows between current row and 6 following) as average_amount
from cte) t where t.visited_on is not null order by t.visited_on 