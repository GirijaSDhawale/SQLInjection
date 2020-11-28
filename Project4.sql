--Table Drop Commands
DROP TABLE CUSTOMER CASCADE CONSTRAINTS;
DROP TABLE CATALOG CASCADE CONSTRAINTS;
DROP TABLE  PARTS_INVENTORY CASCADE CONSTRAINTS;
DROP TABLE MODEL_Blueprint CASCADE CONSTRAINTS;
DROP TABLE SUPPLIER CASCADE CONSTRAINTS;
DROP TABLE MANUFACTURING CASCADE CONSTRAINTS;
DROP TABLE DEPARTMENT CASCADE CONSTRAINTS;
DROP TABLE Supplier_Order CASCADE CONSTRAINTS;
DROP TABLE DISTRIBUTOR CASCADE CONSTRAINTS;
DROP TABLE REPAIR_PRODUCT CASCADE CONSTRAINTS;
DROP TABLE MODEL_DETAILS CASCADE CONSTRAINTS;
DROP TABLE CUSTOMER_BILL CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEES CASCADE CONSTRAINTS;
DROP TABLE INVOICE CASCADE CONSTRAINTS;
DROP TABLE QUALITY CASCADE CONSTRAINTS;
DROP TABLE WAREHOUSE CASCADE CONSTRAINTS;
DROP TABLE CUSTOMER_ORDER CASCADE CONSTRAINTS;
DROP TABLE ROLE_ CASCADE CONSTRAINTS;
DROP TABLE ADMINISTRATOR_INFO CASCADE CONSTRAINTS;

CLEAR SCREEN;

--Creating Table Customer
CREATE TABLE CUSTOMER (
  Customer_ID VARCHAR(10) NOT NULL PRIMARY KEY,
  First_Name VARCHAR (30),
  Last_Name VARCHAR (30),
  Address VARCHAR (30),
  Phone INT
);
--Creating Table Catalog
CREATE TABLE CATALOG (
  Product_ID VARCHAR(10) NOT NULL PRIMARY KEY,
  MODEL_ VARCHAR (20),
  MODEL_DESCRIPTION VARCHAR(80),
  Price FLOAT
);

--Creating Table Parts_Inventory
  CREATE TABLE PARTS_INVENTORY(
  Part_ID VARCHAR(10) NOT NULL PRIMARY KEY,
  Part_Name VARCHAR(20),
  Part_Stock INT
  );
   
--Creating Table MODEL_DETAILS 
   CREATE TABLE MODEL_DETAILS(
   Product_ID VARCHAR(10) NOT NULL PRIMARY KEY,
   MODEL_DESCRIPTION VARCHAR(60), 
   Date_Manufactured DATE,
   MODEL_ VARCHAR(20)
   );
   
--Creating Distributor Table
CREATE TABLE DISTRIBUTOR (
  Distributor_ID VARCHAR(10) NOT NULL PRIMARY KEY,
  Distributor_Name VARCHAR (30),
  Address VARCHAR (30),
  MODEL_ VARCHAR(20)
);


--Creating Table MODEL_Blueprint
CREATE TABLE MODEL_Blueprint (
  MODEL_ VARCHAR(20),
  Qty INT,
  Part_ID VARCHAR(10),
  FOREIGN KEY (Part_ID) references PARTS_INVENTORY(Part_ID),
  Blueprint_ID VARCHAR (10) NOT NULL PRIMARY KEY
);

--Creating Table MANUFACTURING
CREATE TABLE MANUFACTURING (
  Airplane_Number VARCHAR  (10) NOT NULL PRIMARY KEY,
  Date_Manufactured DATE,
  MODEL_ VARCHAR (20),
  Status VARCHAR (20)
);

--Creating Table Department
   CREATE TABLE DEPARTMENT(
   Department_ID VARCHAR(10) NOT NULL PRIMARY KEY,
   Department_Name VARCHAR(30)
   );

--Creating Table Supplier
  CREATE TABLE SUPPLIER(
  Supplier_ID VARCHAR(10) NOT NULL PRIMARY KEY,
  Supplier_Name VARCHAR(30),
  Supplier_Address VARCHAR (30),
  Contact_Info INT,
  Part_Name VARCHAR(30),
  Part_ID VARCHAR(10),
  FOREIGN KEY (Part_ID) references PARTS_INVENTORY(Part_ID)
  );
  


