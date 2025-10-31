select * from customer where age between 20 and 30;

select * from customer where age >= 20 and age <= 30; 

select * from customer where age not between 20 and 30;


select * from sales where ship_date between '2015-04-01' and '2016-04-01';

select * from customer where customer_name like 'J%'; 

select * from customer where customer_name like '%Nelson%'; 

select * from customer where customer_name Like '____ %'; 

select distinct city from customer where city not like 'S%'; 

select * from customer where customer_name like 'G\%'; 

/* Seleccionar las ciudades donde
la region sea north o east sin duplicados
mediante IN
*/ 
select distinct city from customer where region in ('North', 'East');

/* Seleccionar la lista de ordenes donde
hay ventas entre 100 y 500 usando between */
select order_id from sales where sales between 100 and 500;
/* 
 Seleccionar lista de customers cuyo 
 last_name contiene solo 4 caracteres
 usando like
*/

select customer_id from customer where customer_name like '% ____';

-- para comprobar se hace un select * de cada uno para ver los valores
-- en lugar de solo customer_id o una sola columna.
select * from customer
where state = 'California' 
order by Customer_name; 

select * from customer
order by 2 desc;

select * from customer
where state = 'California'
order by customer_name desc;

select * from customer where age>25
order by city asc, 
customer_name desc;

--Limit 

select * from customer where age >= 25 order by age desc limit 8; 

select * from customer where age >= 25 order by age asc limit 10;

--Ejercicio de ordenamiento
select * from sales where discount > 0
order by discount desc;

select * from sales where discount > 0
order by discount desc limit 10;

-- AS

select customer_id as "Serial Number", customer_name as name, age as Customer_age from customer;

select count(*) from sales; 

select count(order_line) as "Number of Products Ordered", 
count (distinct order_id) as "Number of Orders"
from sales where customer_id = 'CG-12520';

select sum(profit) as "Total Profit" from sales;

select sum(quantity) as "Total Quantity" from sales where product_id = 'FUR-TA-10000577';

--average
select avg(age) as "Average Customer Age" from customer; 

select avg(sales*.10) as "Average Commission Value" from sales;

select min(sales) as "Minimum sales value June 15" from sales where order_date between '2015-06-01' and '2015-06-30';

select sales from sales where order_date between '2015-06-01' and '2015-06-30' order by sales asc;

select max(sales) as "Minimum sales value June 15" from sales where order_date between '2015-06-01' and '2015-06-30';

select sales from sales where order_date between '2015-06-01' and '2015-06-30' order by sales desc;
--corroborar el maximo. 

--suma de todos los valores de ventas
select sum(sales) from sales;

select count(distinct customer_id) from customer where region = 'north' and
age between 20 and 30;

select avg(age) from customer where region = 'East';

select min(age), max(age) from customer where city = 'Philadelphia';

select region, state, avg(age) as age, COUNT(customer_id) AS customer_count from customer Group by region, state; 

select product_id, SUM(quantity) as quantity_sold from sales
group by product_id order by quantity_sold desc; 

select customer_id, min(sales) as min_sales, max(sales) as max_sales, avg(sales) as Average_sales,
SUM(sales) AS Total_sales from sales group by customer_id 
order by total_sales desc limit 5;

select region, count(customer_id) as customer_count
from customer
group by region
having count(customer_id) > 200;

select region, count(customer_id) as customer_count 
from customer where customer_name like 'A%'
group by region having count(customer_id) > 15; 

select product_id, sum(sales) as total_sales_dlls, 
sum(quantity) as total_sales_quantity, 
count(sales) as number_of_orders, 
max(sales) as max_sale, min(sales) as min_sale, 
avg(sales) as average_sales from sales group by product_id order by total_sales_dlls desc;

select product_id, sum(sales) as total_sales_dlls, 
sum(quantity) as total_sales_quantity, 
count(sales) as number_of_orders, 
max(sales) as max_sale, min(sales) as min_sale, 
avg(sales) as average_sales from sales group by product_id having sum(quantity) > 10 order by total_sales_dlls desc 
;
