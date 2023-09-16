# Write a query to get the sum of impressions by day.

SELECT DAY(date) as day, SUM(impressions) as total_impressions
FROM marketing_performance
GROUP BY DAY(date);

# Write a query to get the top three revenue-generating states in order of best to worst. How much revenue did the third best state generate?

SELECT state, SUM(revenue) as total_revenue
FROM website_revenue
GROUP BY state
ORDER BY  total_revenue DESC
LIMIT 3;

Based on the “website_revenue” excel I can make some calculations. I downloaded the “website_revenue” excel then created a Pivot Table to
so see the total revenue of each state then I sorted the revenues from highest to lowest so the revenue of the third best state which is Ohio (OH) is $37,577. The first state 
was New York followed by Georgia

# Write a query that shows total cost, impressions, clicks, and revenue of each campaign. Make sure to include the campaign name in the output.
  
SELECT c.name as Campaign_Name, SUM(m.cost) as total_cost, SUM(m.impressions) as total_impressions, SUM(m.clicks) as total_clicks, SUM(w.revenue) as total_revenue
FROM marketing_performance  m
INNER JOIN website_revenue w
	ON m.campaign_id = w.campaign_id
INNER JOIN campaign_info c
	ON c.id = w.campaign_id
GROUP BY Campaign_Name;

# Write a query to get the number of conversions of Campaign5 by state. Which state generated the most conversions for this campaign?
  
SELECT w.state as state, SUM(m.conversions) as number_conversions
FROM marketing_performance m
INNER JOIN website_revenue w
	ON m.campaign_id = w.campaign_id
INNER JOIN campaign_info c
	ON c.id = w.campaign_id
WHERE c.name LIKE ‘%Campaign5%’
GROUP BY state
ORDER BY number_conversions DESC;

The state that generated the most conversion for this campaign was Georgia (GA).I did this by downloading the “website_revenue” excel 
then creating a pivot table to show the total revenue per state for the “Campaign5”. I found the ID for “Campaign5” by going to the 
“campaign_info” excel and finding the ID for that specific campaign.


# In your opinion, which campaign was the most efficient, and why?
Based on the pivot tables I created from the excel, Campaign3 generated the most profit, but also generated the most cost. 
However, when I subtract the profit minus the cost, Campaign5 seems to generate the most total profit. So Campaign5 seems to be the most efficient. 


# Bonus Question
# Write a query that showcases the best day of the week (e.g., Sunday, Monday, Tuesday, etc.) to run ads.

SELECT DAYNAME(date) as day, (SUM(w.revenue) - SUM(m.cost)) as profit
FROM marketing_performance m
INNER JOIN website_revenue w
	ON m.campaign_id = w.campaign_id
GROUP BY DAYNAME(date)
ORDER BY profit DESC;

The purpose of the query is to display each day of the week and display the total profit which is revenue minus cost. The purpose
is to see which day of the week generated the most profit. 










  
