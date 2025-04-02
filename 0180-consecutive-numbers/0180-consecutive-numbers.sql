with cte as (select *,lead(num) over(order by id) dupa ,
lag(num) over (order by id) inainte
from logs)
select distinct num as ConsecutiveNums from cte where inainte=num and dupa=num