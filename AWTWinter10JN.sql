
DROP TABLE salesCompanyDomestic
go



DROP TABLE salesCompanyInternational
go



DROP TABLE orderLineItem
go



DROP TABLE product
go



DROP TABLE productCategory
go



DROP TABLE salesOrder
go



DROP TABLE carrier
go



DROP TABLE customer
go



DROP TABLE customerType
go



DROP TABLE city
go



DROP TABLE shippingMethod
go



DROP TABLE salesperson
go



DROP TABLE salesCompany
go



CREATE TABLE salesCompany
( 
	companyId            integer  NOT NULL ,
	companyName          varchar(30)  NULL ,
	salesNetworkIndicator char(1)  NULL ,
	 PRIMARY KEY (companyId ASC)
)
go



CREATE TABLE salesperson
( 
	salespersonNo        integer  NOT NULL ,
	salespersonName      varchar(20)  NULL ,
	statusIndicator      char(1)  NULL ,
	companyId            integer  NULL ,
	 PRIMARY KEY (salespersonNo ASC),
	 FOREIGN KEY (companyId) REFERENCES salesCompany(companyId)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE TABLE shippingMethod
( 
	ShippingMethodId     char(5)  NOT NULL ,
	shippingMethodName   varchar(13)  NULL ,
	shippingMethodDescription varchar(20)  NULL ,
	 PRIMARY KEY (ShippingMethodId ASC)
)
go



CREATE TABLE city
( 
	cityId               integer  NOT NULL ,
	zipCode              varchar(10)  NULL ,
	cityName             varchar(45)  NULL ,
	state                char(2)  NULL ,
	areaCode             varchar(10)  NULL ,
	 PRIMARY KEY (cityId ASC)
)
go



CREATE TABLE customerType
( 
	customerTypeId       varchar(4)  NOT NULL ,
	typeDescription      varchar(10)  NULL ,
	typeDiscount         numeric(6,4)  NULL ,
	 PRIMARY KEY (customerTypeId ASC)
)
go



CREATE TABLE customer
( 
	customerId           char(18)  NOT NULL ,
	cityId               integer  NULL ,
	companyContactName   varchar(20)  NULL ,
	customerIndicator    char(1)  NULL ,
	customerTypeId       varchar(4)  NULL ,
	 PRIMARY KEY (customerId ASC),
	 FOREIGN KEY (cityId) REFERENCES city(cityId)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
 FOREIGN KEY (customerTypeId) REFERENCES customerType(customerTypeId)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE TABLE carrier
( 
	carrierNo            char(5)  NOT NULL ,
	carrierName          varchar(5)  NULL ,
	carrierDescription   varchar(30)  NULL ,
	 PRIMARY KEY (carrierNo ASC)
)
go



CREATE TABLE salesOrder
( 
	orderId              char(7)  NOT NULL ,
	orderDate            datetime  NULL ,
	customerId           char(18)  NOT NULL ,
	salespersonNo        integer  NOT NULL ,
	ShippingMethodId     char(5)  NOT NULL ,
	carrierNo            char(5)  NOT NULL ,
	 PRIMARY KEY (orderId ASC),
	 FOREIGN KEY (salespersonNo) REFERENCES salesperson(salespersonNo)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
 FOREIGN KEY (ShippingMethodId) REFERENCES shippingMethod(ShippingMethodId)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
 FOREIGN KEY (customerId) REFERENCES customer(customerId)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
 FOREIGN KEY (carrierNo) REFERENCES carrier(carrierNo)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE TABLE productCategory
( 
	categoryId           varchar(5)  NOT NULL ,
	categoryDescription  varchar(33)  NULL ,
	 PRIMARY KEY (categoryId ASC)
)
go



CREATE TABLE product
( 
	productNo            char(6)  NOT NULL ,
	productDescription   varchar(33)  NULL ,
	categoryId           varchar(5)  NOT NULL ,
	productUnitPrice     integer  NULL ,
	productUnitWeight    integer  NULL ,
	inventoryQty         integer  NULL ,
	 PRIMARY KEY (productNo ASC),
	 FOREIGN KEY (categoryId) REFERENCES productCategory(categoryId)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE TABLE orderLineItem
( 
	orderId              char(7)  NOT NULL ,
	productNo            char(6)  NOT NULL ,
	qtyOrdered           integer  NULL ,
	 PRIMARY KEY (orderId ASC,productNo ASC),
	 FOREIGN KEY (orderId) REFERENCES salesOrder(orderId)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
 FOREIGN KEY (productNo) REFERENCES product(productNo)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE TABLE salesCompanyInternational
( 
	companyId            integer  NOT NULL ,
	country              varchar(20)  NULL ,
	emailAddress         varchar(25)  NULL ,
	 PRIMARY KEY (companyId ASC),
	 FOREIGN KEY (companyId) REFERENCES salesCompany(companyId)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)
go



CREATE TABLE salesCompanyDomestic
( 
	companyId            integer  NOT NULL ,
	state                varchar(18)  NULL ,
	phoneNumber          varchar(11)  NULL ,
	commissionRate       numeric(4,2)  NULL ,
	 PRIMARY KEY (companyId ASC),
	 FOREIGN KEY (companyId) REFERENCES salesCompany(companyId)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)
go


