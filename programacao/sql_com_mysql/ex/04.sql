/*
Quantos produtos da categoria "beleza_saude" possuem o volume menor que 1L.   
*/

SELECT  COUNT(*) AS qtd_total

FROM tb_products AS t1
WHERE product_category_name = 'beleza_saude'
AND (t1.product_length_cm * 
     t1.product_height_cm * 
     t1.product_width_cm) / 1000 < 1;
