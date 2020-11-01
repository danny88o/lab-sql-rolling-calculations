-- Lab 3.07 -Rolling Calculations - Not Finished
use sakila;

-- Get number of monthly active customers.
create or replace view user_activity as
select customer_id, convert(rental_date, date) as Activity_date,
date_format(convert(rental_date,date), '%m') as Activity_Month,
date_format(convert(rental_date,date), '%Y') as Activity_year
from rental;

create or replace view Monthly_active_users as
select count(distinct customer_id) as Active_users, Activity_year, Activity_Month
from user_activity
group by Activity_year, Activity_Month
order by Activity_year, Activity_Month;

with cte_activity as (
select Active_users, lag(Active_users,1) over (partition by Activity_year) as last_month,
Activity_year, Activity_month
from Monthly_active_users
)
select * from cte_activity
where last_month is not null;

-- Active users in the previous month.


-- Percentage change in the number of active customers.


-- Retained customers every month.



