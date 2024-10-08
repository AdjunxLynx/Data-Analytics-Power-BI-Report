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

