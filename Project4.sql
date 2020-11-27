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
  MODEL_DESCRIPTION VARCHAR(30),
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
   MODEL_DESCRIPTION VARCHAR(30), 
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
  Status VARCHAR (10)
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



--Inserting Data in table Customer
INSERT INTO CUSTOMER (Customer_ID,First_Name,Last_Name,Address,Phone) VALUES ('C10001','Marsden','Flynn','Ap #922-2226 Eu Rd.',1-776-423-8576);
INSERT INTO CUSTOMER (Customer_ID,First_Name,Last_Name,Address,Phone) VALUES ('C10002','Uriel','Meyer','597-8319 Magna. Street',1-135-317-3205);
INSERT INTO CUSTOMER (Customer_ID,First_Name,Last_Name,Address,Phone) VALUES ('C10003','Hayden','Shields','7978 Dui Street',1-879-150-3664);
INSERT INTO CUSTOMER (Customer_ID,First_Name,Last_Name,Address,Phone) VALUES ('C10004','Anthony','Battle','9295 A, Street',1-403-181-0725);
INSERT INTO CUSTOMER (Customer_ID,First_Name,Last_Name,Address,Phone) VALUES ('C10005','Drake','Espinoza','221-120 Ut Ave',1-205-199-2765);

--Inserting Data in table Catalog
INSERT INTO CATALOG (Product_ID,MODEL_, MODEL_DESCRIPTION,Price) VALUES ('PROD1','BOEING 747', 'HAWAI JAHAJ', 9000000);
INSERT INTO CATALOG (Product_ID,MODEL_, MODEL_DESCRIPTION,Price) VALUES ('PROD2','AIRBUS A320', 'HAWAI JAHAJ', 615000);
INSERT INTO CATALOG (Product_ID,MODEL_, MODEL_DESCRIPTION,Price) VALUES ('PROD3','BOEING 777', 'HAWAI JAHAJ', 5600000);
INSERT INTO CATALOG (Product_ID,MODEL_, MODEL_DESCRIPTION,Price) VALUES ('PROD4','AIRBUS A330', 'HAWAI JAHAJ', 450000);
INSERT INTO CATALOG (Product_ID,MODEL_, MODEL_DESCRIPTION,Price) VALUES ('PROD5','AIRBUS A380', 'HAWAI JAHAJ', 3500000);


--Inserting Data in table Parts_Inventory
INSERT INTO  PARTS_INVENTORY (Part_ID,Part_Name,Part_Stock) VALUES ('P101','Gil',12);
INSERT INTO  PARTS_INVENTORY (Part_ID,Part_Name,Part_Stock) VALUES ('P102','Deacon',79);
INSERT INTO  PARTS_INVENTORY (Part_ID,Part_Name,Part_Stock) VALUES ('P103','Cyrus',43);
INSERT INTO  PARTS_INVENTORY (Part_ID,Part_Name,Part_Stock) VALUES ('P104','Quyn',81);
INSERT INTO  PARTS_INVENTORY (Part_ID,Part_Name,Part_Stock) VALUES ('P105','Blair',35);

-- Inserting Data in table MODEL_DETAILS
INSERT INTO MODEL_DETAILS (Product_ID,MODEL_DESCRIPTION,Date_Manufactured,MODEL_) VALUES ('PROD1','libero. tesque a, facilisis','02-07-20','G3W 2F3');
INSERT INTO MODEL_DETAILS (Product_ID,MODEL_DESCRIPTION,Date_Manufactured,MODEL_) VALUES ('PROD2','adipiscingut, molestie in,','12-10-20','K5C 0S7');
INSERT INTO MODEL_DETAILS (Product_ID,MODEL_DESCRIPTION,Date_Manufactured,MODEL_) VALUES ('PROD3','purus, rci. Ut sagittis','05-07-20','C2U 1D8');
INSERT INTO MODEL_DETAILS (Product_ID,MODEL_DESCRIPTION,Date_Manufactured,MODEL_) VALUES ('PROD4','sem egeaconvallis in,','05-06-21','G8C 2H5');
INSERT INTO MODEL_DETAILS (Product_ID,MODEL_DESCRIPTION,Date_Manufactured,MODEL_) VALUES ('PROD5','lobortiser euismod est arcu ac','02-07-20','E8C 5K4');