--Creating Table Supplier_Order
CREATE TABLE Supplier_Order (
  Order_ID VARCHAR(10)NOT NULL PRIMARY KEY,
  Part_ID VARCHAR (10),
  Part_Qty INT,
  Order_Date DATE,
  Supplier_ID VARCHAR (10),
  FOREIGN KEY (Part_ID) references PARTS_INVENTORY(Part_ID),
  FOREIGN KEY (Supplier_ID) references SUPPLIER(Supplier_ID)
);

--Creating Table INVOICE
CREATE TABLE INVOICE (
  Invoice_ID VARCHAR (10) NOT NULL PRIMARY KEY,
  Part_Qty INT,
  Invoice_Date DATE,
  Shipping_Number INT,
  Order_ID_Status VARCHAR (30),
  Part_ID VARCHAR (10),
  Supplier_ID VARCHAR (10),
  Order_ID VARCHAR (10),
  FOREIGN KEY (Order_ID) references Supplier_Order(Order_ID),
  FOREIGN KEY (Part_ID) references PARTS_INVENTORY(Part_ID),
  FOREIGN KEY (Supplier_ID) references SUPPLIER(Supplier_ID)
);


--Creating Table QUALITY
CREATE TABLE QUALITY  (
  Inspection_ID VARCHAR (10) NOT NULL PRIMARY KEY,
  Inspectiondate DATE,
  Status VARCHAR (10),
  Airplane_Number VARCHAR (10),
  DEPARTMENT_ID VARCHAR (10),
   FOREIGN KEY (Airplane_Number) references MANUFACTURING(Airplane_Number),
   FOREIGN KEY (DEPARTMENT_ID) references DEPARTMENT (DEPARTMENT_ID)
);

--Creating Table WAREHOUSE
CREATE TABLE WAREHOUSE (
  Item_no VARCHAR (10) NOT NULL PRIMARY KEY,
  Product_ID VARCHAR(10),
  MODEL_ VARCHAR(20),
  Price FLOAT,
  StockOnHand INT,
  Distributor_ID VARCHAR (10),
   FOREIGN KEY (Product_ID) references MODEL_DETAILS (Product_ID),
   FOREIGN KEY (Distributor_ID) references DISTRIBUTOR (Distributor_ID)
);

--Creating Table CUSTOMER_ORDER
CREATE TABLE CUSTOMER_ORDER (
  Customer_ID VARCHAR(10),
  MODEL_ VARCHAR (20),
  Amount FLOAT,
  DateTime DATE,
  Quantity INT,
  CustOrder_ID VARCHAR(10) NOT NULL PRIMARY KEY,
   FOREIGN KEY (Customer_ID) references CUSTOMER(Customer_ID)
);


--Creating Table Repair_Product  
   CREATE TABLE REPAIR_PRODUCT(
   Repair_ID VARCHAR(10) NOT NULL PRIMARY KEY,
   Defect_Description VARCHAR(30), 
   Airplane_Number VARCHAR(10),
   Inspection_ID VARCHAR(10),
   FOREIGN KEY (Inspection_ID) references QUALITY(Inspection_ID),
   FOREIGN KEY (Airplane_Number) references MANUFACTURING(Airplane_Number)
   );
  


--Creating Table Customer_Bill
   CREATE TABLE CUSTOMER_BILL(
   Bill_ID VARCHAR(10) NOT NULL PRIMARY KEY,
   MODEL_ VARCHAR(20), 
   Amount Float,
   Delivery_Status VARCHAR(10),
   Product_ID VARCHAR(10),
   Customer_ID VARCHAR(10),
   Delivery_Date DATE,
   FOREIGN KEY (Product_ID) references MODEL_DETAILS(Product_ID),
   FOREIGN KEY (Customer_ID) references CUSTOMER(Customer_ID)
   );
   
--Creating Table Employees 
   CREATE TABLE EMPLOYEES(
   Employee_ID VARCHAR(10) NOT NULL PRIMARY KEY,
   Department_ID VARCHAR(10), 
   First_Name VARCHAR(30),
   Last_Name VARCHAR(30),
   Address VARCHAR(30),
   SSN VARCHAR(30),
   DOB DATE,
   FOREIGN KEY (Department_ID) references DEPARTMENT(Department_ID)
   );
   
