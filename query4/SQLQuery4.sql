select distinct product.productNo as 'product Part No', productDescription as 'Product Description',
 categoryId as 'Product Category Id', count(orderlineItem.orderId) as 'Total Number of Orders'

from product inner join  orderLineItem 
on orderLineItem.productNo = product.productNo
where product.productNo in
	(select productNo
from orderLineItem, salesOrder
where orderLineItem.orderId = salesOrder.orderId)
group by product.productNo, productDescription, categoryId
order by  'Total Number of Orders' desc, 'product Part No'
