DELIMITER //

CREATE PROCEDURE UpdateBooking(
  IN input_booking_id INT,
  IN new_booking_date DATE
)
BEGIN
  UPDATE Bookings
  SET booking_date = new_booking_date
  WHERE booking_id = input_booking_id;
END //

DELIMITER ;
