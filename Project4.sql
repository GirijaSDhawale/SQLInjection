--Table Drop Commands
DROP TABLE CUSTOMER CASCADE CONSTRAINTS;
DROP TABLE CATALOG CASCADE CONSTRAINTS;
DROP TABLE Model_Blueprint CASCADE CONSTRAINTS;
DROP TABLE Supplier_Order CASCADE CONSTRAINTS;
DROP SEQUENCE cust_id CASCADE CONSTRAINTS;
DROP TABLE INVOICE CASCADE CONSTRAINTS;
DROP TABLE MANUFACTURING CASCADE CONSTRAINTS;
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
  Product_ID VARCHAR(10),
  MODEL VARCHAR (10),
  Model_Description VARCHAR(30),
  Price FLOAT,
  FOREIGN KEY (Product_ID) references MODELDETAILS(Product_ID)
);

--Creating Table Model_Blueprint
CREATE TABLE Model_Blueprint (
  MODEL VARCHAR(10),
  Qty INT,
  Part_ID VARCHAR(10),
  FOREIGN KEY (Part_ID) references PARTS_INVENTORY(Part_ID)
  Blueprint_ID VARCHAR (10)
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

--Creating Table MANUFACTURING
CREATE TABLE MANUFACTURING (
  Airplane_Number VARCHAR  (10) NOT NULL PRIMARY KEY,
  Date_Manufactured DATE,
  MODEL VARCHAR (10),
  Status VARCHAR (10),
);

--Creating Table QUALITY
CREATE TABLE QUALITY  (
  Inspection_ID VARCHAR (10) NOT NULL PRIMARY KEY,
  Inspectiondate DATE,
  Status VARCHAR (10),
  Airplane_Number VARCHAR (10),
  DepartmentID VARCHAR (10),
   FOREIGN KEY (Airplane_Number) references MANUFACTURING(Airplane_Number),
   FOREIGN KEY (DepartmentID) references Departments (DepartmentID)
);

--Creating Table WAREHOUSE
CREATE TABLE WAREHOUSE (
  Item_no VARCHAR (10) NOT NULL PRIMARY KEY,
  Product_ID VARCHAR(10),
  MODEL VARCHAR(10),
  Price FLOAT,
  StockOnHand INT,
  Distributor_ID VARCHAR (10),
   FOREIGN KEY (Product_ID) references MODELDETAILS (Product_ID),
   FOREIGN KEY (MODEL) references CATALOG (MODEL),
   FOREIGN KEY (Distributor_ID) references DISTRIBUTOR (Distributor_ID)
);

--Creating Table CUSTOMER_ORDER
CREATE TABLE CUSTOMER_ORDER (
  Customer_ID VARCHAR(10),
  MODEL VARCHAR (10),
  Amount FLOAT,
  DateTime DATE,
  Quantity INT,
  CustOrder_ID VARCHAR(10) NOT NULL PRIMARY KEY,
   FOREIGN KEY (Customer_ID) references CUSTOMER(Customer_ID),
   FOREIGN KEY (MODEL) references CATALOG(MODEL)
);
--Creating Sequence for Customer Table
CREATE SEQUENCE cust_id
    START WITH 10001
    INCREMENT BY 1
    ORDER;
    
--Creating Sequence for Model_Blueprint Table
CREATE SEQUENCE blue_id
    START WITH 20001
    INCREMENT BY 1
    ORDER;
    
--Creating Sequence for Supplier_Order Table
CREATE SEQUENCE order_i
    START WITH 100
    INCREMENT BY 1
    ORDER;

--Creating Sequence for INVOICE Table
CREATE SEQUENCE inv_id
    START WITH 6000
    INCREMENT BY 1
    ORDER;
    
--Creating Sequence for MANUFACTURING Table
CREATE SEQUENCE Air_no
    START WITH 100
    INCREMENT BY 10
    ORDER;

--Creating Sequence for QUALITY Table
CREATE SEQUENCE i_id
    START WITH 80
    INCREMENT BY 2
    ORDER;
    
--Creating Sequence for WAREHOUSE Table
CREATE SEQUENCE it_no
    START WITH 1
    INCREMENT BY 1
    ORDER;
    
--Creating Sequence for CUSTOMER_ORDER Table
CREATE SEQUENCE custorder
    START WITH 1
    INCREMENT BY 1
    ORDER;
    
--Inserting Data in table Customer
INSERT INTO CUSTOMER (Customer_ID,First_Name,Last_Name,Address,Phone) VALUES (cust_id.NEXTVAL,'Marsden','Flynn','Ap #922-2226 Eu Rd.',1-776-423-8576);
INSERT INTO CUSTOMER (Customer_ID,First_Name,Last_Name,Address,Phone) VALUES (cust_id.NEXTVAL,'Uriel','Meyer','597-8319 Magna. Street',1-135-317-3205);
INSERT INTO CUSTOMER (Customer_ID,First_Name,Last_Name,Address,Phone) VALUES (cust_id.NEXTVAL,'Hayden','Shields','7978 Dui Street',1-879-150-3664);
INSERT INTO CUSTOMER (Customer_ID,First_Name,Last_Name,Address,Phone) VALUES (cust_id.NEXTVAL,'Anthony','Battle','9295 A, Street',1-403-181-0725);
INSERT INTO CUSTOMER (Customer_ID,First_Name,Last_Name,Address,Phone) VALUES (cust_id.NEXTVAL,'Drake','Espinoza','221-120 Ut Ave',1-205-199-2765);



--Inserting Data in table Catalog
INSERT INTO CATALOG (MODEL, Model_Description,Price) VALUES ('BOEING 747', 'HAWAI JAHAJ', 9000000);
INSERT INTO CATALOG (MODEL, Model_Description,Price) VALUES ('AIRBUS A320', 'HAWAI JAHAJ', 615000);
INSERT INTO CATALOG (MODEL, Model_Description,Price) VALUES ('BOEING 777', 'HAWAI JAHAJ', 5600000);
INSERT INTO CATALOG (MODEL, Model_Description,Price) VALUES ('AIRBUS A330', 'HAWAI JAHAJ', 450000);
INSERT INTO CATALOG (MODEL, Model_Description,Price) VALUES ('AIRBUS A380', 'HAWAI JAHAJ', 3500000);

--Inserting Data in table Model_Blueprint

INSERT INTO Model_Blueprint (MODEL,Qty,Part_ID,Blueprint_ID) VALUES ('BOEING 747','2','03150',448);
INSERT INTO Model_Blueprint (MODEL,Qty,Part_ID,Blueprint_ID) VALUES ('AIRBUS A320','2','68900',820);
INSERT INTO Model_Blueprint (MODEL,Qty,Part_ID,Blueprint_ID) VALUES ('BOEING 777','2','68733',171);
INSERT INTO Model_Blueprint (MODEL,Qty,Part_ID,Blueprint_ID) VALUES ('AIRBUS A330','2','82047',765);
INSERT INTO Model_Blueprint (MODEL,Qty,Part_ID,Blueprint_ID) VALUES ('AIRBUS A380','2','01346',939);

--Inserting Data in table Supplier_Order
INSERT INTO Supplier_Order (Order_ID,Part_ID,Part_Qty,Order_Date,Supplier_ID) VALUES (order_i.NEXTVAL,'71014','3','04-01-20','61399');
INSERT INTO Supplier_Order (Order_ID,Part_ID,Part_Qty,Order_Date,Supplier_ID) VALUES (order_i.NEXTVAL,'18916','3','05-27-20','48016');
INSERT INTO Supplier_Order (Order_ID,Part_ID,Part_Qty,Order_Date,Supplier_ID) VALUES (order_i.NEXTVAL,'63196','3','07-08-20','61077');
INSERT INTO Supplier_Order (Order_ID,Part_ID,Part_Qty,Order_Date,Supplier_ID) VALUES (order_i.NEXTVAL,'62758','3','05-28-20','73489');
INSERT INTO Supplier_Order (Order_ID,Part_ID,Part_Qty,Order_Date,Supplier_ID) VALUES (order_i.NEXTVAL,'13501','3','05-29-21','93850');

--Inserting Data in table INVOICE
INSERT INTO INVOICE (Invoice_ID,Part_Qty,Invoice_Date,Shipping_Number,Order_ID_Status,Part_ID,Supplier_ID,Order_ID) VALUES (inv_id.NEXTVAL,29,'10-03-21',2180,'Harlan',4953,8,10);
INSERT INTO INVOICE (Invoice_ID,Part_Qty,Invoice_Date,Shipping_Number,Order_ID_Status,Part_ID,Supplier_ID,Order_ID) VALUES (inv_id.NEXTVAL,36,'10-17-20',3132,'Abel',2628,5,3);
INSERT INTO INVOICE (Invoice_ID,Part_Qty,Invoice_Date,Shipping_Number,Order_ID_Status,Part_ID,Supplier_ID,Order_ID) VALUES (inv_id.NEXTVAL,23,'09-24-21',8022,'Sylvester',3544,6,2);
INSERT INTO INVOICE (Invoice_ID,Part_Qty,Invoice_Date,Shipping_Number,Order_ID_Status,Part_ID,Supplier_ID,Order_ID) VALUES (inv_id.NEXTVAL,35,'09-25-21',5790,'Ishmael',3281,4,5);
INSERT INTO INVOICE (Invoice_ID,Part_Qty,Invoice_Date,Shipping_Number,Order_ID_Status,Part_ID,Supplier_ID,Order_ID) VALUES (inv_id.NEXTVAL,10,'10-10-21',2742,'Robert',2256,3,10);

--Inserting Data in table MANUFACTURING
INSERT INTO MANUFACTURING (Airplane_Number,Date_Manufactured,MODEL,Status) VALUES (Air_no.NEXTVAL,'09-07-21','Rashad','Hoyt');
INSERT INTO MANUFACTURING (Airplane_Number,Date_Manufactured,MODEL,Status) VALUES (Air_no.NEXTVAL,'03-20-21','Colton','Maxwell');
INSERT INTO MANUFACTURING (Airplane_Number,Date_Manufactured,MODEL,Status) VALUES (Air_no.NEXTVAL,'03-22-20','Wyatt','Armand');
INSERT INTO MANUFACTURING (Airplane_Number,Date_Manufactured,MODEL,Status) VALUES (Air_no.NEXTVAL,'05-17-20','Ryder','Giacomo');
INSERT INTO MANUFACTURING (Airplane_Number,Date_Manufactured,MODEL,Status) VALUES (Air_no.NEXTVAL,'03-20-21','Kennan','Reed');

--Inserting Data in table QUALITY
INSERT INTO QUALITY (Inspection_ID,Inspectiondate,Status,Airplane_Number,DepartmentID) VALUES (i_id.NEXTVAL,'20-05-20','Cameron','Yuri Wiggins',8);
INSERT INTO QUALITY (Inspection_ID,Inspectiondate,Status,Airplane_Number,DepartmentID) VALUES (i_id.NEXTVAL,'09-03-21','Fitzgerald','Nero Ayers',6);
INSERT INTO QUALITY (Inspection_ID,Inspectiondate,Status,Airplane_Number,DepartmentID) VALUES (i_id.NEXTVAL,'11-06-21','Grant','Wing Hudson',18);
INSERT INTO QUALITY (Inspection_ID,Inspectiondate,Status,Airplane_Number,DepartmentID) VALUES (i_id.NEXTVAL,'28-07-21','Randall','Meredith Donaldson',12);
INSERT INTO QUALITY (Inspection_ID,Inspectiondate,Status,Airplane_Number,DepartmentID) VALUES (i_id.NEXTVAL,'25-05-21','Jin','Carol Hopkins',6);

--Inserting Data in table WAREHOUSE
INSERT INTO WAREHOUSE (Item_no,Product_ID,MODEL,Price,StockOnHand,Distributor_ID) VALUES (it_no.NEXTVAL,'Kermit','Rogan',2702114,5,'Jamal');
INSERT INTO WAREHOUSE (Item_no,Product_ID,MODEL,Price,StockOnHand,Distributor_ID) VALUES (it_no.NEXTVAL,'Conan','Jakeem',3929447,6,'Kyle');
INSERT INTO WAREHOUSE (Item_no,Product_ID,MODEL,Price,StockOnHand,Distributor_ID) VALUES (it_no.NEXTVAL,'Abdul','Hayden',8355240,2,'Colton');
INSERT INTO WAREHOUSE (Item_no,Product_ID,MODEL,Price,StockOnHand,Distributor_ID) VALUES (it_no.NEXTVAL,'Gavin','Gabriel',9093692,2,'Lyle');
INSERT INTO WAREHOUSE (Item_no,Product_ID,MODEL,Price,StockOnHand,Distributor_ID) VALUES (it_no.NEXTVAL,'Cadman','Wyatt',2029656,18,'Paul');

--Inserting Data in table CUSTOMER_ORDER
INSERT INTO CUSTOMER_ORDER (Customer_ID,MODEL,Amount,DateTime,Quantity,CustOrder_ID) VALUES (12163,'Octavius',74959,'05-22-20',22,custorder.NEXTVAL);
INSERT INTO CUSTOMER_ORDER (Customer_ID,MODEL,Amount,DateTime,Quantity,CustOrder_ID) VALUES (96059,'Kelly',59666,'03-30-21',10,custorder.NEXTVAL);
INSERT INTO CUSTOMER_ORDER (Customer_ID,MODEL,Amount,DateTime,Quantity,CustOrder_ID) VALUES (56704,'Eaton',88342,'08-15-20',15,custorder.NEXTVAL);
INSERT INTO CUSTOMER_ORDER (Customer_ID,MODEL,Amount,DateTime,Quantity,CustOrder_ID) VALUES (95742,'August',63934,'02-16-20',23,custorder.NEXTVAL);
INSERT INTO CUSTOMER_ORDER (Customer_ID,MODEL,Amount,DateTime,Quantity,CustOrder_ID) VALUES (10222,'Victor',61403,'12-19-19',15,custorder.NEXTVAL);