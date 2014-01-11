CREATE PROCEDURE insertNewOrderLineItem

@orderId char(7),
@productNo char(6),
@qtyOrdered integer

AS


INSERT INTO orderLineItem (orderId, productNo, qtyOrdered)
values (@orderId, @productNo, @qtyOrdered);


exec insertNewOrderLineItem 'ZZ88989','A99999','2'
