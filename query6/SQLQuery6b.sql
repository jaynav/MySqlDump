select  product.categoryId, productCategory.categoryDescription, AVG(product.productUnitPrice) as 'unit price average', 
avg(product.productUnitWeight) as 'unit weight', sum(product.inventoryQty) as 'total number of products'
from  product, productCategory
	where product.categoryId = productCategory.categoryId 
group by product.categoryId, productCategory.categoryDescription
order by product.categoryId
