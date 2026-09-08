--All Queries

Select*from olist_customers_dataset;
Select*from olist_geolocation_dataset;
select*from olist_orders_dataset;
select*from olist_order_items_dataset;
select*from olist_order_payments_dataset;
select*from olist_order_reviews_dataset;
select*from olist_products_dataset;
select*from olist_sellers_dataset;
select*from product_category_name_translation;


-- List all distinct order statuses.

select distinct order_status
from olist_orders_dataset;

-- Get all orders placed in 2017, sorted by purchase timestamp descending.

select *
from olist_orders_dataset
where order_purchase_timestamp>='2017-01-01' and order_purchase_timestamp<'2018-01-01'
order by order_purchase_timestamp DESC;

-- Get the 10 most expensive order items (by price).

select *
from olist_order_items_dataset
order by price DESC;

-- List distinct customer states.

select distinct customer_state
from olist_customers_dataset;

-- Find all orders that were canceled

select *
from olist_orders_dataset
where order_status ='canceled';

-- Find all order items with a freight value greater than the price (freight costs more than the item).

select *
from olist_order_items_dataset
where freight_value>price;

-- List sellers based in the state of 'SP'

select *
from olist_sellers_dataset
where seller_state ='SP';

-- Find products with a missing (NULL) category name.

select *
from olist_products_dataset
where product_category_name is Null;

-- Find reviews with a score of 1 or 2 and a non-empty comment message.

select *
from olist_order_reviews_dataset
where review_score <=2
and review_comment_message is Null;

-- Get the 5 earliest orders ever placed.

select *
from olist_orders_dataset
order by order_purchase_timestamp ASC
limit 5;

-- Count total number of orders. and Distinct Customer

select count(*)
from olist_orders_dataset;

--Total Revenue and Avg order Price

select sum(price) as TotalRevenue,round(avg(price),2) as Avg_price
from olist_order_items_dataset;

-- Minimum and maximum payment value

select max(Payment_value) as Max_PaymentValue,min(Payment_value) as Min_PaymentValue
from olist_order_payments_dataset;

--Number of orders per order_status

select order_status,count(*) as NumberOfOrders
from olist_orders_dataset
group by order_status;

-- Average review score per review score count

select review_score,count(*) as reviewscorecount
from olist_order_reviews_dataset
group by review_score
order by review_score;

-- Total freight value collected per product category

select p.product_category_name as Category,sum(o.freight_value) as Total
from olist_order_items_dataset as o
join olist_products_dataset as p
on o.product_id=p.product_id
group by p.product_category_name;

-- Average payment installments by payment type
select payment_type,round(avg(payment_installments),2) as Avgerage 
from olist_order_payments_dataset
group by payment_type;

-- List each order with its customer state

select o.customer_id,o.order_status,c.customer_state
from olist_orders_dataset as o
join olist_customers_dataset as c
on o.customer_id=c.customer_id;

-- List order items with English category name

select o.order_id,o.product_id,t.product_category_name_english
from olist_order_items_dataset as o
join olist_products_dataset as p
on o.product_id=p.product_id
left join product_category_name_translation as t
on p.product_category_name=t.product_category_name;

-- For each order, total price + total freight + total payment value

with item_agg as (
	select order_id,sum(price) as TotalPrice ,sum(freight_value) as TotalFreight
	from olist_order_items_dataset
	group by order_id
),
payments_agg as (
	select order_id,sum(payment_value)as Total_paymentvalue
	from olist_order_payments_dataset
	group by order_id
)
select i.order_id,i.TotalPrice,i.TotalFreight,p.Total_paymentvalue
from item_agg as i
join payments_agg as p
on i.order_id=p.order_id;

-- List sellers with their state and count of distinct orders they've fulfilled.

select s.seller_id,s.seller_state,count(distinct o.order_id) as Distinct_Orders
from olist_sellers_dataset as s
join olist_order_items_dataset as o
on s.seller_id=o.seller_id
group by s.seller_id,s.seller_state;


-- Revenue by customer state, delivered orders only

select c.customer_state,sum(oi.price)as TotalRevenue
from olist_orders_dataset as o
join olist_customers_dataset as c
on o.customer_id=c.customer_id 
join olist_order_items_dataset as oi
on oi.order_id=o.order_id
where o.order_status='delivered'
group by c.customer_state
order by TotalRevenue DESC;

-- Payment method usage: count of orders and total value per payment type.

select *
from olist_order_payments_dataset;

select payment_type ,sum(payment_value) as TotalValue
from olist_order_payments_dataset as p
group  by payment_type
order by TotalValue DESC;


