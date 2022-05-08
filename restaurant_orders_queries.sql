--PRAGMA foreign_keys=ON;
--
 DROP TABLE 'User';
 DROP TABLE "Order"; 
 DROP TABLE Restaurant; 
 DROP TABLE Dish; 
 DROP TABLE Order_detail; 

CREATE TABLE 'User'(
id integer NOT NULL PRIMARY KEY, first_name TEXT, last_name TEXT, 
mail TEXT, phone TEXT, 
address TEXT, zip integer, city TEXT, status TEXT)
;

CREATE TABLE Restaurant(
id integer NOT NULL PRIMARY KEY, name TEXT, phone TEXT, 
address TEXT, zip INTEGER, city TEXT)
;

CREATE TABLE 'Order'(
id integer NOT NULL PRIMARY KEY, date datetime, status bool, promotion float, 
user integer, restaurant integer,
FOREIGN KEY (restaurant) REFERENCES Restaurant(id), 
FOREIGN KEY (user) REFERENCES User(id))
;


CREATE TABLE Dish(
id integer NOT NULL PRIMARY KEY, title TEXT, descripition longstr, price float, 
restaurant TEXT, 
FOREIGN KEY (restaurant) REFERENCES Restaurant(id) )
;

CREATE TABLE Order_detail(
id integer NOT NULL PRIMARY KEY, 'order' integer, dish integer, quantity integer, 
FOREIGN KEY ('order') REFERENCES 'Order'(id), 
FOREIGN KEY (dish) REFERENCES Dish(id))
;

INSERT INTO 'User' (id, first_name, last_name, mail, phone, address, zip, city, status)
VALUES
(100,'John'      ,'Anton'    ,'j@ana.tole'          ,'+41 536 436','Heinrichstrasse ' ,8005,'Zürich'   ,'1'     ),
(101,'Marie'     ,'Medicis'  ,'marie@medi.cis'      ,NULL,'Sihlquai'         ,8005,'Zürich'   ,'1'     ),
(180,'Anna'      ,'Veritas'  ,'anna@veritas.com'    , NULL, NULL      ,   NULL ,    NULL     ,'1'     ),
(201,'Franz'     ,'Ouali'    ,'franz@ouali.fr'      , NULL,'Schützengasse'    ,8001,'Zürich'   ,'1'     ),
(213,'Sarah'     ,'Magni'    ,'s.magni@gmail.com'   ,'+41 325 678','Haimstrasse'      ,8001,'Zürich'   ,'1'     ),
(215,'Alan'      ,'Dupuis'   ,'a.dupuis@gmail.com'  ,'+41 325 413','Regensbergstrasse',8050,'Zürich'   ,'1'     ),
(221,'Cedric'    ,'Bouteille','bouteille@hotmail.ch', NULL,'Püntackerweg'     ,8152,'Opfikon'  ,'1'     ),
(225,'Gill'      ,'Baccide'  ,'gill@baccide.com'    ,'+41 432 987','Neugutstrasse'    ,8600,'Dübendorf','1'     ),
(301,'Joe'       ,'Qi'       ,'fake@mail.com'       , NULL, NULL      ,NULL,      NULL   ,'0'     )
;

INSERT INTO restaurant (id, name, phone, address, zip, city)
VALUES
(11 ,'Libanese flavor' ,NULL ,'Kanzleistrasse'   ,8004 ,'Zürich' ),
(23 ,'Tanaka Sushi'    ,'+41 786 432' ,'Talacker'         ,8001 ,'Zürich' ),
(38 ,'Le Bistrot'      ,'+33 789 542' ,'Tödistrasse'      ,8002 ,'Zürich' ),
(42 ,'Mama Cucina'     ,NULL ,'Bramenring'       ,8302 ,'Kloten' ),
(51 ,'Sawatdee'        ,NULL ,'Kreuzbühlstrasse' ,8008 ,'Zürich' )
; 

INSERT INTO 'Order' (id, date, status, promotion, user, restaurant)
VALUES
    (10, "2020-12-01 20:03:45", 1, NULL, 100, 11),
    (11, "2020-12-01 20:04:01", 1, NULL, 101, 42),
    (12, "2020-12-01 20:04:01", 1, 10, 180, 51),
    (13, "2020-12-01 20:04:02", 1, NULL, 201, 38),
    (14, "2020-12-01 20:06:02", 1, 5, 221, 51),
    (15, "2020-12-01 20:06:02", 1, 5, 221, 23),
    (16, "2020-12-01 20:10:04", 1, NULL, 215, 42),
    (431, "2021-01-10 20:01:05", 1, 15, 101, 11),
    (432, "2021-01-10 20:01:05", 0, NULL, 213, 23),
    (433, "2021-01-10 20:01:05", 1, NULL, 201, 42),
    (434, "2021-01-10 20:01:08", 0, 15, 101, 38),
    (435, "2021-01-10 20:01:08", 0, NULL, 221, 23),
    (436, "2021-01-10 20:01:08", 1, NULL, 221, 51)
