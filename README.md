# Data-Analytics-Power-BI-Report

## [Installation](#Installation Guide)

## The Report

##### [Executive Summary](#Executive Summary Page)
##### [Customer Details](#Customer Details Page) 
##### [Product Details](#Product Details Page)
##### [Stores Map](#Stores Map Page)

## [SQL Tests](#SQL Tests)

# Installation Guide

This Power BI report requires 4 cleaned tables called: 

- Customers 

  with columns ```Full Name```,  ```Date of Birth```, ```Company```, ```Email```, ```Address```, ```Country```, ```Country Code```, ```Telephone```, ```Join Date```, ```User UUID```. 

- Orders

  with columns ```User ID```, ```Store Code```, ```Product Code```, ```Product Quantity```, ```Order Date```, ```Order Time```,```Shipping Date```, ```Shipping Time```.

- Stores

  with columns ```Address```, ```Longitude```, ```Latitude```, ```Town```, ```Store Code```, ```Staff Numbers```, ```Date Opened```, ```Store Type```, ```Country Code```, ```Region```, ```Country Region```, ```Country```.

- Products

  with columns ```Description```, ```Sale Price```, ```Weight```, ```Category```, ```EAN```, ```Date Added```, ```Product UUID```, ```Availability```, ```Product Code```, ```Cost Price```

These tables and their columns need to have their datatype set correctly.

Once they have been imported, create the star schema by linking:

- Orders(Order Date) many to one Date(Date)
- Orders(Shipping Date) many to one Date(Date)
- Orders(Product Code) many to one Products(Product Code)
- Orders(Store Code) many to one Stores(Store Code)
- Orders(User ID) many to one Customers(User UUID)


## The Report

I created 4 report pages within PBI:



### Executive Summary Page

<p>
    <img src="Github Images\Executive Summary View.png" width="1000" height="500" />
</p>


This report page gives a very quick overview on how the company is doing, through useful key performance indicators (KPIs), display cards, donut graphs and a revenue trend over the years.

There is a table that displays the top 10 Items selling, ranked by revenue it has made. The table also gives details on its category, amount of customers buying it, and amount of orders has been placed for it.

Here we can use the donut chart to get a quick view on which countries and store type is doing the best.


### Customer Details Page

<p>
    <img src="Github Images\Customer Detail View.png" width="1000" height="500" />
</p>

Within this report page, I created 2 Card visuals, showing amount of ```Unique Customers``` and ```Revenue per Customer``` in £. 

Here we can see specific details about customers, where they come from, what product category they purchase from and average revenue per customer. We can also see a trend of amount of customers over the years, and a future forecast for the next 10 years.

You can use this page to see which category most people are interested in, which month or quarter people shop the least in, where most of the customers are based in, and also specific data about the top paying customer.

Finally, I created a date slicer to help the user filter the year shown on the report page.



### Product Details Page

<p>
    <img src="Github Images\Product Detail View.png" width="1000" height="500" />
</p>

<p>
    <img src="Github Images\Product Detail Slicer View.png" width="1000" height="500" />
</p>


In this report page, there are 3 main KPIs for the current quarter showing target revenue, profit and total orders, where the goal is a 10% increase from the previous quarter. Next to this, there is two displays showing the current filters applied to the page. 

This page can be used to see which products *can* make alot of money but aren't (depicted by the dots closer to the bottom right). We can also see which items are extremely popular, but aren't making much profit. Both these categories can be used to see where advertisement, or price increase can be used to increase total revenue.

<p>
    <img src="Github Images\Product Slicer filters.png" width="300" height="500" />
</p>

On the bottom half on the report page, I placed:

- An area chart to show off total revenue over years
- A scatter chart to show profit per item vs how popular an item is 
- A grid to show the user metrics about the top 10 best selling items 



### Stores Map Page

<p>
    <img src="Github Images\Stores Map View.png" width="1000" height="500" />
</p>

This page is designed for regional managers so they can get a quick overview on their local stone. I used the map visual, and the geographical hierarchy I created earlier. I then used the ```Profit YTD``` for the bubble size. On the very top I created a country slicer to specify a country.

I then created a custom tooltips page that gave specific information about how a country is doing.  I created 2 gauges, one for profit ytd, and revenue ytd, where their targets were a 20% increase from the previous year. 

<p>
    <img src="Github Images\Tooltip page.png" width="700" height="350" />
</p>

I set this page as a tooltip page, which means when I hover over a specific  country, it will show specific metrics on them.

<p>
    <img src="Github Images\page information format.png" width="100" height="350"/>
</p>

which turns out like this: 

<p>
    <img src="Github Images\Stores Map tooltip.png" width="1000" height="500"/>
</p>
 

### Navigation bar

To enhance user friendliness, I create a navigation bar to allow the user to easily change between pages based on their needs. These are just simple buttons that change the activate page. I also used the ```on hover``` settings to change how the button looks when the mouse cursor is above the button.

<p>
    <img src="Github Images\Navigation bar.png" width="40" height="500"/>
</p>
### SQL Tests Page

Finally, I used VScode to run SQL queries to a remote server with a copy of the database.

Questions:

- How many staff are there in all of the UK stores?
- Which month in 2022 has had the highest revenue?
- Which German store type had the highest revenue for 2022?
- Create a view where the rows are the store types and the columns are the total sales, percentage of total sales and the count of orders
- Which product category generated the most profit for the "Wiltshire, UK" region in 2021?



Overview on how I queried the Database:

- <p>
      <img src="Github Images\question 1.png" width="400" height="50"/>
  </p>

  I used a basic ```SELECT``` to get the column, and the ```WHERE``` to filter to the UK

- <p>
      <img src="Github Images\question 2.png" width="700" height="350"/>
  </p>

  Here I used a ```CASE``` keyword to change the month from 1-12 to its respective month name. I then ```GROUP BY``` month so the revenue is aggregated by each month. Finally, I use ```WHERE``` to filter by 2022

- <p>
      <img src="Github Images\question 3.png" width="700" height="250"/>
  </p>

- 

- <p>
      <img src="Github Images\question 4.png" width="700" height="350"/>
  </p>
  
  

  <p>
      <img src="Github Images\question 5.png" width="700" height="350"/>
  </p>
  








<p>
    <img src="Github Images\Year Hierarchy.png" width="265" height="211" />
</p>