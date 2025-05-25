SELECT 
  customers.customer_id,
  customers.full_name,
  orders.order_id,
  orders.total_cost,
  menu.item_name
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN menu ON orders.menu_id = menu.menu_id
WHERE orders.total_cost > 150
ORDER BY orders.total_cost ASC;
