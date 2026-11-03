Use BikeStores;

SELECT
	product_name,
	list_price,
	category_id
FROM
	production.products
ORDER BY
	product_name DESC;

--The query above returns category_id so for us to get the category name for easier relaying of information we use an inner join to the categories table
SELECT
	product_name,
	category_name,
	list_price
FROM
	production.products p
INNER JOIN production.categories c
		ON c.category_id = p.category_id
ORDER BY
	product_name DESC;


--Using inner join to query more than two tables
SELECT
	product_name,
	category_name,
	brand_name,
	list_price
FROM
	production.products p
INNER JOIN production.categories c ON c.category_id = p.category_id
INNER JOIN production.brands b ON b.brand_id = p.brand_id
ORDER BY
	product_name DESC;

--LEFT JOIN
SELECT
	product_name,
	order_id
FROM
	production.products p
LEFT JOIN sales.order_items o
	ON o.product_id = p.product_id
ORDER BY
	order_id;

--Using the WHERE clause on a left join to get rows on left table that have no matching rows on the right ttable
SELECT
	product_name,
	order_id
FROM
	production.products p
LEFT JOIN sales.order_items o
	ON o.product_id = p.product_id
WHERE
	order_id IS NULL;
		

--LEFT JOIN on three tables
SELECT
	p.product_name,
	o.order_id,
	i.item_id,
	o.order_date
FROM
	production.products p
LEFT JOIN sales.order_items i
	ON i.product_id = p.product_id
LEFT JOIN sales.orders o
	ON o.order_id = i.order_id
ORDER BY
	order_id;