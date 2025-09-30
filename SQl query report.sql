-- Create database bank
-- import files finance1 and finance2 
use bank;
select * from finance1;
select * from finance2;

-- 1 KPI - Year wise loan amount Stats
select year(issue_d) as YEAR,sum(loan_amnt) as Loan_Amnt from finance1
group by year(issue_d)
order by Loan_Amnt desc;

-- 2 KPI - Grade and sub grade wise revol_bal
select Grade,Sub_grade,sum(revol_bal) as Total_Revol_bal from finance1 join finance2 using (id)
group by grade,sub_grade
order by sub_grade;

-- 3 KPI - Total Payment for Verified Status Vs Total Payment for Non Verified Status
select Verification_status , round(sum(Total_Pymnt)) as Total_Pymnt from finance1 join finance2 using (id)
where verification_status in ('verified','Not Verified')
group by verification_status;

-- 4 KPI - State wise and month wise loan status
 select Addr_state,State,date_format(issue_d,'%M') as Month,Loan_status,sum(Loan_amnt) as Loan_Amnt
from finance1
group by Addr_state,State,date_format(issue_d,'%M'),Loan_status,date_format(issue_d,'%m')
order by state,Loan_status ;

-- 5 KPI - Home ownership Vs last payment date stats
select year(last_pymnt_d) as last_pymnt_year,monthname(last_pymnt_d) as last_pymnt_month,Home_ownership,Loan_amnt
from finance1 join finance2 using (id);





