--Table Drop Commands
DROP TABLE CUSTOMER CASCADE CONSTRAINTS;
DROP TABLE CATALOG CASCADE CONSTRAINTS;
DROP TABLE DISTRIBUTOR CASCADE CONSTRAINTS;
DROP TABLE  PARTS_INVENTORY CASCADE CONSTRAINTS;
DROP TABLE SUPPLIER CASCADE CONSTRAINTS;
DROP TABLE REPAIR_PRODUCT CASCADE CONSTRAINTS;
DROP TABLE MODEL_DETAILS CASCADE CONSTRAINTS;
DROP TABLE CUSTOMER_BILL CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEES CASCADE CONSTRAINTS;
DROP TABLE DEPARTMENT CASCADE CONSTRAINTS;

DROP SEQUENCE cust_id;
DROP SEQUENCE part_id;
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
  MODEL VARCHAR (10) NOT NULL PRIMARY KEY,
  Model_Description VARCHAR(30),
  Price FLOAT,
  FOREIGN KEY (Product_ID) references MODEL_DETAILS(Product_ID)
);

--Creating Distributor Table
CREATE TABLE DISTRIBUTOR (
  Distributor_ID VARCHAR(10) NOT NULL PRIMARY KEY,
  Distributor_Name VARCHAR (30),
  Address VARCHAR (30),
  MODEL VARCHAR(10)
);

