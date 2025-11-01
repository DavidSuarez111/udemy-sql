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

-- para comprobar se hace un 
select * from customer
where state = 'California' 
order by Customer_name; 

select * from customer
where state = 'California'
order by customer_name desc;

select * from customer where age>25
order by city asc, 
customer_name desc;

select *, case
			when age<40 then 'Young'
            when age>60 then 'Senior Citizen' 
            else 'Middle aged'
        End as Age_category from customer; 
/* Joins */

/* Crear tabla de ventas en el año 2015 */
create table sales_2015 as select * from sales where ship_date between '2015-01-01' and '2015-12-31';

select count(*) from sales_2015; --2131

select count(distinct customer_id) from sales_2015; --578

/* Customers with age between 20 and 60 */

create table customer_20_60 as select * from customer where age between 20 and 60;
select count(*) from customer_20_60; --597

/* inner joins */
select 
      a.order_line, a.product_id, 
      a.customer_id, a.sales, b.customer_name, 
      b.age
from sales_2015 as a 
inner join customer_20_60 as b 
on a.customer_id = b.customer_id 
order by customer_id;

/* full join */ 
select 
a.order_line, 
a.product_id, 
a.customer_id,
a.sales, 
b.customer_name, 
b.age,
b.customer_id
from sales_2015 as a
full join customer_20_60 as B
on a.customer_id = b.customer_id
order by a.customer_id, b.customer_id;
/* left join */ 
select a.order_line, 
a.product_id, 
a.sales, 
b.customer_name, 
b.age
from sales_2015 as a 
left join customer_20_60 as b
on a.customer_id = b.customer_id
order by a.customer_id; 

/* right join */ 
select 
a.order_line, 
a.product_id, 
a.sales, 
b.customer_id,
b.customer_name, 
b.age
from sales_2015 as a 
right join customer_20_60 as b
on a.customer_id = b.customer_id
order by a.customer_id; 

/* cross join */ 
