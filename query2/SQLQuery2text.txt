select productNo as 'product No',productDescription as 'Product Description',
productUnitPrice as 'Unit Price', 
inventoryQty as 'unsold Inventory', (productUnitPrice * inventoryQty) as 'total value'
	from product
	where productNo NOT IN
		(select productNo
		from orderLineItem, salesOrder
			where orderLineItem.orderId = salesOrder.orderId)
