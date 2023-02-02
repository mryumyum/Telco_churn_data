
# ONE TIME COMMANDS
ALTER TABLE all_data
RENAME TO telco_customer_churn;

ALTER TABLE `telco_customer_churn`
DROP COLUMN gender;

ALTER TABLE `telco_customer_churn`
DROP COLUMN customerID;
# END ONE TIME COMMANDS

SHOW VARIABLES LIKE "local_infile";
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE "secure_file_priv";
SET SQL_SAFE_UPDATES = 0;
SHOW VARIABLES LIKE "SQL_SAFE_UPDATES";

SELECT *
FROM telco_customer_churn;

SELECT Churn, COUNT(*)
FROM `telco_customer_churn`
GROUP BY Churn;

SELECT SeniorCitizen, COUNT(*)
FROM `telco_customer_churn`
GROUP BY SeniorCitizen;

SELECT DeviceProtection, COUNT(*)
FROM `telco_customer_churn`
GROUP BY DeviceProtection;

SELECT  CASE WHEN DeviceProtection='No' AND Churn='No' THEN 1 END as nodevproc_and_nochurn#,
		#SUM(CASE WHEN DeviceProtection='No' AND Churn='Yes' THEN 1 END) as nodevproc_and_churn,
		#SUM(CASE WHEN DeviceProtection='Yes' AND Churn='Yes' THEN 1 END) as devproc_and_churn,
        #SUM(CASE WHEN DeviceProtection='Yes' AND Churn='no' THEN 1 END) as devproc_and_nochurn
FROM `telco_customer_churn`
GROUP BY DeviceProtection;

SELECT  COUNT(*) as total,
        COUNT(if(DeviceProtection='No' AND Churn='No',1,null)) AS nodevproc_and_nochurn,
        COUNT(if(DeviceProtection='No' AND Churn='Yes',1,null)) AS nodevproc_and_churn,
        COUNT(if(DeviceProtection='Yes' AND Churn='No',1,null)) AS devproc_and_nochurn,
        COUNT(if(DeviceProtection='Yes' AND Churn='Yes',1,null)) AS devproc_and_churn
FROM `telco_customer_churn`;

SELECT COUNT(*)
FROM `telco_customer_churn`;















