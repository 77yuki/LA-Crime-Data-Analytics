DELIMITER //
CREATE PROCEDURE AddIncidentReport(
    IN p_DR_NO VARCHAR(15),
    IN p_Date_Rptd DATETIME,
    IN p_Date_Occ DATETIME,
    IN p_Time_Occ INT,
    IN p_Area INT,
    IN p_Area_Name VARCHAR(50),
    IN p_Rpt_Dist_No INT,
    IN p_Part_1_2 INT,
    IN p_Crm_Cd INT,
    IN p_Crm_Cd_Desc VARCHAR(255),
    IN p_Status VARCHAR(2),
    IN p_Status_Desc VARCHAR(50),
    IN p_Crm_Cd_1 INT,
    IN p_Crm_Cd_2 INT,
    IN p_Crm_Cd_3 INT,
    IN p_Crm_Cd_4 INT,
    IN p_Location VARCHAR(255),
    IN p_Cross_Street VARCHAR(255),
    IN p_Lat DECIMAL(9,6),
    IN p_Lon DECIMAL(9,6)
)
BEGIN
    INSERT INTO Reports
    (DR_NO, Date_Rptd, Date_Occ, Time_Occ, Area, Area_Name, Rpt_Dist_No, Part_1_2, Crm_Cd, Crm_Cd_Desc, Status, Status_Desc, Crm_Cd_1, Crm_Cd_2, Crm_Cd_3, Crm_Cd_4, Location, Cross_Street, Lat, Lon)
    VALUES
    (p_DR_NO, p_Date_Rptd, p_Date_Occ, p_Time_Occ, p_Area, p_Area_Name, p_Rpt_Dist_No, p_Part_1_2, p_Crm_Cd, p_Crm_Cd_Desc, p_Status, p_Status_Desc, p_Crm_Cd_1, p_Crm_Cd_2, p_Crm_Cd_3, p_Crm_Cd_4, p_Location, p_Cross_Street, p_Lat, p_Lon);
END //
DELIMITER ;
