-- SQL_clean_and_transform.sql

-- Drop the view fact_loans if it already exists to avoid conflicts
DROP VIEW IF EXISTS fact_loans;

-- Create the view fact_loans with selected columns and calculated fields
CREATE VIEW fact_loans AS
SELECT
    grade AS Grade,
    sub_grade AS Sub_Grade,
    purpose AS Purpose,
    funded_amnt AS Funded_Amount,
    CASE 
        WHEN funded_amnt < 5000 THEN 'Low Amount'
        WHEN funded_amnt BETWEEN 5000 AND 15000 THEN 'Medium Amount'
        ELSE 'High Amount'
    END AS Funded_Amount_Group,
    CASE 
        WHEN funded_amnt < 5000 THEN 1
        WHEN funded_amnt BETWEEN 5000 AND 15000 THEN 2
        ELSE 3
    END AS Funded_Amount_Group_Order,
    int_rate / 100 AS Interest_Rate,
    CASE 
        WHEN int_rate < 10 THEN 'Low Interest'
        WHEN int_rate BETWEEN 10 AND 20 THEN 'Medium Interest'
        ELSE 'High Interest'
    END AS Interest_Rate_Group,
    CASE 
        WHEN int_rate < 10 THEN 1
        WHEN int_rate BETWEEN 10 AND 20 THEN 2
        ELSE 3
    END AS Interest_Rate_Group_Order,
    term AS Term,
    loan_status AS Loan_Status,
    CASE
        WHEN loan_status = 'Default' OR loan_status LIKE '%Charged Off' THEN 1
        ELSE 0
    END AS Is_Default
FROM loans
WHERE
	purpose IS NOT NULL
	AND purpose NOT LIKE '% %'
    AND purpose <> '000'
    AND Loan_Status <> 'Oct-2015';
	
-- Count total records after cleaning and transformation
SELECT COUNT(*) AS total_records FROM fact_loans;

-- View the structure of the loans table (column names, data types)
DESCRIBE fact_loans;

-- Verify NULL values in fact_loans to ensure data quality after transformation
SELECT
    COUNT(*) AS total_records,
    COUNT(*) - COUNT(Grade) AS grade_null,
    COUNT(*) - COUNT(Sub_Grade) AS sub_grade_null,
    COUNT(*) - COUNT(Purpose) AS purpose_null,
    COUNT(*) - COUNT(Funded_Amount) AS funded_amount_null,
    COUNT(*) - COUNT(Interest_Rate) AS interest_rate_null,
    COUNT(*) - COUNT(Term) AS term_null,
    COUNT(*) - COUNT(Is_Default) AS is_default_null
FROM fact_loans;

-- Check unique values
SELECT DISTINCT Grade FROM fact_loans ORDER BY Grade;
SELECT DISTINCT Sub_Grade FROM fact_loans ORDER BY Sub_Grade;
SELECT DISTINCT Purpose FROM fact_loans ORDER BY Purpose;
SELECT DISTINCT Term FROM fact_loans ORDER BY Term;
SELECT DISTINCT Loan_Status FROM fact_loans ORDER BY Loan_Status;

-- Check Loan_Status
SELECT DISTINCT Loan_Status
FROM fact_loans
WHERE Is_Default = 1;

-- Check 1000 rows
SELECT * 
FROM fact_loans
LIMIT 1000;


