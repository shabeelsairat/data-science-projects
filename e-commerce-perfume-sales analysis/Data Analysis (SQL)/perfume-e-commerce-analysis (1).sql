SELECT
  *
FROM `perfume-e-commerce-analysis.perfume_data.cleaned_perfume_data` 
LIMIT 10;


  SELECT
  SUM(price*sold) revenue,
  SUM(sold) total_sold,
  AVG(price) avg_price,
  COUNT(*) perfume_count
FROM `perfume-e-commerce-analysis.perfume_data.cleaned_perfume_data` 


-- top 10 perfumes brands based on product count
SELECT
  DISTINCT brand,
  COUNT(*) perfume_count
FROM `perfume-e-commerce-analysis.perfume_data.cleaned_perfume_data` 
GROUP BY brand
ORDER BY perfume_count DESC
LIMIT 10;

-- most sold top 10 perfume brands

SELECT
  brand,
  SUM(sold) sum_sold
FROM `perfume-e-commerce-analysis.perfume_data.cleaned_perfume_data` 
GROUP BY brand
ORDER BY sum_sold DESC
LIMIT 10;

-- Most used perfume types

SELECT
  type,
  SUM(sold) sum_sold
FROM `perfume-e-commerce-analysis.perfume_data.cleaned_perfume_data` 
GROUP BY type
ORDER BY sum_sold DESC;
--comment: most used perfume type is EDP

-- Top 10 expensive perfume brands on average
SELECT
  brand,
  AVG(price) avg_price
FROM `perfume-e-commerce-analysis.perfume_data.cleaned_perfume_data` 
GROUP BY brand
ORDER BY avg_price DESC
LIMIT 10;
--comment: Most expensive perfume brand is Creed

-- Top 10 products
SELECT
  title,
  brand,
  SUM(sold) total_sold,
  SUM(price*sold) revenue
FROM `perfume-e-commerce-analysis.perfume_data.cleaned_perfume_data`
GROUP BY title, brand
ORDER BY revenue DESC
LIMIT 10;
--comment: the most sold perfume is escape by calvin klein edp.

-- Top 10 revenue making brands/locations/types CTEs
WITH revenue_data AS (
  SELECT
    brand,
    itemLocation,
    type,
    price,
    sold,
    price*sold AS revenue
  FROM `perfume-e-commerce-analysis.perfume_data.cleaned_perfume_data`
  WHERE price IS NOT NULL 
    AND sold IS NOT NULL
)


-- Top 10 revenue making brands
SELECT
  UPPER(brand) brand,
  SUM(revenue) total_revenue
FROM revenue_data
GROUP BY brand
ORDER BY total_revenue DESC
LIMIT 10;
--commment: Most revenue making brand is CALVIN KLEIN. Now the question is what type of perfume CALVIN KLEIN usually produces?

-- Revenue per location
SELECT
  itemLocation,
  SUM(revenue) total_revenue
FROM revenue_data
GROUP BY itemLocation
ORDER BY total_revenue DESC;
--comment: Most revenue is coming from Hackensack, New Jersey, United States. Now the question is, are people from Hackensack buying EDP or EDT?

-- Revenue by perfume types
SELECT
  type,
  ROUND(SUM(revenue)) AS total_revenue
FROM revenue_data
GROUP BY type
ORDER BY total_revenue DESC;
--comment: The most revenue is coming from EDP.

-- best selling perfume type in most revenue making locations
SELECT
  type,
  ROUND(SUM(revenue)) AS total_revenue
FROM revenue_data
WHERE itemLocation = "Hackensack, New Jersey, United States"
GROUP BY type
ORDER BY total_revenue DESC;
--comment: The most revenue is coming from EDP

-- best selling perfume category by location (revenue based)
WITH revenue_data AS (
  SELECT
    itemLocation,
    type,
    SUM(price*sold) total_revenue
  FROM `perfume-e-commerce-analysis.perfume_data.cleaned_perfume_data`
  WHERE price IS NOT NULL 
    AND sold IS NOT NULL
    AND type IN ('Eau de Parfum', 'Eau de Toilette', 'Cologne')
  GROUP BY itemLocation, type
),

ranked_data AS (
  SELECT
    itemLocation,
    type,
    total_revenue,
    RANK() OVER (PARTITION BY itemLocation ORDER BY total_revenue DESC) AS rank
  FROM revenue_data
)

SELECT
  itemLocation,
  type AS top_perfume_type,
  total_revenue
FROM ranked_data
WHERE rank = 1
ORDER BY total_revenue DESC;
--comment: After knowing the location wise perfume type preferrance, we can make campaings on selling the remaining available perfumes on these locations, based on trend for making the most revenue.

--Revenue Contribution (%)
WITH brand_revenue AS (
  SELECT
    brand,
    SUM(price*sold) revenue
  FROM `perfume-e-commerce-analysis.perfume_data.cleaned_perfume_data`
  WHERE price IS NOT NULL AND sold IS NOT NULL
  GROUP BY brand
)

SELECT
  brand,
  revenue,
  ROUND(100*revenue / SUM(revenue) OVER (), 2) AS revenue_percentage
FROM brand_revenue
ORDER BY revenue DESC
LIMIT 10;
--comment: Top 10 brands contribute 45% of total revenue and
--top 3 brands contribute 21% of total revenue which are Calvin Klein, Versace and Dolce & Gabbana.


--Price vs Sales Relationship
SELECT
  CASE 
    WHEN price < 20 THEN 'Low'
    WHEN price BETWEEN 20 AND 50 THEN 'Medium'
    ELSE 'High'
  END AS price_range,
  COUNT(*) product_count,
  SUM(sold) total_sold,
  SUM(price*sold) total_revenue
FROM `perfume-e-commerce-analysis.perfume_data.cleaned_perfume_data`
WHERE price IS NOT NULL AND sold IS NOT NULL
GROUP BY price_range
ORDER BY total_revenue DESC;
--comment: mid range perfumes drive most revenue

--does availability affect sales?
SELECT
  brand,
  available,
  COUNT(*) product_count,
  SUM(sold) total_sold
FROM `perfume-e-commerce-analysis.perfume_data.cleaned_perfume_data`
GROUP BY brand, available
ORDER BY total_sold DESC;
--comment: some of the perfumes are out of stock but their sold_count is very high. They may still have high demand. restocking them may increase the overall revenue. now gotta find out which ones should be restocked first

-- which locations gets us the most revenue
SELECT
  itemLocation,
  COUNT(*) product_count,
  SUM(sold) total_sold,
  AVG(price) avg_price,
  SUM(price*sold) revenue
FROM `perfume-e-commerce-analysis.perfume_data.cleaned_perfume_data`
GROUP BY itemLocation
ORDER BY revenue DESC
LIMIT 10;