--Inserting Data in table Distributor
INSERT INTO DISTRIBUTOR (Distributor_ID,Distributor_Name,Address,MODEL_) VALUES ('D101','Congue LLP','Langford','Short');
INSERT INTO DISTRIBUTOR (Distributor_ID,Distributor_Name,Address,MODEL_) VALUES ('D102','Arcu Curabitur Associates','Lanklaar','Farmer');
INSERT INTO DISTRIBUTOR (Distributor_ID,Distributor_Name,Address,MODEL_) VALUES ('D103','Ornare Incorporated','San Antonio','Walters');
INSERT INTO DISTRIBUTOR (Distributor_ID,Distributor_Name,Address,MODEL_) VALUES ('D104','Tellus Lorem Eu Associates','Saint-Leonard','Mcbride');
INSERT INTO DISTRIBUTOR (Distributor_ID,Distributor_Name,Address,MODEL_) VALUES ('D105','Lectus Justo LLC','Mazatlán','Wallace');

--Inserting Data in table MODEL_Blueprint

INSERT INTO MODEL_Blueprint (MODEL_,Qty,Part_ID,Blueprint_ID) VALUES ('BOEING 747','2','P101','B1');
INSERT INTO MODEL_Blueprint (MODEL_,Qty,Part_ID,Blueprint_ID) VALUES ('AIRBUS A320','2','P102','B2');
INSERT INTO MODEL_Blueprint (MODEL_,Qty,Part_ID,Blueprint_ID) VALUES ('BOEING 777','2','P103','B3');
INSERT INTO MODEL_Blueprint (MODEL_,Qty,Part_ID,Blueprint_ID) VALUES ('AIRBUS A330','2','P104','B4');
INSERT INTO MODEL_Blueprint (MODEL_,Qty,Part_ID,Blueprint_ID) VALUES ('AIRBUS A380','2','P105','B5');

--Inserting Data in table MANUFACTURING
INSERT INTO MANUFACTURING (Airplane_Number,Date_Manufactured,MODEL_,Status) VALUES ('AIR1','09-07-21','Rashad','Hoyt');
INSERT INTO MANUFACTURING (Airplane_Number,Date_Manufactured,MODEL_,Status) VALUES ('AIR2','03-10-21','Colton','Maxwell');
INSERT INTO MANUFACTURING (Airplane_Number,Date_Manufactured,MODEL_,Status) VALUES ('AIR3','03-10-20','Wyatt','Armand');
INSERT INTO MANUFACTURING (Airplane_Number,Date_Manufactured,MODEL_,Status) VALUES ('AIR4','05-10-20','Ryder','Giacomo');
INSERT INTO MANUFACTURING (Airplane_Number,Date_Manufactured,MODEL_,Status) VALUES ('AIR5','03-10-21','Kennan','Reed');

-- Inserting Data in table Department
INSERT INTO DEPARTMENT (Department_ID,Department_Name) VALUES ('D101','Nash');
INSERT INTO DEPARTMENT (Department_ID,Department_Name) VALUES ('D102','Remedios');
INSERT INTO DEPARTMENT (Department_ID,Department_Name) VALUES ('D103','Amber');
INSERT INTO DEPARTMENT (Department_ID,Department_Name) VALUES ('D104','Fletcher');
INSERT INTO DEPARTMENT (Department_ID,Department_Name) VALUES ('D105','Quinn');

--Inserting Data in table Supplier
INSERT INTO SUPPLIER (Supplier_ID,Supplier_Name,Supplier_Address,Contact_Info,Part_Name,Part_ID) VALUES ('S101','Deviprasad','Bhandup','19317409513','Colby','P101');
INSERT INTO SUPPLIER (Supplier_ID,Supplier_Name,Supplier_Address,Contact_Info,Part_Name,Part_ID) VALUES ('S102','Shyam','Bhubaneswar','16051239617','Inez','P102');
INSERT INTO SUPPLIER (Supplier_ID,Supplier_Name,Supplier_Address,Contact_Info,Part_Name,Part_ID) VALUES ('S103','Raju','Ulhasnagar','10004992','jAADU','P103');
INSERT INTO SUPPLIER (Supplier_ID,Supplier_Name,Supplier_Address,Contact_Info,Part_Name,Part_ID) VALUES ('S104','Hoxuan Xu','Nashik','12102720115','Armand','P104');
INSERT INTO SUPPLIER (Supplier_ID,Supplier_Name,Supplier_Address,Contact_Info,Part_Name,Part_ID) VALUES ('S105','Palash','Boston','17495443883','Jemima','P105');



