## INDEX TO CHECK FIND AN EMPLOYEE USING THEIR FIRST AND LAST NAME

DROP INDEX idx_emp_name;
CREATE INDEX idx_emp_name
ON employees (First_Name,Last_Name);

SELECT * FROM employees WHERE first_name = 'Mary' AND last_name= 'Davis' ;

EXPLAIN PLAN FOR SELECT * FROM employees WHERE first_name = 'Mary' AND last_name= 'Davis';
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);


****************************
##INDEX TO CHECK THE PRICE FOR A MODEL WITHING A PRICE RANGE 

DROP INDEX idx_model_price;
CREATE INDEX idx_model_price
ON catalog (Price);

SELECT * FROM catalog WHERE price BETWEEN 400000 AND 750000;

EXPLAIN PLAN FOR SELECT * FROM catalog WHERE price BETWEEN 400000 AND 750000;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

