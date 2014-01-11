select  salesperson.salespersonName as 'Salesperson Name', salespersonNo as 'Salesperson Id',
	    salesCompany.companyId, salesCompanyDomestic.commissionRate as 'Commission Rate' 
from    salesperson, salesCompany, salesCompanyDomestic
where   salesperson.companyId = salesCompany.companyId 
and     salesCompany.companyId = salesCompanyDomestic.companyId
		and salesCompany.companyId =(444)
order by salespersonName
