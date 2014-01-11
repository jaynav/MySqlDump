select distinct sum(product.productUnitPrice*orderLineItem.qtyOrdered) as 'Order Total Amount', orderLineItem.orderId as 'Order Id',
sum(product.productUnitWeight*qtyOrdered) as 'Order Total Weight' , orderLineItem.qtyOrdered as 'Total Product Qty',
salesOrder.customerId as 'Customer Id', customerType.typeDescription as 'Customer Type Description'
from product, orderLineItem, salesOrder,  customer, customerType
where customerType.customerTypeId = customer.customerTypeId 
and customer.customerId = salesOrder.customerId 
and orderLineItem.orderId = salesOrder.orderId 
and product.productNo= orderLineItem.productNo
group by orderLineItem.orderId,orderLineItem.qtyOrdered,salesOrder.customerId,customerType.typeDescription
order by 'order Total Amount' desc 
