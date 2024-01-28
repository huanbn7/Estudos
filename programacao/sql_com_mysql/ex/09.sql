-- Active: 1676335982496@@127.0.0.1@3306@olist

/*
Qual o valor de receita gerada por consumidores de cada estado? 
Considere a base completa, com apenas pedidos entregues.
*/


WITH tabela AS (SELECT order_id, 
                        order_status,
                        customer_id 
    
                FROM tb_orders
                WHERE order_status = 'delivered') 


SELECT t1.customer_state,
       t1.customer_unique_id,
       SUM(t3.price) AS receita_cliente_estado

FROM tb_customers AS t1

LEFT JOIN tabela AS t2
ON t1.customer_id = t2.customer_id

LEFT JOIN tb_order_items AS t3
ON t2.order_id = t3.order_id

GROUP BY t1.customer_state, t1.customer_unique_id
ORDER BY t1.customer_state, SUM(t3.price);