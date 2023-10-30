SELECT OrderID FROM Orders;

SELECT Cost FROM Orders;
CREATE TRIGGER productsellpriceinsertcheck
AFTER INSERT
ON products FOR EACH ROW
BEGIN
IF new.sellprice <= new.buyprice THEN
INSERT INTO notifications (notification, datetime)
VALUES (
    CONCAT(
        'A SellPrice same or less than the BuyPrice was
        inserted for ProductID ',
        new.productid
    ),
    NOW()
);
END IF;
END;
