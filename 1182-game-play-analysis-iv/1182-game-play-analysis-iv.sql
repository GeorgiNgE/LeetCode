/* Write your T-SQL query statement below */
declare @players float;
select @players= count(distinct player_id)  from activity;
with cte as(select player_id,event_date,dense_rank() over(partition by player_id order by event_date) rnk from activity) 
select round(count(1)/@players,2) as fraction
from cte c inner join 
(select player_id,min(event_date) first_date from activity group by player_id) fd on c.player_id=fd.player_id
where
rnk=2 and DATEDIFF(day,fd.first_date,c.event_date)=1