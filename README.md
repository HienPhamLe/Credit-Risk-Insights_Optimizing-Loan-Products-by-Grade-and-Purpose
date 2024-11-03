# Credit Risk Insights: Optimizing Loan Products by Grade and Purpose [Lending Club]
![](images/overview_page.png)

## Project Overview
Lending Club, a leader in the peer-to-peer lending industry, provides a wealth of data on borrower characteristics, loan performance, interest rates, and default rates. As fintech continues to grow, effective credit risk assessment has become crucial for minimizing defaults and enhancing loan approval processes. This project leverages Lending Club's data to generate actionable insights for optimizing loan products by analyzing key factors such as loan Grade, Purpose, and Default Rate.

Insights and recommendations are provided on the following key areas:
- **Borrower Risk Assessment**: Evaluation of borrower characteristics by loan Grade to identify risk levels and improve targeting for various loan products.  
- **Purpose-Based Performance**: Analysis of loan performance by Purpose to identify high-risk categories.
  
An interactive Power BI dashboard can be downloaded [here](https://app.powerbi.com/groups/me/reports/47bb9f14-9a87-492a-8b24-948a12c2f811/8f03a32be0be0e34306b?experience=power-bi "target=_blank").

## Data Structure & Preparation
The Lending Club Loan data is contained entirely in a single table with a total of 2,260,668 rows. Within the scope of this project’s analysis, we extract the columns as listed below.

![](images/data_structure.png)

Prior to beginning the analysis, various quality checks were conducted for control and familiarization with the datasets.  
The Python and Spark code used for ETL of data from CSV files into the MySQL Database can be found [here](etl_csv_to_mysql.ipynb).  
The SQL queries utilized to inspect and perform quality checks can be found [here](SQL_initial_checks.sql).  
The SQL queries used to clean the data can be found [here](SQL_clean_and_transform.sql).

## Key Insights
- The average loan amount stands at $15.04K, with an average interest rate of 13.09% and an average default rate of 11.6%.
- Low Amount loans (under $5,000) represent an exceptionally low proportion, accounting for only 1.99% of the total loan volume. However, they exhibit the lowest default rate compared to Medium Amount loans ($5,000 - $15,000) and High Amount loans (over $15,000), with a lower default rate across all three interest rate tiers (low: <10%, medium: 10-20%, and high: >20%).
  
![](images/overview_1.png)

- The default rate increases progressively across credit grades from A1 to G5. The average interest rate in these groups is higher than the average default rate for grades A through C, similar for grade D, and lower for grades E through G.

![](images/grade_1.png)
  
- The distribution of loan amounts by purpose shows significant variation, with a concentration in the top three: debt consolidation at approximately $20 billion, credit card at around $8 billion, and home improvement at about $2 billion. While credit card and home improvement rank in the lower range for default rates, debt consolidation ranks in the top 5 with a default rate of 12.6% (above the average of 11.6%).
- Most loan purposes have an average interest rate higher than the default rate; however, small business is an exception with a default rate of 18.1%, significantly higher than the average interest rate of 15.27%.

![](images/purpose_1.png)

## Recommendations
Based on the key insights, here are some targeted recommendations:
1. Consider Expanding Low Amount Loans: Given that loans under $5,000 have the lowest default rates across all interest rate tiers, the company could explore increasing the proportion of low-amount loans. This could help reduce overall default risk while providing credit access to lower-risk borrowers.
2. Review and Adjust Lending Criteria for High-Risk Grades (E to G): Since default rates exceed interest rates for grades E through G and show a widening gap, it may be beneficial to tighten the lending criteria for these grades. This could involve increasing requirements for borrowers in these credit grades, such as stricter income or credit history checks, or limiting loan amounts available to them.
3. Optimize Debt Consolidation Loans: Debt consolidation is the largest loan purpose by volume, but it has a default rate above the average. Given the high volume and default rate, consider refining credit policies for debt consolidation loans, potentially by segmenting borrowers within this purpose to identify those at higher risk. This can improve loan performance while maintaining a substantial share of the loan volume.
4. Implement Caution in Small Business Loans: Small business loans exhibit a default rate significantly higher than the average interest rate, suggesting they carry a high risk relative to returns. The company could consider stricter credit evaluations for small business loans or implementing higher interest rates to compensate for the elevated risk. Alternatively, limiting the total exposure to this category might help mitigate potential losses.
5. Encourage Medium Amount Loans for Moderate Risk: Medium amount loans ($5,000 - $15,000) account for a substantial proportion of the loan volume and maintain a manageable default rate. The company could consider promoting this loan range to balance loan volume growth with risk management.

By implementing these strategies, the company can better align its loan portfolio with risk and return objectives, ultimately improving overall loan performance and profitability.

## Assumptions and Caveats
- Data Quality: The analysis assumes that the provided data is accurate, up-to-date, and representative of Lending Club’s overall loan portfolio. Any inaccuracies may impact findings.
- Loan Grades and Interest Rates as Risk Indicators: We assume loan grades and interest rates reflect borrower risk profiles accurately. If not, comparisons of default rates and interest rates may be skewed.
- Limited Historical and External Data: The dataset may lack long-term trends or factors affecting defaults, including borrower circumstances or market demand for certain loan types.
- Policy Consistency Across Purposes: We assume uniform credit policies for each loan purpose. If policies vary, it could affect default rates across purposes.
- Potential Policy and Market Changes: Lending Club may adjust credit policies or respond to market dynamics, which could alter risk profiles over time, potentially impacting the relevance of our recommendations.



