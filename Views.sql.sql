--DISTRIBUTOR DEPARTMENT CAN VIEW PRODUCTS THAT ARE HIGHER THAN AVERAGE PRICE
CREATE VIEW Products_Above_Average_Price AS
SELECT MODEL_,Price
FROM catalog
WHERE Price > (SELECT AVG(Price) FROM catalog);

SELECT * FROM Products_Above_Average_Price;

--NUMBER OF ODERS PER YEAR FOR SALES DEPARTMENT
CREATE VIEW Number_Of_Orders_Per_Year AS
SELECT EXTRACT(year FROM datetime) "Year",
  COUNT(quantity) "No. of Orders"
  FROM customer_order
  GROUP BY EXTRACT(year FROM datetime)
  ORDER BY "No. of Orders" DESC;
  
SELECT * FROM Number_Of_Orders_Per_Year;

DROP VIEW Number_Of_Orders_Per_Year;

