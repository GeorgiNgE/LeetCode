/* Write your T-SQL query statement below */
with cte as (
select distinct salary, departmentId,
dense_rank() over (partition by departmentId order by salary desc) as rn from employee)
select d.name as  Department,
e.name as Employee,
e.salary
from cte c 
join employee e on e.departmentId=c.departmentId and e.salary=c.salary and rn <4
join Department d on d.id=e.departmentId 