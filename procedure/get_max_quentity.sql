DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(quantity) AS MaxOrderQuantity FROM Orders;
END //

DELIMITER ;