;



INSERT INTO dish(id, title, descripition, price, restaurant)
VALUES
(15,'Chicken Shawarma'      ,'Chicken in a grilled galette'            , 20.5,        11),
(18,'Gyoza'                 ,'Japanese ravioli'                        , 15.0,        23),
(19,'Taboulé'               ,'Parsley taboulé'                         , 21.2,        11),
(22,'Salmon sushi'          ,'per piece'                               ,  2.0,        23),
(24,'Cucumber maki'         ,'6 pieces'                                ,  4.5,        23),
(25,'Tuna maki'             ,'6 pieces'                                ,  9.4,        23),
(27,'California maki'       ,'8 pieces'                                , 12.0,        23),
(31,'Ramen'                 ,'Japanese soup with pork and noodles'     , 21.0,        23),
(32,'Kebbe boulette'        ,'Delicious meat balls'                    , 10.7,        11),
(34,'Tartiflette'           ,'Potatoes, reblochon cheese and cream'    , 21.0,        38),
(35,'Blanquette'            ,'Veal meat and cream'                     , 25.5,        38),
(37,'Croque-Monsieur'       ,'Grilled bread with ham and cheese'       , 12.0,        38),
(40,'Quattro formaggi pizza','Pizza with 4 type of cheese'             , 18.0,        42),
(41,'Il Maestro'            ,'Pizza with surpise'                      , 21.5,        42),
(43,'Rustica pizza'         ,'Pizza with bacon and onions'             , 17.8,        42),
(44,'Pasta Carbonara'       ,    NULL                                , 16.8,        42),
(48,'Pad Thai '             ,'Noodles with vegetables and oyster sauce', 25.0,        51),
(51,'Laab'                  ,'Spicy salad'                             , 17.0,        51),
(52,'Pad See Eiw'           ,'Large noodles with vegetables'           , 25.5,        51)
; 

INSERT INTO Order_detail (`order`, dish, quantity)
VALUES
    (10, 15, 2),
    (10, 32, 4),
    (10, 19, 2),
    (11, 40, 1),
    (11, 41, 1),
    (12, 52, 1),
    (12, 51, 1),
    (13, 34, 8),
    (14, 48, 3),
    (15, 22, 6),
    (15, 31, 1),
    (15, 25, 2),
    (16, 44, 1),
    (16, 43, 2),
    (431, 15, 3),
    (431, 32, 3),
    (432, 27, 2),
    (432, 25, 2),
    (432, 24, 2),
    (432, 22, 2),
    (433, 44, 1),
    (433, 40, 1),
    (434, 37, 2),
    (434, 35, 1),
    (435, 27, 4),
    (435, 22, 2),
    (435, 31, 1),
    (436, 51, 1),
    (435, 52, 2)
;


-- 2.1. Which restaurants delivered an order in december 2020 ?

SELECT 'order'.id AS order_id, date, name AS restaurant_name
FROM "Order"
LEFT JOIN Restaurant
ON 'Order'.restaurant = restaurant.id
;

SELECT 'order'.id AS order_id, date, name AS restaurant_name, date, 
cast(STRFTIME('%Y', date) as Int) AS order_year,
cast(STRFTIME('%m', date) as Int) AS order_month
FROM  "Order"
LEFT JOIN Restaurant
ON 'Order'.restaurant = restaurant.id
WHERE order_year = 2020
AND order_month = 12
;


-- 2.2. Which restaurants offer noodles ?

ALTER TABLE Dish
RENAME COLUMN descripition TO description;

SELECT name AS restaurant_name, title as menu_name, description as menu_description 
FROM Dish
LEFT JOIN Restaurant
ON Dish.restaurant = Restaurant.id
WHERE instr(menu_description, 'noodles') > 0
OR instr(menu_name, 'noodles') > 0
;

-- 2.3. Which dishes were ordered by “Cedric Bouteille” in 2020 ?

WITH or_det AS( 
SELECT *
FROM "Order"
LEFT JOIN Order_detail
ON 'Order'.id = Order_detail.'order'), 
or_det_di AS ( 
SELECT *
FROM or_det
LEFT JOIN Dish
ON or_det.dish = Dish.id), 
or_det_di_us AS(
SELECT * 
FROM or_det_di
LEFT JOIN 'User'
ON or_det_di.'user' = 'User'.id)
SELECT first_name, last_name, date, restaurant, title, description, quantity
FROM or_det_di_us
WHERE last_name = 'Bouteille'
AND cast(STRFTIME('%Y', date) as Int) = 2020;


