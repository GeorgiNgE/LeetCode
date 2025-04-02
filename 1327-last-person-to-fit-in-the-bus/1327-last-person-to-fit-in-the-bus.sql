/* Write your T-SQL query statement below */

with cte as (select *,
SUM(weight) over(order by turn) total,ROW_NUMBER() over(order by turn) rn
from queue
)
select top 1 person_name from cte where total<=1000 order by rn desc