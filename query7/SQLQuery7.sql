select salesperson.salespersonNo as 'saleperson Id', salespersonName as 'salesperson Name', statusIndicator as 'Status Indicator',
salesCompany.companyName as 'Company Name', salesCompany.companyId as 'Company Id'
from salesperson, salesCompany
where salesperson.companyId = salesCompany.companyId and salesperson.companyId not in
(select salesperson.companyId
from salesperson
where salesperson.companyId = (1100))
order by salesperson.salespersonNo
