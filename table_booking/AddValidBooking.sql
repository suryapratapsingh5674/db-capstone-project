DELIMITER //

CREATE PROCEDURE AddValidBooking(
  IN input_date DATE,
  IN input_table INT,
  IN input_customer_id INT
)
BEGIN
  DECLARE already_booked INT;

  START TRANSACTION;

  SELECT COUNT(*) INTO already_booked
  FROM Bookings
  WHERE booking_date = input_date AND table_number = input_table;

  IF already_booked > 0 THEN
    ROLLBACK;
    SELECT 'Booking failed: Table is already booked' AS Message;
  ELSE
    INSERT INTO Bookings (booking_date, table_number, customer_id)
    VALUES (input_date, input_table, input_customer_id);
    
    COMMIT;
    SELECT 'Booking successful!' AS Message;
  END IF;
END //

DELIMITER ;
