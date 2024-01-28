/*
Converter o volume calculado no ex passado 
de cm³ para m³.   
*/

SELECT (t1.product_length_cm * 
        t1.product_height_cm * 
        t1.product_width_cm) / 1000000 AS vol_produto_m3

FROM tb_products AS t1;   