--Inserting Data in table Supplier_Order
INSERT INTO Supplier_Order (Order_ID,Part_ID,Part_Qty,Order_Date,Supplier_ID) VALUES ('O101','P101','3','04-01-20','S101');
INSERT INTO Supplier_Order (Order_ID,Part_ID,Part_Qty,Order_Date,Supplier_ID) VALUES ('O102','P102','3','05-10-20','S102');
INSERT INTO Supplier_Order (Order_ID,Part_ID,Part_Qty,Order_Date,Supplier_ID) VALUES ('O103','P103','3','07-10-20','S103');
INSERT INTO Supplier_Order (Order_ID,Part_ID,Part_Qty,Order_Date,Supplier_ID) VALUES ('O104','P104','3','05-10-20','S104');
INSERT INTO Supplier_Order (Order_ID,Part_ID,Part_Qty,Order_Date,Supplier_ID) VALUES ('O105','P105','3','05-10-21','S105');

--Inserting Data in table INVOICE
INSERT INTO INVOICE (Invoice_ID,Part_Qty,Invoice_Date,Shipping_Number,Order_ID_Status,Part_ID,Supplier_ID,Order_ID) VALUES ('I101',29,'10-03-21',2180,'Harlan','P101','S101','O101');
INSERT INTO INVOICE (Invoice_ID,Part_Qty,Invoice_Date,Shipping_Number,Order_ID_Status,Part_ID,Supplier_ID,Order_ID) VALUES ('I102',36,'10-10-20',3132,'Abel','P102','S102','O102');
INSERT INTO INVOICE (Invoice_ID,Part_Qty,Invoice_Date,Shipping_Number,Order_ID_Status,Part_ID,Supplier_ID,Order_ID) VALUES ('I103',23,'09-09-21',8022,'Sylvester','P103','S103','O103');
INSERT INTO INVOICE (Invoice_ID,Part_Qty,Invoice_Date,Shipping_Number,Order_ID_Status,Part_ID,Supplier_ID,Order_ID) VALUES ('I104',35,'09-09-21',5790,'Ishmael','P104','S104','O104');
INSERT INTO INVOICE (Invoice_ID,Part_Qty,Invoice_Date,Shipping_Number,Order_ID_Status,Part_ID,Supplier_ID,Order_ID) VALUES ('I105',10,'10-10-21',2742,'Robert','P105','S105','O105');

--Inserting Data in table QUALITY
INSERT INTO QUALITY (Inspection_ID,Inspectiondate,Status,Airplane_Number,DEPARTMENT_ID) VALUES ('IN101','05-05-20','Cameron','AIR1','D101');
INSERT INTO QUALITY (Inspection_ID,Inspectiondate,Status,Airplane_Number,DEPARTMENT_ID) VALUES ('IN102','05-03-21','Fitzgerald','AIR2','D102');
INSERT INTO QUALITY (Inspection_ID,Inspectiondate,Status,Airplane_Number,DEPARTMENT_ID) VALUES ('IN103','11-06-21','Grant','AIR3','D103');
INSERT INTO QUALITY (Inspection_ID,Inspectiondate,Status,Airplane_Number,DEPARTMENT_ID) VALUES ('IN104','08-07-21','Randall','AIR4','D104');
INSERT INTO QUALITY (Inspection_ID,Inspectiondate,Status,Airplane_Number,DEPARTMENT_ID) VALUES ('IN105','08-05-21','Jin','AIR5','D105');

--Inserting Data in table WAREHOUSE
INSERT INTO WAREHOUSE (Item_no,Product_ID,MODEL_,Price,StockOnHand,Distributor_ID) VALUES ('IT1','PROD1','Rogan',2702114,5,'D101');
INSERT INTO WAREHOUSE (Item_no,Product_ID,MODEL_,Price,StockOnHand,Distributor_ID) VALUES ('IT2','PROD2','Jakeem',3929447,6,'D102');
INSERT INTO WAREHOUSE (Item_no,Product_ID,MODEL_,Price,StockOnHand,Distributor_ID) VALUES ('IT3','PROD3','Hayden',8355240,2,'D103');
INSERT INTO WAREHOUSE (Item_no,Product_ID,MODEL_,Price,StockOnHand,Distributor_ID) VALUES ('IT4','PROD4','Gabriel',9093692,2,'D104');
INSERT INTO WAREHOUSE (Item_no,Product_ID,MODEL_,Price,StockOnHand,Distributor_ID) VALUES ('IT5','PROD5','Wyatt',2029656,18,'D105');

