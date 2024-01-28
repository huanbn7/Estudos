-- Active: 1676335982496@@127.0.0.1@3306@olist

/*
Para cada seller, qual o produto gerou mais receita?
Considere apenas pedidos entregues.
*/


WITH tb_seller_products AS (SELECT t1.seller_id, 
                                   t1.product_id,
                                   COUNT(t1.product_id) AS qtd_prod_vendidos, 
                                   SUM(t1.price) AS receita_por_prod,
                                   
                                   ROW_NUMBER() OVER( PARTITION BY t1.seller_id 
                                                      ORDER BY SUM(t1.price) DESC, 
                                                      COUNT(t1.product_id) DESC) AS flag_best_prod
 
                            FROM tb_order_items AS t1

                            LEFT JOIN tb_orders AS t2
                            ON t1.order_id = t2.order_id
                            
                            WHERE t2.order_status = 'delivered'

                            GROUP BY t1.seller_id, t1.product_id)
                      
                      
SELECT * 

FROM tb_seller_products
WHERE flag_best_prod = 1;