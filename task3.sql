/*Task 3
To find out how the range varies for each product type, your manager has asked you to determine the minimum and maximum values for each product type.

Write a query to return the product_type, min_price and max_price columns. */
SELECT product_type, 
MIN(price) AS min_price, 
MAX(price) AS max_price
FROM products
GROUP BY product_type;

/* Result
index	product_type	min_price	max_price
0	Snacks	5.2	10.72
1	Produce	3.46	8.78
2	Dairy	8.33	13.97
3	Bakery	6.26	11.88
4	Meat	11.48	16.98
/*