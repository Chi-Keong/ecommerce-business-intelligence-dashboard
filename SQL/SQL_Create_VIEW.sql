## Creates VIEW with all columns from 5 datasets
create or replace view v_order_full as
select 
	o.OrderID,
    o.customerID,
    o.orderStatus,
    o.orderPlacedTime,
    o.orderApprovedTime,
    o.orderDeliveredTime,
    o.orderEstDeliveryDate,
    o.actualLeadTime,
    o.estLeadTime,
    o.isLate,
    c.customerZipCode,
    c.customerCity,
    c.customerState,
    pd.productID,
    pd.productCategory,
    pd.productWeight,
    pd.productLength,
    pd.productHeight,
    pd.productWidth,
    oi.sellerID ,
    oi.price,
    oi.shippingFee,
    pm.paymentSequential,
    pm.paymentType,
    pm.paymentInstallments,
    pm.paymentValue
from Orders o
join OrderItems oi on o.orderID = oi.orderID
join Customers c on o.customerID = c.customerID
join Products pd on oi.productID = pd.productID
join Payments pm on o.orderID = pm.orderID;

## Create VIEW to label order payment status
create or replace VIEW v_order_payment_status as
select 
    o.orderID,
    o.orderPlacedTime ,
    sum(oi.price + oi.shippingFee) as receivable,
    sum(pm.paymentValue) as paid,
    case 
		when sum(oi.price + oi.shippingFee) > sum(pm.paymentValue) then "UNDERPAID"
        when sum(oi.price + oi.shippingFee) > sum(pm.paymentValue) then "OVERPAID"
        else "FULLY_PAID"
	end as payment_status
from Orders o
join orderItems oi on o.orderID = oi.orderID
join Payments pm on o.orderID = pm.orderID
group by o.orderID;