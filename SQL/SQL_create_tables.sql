create database EcommerceOrder;
use EcommerceOrder;

create table Customers(
	customerID varchar(20) not null,
    customerZipCode varchar(15),
    customerCity varchar(50),
    customerState Varchar(20),
    primary key (customerID)
);

create table Products(
	productID varchar(20) not null,
    productCategory varchar(50),
    productWeight decimal(10,2),
    productLength decimal(10,2),
    productHeight decimal(10,2),
    productWidth decimal(10,2),
    primary key (productID)
);

create table Orders(
	orderID varchar(20) not null,
    customerID varchar(20) not null,
    orderStatus varchar(20) not null,
    orderPlacedTime datetime,
    orderApprovedTime datetime,
    orderDeliveredTime datetime,
    orderEstDeliveryDate date,
    actualLeadTime int,
    estLeadTime int,
    isLate boolean,
    primary key (orderID),
    foreign key (customerID) references Customers(customerID)
);


#Although in the dataset 1 order only has 1 product.
#still we will use orderID and productID as pk
#to imitate real-world scenario.
create table OrderItems(
	orderID varchar(20) not null,
    productID varchar(20) not null,
    sellerID varchar(20),
    price decimal(10,2),
    shippingFee decimal(10,2),
    primary key (orderID, productID),
    foreign key (orderID) references Orders(orderID),
    foreign key (productID) references Products(productID)
);

#As an order can be paid by multiple payments,
#using both orderID and paymentSequential can uniquely
#identify each payment.
create table Payments(
	orderID varchar(20) not null,
    paymentSequential int not null,
    paymentType varchar(30),
    paymentInstallments int,
    paymentValue decimal(10,2),
    primary key (orderID, paymentSequential),
    foreign key (orderID) references Orders(orderID)
);
