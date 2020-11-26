--Table Drop Commands
DROP TABLE CUSTOMER CASCADE CONSTRAINTS;
DROP TABLE CATALOG CASCADE CONSTRAINTS;
DROP SEQUENCE cust_id;
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
  Price FLOAT
);

--Creating Sequence for Customer Table
CREATE SEQUENCE cust_id
    START WITH 10001
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
