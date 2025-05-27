DELIMITER //

CREATE PROCEDURE AddBooking(
  IN input_booking_id INT,
  IN input_customer_id INT,
  IN input_booking_date DATE,
  IN input_table_number INT
)
BEGIN
  INSERT INTO Bookings (booking_id, customer_id, booking_date, table_number)
  VALUES (input_booking_id, input_customer_id, input_booking_date, input_table_number);
END //

DELIMITER ;
