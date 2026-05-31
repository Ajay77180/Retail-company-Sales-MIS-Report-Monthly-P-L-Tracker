-- project 1


create database sales_profit_and_loss;
use sales_profit_and_loss;
select * from sales_report;

-- 1. Monthly Revenue vs Target
select month,month_no,
sum(revenue)  as total_rev,
sum(target_revenue) as total_target,
round(sum(revenue)/sum(target_revenue)*100,1) as achivement_pct
from sales_report
group by month,month_no
order by month_no;


-- 2. Region-wise Performance
select * from sales_report;
select region ,
sum(revenue) as total_rev,
sum(units_sold) as total_sold,
round(sum(revenue)/sum(units_sold)*100,2) as avg_rev_per_unit
from sales_report
group by region
order by total_rev desc;


-- 3. Top Product per Month
select * from sales_report;
select month ,product ,
sum(revenue) as total_rev
from sales_report
group by product 
order by total_rev desc;

-- 4. Salesperson ranking with window function
select salesperson ,
sum(revenue) as total_rev,
rank() over (order by sum(revenue) as salesperson_rank 
from sales_report
group by salesperson 
order by salesperson_rank ;

select * from sales_report;
select month,month_no,
sum(revenue) as total_rev,
lag(sum(revenue)) over(order by month_no) as prev_rev,
round((sum(revenue)-lag(sum(revenue)) over(order by month_no))/lag(sum(revenue)) over(order by month_no)*100,1) as mom_growth
from sales_report
group by month,month_no
order by month_no;



