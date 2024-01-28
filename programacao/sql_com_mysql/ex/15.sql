-- Active: 1677872445893@@localhost@3306@olist

/*
Quais sellers estão a mais de 90 dias sem vender? 
Quais sellers possuem a quantidade de dias sem vender maior que
a quantidade media de dias que ele leva para vender?
*/


WITH tb_dias_ultm_venda AS (SELECT  t1.seller_id,
                                    DATE( MAX( t2.order_approved_at ) ) AS dt_ultima_venda,
                                    DATEDIFF( 
                                       DATE('2018-07-01'), 
                                       DATE( MAX( t2.order_approved_at ) ) ) AS qtd_dias_sem_vender


                            FROM tb_order_items AS t1

                            LEFT JOIN tb_orders AS t2
                            ON t1.order_id = t2.order_id

                            WHERE t2.order_approved_at <= '2018-07-01'
                            AND t2.order_status = 'delivered'

                            GROUP BY t1.seller_id),
                         
                         

     tb_flags AS (SELECT  t1.*,
                          t2.media_dias_para_vender,
                          
                          CASE 
                              WHEN qtd_dias_sem_vender > media_dias_para_vender THEN 1   
                              ELSE 0 
                          END AS flag_avg_tempo,
                   
                          CASE 
                              WHEN qtd_dias_sem_vender > 90 THEN 1 
                              ELSE 0
                          END AS flag_90_dias
                   


                  FROM tb_dias_ultm_venda AS t1

                  LEFT JOIN avg_tempo_venda_seller AS t2
                  ON t1.seller_id = t2.seller_id)



SELECT t1.seller_id,
       t1.dt_ultima_venda

FROM tb_flags AS t1

WHERE flag_avg_tempo = 1
OR flag_90_dias = 1;


SELECT  t1.flag_avg_tempo,
        t1.flag_90_dias,
        COUNT(*)

FROM tb_flags AS t1

GROUP BY t1.flag_avg_tempo, t1.flag_90_dias
ORDER BY t1.flag_avg_tempo; 