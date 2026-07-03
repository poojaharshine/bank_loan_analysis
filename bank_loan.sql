SELECT COUNT(id) AS Total_loan_Application FROM bank_loan

SELECT COUNT(id) AS MTD_Total_loan_Application FROM bank_loan WHERE MONTH(ISSUE_DATE) = 12

SELECT COUNT(id) AS PMTD_Total_loan_Application FROM bank_loan WHERE MONTH(ISSUE_DATE) = 11

SELECT SUM(loan_amount) AS Total_Funded_Amt FROM bank_loan

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amt FROM bank_loan WHERE MONTH(ISSUE_DATE) = 12

SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amt FROM bank_loan WHERE MONTH(ISSUE_DATE) = 11 

Select sum(total_payment) as Total_Payment from bank_loan

Select sum(total_payment) as MTD_Total_Payment_Recieved from bank_loan WHERE MONTH(ISSUE_DATE) = 12 AND YEAR(ISSUE_DATE)=2021

Select sum(total_payment) as PMTD_Total_Payment_Recieved from bank_loan WHERE MONTH(ISSUE_DATE) = 11 AND YEAR(ISSUE_DATE)=2021

SELECT ROUND(AVG(dti),4)*100 AS Total_DTI FROM bank_loan

SELECT ROUND(AVG(dti),4)*100 AS MTD_Total_DTI FROM bank_loan WHERE MONTH(ISSUE_DATE) = 12 AND YEAR(ISSUE_DATE)= 2021

SELECT ROUND(AVG(dti),4)*100 AS PMTD_Total_DTI FROM bank_loan WHERE MONTH(ISSUE_DATE) = 11 AND YEAR(ISSUE_DATE)= 2021


SELECT (COUNT(CASE WHEN loan_status='Fully Paid' OR loan_status='Current' then ID END)*100)/COUNT(ID) as Good_loan_Per FROM bank_loan

SELECT COUNT(id)AS Good_loan_Application FROM bank_loan WHERE loan_status='Fully Paid' OR loan_status='Current'

SELECT SUM(loan_amount) AS Good_loan_Funded FROM bank_loan WHERE loan_status='Fully Paid' OR loan_status='Current'

SELECT SUM(total_payment) AS Good_loan_Funded FROM bank_loan WHERE loan_status='Fully Paid' OR loan_status='Current'


SELECT (COUNT(CASE WHEN loan_status='Charged Off' then ID END)*100)/COUNT(ID) as Bad_loan_Per FROM bank_loan

SELECT COUNT(id)AS Bad_loan_Application FROM bank_loan WHERE loan_status='Charged Off'

SELECT SUM(loan_amount) AS Bad_loan_Funded FROM bank_loan WHERE loan_status='Charged Off'

SELECT SUM(total_payment) AS Bad_loan_Recieved FROM bank_loan WHERE loan_status='Charged Off'



SELECT 
	loan_status,
	COUNT(id) AS MTD_Total_Loan_Application,
	SUM(loan_amount) AS MTD_Total_Funded_Amount,
	Sum(total_payment) AS MTD_Total_Amount_recieved,
	AVG(int_rate*100) AS MTD_Intrest_Rate,
	AVG(dti*100)  AS MTD_DTI

	FROM bank_loan
WHERE MONTH(issue_date)=12
GROUP BY
	loan_status



SELECT 
	MONTH(issue_date) AS Month_Number,
	DATENAME(month,issue_date) AS Month_Name,
	COUNT(id) AS Total_Application,
	SUM(loan_amount) AS Total_Amount_Funded,
	SUM(total_payment) AS Total_Amount_Recieved
	FROM bank_loan
	GROUP BY MONTH(issue_date),DATENAME(MONTH,issue_date)
	ORDER BY MONTH(issue_date),DATENAME(MONTH,issue_date)


SELECT 
	term,
	COUNT(id) AS Total_Application,
	SUM(loan_amount) AS Total_Amount_Funded,
	SUM(total_payment) AS Total_Amount_Recieved
	FROM bank_loan
	GROUP BY term
	ORDER BY term


SELECT 
	emp_length,
	COUNT(id) AS Total_Application,
	SUM(loan_amount) AS Total_Amount_Funded,
	SUM(total_payment) AS Total_Amount_Recieved
	FROM bank_loan
	GROUP BY emp_length
	ORDER BY emp_length


SELECT 
	purpose,
	COUNT(id) AS Total_Application,
	SUM(loan_amount) AS Total_Amount_Funded,
	SUM(total_payment) AS Total_Amount_Recieved
	FROM bank_loan
	GROUP BY purpose
	ORDER BY purpose


SELECT 
	home_ownership,
	COUNT(id) AS Total_Application,
	SUM(loan_amount) AS Total_Amount_Funded,
	SUM(total_payment) AS Total_Amount_Recieved
	FROM bank_loan
	GROUP BY home_ownership
	ORDER BY home_ownership