--Creating Table Role
  CREATE TABLE ROLE_ (
  Role_ID varchar(10)  NOT NULL PRIMARY KEY,
  Role_Name varchar(30)
);
   
   
--Creating Table  Administrator_Info
  CREATE TABLE ADMINISTRATOR_INFO (
  Admin_ID VARCHAR(10)  NOT NULL PRIMARY KEY,
  Role_ID VARCHAR(10),
  Admin_Name VARCHAR(30),
  Email_ID VARCHAR(30),
  Password VARCHAR(30),
  FOREIGN KEY (Role_ID) references ROLE_(Role_ID)
);


--Inserting Data in table Customer
INSERT INTO CUSTOMER (Customer_ID,First_Name,Last_Name,Address,Phone) VALUES ('C10001','Laura','Meyer','600 Street Building A NY, USA',1-776-423-8576);
INSERT INTO CUSTOMER (Customer_ID,First_Name,Last_Name,Address,Phone) VALUES ('C10002','Steve','Aoki','Magna Street 12 CA, USA',1-135-317-3205);
INSERT INTO CUSTOMER (Customer_ID,First_Name,Last_Name,Address,Phone) VALUES ('C10003','Ram','Hariharan','79 Street OH, USA',1-879-150-3664);
INSERT INTO CUSTOMER (Customer_ID,First_Name,Last_Name,Address,Phone) VALUES ('C10004','Jacky','Davis','Culver Drive 21 AZ, USA',1-403-181-0725);
INSERT INTO CUSTOMER (Customer_ID,First_Name,Last_Name,Address,Phone) VALUES ('C10005','Drew','Barrymore','Park Ave CT21 CT, USA',1-205-199-2765);

--Inserting Data in table Catalog
INSERT INTO CATALOG (Product_ID,MODEL_, MODEL_DESCRIPTION,Price) VALUES ('PROD1','BOEING 747', 'Engine:Four wing-mounted,Seating Capacity: 366', 9000000);
INSERT INTO CATALOG (Product_ID,MODEL_, MODEL_DESCRIPTION,Price) VALUES ('PROD2','AIRBUS A320', 'Engine:Two wing pylon-mounted turbofan,Seating Capacity: 366', 615000);
INSERT INTO CATALOG (Product_ID,MODEL_, MODEL_DESCRIPTION,Price) VALUES ('PROD3','BOEING 777', 'Engine:GE90,Seating Capacity: 550', 5600000);
INSERT INTO CATALOG (Product_ID,MODEL_, MODEL_DESCRIPTION,Price) VALUES ('PROD4','AIRBUS A330', 'Engine:CF6,Seating Capacity:440', 450000);
INSERT INTO CATALOG (Product_ID,MODEL_, MODEL_DESCRIPTION,Price) VALUES ('PROD5','AIRBUS A380', 'Engine:CF6,Seating Capacity:853', 3500000);

--Inserting Data in table Parts_Inventory
INSERT INTO  PARTS_INVENTORY (Part_ID,Part_Name,Part_Stock) VALUES ('P101','Turbine Engine',12);
INSERT INTO  PARTS_INVENTORY (Part_ID,Part_Name,Part_Stock) VALUES ('P102','Flight Deck',79);
INSERT INTO  PARTS_INVENTORY (Part_ID,Part_Name,Part_Stock) VALUES ('P103','Winglet',43);
INSERT INTO  PARTS_INVENTORY (Part_ID,Part_Name,Part_Stock) VALUES ('P104','Air Brakes',81);
INSERT INTO  PARTS_INVENTORY (Part_ID,Part_Name,Part_Stock) VALUES ('P105','Flaps',35);

