select 
ord.order_id, CONCAT(cus.first_name, ' ', cus.last_name) as full_name, 
cus.city, 
cus.state, 
ord.order_date,
SUM(som.quantity) as total_units,
SUM(som.quantity * som.list_price) as Revenue,
pro.product_name,
cat.category_name,
sto.store_name,
CONCAT(stf.first_name, ' ', stf.last_name) as sales_rep
from sales.orders ord
JOIN sales.customers cus
on ord.customer_id = cus.customer_id
JOIN sales.order_items som
on ord.order_id = som.order_id
join production.products pro
on som.product_id = pro.product_id
join production.categories cat
on pro.category_id = cat.category_id
join sales.stores sto
on ord.store_id = sto.store_id
join sales.staffs stf
on ord.staff_id = stf.staff_id
group by 
ord.order_id, CONCAT(cus.first_name, ' ', cus.last_name), 
cus.city, 
cus.state, 
ord.order_date,
pro.product_name,
cat.category_name,
sto.store_name,
CONCAT(stf.first_name, ' ', stf.last_name)