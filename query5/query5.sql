select distinct customer.customerId,count(salesOrder.orderId) as 'sp', customerType.typeDescription, typeDiscount
from customerType,salesOrder right outer JOIN customer
on salesOrder.customerId = customer.customerId
where customer.customerTypeId =customerType.customerTypeId
group by customer.customerId, customerType.typeDescription, typeDiscount 
having count('sp')>= 2
