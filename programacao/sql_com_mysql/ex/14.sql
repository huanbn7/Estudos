-- Active: 1677872445893@@localhost@3306@olist

/*
 Crie uma tabela que mostra o tempo entre as vendas dos seller? 
 Considere apenas pedidos entregues.
 */

DROP TABLE IF EXISTS avg_tempo_venda_seller;

CREATE TABLE
    tb_avg_tempo_venda_seller AS (

        WITH tb_seller_data AS (
                SELECT
                    t2.seller_id,
                    DATE(t1.order_approved_at) AS data_venda
                FROM
                    tb_orders AS t1
                    LEFT JOIN tb_order_items AS t2 ON t1.order_id = t2.order_id
                WHERE
                    t1.order_status = 'delivered'
                GROUP BY
                    t2.seller_id,
                    DATE(t1.order_approved_at)
                ORDER BY
                    t2.seller_id,
                    DATE(t1.order_approved_at)
            ),


            tb_seller_lag_data AS (
                SELECT
                    t1.*,
                    LAG(t1.data_venda, 1) OVER(
                        PARTITION BY t1.seller_id
                        ORDER BY t1.data_venda
                    ) AS lag_data_venda
                FROM
                    tb_seller_data AS t1
            ),


            tb_seller_data_diff AS (
                SELECT
                    t1.*,
                    DATEDIFF(
                        t1.data_venda,
                        t1.lag_data_venda
                    ) AS data_diff
                FROM
                    tb_seller_lag_data AS t1
            )


        SELECT
            t1.seller_id,
            ROUND(AVG(data_diff), 2) AS media_dias_para_vender
        FROM tb_seller_data_diff AS t1
        GROUP BY t1.seller_id
    );

SHOW TABLES;