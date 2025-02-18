select d.department_id,department_name,count(*) 
from employees e 
left join departments d 
on d.department_id = e.department_id 
group by d.department_id,department_name 
order by d.department_id asc


select first_name,salary,avg(salary) over() as avg_salary
from employees e 

-- partiions based on the department_id and then sort in asc order based on salary under each department
select first_name,department_id,salary, 
row_number() over(partition by department_id order by salary asc) as rank
from employees e 

-- assign a rank with gaps in ranking for ties
select first_name,salary, rank() over(order by salary asc) as salary_rank
from employees e 

--assing rank without gap, in this case employee with same salary will be assinged the same rank
select first_name,salary, dense_rank () over(order by salary asc) as salary_rank
from employees e 

-- assings the rank based on the department_id
select first_name,department_id ,salary, 
rank() over(partition by department_id order by salary asc) as department_rank
from employees e 

-- increments the running_total column with values from salary colum
select first_name,salary,sum(salary) over(order by salary) as running_total
from employees e 

-- gives the avg percentage of each employee salary compared to the whole sum
select first_name ,salary, round(salary*100/sum(salary) over(),2) as percent_of_total
from employees e 

-- divide the whole employee list into 4 quartile and assign the value based on the salary order
select first_name, salary , ntile (4) over (order by salary) as salary_quartile
from employees e 


--didnt understand
select first_name,salary, 
first_value(salary) over (partition by department_id order by salary) as first_salary,
last_value(salary) over (partition by department_id order by salary) as last_salary
from employees e

-- identify duplicate records
with cte as (
select  first_name, salary, row_number() over(partition by first_name order by first_name) as row_num
from employees e 
)
select * from cte where row_num>1

-- This example uses the LAG() function to return the sales amount of the current year and the previous year of the group id 1:

SELECT year, amount, LAG(amount, 1) OVER (ORDER BY year) previous_year_sales
FROM sales
WHERE group_id = 1;

-- The following example uses the LAG() function to compare the sales of the current year with the sales of the previous year of each product group:
SELECT year, amount, group_id, LAG(amount, 1) OVER (PARTITION BY group_id ORDER BY year) previous_year_sales
FROM sales

-- The following example uses the LEAD() function to compare the sales of the current year with the sales of the next year of each product group:
SELECT year, amount, LEAD(amount, 1) OVER (ORDER BY year) next_year_sales
FROM sales

-- Alliasing former is without alising, and next one is alliased, it could also be used with partion by too
select first_name, salary , 
ntile (4) over (order by salary) as salary_quartile,
ntile (10) over (order by salary) as salary_tentile
from employees e 

select first_name, salary , 
ntile (4) over ntile_window as quartile,
ntile (10) over ntile_window as tentile
from employees e 
window ntile_window as (order by salary)