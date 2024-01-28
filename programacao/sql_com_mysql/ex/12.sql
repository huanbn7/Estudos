-- Active: 1676335982496@@127.0.0.1@3306@olist



/* O quanto (R$) cada seller vendeu em produtos da (s) categoria (s) mais vendida*/

WITH tb_cat_mais_vendida AS (SELECT t2.product_category_name AS categoria

                             FROM tb_order_items AS t1
                             
                             LEFT JOIN tb_products AS t2
                             ON t1.product_id = t2.product_id
                             
                             GROUP BY t2.product_category_name
                             ORDER BY COUNT(t1.product_id) DESC
                             LIMIT 3),



     tb_misera AS (SELECT t1.seller_id,
                          t2.order_id,
                          t3.order_status,
                          t2.product_id,
                          t4.product_category_name,
                          t2.price
 
                   FROM  tb_sellers AS t1
         
                   LEFT JOIN tb_order_items AS t2
                   ON t1.seller_id = t2.seller_id
         
                   LEFT JOIN tb_orders AS t3
                   ON t2.order_id = t3.order_id
         
                   LEFT JOIN tb_products AS t4
                   ON t2.product_id = t4.product_id)



SELECT t1.seller_id,
       ROUND( SUM( CASE 
                       WHEN t1.order_status = 'delivered' 
                       AND t1.product_category_name IN (t2.categoria) THEN t1.price 
                       ELSE 0
                   END 
                 ), 2 ) AS price_filtrado 

FROM tb_misera AS t1

LEFT JOIN tb_cat_mais_vendida AS t2
ON t1.product_category_name = t2.categoria

GROUP BY t1.seller_id;