CREATE FUNCTION getNthHighestSalary(N IN NUMBER) RETURN NUMBER IS
result NUMBER;
BEGIN
    /* Write your PL/SQL query statement below */
    select sb.salary into result
    from 
    (select salary, dense_rank() over(order by salary desc) as rn from Employee group by salary) sb
    where sb.rn=N;
    RETURN result;
exception when no_data_found then return null;
END;