-- Active: 1676335982496@@127.0.0.1@3306@olist

/*
O chefe que saber quantas categorias de produtos (unicas) 
temos cadastro na base de dados.
*/ 

SELECT  COUNT(DISTINCT t1.product_category_name) AS qtd_categorias_unicas,
        COUNT(*) AS qtd_registros,
        COUNT(t1.product_id) AS qtd_produtos,
        COUNT(DISTINCT t1.product_id) AS qtd_prod_unicos

FROM tb_products AS t1;