-- Inserting Data in table MODEL_DETAILS
INSERT INTO MODEL_DETAILS (Product_ID,MODEL_DESCRIPTION,Date_Manufactured,MODEL_) VALUES ('PROD1','Engine:Four wing-mounted,Seating Capacity: 366','02-JAN-20','BOEING 747');
INSERT INTO MODEL_DETAILS (Product_ID,MODEL_DESCRIPTION,Date_Manufactured,MODEL_) VALUES ('PROD2','Engine:Two wing pylon-mounted turbofan,Seating Capacity: 366','12-NOV-20','AIRBUS A320');
INSERT INTO MODEL_DETAILS (Product_ID,MODEL_DESCRIPTION,Date_Manufactured,MODEL_) VALUES ('PROD3','Engine:GE90,Seating Capacity: 550','12-NOV-20','BOEING 777');
INSERT INTO MODEL_DETAILS (Product_ID,MODEL_DESCRIPTION,Date_Manufactured,MODEL_) VALUES ('PROD4','Engine:CF6,Seating Capacity:440','24-FEB-18','AIRBUS A330');
INSERT INTO MODEL_DETAILS (Product_ID,MODEL_DESCRIPTION,Date_Manufactured,MODEL_) VALUES ('PROD5','Engine:CF6,Seating Capacity:853','28-DEC-19','AIRBUS A380');

--Inserting Data in table Distributor
INSERT INTO DISTRIBUTOR (Distributor_ID,Distributor_Name,Address,MODEL_) VALUES ('D101','Aviall','Richmond','BOEING 747');
INSERT INTO DISTRIBUTOR (Distributor_ID,Distributor_Name,Address,MODEL_) VALUES ('D102','Aero Precision','Mystic','AIRBUS A320');
INSERT INTO DISTRIBUTOR (Distributor_ID,Distributor_Name,Address,MODEL_) VALUES ('D103','AB Aviation','San Mateo','BOEING 777');
INSERT INTO DISTRIBUTOR (Distributor_ID,Distributor_Name,Address,MODEL_) VALUES ('D104','Falcon Crest Aviation','Los Angeles','AIRBUS A330');
INSERT INTO DISTRIBUTOR (Distributor_ID,Distributor_Name,Address,MODEL_) VALUES ('D105','Omaha Air Service','Burlington','AIRBUS A380');

--Inserting Data in table MODEL_Blueprint

INSERT INTO MODEL_Blueprint (MODEL_,Qty,Part_ID,Blueprint_ID) VALUES ('BOEING 747','2','P101','B1');
INSERT INTO MODEL_Blueprint (MODEL_,Qty,Part_ID,Blueprint_ID) VALUES ('AIRBUS A320','2','P102','B2');
INSERT INTO MODEL_Blueprint (MODEL_,Qty,Part_ID,Blueprint_ID) VALUES ('BOEING 777','2','P103','B3');
INSERT INTO MODEL_Blueprint (MODEL_,Qty,Part_ID,Blueprint_ID) VALUES ('AIRBUS A330','2','P104','B4');
INSERT INTO MODEL_Blueprint (MODEL_,Qty,Part_ID,Blueprint_ID) VALUES ('AIRBUS A380','2','P105','B5');

--Inserting Data in table MANUFACTURING
INSERT INTO MANUFACTURING (Airplane_Number,Date_Manufactured,MODEL_,Status) VALUES ('AIR1','09-JUL-19','BOEING 747','IN PROCESS');
INSERT INTO MANUFACTURING (Airplane_Number,Date_Manufactured,MODEL_,Status) VALUES ('AIR2','21-OCT-18','AIRBUS A320','MANUFACTURED');
INSERT INTO MANUFACTURING (Airplane_Number,Date_Manufactured,MODEL_,Status) VALUES ('AIR3','03-JAN-20','BOEING 777','TESTING');
INSERT INTO MANUFACTURING (Airplane_Number,Date_Manufactured,MODEL_,Status) VALUES ('AIR4','05-MAY-18','AIRBUS A330','TESTING');
INSERT INTO MANUFACTURING (Airplane_Number,Date_Manufactured,MODEL_,Status) VALUES ('AIR5','03-SEP-19','AIRBUS A380','MANUFACTURED');

-- Inserting Data in table Department
INSERT INTO DEPARTMENT (Department_ID,Department_Name) VALUES ('D101','HR');
INSERT INTO DEPARTMENT (Department_ID,Department_Name) VALUES ('D102','Administration');
INSERT INTO DEPARTMENT (Department_ID,Department_Name) VALUES ('D103','Billing');
INSERT INTO DEPARTMENT (Department_ID,Department_Name) VALUES ('D104','Manufacturing');
INSERT INTO DEPARTMENT (Department_ID,Department_Name) VALUES ('D105','Delivery');

