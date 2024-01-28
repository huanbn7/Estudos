-- Active: 1676335982496@@127.0.0.1@3306@olist

/*
Qual o peso médio dos produtos vendidos 
por seller de cada estado. Considere somente 
o ano de 2017 e os pedidos entregues nesse periodo. 
*/


SELECT  t2.seller_state,
        ROUND( AVG(t3.product_weight_g), 2 ) AS media_peso_g

FROM tb_order_items AS t1

LEFT JOIN tb_sellers AS t2
ON t1.seller_id = t2.seller_id

LEFT JOIN tb_products AS t3
ON t1.product_id = t3.product_id

LEFT JOIN tb_orders AS t4
ON t1.order_id = t4.order_id

WHERE t4.order_approved_at = 2017
AND t4.order_status = 'delivered'

GROUP BY t2.seller_state
ORDER BY seller_state;