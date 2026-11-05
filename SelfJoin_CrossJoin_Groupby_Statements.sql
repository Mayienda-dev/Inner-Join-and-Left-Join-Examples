USE BikeStores;

--Implementing the self join through the inner join
SELECT
	e.first_name+ ' '+e.last_name employee,
	m.first_name+ ' '+m.last_name manager
FROM
	sales.staffs e
INNER JOIN sales.staffs m ON m.staff_id = e.manager_id
ORDER BY
	manager;

--Comparing rows using self join
SELECT
	c1.city,
	c1.first_name+' '+c1.last_name customer_1,
	c2.first_name+' '+c2.last_name customer_2
FROM
	sales.customers c1
INNER JOIN sales.customers c2 ON c1.customer_id > c2.customer_id 
	AND c1.city = c2.city 
ORDER by
	city,
	customer_1,
	customer_2;

--Cross Join
SELECT
	product_id,
	product_name,
	store_id,
	0 AS quantity
FROM
	production.products
CROSS JOIN sales.stores
ORDER BY
	product_name,
	store_id;

--GROUP BY clause
SELECT
	customer_id,
	YEAR (order_date) year
FROM
	sales.orders
WHERE
	customer_id IN (1,2)
GROUP BY
	customer_id,
	YEAR(order_date)
ORDER BY
	customer_id;

--GROUP clause examples together with aggregate functions
--COUNT function
SELECT
	city,
	state,
	COUNT(customer_id) customer_count
FROM
	sales.customers
GROUP BY
	city,
	state
ORDER BY
	city,
	state;

--Using GROUP BY clause together with the MIN and MAX functions
SELECT
	brand_name,
	MIN(list_price) min_price,
	MAX(list_price) max_price
FROM
	production.products p
INNER JOIN production.brands b 
	ON b.brand_id = p.brand_id
GROUP BY
	brand_name
ORDER BY
	brand_name;

--Using the GROUP BY clause together with the AVG() function
SELECT
	brand_name,
	AVG(list_price) avg_price
FROM
	production.products p
INNER JOIN production.brands b
	ON b.brand_id = p.brand_id
WHERE
	model_year = 2018
GROUP BY
	brand_name
ORDER BY
	brand_name;