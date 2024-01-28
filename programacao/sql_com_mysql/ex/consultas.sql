-- Active: 1685812643415@@localhost@3306@olist

SHOW TABLES;

SELECT t1.`Name`,
       t2.`Name` 
FROM country AS t1
    LEFT JOIN city AS t2 ON t1.`Code` = t2.`CountryCode`

ORDER BY t1.`Name`, t2.`Name`;



SELECT * FROM tb_order_items;