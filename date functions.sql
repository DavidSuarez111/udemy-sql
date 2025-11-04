/* Random a=10, b=50 */
select random(), random()*40+10, floor(random()*40+10)


/* Date */
select current_date, current_time(1), current_time(3), current_timestamp;
--(#) numero de decimales de precision.

select age('2014-04-25', '2014-01-01'); --3 month 24 days

select order_line, order_date, ship_date, age(ship_date, order_date) as time_taken 
from sales 
order by time_taken desc; 
--en dias 

select extract(day from current_timestamp);
select extract(minute from current_timestamp);
select order_line, ship_date, (extract(epoch from ship_date) - extract(epoch from order_date)) as sec_taken from sales;