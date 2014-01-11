select distinct customer.customerId,count(salesOrder.orderId) as 'total number of sales orders', customerType.typeDescription as
'type Description', typeDiscount as 'type Discount',
	sum(orderLineItem.qtyOrdered*product.productUnitPrice*customerType.typeDiscount)  as 'total value of discounted sales'
		from orderLineItem,product,customerType, salesOrder right outer JOIN customer
		on salesOrder.customerId = customer.customerId
		where customer.customerTypeId =customerType.customerTypeId
			and orderLineItem.orderId =salesOrder.orderId 
			and product.productNo = orderLineItem.productNo
group by customer.customerId, customerType.typeDescription, typeDiscount 
having count('total number of sales orders')>= 2
order by customer.customerId
