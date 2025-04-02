/* Write your T-SQL query statement below */
with cte as (select e.*,
DENSE_RANK() over(order by salary desc) as rn
from Employee e)
select max(salary) as SecondHighestSalary from cte where rn=2