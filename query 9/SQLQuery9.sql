select  salesperson.salespersonNo as 'Salesperson Number', salespersonName as 'Salesperson Name',
salesCompany.companyName as 'Sales Company Name', product.productDescription as 'Product Description',
orderLineItem.qtyOrdered, SalesOrder.customerId
	from salesperson,salesCompany,salesOrder,orderLineItem,product
		where salesperson.companyId = salesCompany.companyId and
		salesperson.salespersonNo = salesOrder.salespersonNo and 
		salesOrder.orderId = orderLineItem.orderId and 
		orderLineItem.productNo = product.productNo and 
		product.productDescription = 'LM35 Diode-Pumped YAG laser'
	order by salesperson.salespersonNo