--Inserting Data in table CUSTOMER_ORDER
INSERT INTO CUSTOMER_ORDER (Customer_ID,MODEL_,Amount,DateTime,Quantity,CustOrder_ID) VALUES ('C10001','Octavius',74959,'05-08-20',22,'CUST1');
INSERT INTO CUSTOMER_ORDER (Customer_ID,MODEL_,Amount,DateTime,Quantity,CustOrder_ID) VALUES ('C10002','Kelly',59666,'03-08-21',10,'CUST2');
INSERT INTO CUSTOMER_ORDER (Customer_ID,MODEL_,Amount,DateTime,Quantity,CustOrder_ID) VALUES ('C10003','Eaton',88342,'08-08-20',15,'CUST3');
INSERT INTO CUSTOMER_ORDER (Customer_ID,MODEL_,Amount,DateTime,Quantity,CustOrder_ID) VALUES ('C10004','August',63934,'02-08-20',23,'CUST4');
INSERT INTO CUSTOMER_ORDER (Customer_ID,MODEL_,Amount,DateTime,Quantity,CustOrder_ID) VALUES ('C10005','Victor',61403,'12-08-19',15,'CUST5');

--Inserting Data in table Repair_Product
INSERT INTO REPAIR_PRODUCT (Repair_ID,Defect_Description,Airplane_Number,Inspection_ID) VALUES ('R101','luctus aliquet odio.','AIR1','IN101');
INSERT INTO REPAIR_PRODUCT (Repair_ID,Defect_Description,Airplane_Number,Inspection_ID) VALUES ('R102','nec tempus mauris erat eget','AIR2','IN102');
INSERT INTO REPAIR_PRODUCT (Repair_ID,Defect_Description,Airplane_Number,Inspection_ID) VALUES ('R103','vitae risus. ia','AIR3','IN103');
INSERT INTO REPAIR_PRODUCT (Repair_ID,Defect_Description,Airplane_Number,Inspection_ID) VALUES ('R104','consectetue Curabitur','AIR4','IN104');
INSERT INTO REPAIR_PRODUCT (Repair_ID,Defect_Description,Airplane_Number,Inspection_ID) VALUES ('R105','tincidunt. Donec','AIR5','IN105');


-- Inserting Data in table Customer_Bill
INSERT INTO CUSTOMER_BILL (Bill_ID,MODEL_,Amount,Delivery_Status,Product_ID,Customer_ID,Delivery_Date) VALUES ('B101','W4L 8Y9',838,'Charlotte','PROD1','C10001','10-08-20');
INSERT INTO CUSTOMER_BILL (Bill_ID,MODEL_,Amount,Delivery_Status,Product_ID,Customer_ID,Delivery_Date) VALUES ('B102','I5O 4P3',764,'Oscar','PROD2','C10002','05-10-20');
INSERT INTO CUSTOMER_BILL (Bill_ID,MODEL_,Amount,Delivery_Status,Product_ID,Customer_ID,Delivery_Date) VALUES ('B103','G4A 5W0',895,'Xerxes','PROD3','C10003','10-09-20');
INSERT INTO CUSTOMER_BILL (Bill_ID,MODEL_,Amount,Delivery_Status,Product_ID,Customer_ID,Delivery_Date) VALUES ('B104','P1E 3L2',778,'Danielle','PROD4','C10004','11-08-20');
INSERT INTO CUSTOMER_BILL (Bill_ID,MODEL_,Amount,Delivery_Status,Product_ID,Customer_ID,Delivery_Date) VALUES ('B105','S9V 5Y3',787,'Garrison','PROD5','C10005','06-04-20');

-- Inserting Data in table Employee
INSERT INTO EMPLOYEES (Employee_ID,Department_ID,First_Name,Last_Name,Address,SSN,DOB) VALUES ('E101','D101','Eaton','Gomez','Cochrane',628,'10-01-68');
INSERT INTO EMPLOYEES (Employee_ID,Department_ID,First_Name,Last_Name,Address,SSN,DOB) VALUES ('E102','D102','Mary','Davis','Ostra Vetere',763,'02-10-67');
INSERT INTO EMPLOYEES (Employee_ID,Department_ID,First_Name,Last_Name,Address,SSN,DOB) VALUES ('E103','D103','Alisa','Olsen','Harnai',538,'04-05-00');
INSERT INTO EMPLOYEES (Employee_ID,Department_ID,First_Name,Last_Name,Address,SSN,DOB) VALUES ('E104','D104','Flavia','Mcknight','Landau',552,'12-10-62');
INSERT INTO EMPLOYEES (Employee_ID,Department_ID,First_Name,Last_Name,Address,SSN,DOB) VALUES ('E105','D105','Rudyard','Hyde','Quenast',535,'03-12-89');

