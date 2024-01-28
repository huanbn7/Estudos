-- Active: 1676335982496@@127.0.0.1@3306@olist

/*
Faça uma query que apresente o tamanho médio, máximo e 
mínimo do nome do objeto por categoria.
*/

SELECT  product_category_name,
        AVG(product_name_lenght) media_length_nome,
        MAX(product_name_lenght) max_length_nome,
        MIN(product_name_lenght) min_length_nome

FROM tb_products
GROUP BY product_category_name;
