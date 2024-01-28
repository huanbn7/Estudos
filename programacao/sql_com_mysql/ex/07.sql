-- Active: 1676335982496@@127.0.0.1@3306@olist

/*
Faça uma query que apresente o tamanho médio, máximo 
e mínimo do nome do objeto por categoria. Considere 
apenas os objetos que tenham a descrição maior que 50.
*/


SELECT  product_category_name,
        ROUND( AVG(product_name_lenght), 2 ) media_length_nome,
        MAX(product_name_lenght) max_length_nome,
        MIN(product_name_lenght) min_length_nome

FROM tb_products
WHERE product_description_lenght > 50
GROUP BY product_category_name
ORDER BY product_category_name;