/*Task 1
Last year (2022) there was a bug in the product system. For some products that were added in that year, 
the year_added value was not set in the data. As the year the product was added may have an impact on the price of the product, 
this is important information to have.

Write a query to determine how many products have the year_added value missing. Your output should be a single column, 
missing_year, with a single row giving the number of missing values.*/

SELECT COUNT(*) AS missing_year
FROM products
WHERE year_added IS NULL;

/* Result
index	missing_year
0	170 */