--Inserting Data in table Supplier
INSERT INTO SUPPLIER (Supplier_ID,Supplier_Name,Supplier_Address,Contact_Info,Part_Name,Part_ID) VALUES ('S101','David','Nantucket','19317409513','Turbine Engine','P101');
INSERT INTO SUPPLIER (Supplier_ID,Supplier_Name,Supplier_Address,Contact_Info,Part_Name,Part_ID) VALUES ('S102','Mark','Tustin','16051239617','Flight Deck','P102');
INSERT INTO SUPPLIER (Supplier_ID,Supplier_Name,Supplier_Address,Contact_Info,Part_Name,Part_ID) VALUES ('S103','Arrow','Hartford','10004992','Winglet','P103');
INSERT INTO SUPPLIER (Supplier_ID,Supplier_Name,Supplier_Address,Contact_Info,Part_Name,Part_ID) VALUES ('S104','Hoxuan Xu','Anaheim','12102720115','Air Brakes','P104');
INSERT INTO SUPPLIER (Supplier_ID,Supplier_Name,Supplier_Address,Contact_Info,Part_Name,Part_ID) VALUES ('S105','Zhenghui','Boston','17495443883','Flaps','P105');


--Inserting Data in table Supplier_Order
INSERT INTO Supplier_Order (Order_ID,Part_ID,Part_Qty,Order_Date,Supplier_ID) VALUES ('O101','P101','3','04-JAN-20','S101');
INSERT INTO Supplier_Order (Order_ID,Part_ID,Part_Qty,Order_Date,Supplier_ID) VALUES ('O102','P102','3','05-OCT-20','S102');
INSERT INTO Supplier_Order (Order_ID,Part_ID,Part_Qty,Order_Date,Supplier_ID) VALUES ('O103','P103','3','07-OCT-20','S103');
INSERT INTO Supplier_Order (Order_ID,Part_ID,Part_Qty,Order_Date,Supplier_ID) VALUES ('O104','P104','3','05-NOV-20','S104');
INSERT INTO Supplier_Order (Order_ID,Part_ID,Part_Qty,Order_Date,Supplier_ID) VALUES ('O105','P105','3','05-APR-20','S105');

--Inserting Data in table INVOICE
INSERT INTO INVOICE (Invoice_ID,Part_Qty,Invoice_Date,Shipping_Number,Order_ID_Status,Part_ID,Supplier_ID,Order_ID) VALUES ('I101',3,'10-JAN-20',2180,'Shipped','P101','S101','O101');
INSERT INTO INVOICE (Invoice_ID,Part_Qty,Invoice_Date,Shipping_Number,Order_ID_Status,Part_ID,Supplier_ID,Order_ID) VALUES ('I102',3,'10-OCT-20',3132,'Recieved','P102','S102','O102');
INSERT INTO INVOICE (Invoice_ID,Part_Qty,Invoice_Date,Shipping_Number,Order_ID_Status,Part_ID,Supplier_ID,Order_ID) VALUES ('I103',3,'09-OCT-20',8022,'Recieved','P103','S103','O103');
INSERT INTO INVOICE (Invoice_ID,Part_Qty,Invoice_Date,Shipping_Number,Order_ID_Status,Part_ID,Supplier_ID,Order_ID) VALUES ('I104',3,'09-NOV-20',5790,'Shipped','P104','S104','O104');
INSERT INTO INVOICE (Invoice_ID,Part_Qty,Invoice_Date,Shipping_Number,Order_ID_Status,Part_ID,Supplier_ID,Order_ID) VALUES ('I105',3,'10-APR-20',2742,'Recieved','P105','S105','O105');

