select t.results from 
(
select top (1) name as results
from (select user_id,count(movie_id) as no_counts from movierating group by user_id) m join users u on m.user_id=u.user_id
order by no_counts desc, u.name asc

union all

select top (1) title as results
from (select movie_id,avg(rating*1.0) as no_counts from movierating where created_at between '2020-02-01' and '2020-02-29' group by movie_id
) m join movies mo on m.movie_id=mo.movie_id
order by no_counts desc, mo.title asc
) t