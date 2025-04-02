/* Write your T-SQL query statement below */
declare @maxs int;
select @maxs=max(id) from seat;
with cte as (select s.*,lead(student) over(order by id) as leadf,
lag(student) over(order by id) as lagf
from seat s)
select id, 
case when id%2=1 and leadf is not null then leadf
    when id%2=0 then lagf
	when id=@maxs then student
end as student
from cte

