--copy com
COPY olist_customers_dataset FROM 'D:\SqL+Bi\olist_customers_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_geolocation_dataset FROM 'D:\SqL+Bi\olist_geolocation_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_products_dataset FROM 'D:\SqL+Bi\olist_products_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_sellers_dataset FROM 'D:\SqL+Bi\olist_sellers_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_orders_dataset FROM 'D:\SqL+Bi\olist_orders_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_order_items_dataset FROM 'D:\SqL+Bi\olist_order_items_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_order_payments_dataset FROM 'D:\SqL+Bi\olist_order_payments_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_order_reviews_dataset FROM 'D:\SqL+Bi\olist_order_reviews_dataset.csv' DELIMITER ',' CSV HEADER;

COPY product_category_name_translation FROM 'D:\SqL+Bi\product_category_name_translation.csv' DELIMITER ',' CSV HEADER;



