/* Ejercicios 13 */

/* 
1.Find Maximum length of characters in the Product name string from Product table 
2.Retrieve product name, sub-category and category from Product table and an additional col name 'product_details' which contains a concatenated string of product name, sub-category and category. 
3. Analyze the product_id col and take out the three parts composing the product_id in three different columns 
4. List down comma separated product name where sub_category is either Chairs or Tables 
*/ 
--1
select 
	product_name, 
	max(length(product_name))
from Product
group by product_name 
order by max(length(product_name)) desc; 
--le agregue grupo y ordenador por curiosidad buscaba saber cual era el producto
--2
select 
	product_name, 
	sub_category, 
	category, 
	product_name||', '||sub_category||', '||category as prod_name_subcat_cat
from Product;
--3. Es una separacion de cadena
select product_id from product; --tiene 3 partes dividido aparentemente por guiones
SELECT ASCII(SUBSTRING(product_id, 5, 1)) AS ascii_code, product_id
FROM product
LIMIT 5; --hay caracteres atipicos no visibles que impiden la separacion por guiones.


select 
	product_id, 
	split_part(REGEXP_REPLACE(product_id, '[^\x20-\x7E]', '', 'g'), '-', 1) as product_id_part1,
	split_part(REGEXP_REPLACE(product_id, '[^\x20-\x7E]', '', 'g'), '-', 2) as product_id_part2,
	split_part(REGEXP_REPLACE(product_id, '[^\x20-\x7E]', '', 'g'), '-', 3) as product_id_part3
from product; --logrado 

--4
--Revisar product_name 
select product_name from product; 

--Revisar sub_category
select distinct sub_category from product; --Chairs y Tables no hay errores de gramatica

--La instruccion no la veo del todo claro, seleccionare los nombres donde la subcategoria sea sillas o mesas. 
select product_name, sub_category
from product
where sub_category in ('Chairs', 'Tables')
order by sub_category; --opcional el ordenar 

--Bueno parece que quiere una lista agregada por commas.
select sub_category, 
string_agg(product_name, ',') as prod_subcat_list from product 
where sub_category in ('Chairs', 'Tables') group by sub_category; 



