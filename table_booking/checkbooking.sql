DELIMITER //

CREATE PROCEDURE CheckBooking(
  IN input_date DATE,
  IN input_table INT
)
BEGIN
  DECLARE is_booked INT;

  SELECT COUNT(*) INTO is_booked
  FROM Bookings
  WHERE booking_date = input_date AND table_number = input_table;

  IF is_booked > 0 THEN
    SELECT 'Table is booked' AS Message;
  ELSE
    SELECT 'Table is available' AS Message;
  END IF;
END //

DELIMITER ;
