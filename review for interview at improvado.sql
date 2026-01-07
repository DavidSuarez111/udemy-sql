-- Make a dashboard with the following figures (in other file) for each Product ID. 

SELECT 
	product_id, sum(sales) as total_sales_dlls, 
	sum(quantity) as total_sales_quantity, 
	count(sales) as number_of_orders, 
	max(sales) as max_sale, 
	min(sales) as min_sale, 
	avg(sales) as average_sales 
FROM 
	sales 
GROUP BY 
	product_id 
HAVING
	sum(quantity) > 10
ORDER BY 
	total_sales_quantity;
-- dashboard completed 

/* 
case when - conditionals. equivalent to case = if, then = else
*/ 
SELECT 
	*, 
CASE WHEN
	age < 40 then 'Young' 
WHEN
	age > 60 then 'Senior Citizen'
ELSE 
	'Middle Aged'
END as Age_category 
FROM 
	customer;

-- age_category field generated based on the conditional of age thresholds. 

/* 
	Joins 
		Inner join what is in both tables in common. 
		
*/ 

-- inner join
SELECT 
	a.order_line, 
	a.product_id, 
	a.customer_id, 
	a.sales, 
	b.customer_name,
	b.age
FROM 
	sales_2015 as a
INNER JOIN 
	customer_20_60 as b
ON
	a.customer_id = b.customer_id;

-- inner join completed, 2 columns from customer_20_60 joined to 4 columns of sales_2015. 

/* 
	Combining queries 
		union, intersect, and except
*/ 

SELECT 
	customer_id 
FROM 
	sales_2015
INTERSECT
SELECT 
	customer_id 
FROM 
	customer_20_60; --436 rows

SELECT
	customer_id
FROM
	sales_2015; --2131 rows

/* 
	Get the info that contains
		Product_id, product_name, category, total_sales 
	FROM 
		sales y product
*/ 

SELECT 
	a.Product_id, a.product_name, 
	a.category, 
	sum(ROUND(sales)) as total_sales
FROM 
	product as a 
LEFT JOIN 
	sales as b
ON
	a.product_id = b.product_id
GROUP BY 
	a.product_id; 

-- rounded for better aesthetic. The query explains how much of each product is sold. 

/* 
	Subqueries
		pending
*/ 

--Get data with all columns of sales table and customer_name, customer_age, product_name and category
	-- A join between 3 tables will be made. Alternatively it can be made with left joins instead of subqueries.
SELECT *
FROM 
	(SELECT 
		c.customer_name, 
		c.age, 
		p.product_name, 
		p.category
	FROM 
		sales as s
LEFT JOIN
	customer as c
ON 
	s.customer_id = c.customer_id
LEFT JOIN 
	product as p
ON 
	s.product_id = p.product_id) as combined; -- in this query combined table gets formed where columns of sales are filtered by the data of customer and product. 
	-- Left to filter based on combined 

SELECT 
	s.*, 
	c.customer_name, 
	c.age, 
	p.product_name,
	p.category
FROM 
	sales AS s 
LEFT JOIN 
	customer AS c
ON s.customer_id = c.customer_id
LEFT JOIN 
	product as p
ON 
	s.product_id = p.product_id;
--the easy left join version 



/* 
	Pattern Matching
*/ 



	
	