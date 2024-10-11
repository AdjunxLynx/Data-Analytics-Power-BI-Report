# Data-Analytics-Power-BI-Report

## Extracting and creating the database
 The Report file extracts data from:
- .csv files
- Folders containing .csv files
- An online SQL database
- An Azure Blob Storage server

It then cleans the data, removing redundant columns and duplicate keys. It then Changes the data type of each column to their correct one, ensuring compatibility and efficiency.

Using Power BIs' built in ```Calendar``` function, I created a date table ranging from the first date in ```Orders[Order Date]``` to the most recent date in ```Orders[Shipping Date]```. Then I used a variety of useful functions to create columns about the date range, such as ```STARTOF(YEAR/QUARTER/MONTH)```.

I then create the relationships between each ```dimension``` table and the ```fact``` table to create a ```Star Schema```. There are two relationships between ```Date``` and ```Orders```, one from ```Orders[Order Date]```, and another from ```Orders[Shipping Date]```. The default relationship is currently ```Order Date```, however later on it will be useful to create filters using the ```Shipping Date``` instead.

<p>
    <img src="Github Images\Model View.png" width="1243" height="680" />
</p>


## Creating measures and hierarchies

I used these DAX formulas to create useful measures and calculated columns: 



<p>
    <img src="Github Images\Total Customers Dax.png" width="613" height="42" />
</p>
<p>
    <img src="Github Images\Total Profit Dax.png" width="1215" height="40" />
</p>

<p>
    <img src="Github Images\Total Revenue Dax.png" width="889" height="43" />
</p>



And for later use, I created two Hierarchies to help visualise and drill down into the data a bit more

<p>
    <img src="Github Images\Geographical Hierarchy.png" width="264" height="144" />
</p>

<p>
    <img src="Github Images\Year Hierarchy.png" width="265" height="211" />
</p>
## The Report

I created 4 report pages within PBI:

- [Executive Summary](# Executive Summary)
- [Customer Details](# Customer Details) 
- [Product Details](# Product Details)
- [Stores Map](# Stores Map)

### Executive Summary 

<p>
    <img src="Github Images\Executive Summary View.png" width="1000" height="500" />
</p>


This report page gives a very quick overview on how the company is doing, through useful key performance indicators (KPIs), display cards, donut graphs and a revenue trend over the years.

To create the KPIs, I created 3 new measures:

<p>
    <img src="Github Images\Quarter Revenue.png" width="1000" height="20" />
</p>


<p>
    <img src="Github Images\Quarter Profit.png" width="1000" height="20" />
</p>

<p>
    <img src="Github Images\Quarter Orders.png" width="1000" height="20" />
</p>
I also created target measures which aimed to be 5% (1.05 times) greater than the original measure.



There is a table that displays the top 10 Items selling, ranked by revenue it has made. The table also gives details on its category, amount of customers buying it, and amount of orders has been placed for it.




### Customer Details

<p>
    <img src="Github Images\Customer Detail View.png" width="1000" height="500" />
</p>

Within this report page, I created 2 Card visuals, showing amount of ```Unique Customers``` and ```Revenue per Customer``` in £. 

Using the date hierarchy I created earlier, I created a line graph with a line of best fit and forecast prediction 10 years ahead with a confidence level of 95%. The date hierarchy meant the user would be able to drill down into the data and see into smaller date ranges.

I then created two displays representing total customers by country and product category bought.

I wanted to create a section on the top 20 Customers by creating a grid with ```Full Name```, ```Total Orders``` measure and ```Total Revenue``` measure, then applying a Top N filter on the ```Total Revenue``` column. 3 new measures were also created to show the top customer by revenue.

<p>
    <img src="Github Images\Top Customer Name.png" width="1000" height="20" />
</p>

<p>
    <img src="Github Images\Top CUstomer Revenue.png" width="1000" height="20" />
</p>

<p>
    <img src="Github Images\Top Customer Orders.png" width="1000" height="20" />
</p>

These DAX codes create a temp table from the ```Customers``` Table, grouping the rows by ```Full Name```. It then sorts the table by ```Total Revenue``` descending, then ```Full Name``` by ascending, and gets the top ```N``` values where ```n``` in this case is 1. Finally, it returns the ```Full Name```, ```Total Revenue``` or ```Total Orders```based on the measure. 

Finally, I created a date slicer to help the user filter the year shown on the report page.



### Product Details

<p>
    <img src="Github Images\Product Detail View.png" width="1000" height="500" />
</p>

<p>
    <img src="Github Images\Product Detail Slicer View.png" width="1000" height="500" />
</p>



In this report page, there are 3 main KPIs for the current quarter showing target revenue, profit and total orders, where the goal is a 10% increase from the previous quarter. Next to this, there is two displays showing the current filters applied to the page. I used the following DAX code to create a measure for a card that shows the current filter applied.

<p>
    <img src="Github Images\Selection view DAX.png" width="889" height="43" />
</p>

With this display, we need a way to apply the filters, so I created a filter button to display Slicers for the user to interact with. I created a group that showed the slicers, placed directly ontop of the bookmark on the left side of the screen. I then created a bookmark with the group shown, and then hidden, assigning the filter and back button to these bookmarks.

<p>
    <img src="Github Images\Product Slicer filters.png" width="300" height="500" />
</p>

On the bottom half on the report page, I place:

- An area chart to show off total revenue over years
- A scatter chart to show profit per item vs how popular an item is 
- A grid to show the user metrics about the top 10 best selling items 

### Stores Map

<p>
    <img src="Github Images\Stores Map View.png" width="1000" height="500" />
</p>

This page is designed for regional managers so they can get a quick overview on their local stone. I used the map visual, and the geographical hierarchy I created earlier. I then used the ```Profit YTD``` for the bubble size. On the very top I created a country slicer to specify a country.



I then created a custom tooltips page that gave specific information about how a country is doing.  I created 2 gauges, one for profit ytd, and revenue ytd, where their targets were a 20% increase from the previous year. 

<p>
    <img src="Github Images\Tooltip page.png" width="700" height="350" />
</p>

I set this page as a tooltip page, which means when I hover over a specific country, it will show specific metrics on them.

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
