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
- [Customer Detail](# Customer Details) 
- [Product Details](# Product Details)
- [Stores Map](# Stores Map)

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
