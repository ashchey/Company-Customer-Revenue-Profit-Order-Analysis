USE SSA;

select distinct(company)
from client_data
Order by company;

select distinct(closingstatus)
from client_data
order by closingstatus;

select Count(*) AS OrderCount,
	Year(date) AS Years
from client_data
GROUP BY Year(DATE)
Order BY Years Desc;

/* Orders, Payout, Revenue */

select company,
	count(*) TotalOrders,
	sum(NotaryPay) AS NotaryPayout,
	sum(InvoiceFee) AS RevenueTotal,
	sum(InvoiceFee) - sum(NotaryPay) As CompanyProfit
FROM client_data
Group By Company
Order by TotalOrders desc;

select company,
	count(*) TotalOrders,
	sum(NotaryPay) AS NotaryPayout,
	sum(InvoiceFee) AS RevenueTotal,
	sum(InvoiceFee) - sum(NotaryPay) As Profit
FROM client_data
WHERE closingstatus IN ('Invoiced', 'Completed', 'Confirmed')
Group By Company
Order by TotalOrders desc;

Select signingstate, count(*) AS OrderCount
from client_data
Group By SigningState
Order By OrderCount desc;

Select signingstate, count(*) AS OrderCount
from client_data
WHERE closingstatus IN ('Invoiced', 'Completed','Confirmed')
Group By Signingstate
Order By OrderCount desc;

select company, count(*) AS totalclosings
from client_data
group by company
order by totalclosings desc;

select company, count(*) AS totalclosings
from client_data
where closingstatus = 'Cancelled'
group by company
order by totalclosings desc;

select closingstatus, company, propstate, signingstate, notarypay, Invoicefee
from client_data
where company = 'Mortgage Connect'
	AND InvoiceFee > 175
	AND propstate NOT IN ('SC', 'GA', 'MA', 'NC', 'WV', 'DE')
Order BY InvoiceFee desc;

SELECT 
    company,
    AVG(notarypay) AS OverallNotaryAvg,
    AVG(invoicefee) AS OverallFeeAvg
FROM client_data
WHERE company = 'Mortgage Connect'
  AND invoicefee > 175
  AND propstate NOT IN ('SC', 'GA', 'MA', 'NC', 'WV', 'DE')
GROUP BY company;

SELECT 
    closingstatus,
    company,
    AVG(notarypay) AS StatusNotaryAvg,
    AVG(invoicefee) AS StatusFeeAvg
FROM client_data
WHERE company = 'Mortgage Connect'
  AND invoicefee > 175
  AND propstate NOT IN ('SC', 'GA', 'MA', 'NC', 'WV', 'DE')
GROUP BY closingstatus, company
ORDER BY StatusFeeAvg DESC;

SELECT 
    closingstatus,
    company,
    AVG(notarypay) AS StatusNotaryAvg,
    AVG(invoicefee) AS StatusFeeAvg
FROM client_data
WHERE company = 'Mortgage Connect'
  AND propstate NOT IN ('SC', 'GA', 'MA', 'NC', 'WV', 'DE')
GROUP BY closingstatus, company
ORDER BY StatusFeeAvg DESC;

select *
from client_data
where company = 'mortgage connect';

Select count(distinct company) TotalCompanies
from client_data;

select distinct(closingstatus)
from client_data:

SELECT 
    CASE
        WHEN closingstatus = 'invoiced' OR closingstatus = 'completed' THEN 'Completed_Closings'
        ELSE 'Incomplete_Closings'
    END AS Overall_Closing_Status,
    COUNT(*) AS StatusCount
FROM client_data
GROUP BY
    CASE
        WHEN closingstatus = 'invoiced' OR closingstatus = 'completed' THEN 'Completed_Closings'
        ELSE 'Incomplete_Closings'
    END;

select Distinct(signingtype)
from client_data;

select count(*)
from client_data
where signingstate = 'FL';

select count(*) Transactions_For_NWC
from client_data
where company = 'Network Capital'
Group by company;

SELECT 
    MIN(date) AS Earliest_Transaction,
    MAX(date) AS Latest_Transaction
FROM client_data;

select count(*) NotaryPayment
from client_data
where NotaryPay > 0;


select TOP 1 count(*) totalorder, company
from client_data
group by company
order by totalorder desc;

--------------------------------------------/*11 - 20*/--------------------------------------------

select SigningState, SUM(InvoiceFee) AS RevenueTotal
FROM client_data
group by signingstate
Order by RevenueTotal desc;

select signingstate, SUM(notarypay) AS TotalNotaryPay
from client_data
group by SigningState
order by TotalNotaryPay desc;

select company, AVG(InvoiceFee) AS AvgInvoiceFee
from client_data
group by Company
order by AvgInvoiceFee desc;

select signingtype, AVG(invoicefee) as AvgInvoiceFee
from client_data
group by SigningType;

select date, sum(invoicefee)
from client_data
group by year, month;

selelct date, count(*)
from client_data
group by  month desc;

select signingstate, closingstatus, count(*) TotalCount
from client_data
where closingstatus = 'CANCELLED';

select TOP 1 company, AVG(notarypay) AvgNotaryPay
from client_data
group by company
order by AvgNotaryPay desc;

SELECT Top 5 company, SUM(InvoiceFee) TotalRevenue
from client_data
where closingstatus =  'invoiced' OR closingstatus = 'completed'
group by company
order by TotalRevenue desc;