--Inserting Data in table QUALITY
INSERT INTO QUALITY (Inspection_ID,Inspectiondate,Status,Airplane_Number,DEPARTMENT_ID) VALUES ('IN101','05-MAY-20','Checking','AIR1','D101');
INSERT INTO QUALITY (Inspection_ID,Inspectiondate,Status,Airplane_Number,DEPARTMENT_ID) VALUES ('IN102','05-MAR-20','Checked','AIR2','D102');
INSERT INTO QUALITY (Inspection_ID,Inspectiondate,Status,Airplane_Number,DEPARTMENT_ID) VALUES ('IN103','11-JUN-20','Checking','AIR3','D103');
INSERT INTO QUALITY (Inspection_ID,Inspectiondate,Status,Airplane_Number,DEPARTMENT_ID) VALUES ('IN104','08-JUL-20','Checked','AIR4','D104');
INSERT INTO QUALITY (Inspection_ID,Inspectiondate,Status,Airplane_Number,DEPARTMENT_ID) VALUES ('IN105','08-MAY-20','Checking','AIR5','D105');

--Inserting Data in table WAREHOUSE
INSERT INTO WAREHOUSE (Item_no,Product_ID,MODEL_,Price,StockOnHand,Distributor_ID) VALUES ('IT1','PROD1','BOEING 747',9000000,5,'D101');
INSERT INTO WAREHOUSE (Item_no,Product_ID,MODEL_,Price,StockOnHand,Distributor_ID) VALUES ('IT2','PROD2','AIRBUS A320',6150000,6,'D102');
INSERT INTO WAREHOUSE (Item_no,Product_ID,MODEL_,Price,StockOnHand,Distributor_ID) VALUES ('IT3','PROD3','BOEING 777',5600000,2,'D103');
INSERT INTO WAREHOUSE (Item_no,Product_ID,MODEL_,Price,StockOnHand,Distributor_ID) VALUES ('IT4','PROD4','AIRBUS A330',450000,2,'D104');
INSERT INTO WAREHOUSE (Item_no,Product_ID,MODEL_,Price,StockOnHand,Distributor_ID) VALUES ('IT5','PROD5','AIRBUS A380',3500000,18,'D105');

--Inserting Data in table CUSTOMER_ORDER
INSERT INTO CUSTOMER_ORDER (Customer_ID,MODEL_,Amount,DateTime,Quantity,CustOrder_ID) VALUES ('C10001','BOEING 747',9000000,'05-JUN-20',22,'CUST1');
INSERT INTO CUSTOMER_ORDER (Customer_ID,MODEL_,Amount,DateTime,Quantity,CustOrder_ID) VALUES ('C10002','AIRBUS A320',6150000,'03-MAY-21',10,'CUST2');
INSERT INTO CUSTOMER_ORDER (Customer_ID,MODEL_,Amount,DateTime,Quantity,CustOrder_ID) VALUES ('C10003','BOEING 777',5600000,'08-JAN-20',15,'CUST3');
INSERT INTO CUSTOMER_ORDER (Customer_ID,MODEL_,Amount,DateTime,Quantity,CustOrder_ID) VALUES ('C10004','AIRBUS A330',450000,'02-NOV-20',23,'CUST4');
INSERT INTO CUSTOMER_ORDER (Customer_ID,MODEL_,Amount,DateTime,Quantity,CustOrder_ID) VALUES ('C10005','AIRBUS A380',3500000,'12-OCT-19',15,'CUST5');

--Inserting Data in table Repair_Product
INSERT INTO REPAIR_PRODUCT (Repair_ID,Defect_Description,Airplane_Number,Inspection_ID) VALUES ('R101','Fuel leak','AIR1','IN101');
INSERT INTO REPAIR_PRODUCT (Repair_ID,Defect_Description,Airplane_Number,Inspection_ID) VALUES ('R102','Electrical failures ','AIR2','IN102');
INSERT INTO REPAIR_PRODUCT (Repair_ID,Defect_Description,Airplane_Number,Inspection_ID) VALUES ('R103','Failure of de-ice equipment','AIR3','IN103');
INSERT INTO REPAIR_PRODUCT (Repair_ID,Defect_Description,Airplane_Number,Inspection_ID) VALUES ('R104','Hydraulic systems failure ','AIR4','IN104');
INSERT INTO REPAIR_PRODUCT (Repair_ID,Defect_Description,Airplane_Number,Inspection_ID) VALUES ('R105','Fuel leak','AIR5','IN105');


