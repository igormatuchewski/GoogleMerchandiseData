-- TABELA USERS: ltv (life time value): receita total esperada que o cliente gere para a empresa --
-- TABELA USERS: date: data da primeira compra do cliente --
-- TABELA EVENTS: ga_session_id: o id da compra --


-- Verificando se há duplicidades --

SELECT
	id,
	COUNT(id) AS "qtd"
FROM
	dbo.users
GROUP BY
	id
HAVING
	COUNT(id) > 1

SELECT
	id,
	COUNT(id) AS "qtd"
FROM
	dbo.items
GROUP BY
	id
HAVING
	COUNT(id) > 1

CREATE VIEW google_normalizada AS
SELECT
	ev.user_id,
	ev.country AS "user_country",
	ev.device AS "user_device",
	
u.ltv AS "life_time_value",
	u.date AS "first_purchase",
	ev.ga_session_id AS "order_id",
	ev.item_id,
	it.name AS "item_name",
	it.brand,
	it.variant,
	it.category,
	it.price_in_usd,
	ev.type AS "occurence",
	ev.date AS "date"
FROM
	dbo.events1 AS ev
LEFT JOIN
	dbo.users AS u
ON
	ev.user_id = u.id
LEFT JOIN
	dbo.items as it
ON
	ev.item_id = it.id


SELECT
	*
FROM
	google_normalizada