-- 2.4. Which user are still waiting for their delivery (check status order) ?

WITH order_user AS (
SELECT 'Order'.status AS order_status,
'User'.first_name, 
'User'.last_name, 
date, 
restaurant
FROM 'Order'
LEFT JOIN 'User'
ON 'Order'.'user' = 'User'.id)
SELECT *
FROM order_user
WHERE order_status=0;


-- 2.5. Which users ordered in 2020 and in 2021 ?

WITH order_user AS (
SELECT 'Order'.status AS order_status,
'User'.first_name, 
'User'.last_name, 
date, 
restaurant
FROM 'Order'
LEFT JOIN 'User'
ON 'Order'.'user' = 'User'.id)
SELECT *
FROM order_user
WHERE last_name IN ( 
SELECT last_name
FROM order_user
WHERE cast(STRFTIME('%Y', date) as Int) =2020) 
AND last_name IN (
SELECT last_name
FROM order_user
WHERE cast(STRFTIME('%Y', date) as Int) =2021)
;

WITH order_user AS (
SELECT 'Order'.status AS order_status,
'User'.first_name, 
'User'.last_name, 
date, 
restaurant
FROM 'Order'
LEFT JOIN 'User'
ON 'Order'.'user' = 'User'.id)
SELECT *
FROM order_user
WHERE (restaurant, last_name) IN ( 
SELECT restaurant, last_name
FROM order_user
WHERE cast(STRFTIME('%Y', date) as Int) =2020)
AND (restaurant, last_name)  IN (
SELECT restaurant, last_name
FROM order_user
WHERE cast(STRFTIME('%Y', date) as Int) =2021)
; 


-- 2.6. What is the biggest quantity & dish delivered to one user ?

WITH or_det AS( 
SELECT *
FROM "Order"
LEFT JOIN Order_detail
ON 'Order'.id = Order_detail.'order'), 
or_det_di AS ( 
SELECT *
FROM or_det
LEFT JOIN Dish
ON or_det.dish = Dish.id), 
or_det_di_us AS(
SELECT * 
FROM or_det_di
LEFT JOIN 'User'
ON or_det_di.'user' = 'User'.id)
SELECT first_name, last_name, restaurant, date, title as dish_name, description, quantity
FROM or_det_di_us
Order by quantity DESC
LIMIT 1;

-- 2.7. What is the cost of each order ?

WITH or_det AS( 
SELECT *
FROM "Order"
LEFT JOIN Order_detail
ON 'Order'.id = Order_detail.'order'), 
or_det_di AS ( 
SELECT *
FROM or_det
LEFT JOIN Dish
ON or_det.dish = Dish.id)
SELECT  id, title as dish_name, description, quantity, price, 
sum(price*quantity) as cost_per_order
FROM or_det_di
GROUP BY id
ORDER BY cost_per_order DESC
;

WITH or_det AS( 
SELECT *
FROM "Order"
LEFT JOIN Order_detail
ON 'Order'.id = Order_detail.'order'), 
or_det_di AS ( 
SELECT *, price*quantity as price_full
FROM or_det
LEFT JOIN Dish
ON or_det.dish = Dish.id)
SELECT  id, title as dish_name, description, quantity, price, price_full, 
sum(price_full) OVER(
PARTITION by id
ORDER BY price_full DESC
RANGE UNBOUNDED PRECEDING) as price_per_order
FROM or_det_di
;


-- 2.8. Compare each order cost to the following one and get the difference 
-- between this cost and the total turnover on that dataset.

WITH or_det AS( 
SELECT *
FROM "Order"
LEFT JOIN Order_detail
ON 'Order'.id = Order_detail.'order'), 
or_det_di AS ( 
SELECT *, price*quantity as price_full
FROM or_det
LEFT JOIN Dish
ON or_det.dish = Dish.id),
cost_per_order AS(
SELECT  id,  
sum(price_full) as price_per_order
FROM or_det_di
GROUP BY id), 
cost_to_next AS(
SELECT *, 
lead(price_per_order) OVER()-price_per_order as diff_to_next
FROM cost_per_order)
SELECT *,
sum(price_per_order) OVER() as total_turnover,
sum(price_per_order) OVER()-diff_to_next as diff_to_total
from cost_to_next
;

-- 2.9. Display all the dish ordered in 2021 and how many times the dish was ordered (order by this amount) ?

