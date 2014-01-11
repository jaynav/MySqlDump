select distinct  salesperson.companyId as 'Company Id',  salesCompany.companyName as 'Company Name',
salesNetworkIndicator as 'Sales Network', count(salesperson.salespersonNo) as 'total number of salespeople'
from salesperson inner join salesCompany
on salesperson.companyId = salesCompany.companyId
group by salesperson.companyId, salesCompany.companyName, salesNetworkIndicator
order by 'total number of salespeople' desc, 'Company Id' desc