-- Average review score per seller(min 20 reviews, to avoid noisy small samples

WITH review_per_order AS (
    SELECT order_id, AVG(review_score) AS score
    FROM olist_order_reviews_dataset
    GROUP BY order_id
)
SELECT oi.seller_id, round(AVG(r.score),2) AS avg_review_score, COUNT(*) AS num_reviews
FROM olist_order_items_dataset oi
JOIN review_per_order r ON oi.order_id = r.order_id
GROUP BY oi.seller_id
HAVING COUNT(*) >= 20
ORDER BY avg_review_score DESC;

-- Average delivery time in days (purchase to delivered), delivered orders only

SELECT AVG(
    EXTRACT(EPOCH FROM (order_delivered_customer_date - order_purchase_timestamp)) / 86400
) AS avg_delivery_days
FROM olist_orders_dataset
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL;


-- Repeat customers: customers (by customer_unique_id) with more than 1 order, and their total revenue contribution.

WITH cust_orders AS (
    SELECT c.customer_unique_id, o.order_id
    FROM olist_orders_dataset o
    JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
    WHERE o.order_status = 'delivered'
),
order_revenue AS (
    SELECT order_id, SUM(price) AS revenue
    FROM olist_order_items_dataset
    GROUP BY order_id
),
cust_summary AS (
    SELECT co.customer_unique_id,
           COUNT(DISTINCT co.order_id) AS num_orders,
           SUM(orv.revenue) AS total_revenue
    FROM cust_orders co
    JOIN order_revenue orv ON co.order_id = orv.order_id
    GROUP BY co.customer_unique_id
)
SELECT *
FROM cust_summary
WHERE num_orders > 1
ORDER BY total_revenue DESC;


-- Top 10 sellers by total revenue (delivered orders only)

select oi.seller_id,sum(oi.price) as Total_Revenue
from olist_order_items_dataset as oi
join olist_orders_dataset as o
on oi.order_id=o.order_id
where o.order_status='delivered'
group by oi.seller_id 
order by Total_Revenue DESC
limit 10;

-- Classify each order item as 'low', 'medium', 'high' value using CASE (thresholds: <50, 50-200, >200)

select order_id,product_id,price,
Case 
	when price <50 then 'Low'
	when price between 50 and 200 then 'Medium'
	else 'High'
end as PriceTier
from olist_order_items_dataset as oi;


-- Monthly revenue trend (delivered orders).

SELECT DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
       SUM(oi.price) AS monthly_revenue
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY month
ORDER BY month;

-- Top 3 sellers by revenue within each state

WITH seller_revenue AS (
    SELECT s.seller_id, s.seller_state, SUM(oi.price) AS revenue
    FROM olist_order_items_dataset oi
    JOIN olist_sellers_dataset s ON oi.seller_id = s.seller_id
    JOIN olist_orders_dataset o ON oi.order_id = o.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY s.seller_id, s.seller_state
),
ranked AS (
    SELECT *,
           RANK() OVER (PARTITION BY seller_state ORDER BY revenue DESC) AS state_rank
    FROM seller_revenue
)
SELECT *
FROM ranked
WHERE state_rank <= 3
ORDER BY seller_state, state_rank;


--Category performance over time: revenue per category per quarter

SELECT COALESCE(t.product_category_name_english, p.product_category_name) AS category,
       DATE_TRUNC('quarter', o.order_purchase_timestamp) AS quarter,
       SUM(oi.price) AS revenue
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
JOIN olist_products_dataset p ON oi.product_id = p.product_id
LEFT JOIN product_category_name_translation t ON p.product_category_name = t.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY category, quarter
ORDER BY category, quarter;


-- Sellers with high revenue but poor average review score (revenue in top 20%, avg review < 3.5) — subquery-based threshold.

WITH seller_revenue AS (
    SELECT oi.seller_id, SUM(oi.price) AS revenue
    FROM olist_order_items_dataset oi
    JOIN olist_orders_dataset o ON oi.order_id = o.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY oi.seller_id
),
seller_reviews AS (
    SELECT oi.seller_id, AVG(r.review_score) AS avg_score
    FROM olist_order_items_dataset oi
    JOIN olist_order_reviews_dataset r ON oi.order_id = r.order_id
    GROUP BY oi.seller_id
),
revenue_threshold AS (
    SELECT PERCENTILE_CONT(0.8) WITHIN GROUP (ORDER BY revenue) AS p80
    FROM seller_revenue
)
SELECT sr.seller_id, sr.revenue, sv.avg_score
FROM seller_revenue sr
JOIN seller_reviews sv ON sr.seller_id = sv.seller_id
CROSS JOIN revenue_threshold rt
WHERE sr.revenue >= rt.p80
  AND sv.avg_score < 3.5
ORDER BY sr.revenue DESC;


-- Rank product categories within each state by revenue

WITH cat_state_revenue AS (
    SELECT c.customer_state,
           COALESCE(t.product_category_name_english, p.product_category_name) AS category,
           SUM(oi.price) AS revenue
    FROM olist_orders_dataset o
    JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
    JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
    JOIN olist_products_dataset p ON oi.product_id = p.product_id
    LEFT JOIN product_category_name_translation t ON p.product_category_name = t.product_category_name
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_state, category
)
SELECT *,
       DENSE_RANK() OVER (PARTITION BY customer_state ORDER BY revenue DESC) AS category_rank_in_state
FROM cat_state_revenue
ORDER BY customer_state, category_rank_in_state;


--Compare current month revenue vs previous month for the most recent 2 months in the data

WITH monthly AS (
    SELECT DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
           SUM(oi.price) AS revenue
    FROM olist_orders_dataset o
    JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY month
),
last_two AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY month DESC) AS rn
    FROM monthly
)
SELECT month, revenue
FROM last_two
WHERE rn <= 2
ORDER BY month;























































































































































































































































































































































































































































































































































