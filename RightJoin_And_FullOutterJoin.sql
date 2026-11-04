USE BikeStores;
--RIGHT JOIN

SELECT
	product_name,
	order_id
FROM
	sales.order_items o
	RIGHT JOIN production.products p
		ON o.product_id = p.product_id
ORDER BY
	order_id;

--Using the WHERE clause to find records on the right table that do not hav matching records on the left table
SELECT
	product_name,
	order_id
FROM
	sales.order_items o
	RIGHT JOIN production.products p
		ON o.product_id = p.product_id
WHERE
	order_id IS NULL
ORDER BY
	product_name;

--FULL OUTER JOIN
CREATE SCHEMA pm;

CREATE TABLE pm.projects (
	id INT PRIMARY KEY IDENTITY,
	title VARCHAR(255) NOT NULL
	);
	
CREATE TABLE pm.members (
	id INT PRIMARY KEY IDENTITY,
	name VARCHAR(120) NOT NULL,
	project_id INT
	FOREIGN KEY(project_id)
		REFERENCES pm.projects(id)
		);

INSERT INTO 
	pm.projects (title)
VALUES
	('New CRM for project sales'),
	('ERP Implementation'),
	('Develop Mobile Sales Platform');


INSERT INTO	
	pm.members
VALUES
	('John Doe', 1),
	('Lily Bush', 1),
	('Jane Doe', 2),
	('Jack Daniel', null);

SELECT * FROM pm.projects;

SELECT * FROM pm.members;

--Full outer join
SELECT
	m.name member,
	p.title project
FROM
	pm.members m
	FULL OUTER JOIN pm.projects p
		ON p.id = m.project_id;

--Retrieving records that have null on either side
SELECT
	m.name member,
	p.title project
FROM
	pm.members m
	FULL OUTER JOIN pm.projects p
		ON p.id	= m.project_id
WHERE
	p.id IS NULL OR m.project_id IS NULL;