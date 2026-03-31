CREATE TABLE CUSTOMER(
	CustomerID	INT PRIMARY KEY,
	Gender VARCHAR(10),
	Age int,
	Annual_Income INT,	
	Spending_Score  INT

)
select*from customer

-- 1. Total Customers
	select count(*) as total_customer
	from customer

-- 2. Total customers according to Gender Distribution
	select gender,count(*) as total_customer
	from customer
	group by gender
	
-- 3. Average Age, Income, Spending Score of the customers
	select round(avg(age),2) as average_age,round(avg(annual_income),2) as average_income,round(avg(spending_score),2) as average_spending
	from customer
	
-- 4. Minimum and Maximum age and income of customers
	select min(age) as minimum_age,max(age) as maximum_age,min(annual_income) as minimum_income,max(annual_income) as maximum_income
	from customer
	
-- 5. Group customer by their ages
	select 
		case
			when age<=25 then 'Young'
			when age between 26 and 40 then 'Adult'
			else 'Senior'
		end as age_group,count(*)
		from customer
		group by age_group
		
-- 6. Total customer on the basis of their Income Tiers
		select
			case
				when annual_income<=40 then 'Low'
				when annual_income<=70 then 'Medium'
				else 'High'
			end as income_tiers,count(*)
			from customer
			group by income_tiers
-- 7. Customer Segments according to their spends
	select 
		case
			when annual_income>=70 and spending_score>=70 then 'VIP'
			when annual_income>=70 and spending_score<70  then  'Cautious'
			when annual_income<70  and spending_score>=70 then 'Bargain Hunter'
			else 'Occasional Buyer'
		end as segment,count(*)
		from customer
		group by segment
		
-- 8. Average Spending by Gender
	select gender,round(avg(spending_score),2) as avg_spend
	from customer
	group by gender
	
-- 10. Top 5 Customers by Spending Score
	select customerid,annual_income,spending_score
	from customer
	order by spending_score desc
	limit 5