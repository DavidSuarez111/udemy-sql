create table customer (
customer_id varchar primary key,
customer_name varchar,
segment varchar, age int,
country varchar, city varchar,
state varchar, postal_code bigint, region varchar);

select * from customer;

create table product (
            product_id varchar primary key, 
            category varchar, sub_category varchar,
            product_name varchar
        );

create table sales (
            order_line int primary key, 
            order_id varchar, 
            order_date date, 
            ship_date date, 
            ship_mode varchar, 
            customer_id varchar, 
            product_id varchar, 
            sales numeric, 
            quantity int, 
            discount numeric, 
            profit numeric);

copy customer from 'C:/Users/Public/Data/Customer.csv' delimiter ',' CSV header; 

copy product from 'C:/Users/Public/Data/Product.csv' CSV header;  

copy sales from 'C:/Users/Public/Data/Sales.csv' CSV header; 