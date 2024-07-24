USE bike;

/* 1. List all customers with Gmail accounts */
SELECT *
FROM customer
WHERE email like '%gmail.com';

/* 2. Haro bikes */
SELECT * FROM brand where brand_id = 2;
SELECT product_name, list_price, TRUNCATE(list_price * 0.80, 2) AS 'discount_price'
FROM product where brand_id = 2;

/* 3. Santa Cruz Bikes */
SELECT cust_order_id, order_date
FROM cust_order
WHERE store_id = 1
AND staff_id != 2;