WITH or_det AS( 
SELECT *
FROM "Order"
LEFT JOIN Order_detail
ON 'Order'.id = Order_detail.'order'), 
or_det_di AS ( 
SELECT *, price*quantity as price_full
FROM or_det
LEFT JOIN Dish
ON or_det.dish = Dish.id)
SELECT title as dish_name, description, quantity, sum(quantity) as no_ordered 
FROM or_det_di
WHERE cast(STRFTIME('%Y', date) as int) =2021
GROUP BY dish_name
ORDER BY no_ordered DESC
;


-- 2.10. What is the average amount spent per order ?

WITH order_det AS ( 
SELECT * 
FROM 'Order'
LEFT JOIN Order_detail
ON 'Order'.id = Order_detail.'order'
),
price_table AS( 
SELECT *, price*quantity as price_full 
FROM order_det
LEFT JOIN Dish
ON order_det.dish = Dish.id
),
price_table_per_order AS(
SELECT id,  sum(price_full) as price_per_order
FROM price_table
Group by id),
CTE AS ( 
SELECT *,
avg(price_per_order) OVER() as average_price_per_order
FROM price_table_per_order)
SELECT *, round(average_price_per_order,1)
from CTE;

-- 2.11. What is the difference between the average amount spent 
-- per order across all users and the average amount spent per order by each individual user?

WITH or_det AS( 
SELECT *
FROM "Order"
LEFT JOIN Order_detail
ON 'Order'.id = Order_detail.'order'), 
or_det_di AS ( 
SELECT *
FROM or_det
LEFT JOIN Dish
ON or_det.dish = Dish.id), 
or_det_di_us AS(
SELECT or_det_di.id, first_name, last_name, title as dish_name, quantity*price as full_price 
FROM or_det_di
LEFT JOIN 'User'
ON or_det_di.'user' = 'User'.id),
table_per_order AS(
SELECT *, sum(full_price) as price_per_order
FROM or_det_di_us
GROUP BY id),
table_per_user AS(
SELECT *, avg(price_per_order) as price_per_user
FROM table_per_order
GROUP BY last_name)
SELECT table_per_user.id, table_per_user.first_name, table_per_user.last_name, price_per_user, 
avg(table_per_user.price_per_order) OVER() AS avg_price_per_order
FROM table_per_user
LEFT JOIN table_per_order
on table_per_user.id = table_per_order.id
;

-- 2.12. What is the total turnover generated ? 
--(get the order total, the running total over the turnover, then the complete turnover)
WITH or_det AS( 
SELECT *
FROM "Order"
LEFT JOIN Order_detail
ON 'Order'.id = Order_detail.'order'), 
or_det_di AS ( 
SELECT *
FROM or_det
LEFT JOIN Dish
ON or_det.dish = Dish.id), 
or_det_di_us AS(
SELECT or_det_di.id, first_name, last_name, title as dish_name, quantity*price as full_price 
FROM or_det_di
LEFT JOIN 'User'
ON or_det_di.'user' = 'User'.id)
SELECT sum(full_price) as total_turnover
FROM or_det_di_us

-- 2.13. What is the percent (2 decimals accepted) of each command regarding the turnover ? (use cte)

WITH or_det AS( 
SELECT *
FROM "Order"
LEFT JOIN Order_detail
ON 'Order'.id = Order_detail.'order'), 
or_det_di AS ( 
SELECT or_det.id, 
sum(price*quantity) as turnover_per_order
FROM or_det
LEFT JOIN Dish
ON or_det.dish = Dish.id
GROUP BY or_det.id), 
table_turnover AS ( 
SELECT *, 
sum(turnover_per_order) OVER() as total_turnover 
FROM or_det_di)
SELECT *,
turnover_per_order/total_turnover*100 as 'share_of_turnover (percentage)'
FROM table_turnover;

-- 2.14. Rank the best orders. (use temporary table)

CREATE TEMPORARY TABLE turnover_table AS 
WITH or_det AS( 
SELECT *
FROM "Order"
LEFT JOIN Order_detail
ON 'Order'.id = Order_detail.'order'), 
or_det_di AS ( 
SELECT or_det.id, 
sum(price*quantity) as turnover_per_order
FROM or_det
LEFT JOIN Dish
ON or_det.dish = Dish.id
GROUP BY or_det.id)
SELECT * 
FROM or_det_di
;

SELECT *
FROM turnover_table
ORDER BY turnover_per_order DESC 
;

--2.15. Display all of the order with the mention “Profitable” 
--if the total of the order is above 35 , “Balanced” if between 34 and 35, or “Not profitable”.

SELECT *, 
CASE 
	WHEN turnover_per_order >35 THEN 'profitable'
	WHEN turnover_per_order > 34 THEN 'Balanced'
	ELSE 'Not profitable'
END AS category
FROM turnover_table
;
