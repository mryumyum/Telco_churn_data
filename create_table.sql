SHOW VARIABLES LIKE "local_infile";
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE "secure_file_priv";
SET SQL_SAFE_UPDATES = 0;
SHOW VARIABLES LIKE "SQL_SAFE_UPDATES";

CREATE TABLE all_data(
	customerID TEXT,
    gender TEXT,
    SeniorCitizen INT,
    Partner TEXT,
    Dependents TEXT,
    tenure INT,
    PhoneService TEXT,
    MultipleLines TEXT,
    InternetService TEXT,
    OnlineSecurity TEXT,
    OnlineBackup TEXT,
    DeviceProtection TEXT,
    TechSupport TEXT,
    StreamingTV TEXT,
    StreamingMoives TEXT,
    Contract TEXT,
    PaperlessBilling TEXT,
    PaymentMethod TEXT,
    MonthlyCharges FLOAT,
    TotalCharges FLOAT,
    Churn TEXT
);

LOAD DATA LOCAL INFILE "C:\\Users\\Zach\\Desktop\\Untitled Folder\\Telco-Customer-Churn.csv"
INTO TABLE all_data
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

UPDATE all_data
SET member_casual = SUBSTRING(member_casual, 2, LENGTH(member_casual))
WHERE LEFT(member_casual, 1) = '"';

UPDATE all_data
SET member_casual = TRIM(TRAILING '\r' FROM member_casual);

UPDATE all_data
SET member_casual = TRIM(TRAILING '"' FROM member_casual);
#WHERE RIGHT(member_casual, 1) = '"';

ALTER TABLE all_data
DROP COLUMN started_at;

ALTER TABLE all_data
DROP COLUMN ended_at;

SELECT *
FROM all_data;






