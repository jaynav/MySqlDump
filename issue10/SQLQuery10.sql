select salesperson.salespersonNo, salespersonName, salesCompany.companyName, count(salesOrder.orderId) as 'sales order count'
from salesperson,salesCompany,salesOrder
	where salesperson.companyId = salesCompany.companyId and
	salesperson.salespersonNo = salesOrder.salespersonNo

group by salesperson.salespersonNo, salespersonName, salesCompany.companyName 
having count ('sales order count')=5  
