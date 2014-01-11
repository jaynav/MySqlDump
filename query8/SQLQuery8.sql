select salesOrder.customerId as 'Customer Id',customer.companyContactName as 'customer ContactName', salesOrder.orderId as 'Order Id',
 carrier.carrierDescription as 'Carrier Description'
from customer, salesOrder,carrier
	where customer.customerId = salesOrder.customerId
	and  salesOrder.carrierNo = carrier.carrierNo 
	and carrier.carrierDescription in 
       ('United Parcel Service','Private Express Delivery')

order by 'Customer Id','Carrier Description'
