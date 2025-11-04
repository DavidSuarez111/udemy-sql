/* trim, upper, lower */

select trim(leading ' ' from ' Start-Tech Academy ');
select trim(trailing ' ' from ' Start-Tech Academy ');
select trim(' Start-Tech Academy ');
select ltrim(' Start-Tech Academy ');
select rtrim(' Start-Tech Academy ');

/* concatenate */ 
select 
            customer_name,
            city||' , '||state||' , '||country as Address 
FROM customer;

/*Substring */
select
customer_id, 
customer_name,
SUBSTRING(customer_id FOR 2) as cust_group
from customer
where substring(customer_id for 2) = 'AB';

select 
     Customer_id, 
     Customer_name,
     SUBSTRING(Customer_id FROM 4 FOR 5) AS cust_number
FROM customer
where SUBSTRING(Customer_id FOR 2) = 'AB';

select 
            order_id, 
            STRING_AGG(product_id,',')
from sales
group by order_id;



