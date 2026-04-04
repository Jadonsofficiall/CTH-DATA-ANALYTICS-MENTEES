-- Creating a table and inserting fields
CREATE TABLE manufacturer (
	car_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    car_model VARCHAR(100) NOT NULL,
    vehicle_type VARCHAR(100) NOT NULL)
    ;

-- Renaming a column or field
ALTER TABLE manufacturer
CHANGE name car_name VARCHAR(100);

-- Add a column or field
ALTER TABLE manufacturer
ADD COLUMN fuel_capacity DECIMAL(10, 2);

ALTER TABLE manufacturer
ADD COLUMN fuel_efficiency INT NOT NULL;

ALTER TABLE manufacturer
DROP PRIMARY KEY;

ALTER TABLE manufacturer
ADD PRIMARY KEY (car_id);

ALTER TABLE manufacturer
ADD COLUMN carsales_id INT NOT NULL;

ALTER TABLE manufacturer
MODIFY COLUMN carsales_id VARCHAR(100);

ALTER TABLE manufacturer
MODIFY COLUMN carsales_id INT NOT NULL;

CREATE TABLE sales (
	sales_id INT PRIMARY KEY NOT NULL,
    carsales_id INT NOT NULL,
    sales DECIMAL(10, 2) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    vehicle_type VARCHAR(100) NOT NULL,
    FOREIGN KEY (carsales_id) REFERENCES manufacturer(car_id))
    ;
    
ALTER TABLE sales
ADD COLUMN 	year_resale_value INT NOT NULL;

CREATE TABLE car_specs (
	cars_id INT PRIMARY KEY,
    engine_size DECIMAL(10, 2) NOT NULL,
    horsepower INT NOT NULL,
    wheelbase DECIMAL(10, 2) NOT NULL,
    width DECIMAL(10, 2) NOT NULL,
    length DECIMAL(10, 2) NOT NULL,
    power_perf_factor DECIMAL(10, 2) NOT NULL,
    curb_weight DECIMAL(10, 2) NOT NULL)
    ;

ALTER TABLE car_specs
ADD CONSTRAINT fk_car_specs
FOREIGN KEY (cars_id) REFERENCES manufacturer(car_id)
;

## Adding records to table fields

INSERT INTO sales ( sales_id, carsales_id, sales, price, vehicle_type, year_resale_value)
VALUES
	(1001, 20101, 169190.90, 21500.50, 'Passenger', 16360.90),
    (1002, 20102, 393845.50, 28405.00, 'Car', 19875.50),
    (1003, 20103, 141149.50, 30129.70, 'Paseenger', 18225.25),
    (1004, 20104, 858865.00, 42000.00, 'Passenger', 29725.50),
    (1005, 20105, 203975.60, 23995.50, 'Car', 22255.50),
    (1006, 20106, 187870.50, 33955.90, 'Car', 23555.00),
    (1007, 20107, 138000.00, 62000.00, 'Passenger', 39000.00),
    (1008, 20108, 197475.75, 26995.50, 'Car', 45955.50),
    (1009, 20109, 923195.00, 33400.60, 'Passenger', 28675.50),
    (1010, 20110, 175270.00, 389050.00, 'Car', 36125.90)
    ;
    
ALTER TABLE sales
DROP FOREIGN KEY sales_ibfk_1;

SHOW CREATE TABLE manufacturer;

ALTER TABLE manufacturer
ADD CONSTRAINT fk_manufacturer
FOREIGN KEY (car_id) REFERENCES sales(carsales_id)
;

SELECT *
FROM manufacturer;

INSERT INTO manufacturer ( car_id, car_name, car_model, vehicle_type, fuel_capacity, fuel_efficiency, carsales_id)
VALUES
	(1101, 'Acura', 'Integra', 'Passenger', 13.2, 28, 20101),
    (1102, 'Acura', 'TL', 'Car', 17.2, 28, 20102),
    (1103, 'Acura', 'CL', 'Passenger', 17.2, 26, 20103),
    (1104, 'Acura', 'RL', 'Passenger', 18, 22, 20104),
    (1105, 'Audi', 'A4', 'Car', 16.4, 27, 20105),
    (1106, 'Audi', 'A6', 'Car', 18.5, 22, 20106),
    (1107, 'Audi', 'A8', 'Passenger', 23.7, 21, 20107),
    (1108, 'BMW', '323i', 'Car', 16.6, 26, 20108),
    (1109, 'BMW', '328i', 'Passenger', 16.6, 24, 20109),
    (1110, 'BMW', '528i', 'Car', 18.5, 25, 20110)
    ;

ALTER TABLE manufacturer
DROP FOREIGN KEY fk_manufacturer;

INSERT INTO car_specs ( cars_id, engine_size, horsepower, wheelbase, width, length, power_perf_factor, curb_weight)
VALUES
	(1101, 1.8, 140, 101.2, 67.3, 172.4, 58.28, 2.64),
    (1102, 3.2, 225, 108.1, 70.3, 192.9, 98.37, 3.52),
    (1103, 2.5, 125, 100.5, 65.5, 162.5, 80.33, 3.45),
    (1104, 3.0, 140, 105.2, 76.4, 172.7, 65.8, 2.75),
    (1105, 1.9, 160, 110.7, 55.8, 160.3, 78.4, 3.42),
    (1106, 3.5, 210, 102.8, 67.3, 192.9, 98.27, 3.50),
    (1107, 2.5, 160, 115.7, 67.3, 172.4, 65.8, 3.45),
    (1108, 1.8, 225, 113.7, 70.5, 175.8, 58.34, 2.70),
    (1109, 3.0, 220, 120.7, 76.4, 162.5, 80.33, 3.45),
    (1110, 1.9, 145, 108.2, 56.5, 175.8, 65.8, 2.64)
    ;
    
    SELECT *
    FROM car_specs;
    
    SELECT *
    FROM manufacturer;
    
    SELECT *
    FROM sales;
    
    SELECT m.car_name, m.car_model, s.sales, s.price, s.year_resale_value
    FROM sales AS s
    INNER JOIN manufacturer AS m
    ON s.carsales_id = m.carsales_id
    ORDER BY m.car_name
    ;