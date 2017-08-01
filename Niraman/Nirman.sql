drop database Nirman;

create database Nirman;

use Nirman;

create table Customer(
	CustomerID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	CustomerName VARCHAR(50) NOT NULL,
	CustomerAddress VARCHAR(100) NOT NULL,
	CustomerMobileNumber VARCHAR(12) NOT NULL,
	CustomerPanNumber VARCHAR(20) NOT NULL,
	CustomerAadharNumber VARCHAR(50),
	CustomerGstin VARCHAR(30) NOT NULL,
	UNIQUE KEY(CustomerMobileNumber,CustomerPanNumber,CustomerAadharNumber,CustomerGstin),
	CustomerEmail VARCHAR(50),
	CustomerLandline VARCHAR(20),
	CustomerPassword VARCHAR(30) NOT NULL
);

create table Vendor(
	VendorID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	VendorName VARCHAR(50) NOT NULL,
	VendorAddress VARCHAR(100) NOT NULL,
	VendorMobileNumber VARCHAR(12) NOT NULL,
	VendorPanNumber VARCHAR(20) NOT NULL,
	VendorAadharNumber VARCHAR(50),
	VendorGstin VARCHAR(30) NOT NULL,
	UNIQUE KEY(VendorMobileNumber,VendorPanNumber,VendorAadharNumber,VendorGstin),
	VendorEmail VARCHAR(50),
	VendorLandline VARCHAR(20),
	VendorPassword VARCHAR(30) NOT NULL
);

create table Brand(
	BrandID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	BrandName VARCHAR(100) NOT NULL,
	UNIQUE(BrandName)
);

create table VendorHasBrands(
	VendorHasBrandsID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	VendorID INT NOT NULL,FOREIGN KEY(VendorID) REFERENCES Vendor(VendorID),
	BrandID INT NOT NULL,FOREIGN KEY(BrandID) REFERENCES Brand(BrandID)
);

create table Product(
	ProductID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	ProductName VARCHAR(50) NOT NULL
);

create table ProductDetail(
	ProductDetailID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	ProductDetail VARCHAR(50),
	ProductID INT NOT NULL,FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
);

create table VendorBankDetail(
	BankID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	VendorID INT NOT NULL,FOREIGN KEY(VendorID) REFERENCES Vendor(VendorID),
	BankName VARCHAR(100) NOT NULL,
	BankBranch VARCHAR(50) NOT NULL,
	BankIfscCode VARCHAR(50) NOT NULL
);

create table Offer(
	OfferID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	VendorID INT NOT NULL, FOREIGN KEY(VendorID) REFERENCES Vendor(VendorID),
	TimeLeft DATETIME NOT NULL,
	OfferStatus INT NOT NULL
);


create table OfferHasProducts(
	OfferHasProductsID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	OfferID INT NOT NULL,FOREIGN KEY(OfferID) REFERENCES Offer(OfferID),
	ProductID INT NOT NULL,FOREIGN KEY(ProductID) REFERENCES Product(ProductID),
	BrandID INT NOT NULL, FOREIGN KEY(BrandID) REFERENCES VendorHasBrands(BrandID),
	OfferQuantity INT NOT NULL,
	OfferPrice FLOAT NOT NULL,
	OfferTerms VARCHAR(100) NOT NULL,
	TotalSubscriptionQuantity INT NOT NULL,
	ProductDetailID INT NOT NULL, FOREIGN KEY(ProductDetailID) REFERENCES ProductDetail(ProductDetailID)
);


create table Subscription(
	SubscriptionID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	OfferID INT NOT NULL, FOREIGN KEY(OfferID) REFERENCES Offer(OfferID),
	SubscriptionQuantity INT NOT NULL
);


insert into Brand(BrandName)VALUES('KCP');
insert into Brand(BrandName)VALUES('ZUARI');


