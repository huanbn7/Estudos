-- Active: 1677872445893@@localhost@3306@olist


/*
Qual o valor total de receita gereda por sellers de cada estado?
Considere a base completa, com apenas pedidos entegue.
*/ 


SELECT  t1.seller_state,
        t1.seller_id,
        ROUND( SUM( CASE 
                        WHEN t3.order_status = 'delivered' THEN  t2.price
                        ELSE 0
                    END ), 2 ) AS receita


FROM tb_sellers AS t1

LEFT JOIN tb_order_items AS t2
ON t1.seller_id = t2.seller_id

LEFT JOIN tb_orders AS t3
ON t2.order_id = t3.order_id

GROUP BY t1.seller_state, t1.seller_id
ORDER BY t1.seller_state, receita;