##Checking file loading settings##
show variables like 'local_infile';
SHOW VARIABLES LIKE 'secure_file_priv';
set global local_infile = 1;

##Loading csvs to tables##
load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/df_Customers.csv"
into table Customers
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines
(customerID, customerZipCode, customerCity, customerState);

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/df_Products1.csv"
into table Products
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
(@productID, @productCategory, @productWeight, @productLength, @productHeight, @productWidth)
set
productID = trim(@productID),
productCategory = nullif(trim(@productCategory), ''),
productWeight = nullif(trim(@productWeight), ''),
productLength = nullif(trim(@productLength), ''),
productHeight = nullif(trim(@productHeight), ''),
productWidth = nullif(trim(@productWidth), '');


load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/df_Orders1.csv"
into table Orders
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
(@orderID, @customerID, @orderStatus, @orderPlacedTime, @orderApprovedTime, @orderDeliveredTime, @orderEstDeliveryDate, @actualLeadTime, @estLeadTime, @isLate)
set
orderID = trim(@orderID),
customerID = trim(@customerID),
orderStatus = trim(@orderStatus),
orderPlacedTime = nullif(trim(@orderPlacedTime), ''),
orderApprovedTime = nullif(trim(@orderApprovedTime), ''),
orderDeliveredTime = nullif(trim(@orderDeliveredTime), ''),
orderEstDeliveryDate = nullif(trim(@orderEstDeliveryDate), ''),
actualLeadTime = nullif(trim(@actualLeadTime), ''),
estLeadTime = nullif(trim(@estLeadTime), ''),
isLate = case
	when lower(trim(@isLate)) in ("true", "t", "1") then 1
    when lower(trim(@isLate)) in ("false", "f", "0") then 0
    when trim(@isLate) = '' then null
    else null
end;


load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/df_OrderItems.csv"
into table OrderItems
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines
(orderID, productID, sellerID, price, shippingFee);

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/df_Payments.csv"
into table Payments
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines
(orderID, paymentSequential, paymentType, paymentInstallments, paymentValue);