-- Active: 1676335982496@@127.0.0.1@3306@olist

/*
O chefe quer saber quantos produtos possuem o volume
maior que 5L.   
*/

SELECT COUNT(*) AS qtd_total

FROM tb_products AS t1
WHERE  (t1.product_length_cm * 
        t1.product_height_cm * 
        t1.product_width_cm) / 1000 > 5;