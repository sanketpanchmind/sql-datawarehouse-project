-- This script sets up a fresh Data Warehouse environment. It first removes the existing DataWarehouse database if present, then creates a new one.
-- Finally, it creates Bronze, Silver, and Gold schemas to organize data into raw, cleaned, and business-ready layers.

USE master;
GO

-- Drop the database if it already exists
IF EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = 'DataWarehouse'
)
BEGIN
    ALTER DATABASE DataWarehouse
    SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;

    DROP DATABASE DataWarehouse;
END;
GO

-- Create the DataWarehouse database
CREATE DATABASE DataWarehouse;
GO

-- Switch to the DataWarehouse database
USE DataWarehouse;
GO

-- Create Bronze schema
CREATE SCHEMA bronze;
GO

-- Create Silver schema
CREATE SCHEMA silver;
GO

-- Create Gold schema
CREATE SCHEMA gold;
GO
