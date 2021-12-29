CREATE DATABASE DW_Hospitalsakila;

USE DW_Hospitalsakila;

CREATE table dim_hospital (
dim_hospital_id smallint(5) NOT NULL,
city_id smallint(5) NOT NULL,
hospitalsakila_id smallint(5) NOT NULL,
PRIMARY KEY (dim_hospital_id)
);

CREATE table dim_time ( 
id int NOT NULL AUTO_INCREMENT, 
dt date DEFAULT null, 
yr smallint DEFAULT null, 
mth smallint DEFAULT null, 
dy smallint DEFAULT null, 
wk smallint default null, 
day_name char(20) default null, 
PRIMARY KEY (id)
); 

CREATE table dim_city (
dim_city_id smallint(5) NOT NULL,
city_name VARCHAR(50) NOT NULL,
country_name VARCHAR(50) NOT NULL,
hospitalsakila_id smallint(5) NOT NULL,
last_update TIMESTAMP NOT NULL,
PRIMARY KEY (dim_city_id)
);

CREATE table dim_appointment (
dim_appointment_id smallint(5) NOT NULL,
patient_id smallint(5) NOT NULL,
hospitalsakila_id smallint(5) NOT NULL,
PRIMARY KEY (dim_appointment_id)
);

CREATE table Fact_Appointment_Payment ( 
time_id int,
hospital_id smallint(5), 
appointment_id smallint(5), 
city_id smallint(5), 
payment_amount decimal(20,5),
FOREIGN KEY (hospital_id) REFERENCES dim_hospital(dim_hospital_id),
FOREIGN KEY (appointment_id) REFERENCES dim_appointment(dim_appointment_id),
FOREIGN KEY (city_id) REFERENCES dim_city(dim_city_id),
FOREIGN KEY (time_id) REFERENCES dim_time(id)
);