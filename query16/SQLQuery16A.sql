CREATE PROCEDURE insertNewProduct

@productNo char(6), 
@productDescription varchar(33), 
@categoryId varchar(5),
@productUnitPrice integer, 
@productUnitWeight integer, 
@inventoryQty integer

AS


INSERT INTO product (productNo, productDescription, categoryId,
productUnitPrice, productUnitWeight, inventoryQty)
values (@productNo, @productDescription, @categoryId,
@productUnitPrice, @productUnitWeight, @inventoryQty);

exec insertNewProduct 'A99999','Test Product','IP1','45200',
'100','10'
