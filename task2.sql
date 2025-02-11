/*Task 2
Given what you know about the year added data, you need to make sure all of the data is clean before you start your analysis.
 The table below shows what the data should look like.

Write a query to ensure the product data matches the description provided. Do not update the original table.

Column Name	Criteria
product_id	Nominal. The unique identifier of the product.
Missing values are not possible due to the database structure.
product_type	Nominal. The product category type of the product, one of 5 values (Produce, Meat, Dairy, Bakery, Snacks).
Missing values should be replaced with “Unknown”.
brand	Nominal. The brand of the product. One of 7 possible values.
Missing values should be replaced with “Unknown”.
weight	Continuous. The weight of the product in grams. This can be any positive value, rounded to 2 decimal places.
Missing values should be replaced with the overall median weight.
price	Continuous. The price the product is sold at, in US dollars. This can be any positive value, rounded to 2 decimal places.
Missing values should be replaced with the overall median price.
average_units_sold	Discrete. The average number of units sold each month. This can be any positive integer value.
Missing values should be replaced with 0.
year_added	Nominal. The year the product was first added to FoodYum stock.
Missing values should be replaced with last year (2022).
stock_location	Nominal. The location that stock originates. This can be one of four warehouse locations, A, B, C or D
Missing values should be replaced with “Unknown”.   */

SELECT
  product_id,
 COALESCE(CASE WHEN product_type IN ('-', 'missing') THEN 'Unknown' ELSE product_type END, 'Unknown') AS product_type,
  COALESCE(CASE WHEN brand IN ('-', 'missing') THEN 'Unknown' ELSE brand END, 'Unknown') AS brand,
  CASE 
    WHEN weight IS NULL THEN ROUND((SELECT AVG(CAST(REPLACE(weight, 'grams', '') AS FLOAT)) FROM products)::numeric, 2)
    ELSE ROUND(CAST(REPLACE(weight, 'grams', '') AS FLOAT)::numeric, 2)
  END AS weight,
  CASE 
    WHEN price IS NULL THEN ROUND((SELECT AVG(price) FROM products)::numeric, 2)
    ELSE ROUND(price::numeric, 2) 
  END AS price,
  COALESCE(average_units_sold, 0) AS average_units_sold,
  COALESCE(year_added, 2022) AS year_added,
  UPPER(stock_location) AS stock_location
FROM
  products;

/* Result
index	product_id	product_type	brand	weight	price	average_units_sold	year_added	stock_location
0	1	Bakery	TopBrand	602.61	11	15	2022	C
1	2	Produce	SilverLake	478.26	8.08	22	2022	C
2	3	Produce	TastyTreat	532.38	6.16	21	2018	B
3	4	Bakery	StandardYums	453.43	7.26	21	2021	D
4	5	Produce	GoldTree	588.63	7.88	21	2020	A
5	6	Meat	TopBrand	612.06	16.2	24	2017	A
6	7	Produce	GoldTree	320.49	8.01	21	2019	B
7	8	Meat	SilverLake	535.19	15.77	28	2021	A
8	9	Meat	StandardYums	375.07	11.57	30	2020	A
9	10	Meat	TastyTreat	506.34	13.94	27	2018	C
10	11	Dairy	StandardYums	345.07	9.26	26	2020	B
11	12	Bakery	StandardYums	345.58	6.87	21	2022	D
12	13	Snacks	SmoothTaste	512.54	8.65	19	2016	A
13	14	Meat	StandardYums	395.76	11.92	30	2019	A
14	15	Produce	SilverLake	324.92	7.94	23	2021	D
15	16	Dairy	SmoothTaste	446.76	10.79	23	2017	D */
