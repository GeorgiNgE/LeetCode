/* Write your T-SQL query statement below */
select 
'Low Salary' as category,
coalesce(count(*),0) as accounts_count
from Accounts a
where income <20000
union
select 
'Average Salary' as category,
coalesce(count(*),0) as accounts_count
from Accounts a
where income >= 20000 and income <= 50000
union
select 
'High Salary' as category,
coalesce(count(*),0) as accounts_count
from Accounts a
where income > 50000