

/*
Faça uma query que apresente o tamanho médio, máximo e 
mínimo do nome do objeto por categoria. Considere apenas 
os objetos que tenham a descrição maior que 50. 
Exiba apenas as categorias com tamanho médio de descrição 
do objeto maior que 100 caracteres.
*/


SELECT  product_category_name,
        ROUND( AVG(product_name_lenght), 2 ) AS media_length_nome,
        MAX(product_name_lenght) AS max_length_nome,
        MIN(product_name_lenght) AS min_length_nome,
        AVG(product_description_lenght) AS media_descricao

FROM tb_products
WHERE product_description_lenght > 50
GROUP BY product_category_name
HAVING media_descricao > 100;