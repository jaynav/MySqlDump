SELECT salesorder.orderId as 'Order Id', convert(varchar(20),orderDate,107) as 'Order date',
	salesperson.salespersonName as 'Sales Person Name',
	salesCompany.companyName as 'Sales Company Name', salesCompanyDomestic.phoneNumber as 'Phone Number',
	commissionRate as 'Commission Rate'
FROM salesorder, salesperson, salesCompany, salesCompanyDomestic
WHERE salesOrder.salespersonNO = salesperson.salespersonNo and
	salesperson.companyId = salesCompany.companyId and 
	salesCompany.companyId = salesCompanyDomestic.companyId and
	salesperson.salespersonName NOT IN 
		(Select salesperson.salespersonName
			FROM salesperson
			where salespersonName = 'Janet Rice') and 
	salesCompany.companyName IN
		(Select salesCompany.companyName
			From salesCompany
			Where companyName = 'Industrial Appparatus')
order by salesOrder.orderId
 
