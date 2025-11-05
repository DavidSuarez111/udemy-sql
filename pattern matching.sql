/* Pattern matching */

select * from customer 
where customer_name ~*'^a+[a-z\s]+$';

--que los nombres empiecen con a, b, c o d.
select * from customer 
where customer_name ~*'^(a|b|c|d)+[a-z\s]+$';

--que tenga un caracter repetido 3 veces de la a a la z y luego uno 4 veces. Entonces solo nombres y apellidos de 4 letras. 
select * from customer 
where customer_name ~*'^(a|b|c|d)[a-z]{3}\s[a-z]{4}$';

--emails validos
create table users(id serial primary key, name character varying);
insert into users(name) values 
('Alex'), ('Jon Snow'), ('Christopher'), ('Arya'), 
('Sandip Debnath'), ('Lakshmi'), ('alex@gmail.com'), ('sandip5004'), ('lakshmi@gmail.com');
select * from users
where name ~*'[a-z0-9\.\-\_]+@[a-z0-9\.\-]+\.[a-z]{2,5}';