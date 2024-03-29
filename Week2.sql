#Question 1

SELECT
	COUNT(order_id)
FROM pizza_runner.customer_orders;

#question 2

SELECT
	COUNT(DISTINCT order_id)
FROM pizza_runner.customer_orders;

#question 3
SELECT
	COUNT(order_id)
FROM pizza_runner.runner_orders
WHERE order_id <> '6' AND order_id <> '9';

#question 4
SELECT
	COUNT(customer_orders.pizza_id),
    pizza_names.pizza_name
FROM pizza_runner.customer_orders
JOIN pizza_runner.runner_orders ON pizza_runner.runner_orders.order_id = pizza_runner.customer_orders.order_id
JOIN pizza_runner.pizza_names ON pizza_runner.customer_orders.pizza_id = pizza_runner.pizza_names.pizza_id
GROUP BY customer_orders.pizza_id, pizza_names.pizza_name;

#question 5

SELECT
	COUNT(customer_orders.pizza_id),
    pizza_names.pizza_name,
    customer_orders.customer_id
FROM pizza_runner.customer_orders
JOIN pizza_runner.runner_orders ON pizza_runner.runner_orders.order_id = pizza_runner.customer_orders.order_id
JOIN pizza_runner.pizza_names ON pizza_runner.customer_orders.pizza_id = pizza_runner.pizza_names.pizza_id
GROUP BY customer_orders.pizza_id, pizza_names.pizza_name, customer_orders.customer_id
ORDER BY customer_orders.customer_id;

#question 6


#question 7
