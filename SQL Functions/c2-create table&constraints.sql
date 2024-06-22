USE `cs 338 project`;

CREATE TABLE Reports (
    DR_NO VARCHAR(15) PRIMARY KEY,
    Date_Rptd DATETIME,
    Date_Occ DATETIME,
    Time_Occ INT,
    Area INT,
    Area_Name VARCHAR(50),
    Rpt_Dist_No INT,
    Part_1_2 INT,
    Crm_Cd INT,
    Crm_Cd_Desc VARCHAR(255),
    Status VARCHAR(2),
    Status_Desc VARCHAR(50),
    Crm_Cd_1 INT,
    Crm_Cd_2 INT,
    Crm_Cd_3 INT,
    Crm_Cd_4 INT,
    Location VARCHAR(255),
    Cross_Street VARCHAR(255),
    Lat DECIMAL(9,6),
    Lon DECIMAL(9,6)
);
