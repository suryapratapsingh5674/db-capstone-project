DELIMITER //

CREATE PROCEDURE CancelOrder(IN orderToDelete INT)
BEGIN
    DELETE FROM Orders WHERE order_id = orderToDelete;
END //

DELIMITER ;