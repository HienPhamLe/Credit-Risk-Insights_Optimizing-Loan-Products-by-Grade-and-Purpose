-- SQL_initial_checks.sql

-- Count total records and assess the initial structure of the loans table
SELECT COUNT(*) AS total_records FROM loans;

-- View the structure of the loans table (column names, data types)
DESCRIBE loans;

-- Check for NULL values in key columns to assess data quality
SELECT
    COUNT(*) AS total_records,
    COUNT(*) - COUNT(grade) AS grade_null,
    COUNT(*) - COUNT(sub_grade) AS sub_grade_null,
    COUNT(*) - COUNT(purpose) AS purpose_null,
    COUNT(*) - COUNT(funded_amnt) AS funded_amount_null,
    COUNT(*) - COUNT(int_rate) AS interest_rate_null,
    COUNT(*) - COUNT(term) AS term_null,
    COUNT(*) - COUNT(loan_status) AS loan_status_null
FROM loans;

-- Identify unique values in categorical columns to check for consistency
SELECT DISTINCT grade AS Grade FROM loans ORDER BY grade;
SELECT DISTINCT sub_grade AS Sub_Grade FROM loans ORDER BY sub_grade;
SELECT DISTINCT purpose AS Purpose FROM loans ORDER BY purpose;
SELECT DISTINCT term AS Term FROM loans ORDER BY term;
SELECT DISTINCT loan_status AS Loan_Status FROM loans ORDER BY loan_status;

-- Perform basic statistical analysis on numeric columns to identify range and potential outliers
SELECT 
    MIN(funded_amnt) AS min_funded_amount,
    MAX(funded_amnt) AS max_funded_amount,
    AVG(funded_amnt) AS avg_funded_amount
FROM loans;

SELECT 
    MIN(int_rate) AS min_interest_rate,
    MAX(int_rate) AS max_interest_rate,
    AVG(int_rate) AS avg_interest_rate
FROM loans;
