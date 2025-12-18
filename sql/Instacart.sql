--Q1 What percentage of orders are repeat orders?

WITH order_classification AS (
    SELECT
        order_id,
        CASE
            WHEN days_since_prior_order IS NULL THEN 'First Order'
            ELSE 'Repeat Order'
        END AS order_type
    FROM orders
)
SELECT
    COUNT(*) AS total_orders,
    SUM(
        CASE
            WHEN order_type = 'Repeat Order' THEN 1
            ELSE 0
        END
    ) AS repeat_orders,
    ROUND(
        SUM(
            CASE
                WHEN order_type = 'Repeat Order' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS repeat_order_percentage
FROM order_classification;

--Q2 Average Basket Size: First-time vs Repeat Orders

WITH order_type AS (
    SELECT
        order_id,
        CASE
            WHEN days_since_prior_order IS NULL THEN 'First Order'
            ELSE 'Repeat Order'
        END AS order_category
    FROM orders
),
basket_size AS (
    SELECT
        op.order_id,
        COUNT(op.product_id) AS items_in_order
    FROM order_products__prior op
    GROUP BY op.order_id
)
SELECT
    ot.order_category,
    ROUND(AVG(bs.items_in_order), 2) AS avg_basket_size
FROM order_type ot
JOIN basket_size bs
    ON ot.order_id = bs.order_id
GROUP BY ot.order_category;

-- Q3 Departments with Highest Reorder Rate

SELECT
    d.department,
    ROUND(
        SUM(op.reordered)::numeric / COUNT(op.product_id),
        3
    ) AS reorder_rate
FROM order_products__prior op
JOIN products p
    ON op.product_id = p.product_id
JOIN departments d
    ON p.department_id = d.department_id
GROUP BY d.department
ORDER BY reorder_rate DESC;

--Q4 Top 10 Most Frequently Reordered Products

SELECT
    p.product_name,
    COUNT(*) AS reorder_count
FROM order_products__prior op
JOIN products p
    ON op.product_id = p.product_id
WHERE op.reordered = 1
GROUP BY p.product_name
ORDER BY reorder_count DESC
LIMIT 10;

--Q5 Order Time Comparison: First vs Repeat Customers

SELECT
    CASE
        WHEN o.days_since_prior_order IS NULL THEN 'First Order'
        ELSE 'Repeat Order'
    END AS order_type,
    o.order_hour_of_day,
    COUNT(*) AS total_orders
FROM orders o
GROUP BY order_type, o.order_hour_of_day
ORDER BY order_type, o.order_hour_of_day;

