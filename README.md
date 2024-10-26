# Data-Analytics-Power-BI-Report

## [Installation Guide](#installation-guide)

## The Report

- #### [Executive Summary Page](#executive-summary-page)
- #### [Customer Details Page](#customer-details-page)
- #### [Product Details Page](#product-details-page)
- #### [Stores Map Page](#stores-map-page)

## [SQL Tests](#sql-tests-page)

# Installation Guide

This Power BI report requires four cleaned tables called: 

- **Customers**  
  Columns: `Full Name`, `Date of Birth`, `Company`, `Email`, `Address`, `Country`, `Country Code`, `Telephone`, `Join Date`, `User UUID`.

- **Orders**  
  Columns: `User ID`, `Store Code`, `Product Code`, `Product Quantity`, `Order Date`, `Order Time`, `Shipping Date`, `Shipping Time`.

- **Stores**  
  Columns: `Address`, `Longitude`, `Latitude`, `Town`, `Store Code`, `Staff Numbers`, `Date Opened`, `Store Type`, `Country Code`, `Region`, `Country Region`, `Country`.

- **Products**  
  Columns: `Description`, `Sale Price`, `Weight`, `Category`, `EAN`, `Date Added`, `Product UUID`, `Availability`, `Product Code`, `Cost Price`.

These tables and their columns need to have their datatypes set correctly.

Once they have been imported, create the star schema by linking:

- `Orders(Order Date)` many-to-one `Date(Date)`
- `Orders(Shipping Date)` many-to-one `Date(Date)`
- `Orders(Product Code)` many-to-one `Products(Product Code)`
- `Orders(Store Code)` many-to-one `Stores(Store Code)`
- `Orders(User ID)` many-to-one `Customers(User UUID)`

## The Report

I created four report pages within Power BI:

### Executive Summary Page

<p>
    <img src="Github Images\Executive Summary View.png" width="1000" height="500" />
</p>

This report page provides a quick overview of the company’s performance through KPIs, display cards, donut graphs, and a revenue trend over the years. 

There is a table displaying the top 10 items by revenue, along with each item’s category, customer count, and order count. The donut chart offers a quick view of the best-performing countries and store types.

### Customer Details Page

<p>
    <img src="Github Images\Customer Detail View.png" width="1000" height="500" />
</p>

In this report page, I created two card visuals showing `Unique Customers` and `Revenue per Customer` (£). 

The page shows detailed customer data, including their region, preferred product categories, and revenue trends. There’s also a date slicer to filter the year shown on the report.

### Product Details Page

<p>
    <img src="Github Images\Product Detail View.png" width="1000" height="500" />
</p>

<p>
    <img src="Github Images\Product Detail Slicer View.png" width="1000" height="500" />
</p>

This report page includes three main KPIs showing target revenue, profit, and total orders for the current quarter (with a goal of 10% increase). Next to this, two displays show the current filters applied.

This page helps identify products with high revenue potential that are underperforming, as well as popular items with low profit, offering insight into potential areas for advertisement or price increases.

<p>
    <img src="Github Images\Product Slicer filters.png" width="300" height="500" />
</p>

The bottom half includes:

- An area chart showing total revenue over the years.
- A scatter chart depicting profit per item against popularity.
- A grid listing metrics for the top 10 best-selling items.

### Stores Map Page

<p>
    <img src="Github Images\Stores Map View.png" width="1000" height="500" />
</p>

Designed for regional managers, this page provides a quick overview of their local store's performance. I used the map visual with geographical hierarchy, using `Profit YTD` for bubble size. A country slicer allows for country-specific views.

There’s also a custom tooltip page with gauges for profit and revenue YTD, each with a 20% target increase from the previous year. 

<p>
    <img src="Github Images\Tooltip page.png" width="700" height="350" />
</p>

Hovering over a country shows specific metrics.

<p>
    <img src="Github Images\page information format.png" width="100" height="350"/>
</p>

Resulting in the following display:

<p>
    <img src="Github Images\Stores Map tooltip.png" width="1000" height="500"/>
</p>

### Navigation Bar

To enhance user-friendliness, I added a navigation bar allowing users to switch pages based on their needs. These are simple buttons with `on hover` settings for a visual effect.

<p>
    <img src="Github Images\Navigation bar.png" width="40" height="500"/>
</p>

## SQL Tests Page

Finally, I used VS Code to run SQL queries to a remote server with a database copy.

**Questions:**

1. How many staff are there in all UK stores?
2. Which month in 2022 had the highest revenue?
3. Which German store type had the highest revenue for 2022?
4. Create a view with store types as rows and total sales, percentage of total sales, and count of orders as columns.
5. Which product category generated the most profit in the "Wiltshire, UK" region in 2021?

**Database Queries:**

<p>
      <img src="Github Images\question 1.png" width="400" height="50"/>
  </p>
- **Query 1**: Basic `SELECT` to get the column, and `WHERE` filter to the UK.

<p>
      <img src="Github Images\question 2.png" width="700" height="350"/>
  </p>
- **Query 2**: Using `CASE` to convert months (1-12) to names, `GROUP BY` to aggregate revenue by month, and `WHERE` filter for 2022.

<p>
      <img src="Github Images\question 3.png" width="700" height="250"/>
  </p>

<p>
      <img src="Github Images\question 4.png" width="700" height="350"/>
  </p>

<p>
      <img src="Github Images\question 5.png" width="700" height="350"/>
  </p>

<p>
    <img src="Github Images\Year Hierarchy.png" width="265" height="211" />
</p>
