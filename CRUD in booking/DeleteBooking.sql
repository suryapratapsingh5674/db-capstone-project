DELIMITER //

CREATE PROCEDURE CancelBooking(
  IN input_booking_id INT
)
BEGIN
  DELETE FROM Bookings
  WHERE booking_id = input_booking_id;
END //

DELIMITER ;
