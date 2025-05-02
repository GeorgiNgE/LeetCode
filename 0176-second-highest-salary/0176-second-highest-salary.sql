/* Write your PL/SQL query statement below */
with cte as (select salary, dense_rank() over(order by salary desc) rn from employee group by salary)
select max(salary) as SecondHighestSalary from cte where rn=2