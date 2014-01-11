select distinct count(salesOrder.orderId)as 'Total Orders Per Type',
customer.customerTypeId as 'Customer Type',
customerType.typeDescription as 'Type Description'
from customer, customerType, salesOrder
where  customer.customerTypeId = customerType.customerTypeId
and customer.customerId = salesOrder.customerId
group by customer.customerTypeId,customerType.typeDescription 
order by 'Total Orders Per Type'
