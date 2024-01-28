-- Active: 1676335982496@@127.0.0.1@3306@olist

/*
Faça uma query que apresente o tamanho médio, máximo 
e mínimo da descrição do objeto por categoria
*/

SELECT  product_category_name,
        AVG(product_description_lenght) AS media,
        MAX(product_description_lenght) AS max,
        MIN(product_description_lenght) AS min


FROM tb_products
GROUP BY product_category_name;