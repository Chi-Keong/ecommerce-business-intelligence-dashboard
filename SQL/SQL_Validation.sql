## Power BI Validation Script
##	- Selected a random time period using the Power BI slicer (2016-10-01 to 2016-10-31).
##	- Cross-validated KPI results between SQL queries and Power BI measures.


## Total Orders
select count(distinct orderID) as total_orders
from Orders
where orderPlacedTime >= "2016-10-01" and orderPlacedTime <= "2016-10-31";

## Total Product Revenue
select sum(price) as product_revenue
from Orders o
join orderItems oi on o.orderID = oi.orderID
where orderPlacedTime >= "2016-10-01" and orderPlacedTime <= "2016-10-31";

## isLate = 1
select count(*) 
from Orders
where 
	isLate = 1 
    and orderPlacedTime >= "2016-10-01" 
    and orderPlacedTime <= "2016-10-31";
    
## Underpaid Orders
select count(*)
from v_order_payment_status
where
	orderPlacedTime >= "2016-10-01"
    and orderPlacedTime <= "2016-10-31"
    and paymentStatus = "UNDERPAID";