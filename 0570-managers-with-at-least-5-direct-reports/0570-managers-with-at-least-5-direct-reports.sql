/* Write your T-SQL query statement below */
with man as (
    select managerId
    from employee
    group by managerId
    having count(managerId)>=5
)
select e.name
from employee e,man m
where e.id=m.managerId