--Creating Table Parts_Inventory
  CREATE TABLE PARTS_INVENTORY(
  Part_ID VARCHAR(10) NOT NULL PRIMARY KEY,
  Part_Name VARCHAR(20),
  Part_Stock INT
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

--Creating Table Repair_Product  
   CREATE TABLE REPAIR_PRODUCT(
   Repair_ID VARCHAR(10) NOT NULL PRIMARY KEY,
   Defect_Description VARCHAR(30), 
   Airplane_Number VARCHAR(10),
   Inspection_ID VARCHAR(10),
   FOREIGN KEY (Inspection_ID) references QUALITY(Inspection_ID),
   FOREIGN KEY (Airplane_Number) references MANUFACTURING(Airplane_Number)
   );
  
--Creating Table Model_Details 
   CREATE TABLE MODEL_DETAILS(
   Product_ID VARCHAR(10) NOT NULL PRIMARY KEY,
   Model_Description VARCHAR(30), 
   Date_Manufactured DATE,
   MODEL VARCHAR(10)
   );

--Creating Table Customer_Bill
   CREATE TABLE CUSTOMER_BILL(
   Bill_ID VARCHAR(10) NOT NULL PRIMARY KEY,
   MODEL VARCHAR(10), 
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
   FOREIGN KEY (Department_ID) references CUSTOMER(Department_ID)
   );

--Creating Table Department
   CREATE TABLE DEPARTMENT(
   Department_ID VARCHAR(10) NOT NULL PRIMARY KEY,
   Department_Name VARCHAR(30)
   );
   

  
--Creating Sequence for Customer Table
CREATE SEQUENCE cust_id
    START WITH 10001
    INCREMENT BY 1
    ORDER;

--Creating Sequence for Parts_Inventory Table    
  CREATE SEQUENCE part_id
    START WITH 500
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

--Inserting Data in table Distributor
INSERT INTO DISTRIBUTOR (Distributor_ID,Distributor_Name,Address,MODEL) VALUES ('T2V 2B6','Congue LLP','Langford','Short');
INSERT INTO DISTRIBUTOR (Distributor_ID,Distributor_Name,Address,MODEL) VALUES ('L0H 0A6','Arcu Curabitur Associates','Lanklaar','Farmer');
INSERT INTO DISTRIBUTOR (Distributor_ID,Distributor_Name,Address,MODEL) VALUES ('X0H 6A1','Ornare Incorporated','San Antonio','Walters');
INSERT INTO DISTRIBUTOR (Distributor_ID,Distributor_Name,Address,MODEL) VALUES ('A4G 6H9','Tellus Lorem Eu Associates','Saint-Leonard','Mcbride');
INSERT INTO DISTRIBUTOR (Distributor_ID,Distributor_Name,Address,MODEL) VALUES ('R1F 1O6','Lectus Justo LLC','Mazatlán','Wallace');

--Inserting Data in table Parts_Inventory
INSERT INTO  PARTS_INVENTORY (Part_ID,Part_Name,Part_Stock) VALUES (part_id.NEXTVAL,'Gil',12);
INSERT INTO  PARTS_INVENTORY (Part_ID,Part_Name,Part_Stock) VALUES (part_id.NEXTVAL,'Deacon',79);
INSERT INTO  PARTS_INVENTORY (Part_ID,Part_Name,Part_Stock) VALUES (part_id.NEXTVAL,'Cyrus',43);
INSERT INTO  PARTS_INVENTORY (Part_ID,Part_Name,Part_Stock) VALUES (part_id.NEXTVAL,'Quyn',81);
INSERT INTO  PARTS_INVENTORY (Part_ID,Part_Name,Part_Stock) VALUES (part_id.NEXTVAL,'Blair',35);

--Inserting Data in table Supplier
INSERT INTO SUPPLIER (Supplier_ID,Supplier_Name,Supplier_Address,Contact_Info,Part_Name,Part_ID) VALUES ('03251','Hendrerit Consectetuer Cursus Ltd','Söderhamn','1-931-740-9513','Colby',89);
INSERT INTO SUPPLIER (Supplier_ID,Supplier_Name,Supplier_Address,Contact_Info,Part_Name,Part_ID) VALUES ('23709','Vestibulum LLP','Bhubaneswar','1-605-123-9617','Inez',69);
INSERT INTO SUPPLIER (Supplier_ID,Supplier_Name,Supplier_Address,Contact_Info,Part_Name,Part_ID) VALUES ('23752','Sem Magna Nec Associates','Herne','1-667-292-1430','Maya',78);
INSERT INTO SUPPLIER (Supplier_ID,Supplier_Name,Supplier_Address,Contact_Info,Part_Name,Part_ID) VALUES ('45696','Arcu Imperdiet LLP','Vrasene','1-210-272-0115','Armand',54);
INSERT INTO SUPPLIER (Supplier_ID,Supplier_Name,Supplier_Address,Contact_Info,Part_Name,Part_ID) VALUES ('83538','Aliquam Adipiscing PC','Lac Ste. Anne','1-749-544-3883','Jemima',7);

--Inserting Data in table Repair_Product
INSERT INTO REPAIR_PRODUCT (Repair_ID,Defect_Description,Airplane_Number,Inspection_ID) VALUES (2RPID,'luctus aliquet odio.','dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est','senectus et netus et malesuada fames ac turpis egestas. Aliquam');
INSERT INTO REPAIR_PRODUCT (Repair_ID,Defect_Description,Airplane_Number,Inspection_ID) VALUES (4RPID,'nec tempus mauris erat eget','mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id','Sed auctor odio a purus. Duis elementum, dui quis accumsan');
INSERT INTO REPAIR_PRODUCT (Repair_ID,Defect_Description,Airplane_Number,Inspection_ID) VALUES (6RPID,'vitae risus. Duis a mi fringilla mi lacinia','eget nisi dictum augue malesuada malesuada. Integer id magna et','magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim');
INSERT INTO REPAIR_PRODUCT (Repair_ID,Defect_Description,Airplane_Number,Inspection_ID) VALUES (8RPID,'consectetuer adipiscing elit. Curabitur','magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed,','eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed');
INSERT INTO REPAIR_PRODUCT (Repair_ID,Defect_Description,Airplane_Number,Inspection_ID) VALUES (10RPID,'tincidunt. Donec','non justo. Proin non massa non ante bibendum ullamcorper. Duis','rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at,');

-- Inserting Data in table Model_Details
INSERT INTO MODEL_DETAILS (Product_ID,Model_Description,Date_Manufactured,MODEL) VALUES (2PROD,'libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis','02-19-20','G3W 2F3');
INSERT INTO MODEL_DETAILS (Product_ID,Model_Description,Date_Manufactured,MODEL) VALUES (6PROD,'adipiscing lobortis risus. In mi pede, nonummy ut, molestie in,','12-27-20','K5C 0S7');
INSERT INTO MODEL_DETAILS (Product_ID,Model_Description,Date_Manufactured,MODEL) VALUES (10PROD,'purus, in molestie tortor nibh sit amet orci. Ut sagittis','05-30-20','C2U 1D8');
INSERT INTO MODEL_DETAILS (Product_ID,Model_Description,Date_Manufactured,MODEL) VALUES (14PROD,'sem egestas blandit. Nam nulla magna, malesuada vel, convallis in,','05-06-21','G8C 2H5');
INSERT INTO MODEL_DETAILS (Product_ID,Model_Description,Date_Manufactured,MODEL) VALUES (18PROD,'lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac','02-07-20','E8C 5K4');

-- Inserting Data in table Customer_Bill
INSERT INTO CUSTOMER_BILL (Bill_ID,MODEL,Amount,Delivery_Status,Product_ID,Customer_ID,Delivery_Date) VALUES (202BILL,'W4L 8Y9',838,'Charlotte',22PID,CID,'20-08-20');
INSERT INTO CUSTOMER_BILL (Bill_ID,MODEL,Amount,Delivery_Status,Product_ID,Customer_ID,Delivery_Date) VALUES (203BILL,'I5O 4P3',764,'Oscar',23PID,CID,'05-10-20');
INSERT INTO CUSTOMER_BILL (Bill_ID,MODEL,Amount,Delivery_Status,Product_ID,Customer_ID,Delivery_Date) VALUES (204BILL,'G4A 5W0',895,'Xerxes',24PID,CID,'18-09-20');
INSERT INTO CUSTOMER_BILL (Bill_ID,MODEL,Amount,Delivery_Status,Product_ID,Customer_ID,Delivery_Date) VALUES (205BILL,'P1E 3L2',778,'Danielle',25PID,CID,'13-08-20');
INSERT INTO CUSTOMER_BILL (Bill_ID,MODEL,Amount,Delivery_Status,Product_ID,Customer_ID,Delivery_Date) VALUES (206BILL,'S9V 5Y3',787,'Garrison',26PID,CID,'24-04-20');

-- Inserting Data in table Employee
INSERT INTO EMPLOYEES (Employee_ID,Department_ID,First_Name,Last_Name,Address,SSN,DOB) VALUES (101,DEPT01,'Eaton','Gomez','Cochrane',628,'13-01-68');
INSERT INTO EMPLOYEES (Employee_ID,Department_ID,First_Name,Last_Name,Address,SSN,DOB) VALUES (202,DEPT02,'Mary','Davis','Ostra Vetere',763,'02-10-67');
INSERT INTO EMPLOYEES (Employee_ID,Department_ID,First_Name,Last_Name,Address,SSN,DOB) VALUES (303,DEPT03,'Alisa','Olsen','Harnai',538,'20-05-00');
INSERT INTO EMPLOYEES (Employee_ID,Department_ID,First_Name,Last_Name,Address,SSN,DOB) VALUES (404,DEPT04,'Flavia','Mcknight','Landau',552,'13-10-62');
INSERT INTO EMPLOYEES (Employee_ID,Department_ID,First_Name,Last_Name,Address,SSN,DOB) VALUES (505,DEPT05,'Rudyard','Hyde','Quenast',535,'03-12-89');

-- Inserting Data in table Department
INSERT INTO DEPARTMENT (Department_ID,Department_Name) VALUES (DEPT01,'Nash');
INSERT INTO DEPARTMENT (Department_ID,Department_Name) VALUES (DEPT02,'Remedios');
INSERT INTO DEPARTMENT (Department_ID,Department_Name) VALUES (DEPT03,'Amber');
INSERT INTO DEPARTMENT (Department_ID,Department_Name) VALUES (DEPT04,'Fletcher');
INSERT INTO DEPARTMENT (Department_ID,Department_Name) VALUES (DEPT05,'Quinn');













