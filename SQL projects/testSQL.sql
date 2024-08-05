use newTest;

select top 5 list_price,product_name from production.products order by list_price desc;
select * from sales.customers where city ='new york' ;
select *  from sales.customers;
select * from production.products;
select * from sales.orders;

select customer_id ,count(*) as "number of orders " 
from sales.orders  
group by customer_id  
having count(*)=1 ;
-- grouping 
select category_id,sum(list_price) from production.products group by category_id ;
select customer_id , count(1) 
from sales.orders 
group by customer_id ;
-- having 
select  category_id , sum (list_price) as [total sales] 
from production.products
group by category_id 
having sum(list_price)>500 
order by sum(list_price) desc;
--insertion 
insert into production.brands (brand_name) values ('brandX');
select * from production.brands ;  
-- updating 
select * from sales.staffs;
update sales.staffs set active =0 ;
-- deletion 
delete from sales.stores where store_id=5;
delete from production.brands where brand_id=2;
delete from production.categories where category_id =3;
delete from sales.customers where customer_id =4;
delete from sales.staffs where staff_id=4;   -- An  Error occurred whith staff_id =6

-- additional complex 
select* from sales.orders ;

insert into sales.orders (customer_id,order_status,order_date,required_date,shipped_date,store_id,staff_id)
values                   (1  , 1     ,'2024-07-01','2024-07-10',     null,      1,         1);

--------------------------------------------------------------------------------------------------------------------
--30
update sales.orders set shipped_date ='2024-07-05' where order_id=1;
-- 31
delete from sales.orders where order_status=3;
--32
insert into production.products (product_name,brand_id,category_id,list_price,model_year)
                          values( 'test1',     4,           4,       22.22,     '2004'),
                                 ('test2' ,     4 ,          4,     3.33,       '2001');
--33
update production.stocks set quantity=0 where store_id=1;