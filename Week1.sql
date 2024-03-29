#Question 1
SELECT customer_id, SUM(price)
FROM dannys_diner.menu
JOIN dannys_diner.sales ON dannys_diner.menu.product_id = dannys_diner.sales.product_id
GROUP BY customer_id
ORDER BY customer_id;

#Question 2
SELECT customer_id, COUNT(DISTINCT order_date)
FROM dannys_diner.menu
JOIN dannys_diner.sales ON dannys_diner.menu.product_id = dannys_diner.sales.product_id
GROUP BY customer_id
ORDER BY customer_id;

#Question 3
SELECT product_name, customer_id, min(order_date)
FROM dannys_diner.menu
JOIN dannys_diner.sales ON dannys_diner.menu.product_id = dannys_diner.sales.product_id
GROUP BY customer_id, product_name
ORDER BY customer_id;

SELECT product_name, customer_id, order_date
FROM dannys_diner.menu
JOIN dannys_diner.sales ON dannys_diner.menu.product_id = dannys_diner.sales.product_id
WHERE order_date = '2021-01-01T00:00:00.000Z'
GROUP BY customer_id, product_name, order_date
ORDER BY customer_id;

#Question 4
SELECT product_name, COUNT(sales.product_id)
FROM dannys_diner.menu
JOIN dannys_diner.sales ON dannys_diner.menu.product_id = dannys_diner.sales.product_id
GROUP BY product_name;

#Question5
SELECT customer_id, MAX(product_name)
FROM dannys_diner.menu
JOIN dannys_diner.sales ON dannys_diner.menu.product_id = dannys_diner.sales.product_id
GROUP BY customer_id
ORDER BY MAX(product_name);

#Question 6
SELECT product_name, sales.customer_id, min(order_date)
FROM dannys_diner.menu
JOIN dannys_diner.sales ON dannys_diner.menu.product_id = dannys_diner.sales.product_id
JOIN dannys_diner.members ON dannys_diner.sales.customer_id = dannys_diner.members.customer_id
WHERE order_date > join_date
GROUP BY sales.customer_id, product_name, order_date
ORDER BY sales.customer_id;

#Question 7
SELECT product_name, sales.customer_id, min(order_date)
FROM dannys_diner.menu
JOIN dannys_diner.sales ON dannys_diner.menu.product_id = dannys_diner.sales.product_id
JOIN dannys_diner.members ON dannys_diner.sales.customer_id = dannys_diner.members.customer_id
WHERE order_date < join_date
GROUP BY sales.customer_id, product_name, order_date
ORDER BY sales.customer_id;

#Question 8
SELECT sales.customer_id, SUM(price), COUNT(menu.product_id)
FROM dannys_diner.menu
JOIN dannys_diner.sales ON dannys_diner.menu.product_id = dannys_diner.sales.product_id
JOIN dannys_diner.members ON dannys_diner.sales.customer_id = dannys_diner.members.customer_id
WHERE order_date < join_date
GROUP BY sales.customer_id
ORDER BY sales.customer_id;

#Question 9
With Points as
(
Select *, Case When product_id = 1 THEN price*20
               Else price*10
	       End as Points
From dannys_diner.Menu
)
SELECT sales.customer_id, sum(points.points) as points
FROM dannys_diner.sales
JOIN Points On points.product_id = sales.product_id
JOIN dannys_diner.menu on menu.product_id = sales.product_id
GROUP BY sales.customer_id
ORDER BY sales.customer_id;

#Question 10
With Points as
(
Select *, Case When product_id = 1 THEN price*20
               Else price*20
	       End as Points
From dannys_diner.Menu
)
SELECT sales.customer_id, sum(points.points) as points
FROM dannys_diner.sales
JOIN Points On points.product_id = sales.product_id
JOIN dannys_diner.menu on menu.product_id = sales.product_id
JOIN dannys_diner.members on members.customer_id = sales.customer_id
WHERE order_date >= join_date AND order_date < '02-01-2021'
GROUP BY sales.customer_id
ORDER BY sales.customer_id;