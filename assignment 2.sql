--# using join 
--1 
select product_name,brand_name, category_name 
from production.products as product 
join production.brands as brand 
on product.brand_id=brand.brand_id
join production.categories as category 
on category.category_id=product.category_id;
--2
select product_name , sum(quantity) as sold 
from production.products as product  
join sales.order_items as orders 
on orders.product_id=product.product_id
group by product_name;
--3
select concat(first_name,' ',last_name)as customer,store_name
from sales.orders as orders 
join sales.customers as customers on customers.customer_id=orders.customer_id
join sales.stores as stores on stores.store_id=orders.store_id;
--4
select store_name , sum(list_price) sales
from sales.orders      as orders
join sales.stores      as stores on stores.store_id=orders.store_id 
join sales.order_items as item   on item.order_id=orders.order_id
group by store_name;
--5
select concat(customer.first_name,' ',customer.last_name)as customer,store_name,concat(staff.first_name,' ',staff.last_name)staff,order_date,
product_name ,quantity,item.list_price
from sales.orders        as orders
join sales.customers     as customer on customer.customer_id=orders.customer_id
join sales.stores        as store    on store.store_id=orders.store_id
join sales.staffs        as staff    on staff.staff_id=orders.staff_id
join sales.order_items   as item     on item.order_id=orders.order_id
join production.products as product  on product.product_id=item.product_id;
--6  -- used left join 
select product_name as not_Sold  
from production.products as product 
left join sales.order_items as item on product.product_id=item.product_id
where quantity is null ;
--7
select category_name ,cast(avg(list_price)as numeric(10,2))as AVG_price
from production.products products
join production.categories  cat on cat.category_id=products.category_id
group by category_name;
--8
select product_name ,sum(quantity) available 
from production.products products
join production.stocks  stock on stock.product_id=products.product_id
group by product_name;
--9
select concat(customer.first_name,' ',customer.last_name)as customer,sum(quantity) transactions 
from sales.orders        as orders
join sales.customers     as customer on customer.customer_id=orders.customer_id
join sales.order_items   as item     on item.order_id=orders.order_id
group by concat(customer.first_name,' ',customer.last_name);
--10
select store_name,product_name ,sum(quantity) sold
from sales.orders        as orders
join sales.stores        as store    on store.store_id=orders.store_id
join sales.order_items   as item     on item.order_id=orders.order_id
join production.products as product  on product.product_id=item.product_id
group by store.store_name,product_name
order by store.store_name;
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
--# left join 
--1
select product_name , category_name 
from production.products as product 
left join production.categories as cat on cat.category_id=product.category_id;
--2
select product_name , isnull(sum(quantity),0) as sold 
from production.products as product  
left join sales.order_items as orders 
on orders.product_id=product.product_id
group by product_name;
--3
select concat(customer.first_name,' ',customer.last_name)as customer,store_name,concat(staff.first_name,' ',staff.last_name)staff,order_date,
product_name ,quantity,item.list_price
from sales.orders        as orders
left join sales.customers     as customer on customer.customer_id=orders.customer_id
join sales.stores        as store    on store.store_id=orders.store_id
join sales.staffs        as staff    on staff.staff_id=orders.staff_id
join sales.order_items   as item     on item.order_id=orders.order_id
join production.products as product  on product.product_id=item.product_id
where  concat(customer.first_name,' ',customer.last_name) ='' ;
--4 --no staff don't have a store id
select concat(staff.first_name,' ',staff.last_name)staff, store_name 
from sales.staffs as staff 
 left join sales.stores as store on staff.store_id=store.store_id;
 --5 --no cat has no products 
 select category_name ,cast(avg(list_price)as numeric(10,2))as AVG_price
from production.products products
left join production.categories  cat on cat.category_id=products.category_id
group by category_name;
--6
select concat(customer.first_name,' ',customer.last_name)as customer,isnull(sum(quantity),0) transactions 
from sales.customers     as customer 
 join sales.orders        as orders on customer.customer_id=orders.customer_id
left join sales.order_items   as item     on item.order_id=orders.order_id
group by concat(customer.first_name,' ',customer.last_name);
--#####################################################################################
--1
select concat(staff.first_name,staff.last_name)as staff , concat(manager.first_name,manager.last_name)as managers 
from sales.staffs as staff 
join sales.staffs as manager on manager.staff_id=staff.manager_id;


select * from sales.orders;