-- Inserting Data in table Customer_Bill
INSERT INTO CUSTOMER_BILL (Bill_ID,MODEL_,Amount,Delivery_Status,Product_ID,Customer_ID,Delivery_Date) VALUES ('B101','BOEING 747',9000000,'Delivered','PROD1','C10001','24-NOV-20');
INSERT INTO CUSTOMER_BILL (Bill_ID,MODEL_,Amount,Delivery_Status,Product_ID,Customer_ID,Delivery_Date) VALUES ('B102','AIRBUS A320',615000,'In Transit','PROD2','C10002','23-NOV-20');
INSERT INTO CUSTOMER_BILL (Bill_ID,MODEL_,Amount,Delivery_Status,Product_ID,Customer_ID,Delivery_Date) VALUES ('B103','BOEING 777',5600000,'In Transit','PROD3','C10003','18-NOV-20');
INSERT INTO CUSTOMER_BILL (Bill_ID,MODEL_,Amount,Delivery_Status,Product_ID,Customer_ID,Delivery_Date) VALUES ('B104','AIRBUS A330',450000,'In Transit','PROD4','C10004','19-NOV-20');
INSERT INTO CUSTOMER_BILL (Bill_ID,MODEL_,Amount,Delivery_Status,Product_ID,Customer_ID,Delivery_Date) VALUES ('B105','AIRBUS A380',3500000,'Delivered','PROD5','C10005','21-NOV-20');

-- Inserting Data in table Employee
INSERT INTO EMPLOYEES (Employee_ID,Department_ID,First_Name,Last_Name,Address,SSN,DOB) VALUES ('E101','D101','Eaton','Gomez','New Jersey',628888999,'10-JAN-68');
INSERT INTO EMPLOYEES (Employee_ID,Department_ID,First_Name,Last_Name,Address,SSN,DOB) VALUES ('E102','D102','Mary','Davis','Lexington',763666555,'02-FEB-67');
INSERT INTO EMPLOYEES (Employee_ID,Department_ID,First_Name,Last_Name,Address,SSN,DOB) VALUES ('E103','D103','Alisa','Olsen','Burlington',538444333,'04-MAR-00');
INSERT INTO EMPLOYEES (Employee_ID,Department_ID,First_Name,Last_Name,Address,SSN,DOB) VALUES ('E104','D104','Flavia','Mcknight','Mystic',552333222,'12-APR-62');
INSERT INTO EMPLOYEES (Employee_ID,Department_ID,First_Name,Last_Name,Address,SSN,DOB) VALUES ('E105','D105','Rudyard','Hyde','Lowell',535212323,'03-MAY-89');

-- Inserting Data in table Role
INSERT INTO ROLE_ (Role_ID,Role_Name) VALUES (1,'Admin');
INSERT INTO ROLE_ (Role_ID,Role_Name) VALUES (2,'DAdmin');
INSERT INTO ROLE_ (Role_ID,Role_Name) VALUES (3,'SAdmin');
INSERT INTO ROLE_ (Role_ID,Role_Name) VALUES (4,'MAdmin');
INSERT INTO ROLE_ (Role_ID,Role_Name) VALUES (5,'PAdmin');

-- Inserting Data in table  Administrator_Info
INSERT INTO ADMINISTRATOR_INFO (Admin_ID,Role_ID,Admin_Name,Email_ID,Password) VALUES ('ADMIN101',1,'Yash','yash@gmail.com','yash');
INSERT INTO ADMINISTRATOR_INFO (Admin_ID,Role_ID,Admin_Name,Email_ID,Password) VALUES ('ADMIN102',2,'Girija','girija@gmail.com','girija');
INSERT INTO ADMINISTRATOR_INFO (Admin_ID,Role_ID,Admin_Name,Email_ID,Password) VALUES ('ADMIN103',3,'Dev','dev@gmail.com','dev');
INSERT INTO ADMINISTRATOR_INFO (Admin_ID,Role_ID,Admin_Name,Email_ID,Password) VALUES ('ADMIN104',4,'Manisha','manisha@gmail.com','man');
INSERT INTO ADMINISTRATOR_INFO (Admin_ID,Role_ID,Admin_Name,Email_ID,Password) VALUES ('ADMIN105',5,'Bobby','bobby@gmail.com','bob');
