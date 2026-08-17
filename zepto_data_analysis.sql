drop table if exists zepto;

create table zepto(
sku_id SERIAL primary key,
category varchar(120),
name varchar(150) not null,
mrp Numeric(8,2),
discountPercent Numeric(5,2),
availableQuantity INTEGER,
discountedSellingPrice Numeric(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);
select * from zepto;

--data exploration
select count(*) from zepto;

--sample data
select * from zepto 
limit 10;

--null values
select * from zepto 
where name is null
or
category is null 
or 
mrp is null
or 
discountpercent is null 
or 
availablequantity is null 
or 
discountedsellingprice is null 
or
weightingms is null 
or 
outofstock is null 
or 
quantity is null;

--different product categories
select distinct category 
from zepto 
order by category;

--products in stock vs out of stock
select outofstock, count(sku_id)
from zepto 
group by outofstock;

--product names present multiple times
select name, count(sku_id) as "Number of SKUs"
from zepto 
group by name
having count(sku_id) > 1
order by count(sku_id) desc;

--data cleaning

--products with price = 0
select * from zepto 
where mrp = 0 or discountedsellingprice = 0;

delete from zepto 
where mrp = 0;

--convert paise to rupees
update zepto 
set mrp = mrp/100.0,
discountedsellingprice = discountedsellingprice/100.0;

select mrp, discountedsellingprice from zepto

select * from zepto;

-- Q1. find the top 10 best-value products based on the discount percentage.
SELECT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;



--Q2. What are the product with High MRP but Out of stock
select distinct name, mrp
from zepto 
where outofstock = true and mrp > 300
order by mrp desc

--Q3. Calculated Estimated Revenue for each category
select category, sum(discountedsellingprice * availablequantity) as total_revenue
from zepto 
group by category
order by total_revenue desc;

--Q4. Find all products where MRP is greater than rs.500 and discount is less than 10%.
select distinct name, mrp, discountpercent
from zepto 
where mrp > 500 and discountpercent < 10;

--Q5. Identify the top 5 categories offering the highest average dicount percentage.
select category, round(avg(discountpercent),2) as average_discount_percent
from zepto 
group by category
order by average_discount_percent desc
limit 5;

--Q6. Find the price per gram for products above 100g and sort by best value.
select distinct name, weightingms, discountedsellingprice,
round(discountedsellingprice/weightingms,2) as price_per_gram
from zepto 
where weightingms >= 100
order by price_per_gram;

--Q7. Group the products into categories like Low, Medium, Bulk
select distinct name, weightingms,
case when weightingms < 1000 then 'Low' 
	when weightingms < 5000 then 'Medium' 
	else 'Bulk'
	end as weight_category
from zepto;

--Q8.What is the total inventory weight per category
select category,
sum(weightingms * availablequantity) as total_weight
from Zepto 
group by category 
order by total_weight;







