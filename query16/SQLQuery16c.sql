Select distinct product.productNo as 'Product Number', productDescription as 'Product Description',
productUnitPrice as 'Unit Price',productCategory.categoryDescription as 'Category Description',
salesOrder.orderId as 'Order Id', convert(varchar(20),orderDate,107) as 'Order Date'
From productCategory,product,orderLineItem, salesOrder
Where product.categoryId = productCategory.categoryId and
product.productNo = orderLineItem.productNo and 
orderLineItem.orderId = salesOrder.orderId and salesOrder.orderId = 'ZZ88989'
