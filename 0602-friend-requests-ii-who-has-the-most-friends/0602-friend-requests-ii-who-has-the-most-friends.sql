/* Write your T-SQL query statement below */
with cte as 
(select accepter_id, count(*) as no_a from RequestAccepted group by accepter_id),
cte2 as (select requester_id,count(*) no_r from RequestAccepted group by requester_id)
select top (1) t.*
from (select
coalesce(r.requester_id,a.accepter_id) as id ,coalesce(no_a+no_r,no_r,no_a) as num
from cte a full join cte2 r on a.accepter_id=r.requester_id) t
order by t.num desc