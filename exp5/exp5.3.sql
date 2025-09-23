CREATE OR REPLACE PROCEDURE check_stock_availability (IN product_id INT, IN INT p_quantity)
LANGUAGE plpgsql
AS $$
    DECLARE
		stock INT;

	BEGIN
		SELECT p.stock
	    INTO stock
	    FROM Products p
	    WHERE p.id = product_id;

		IF stock <p_quantity THEN
			RAISE NOTICE 'Stock to process your order is not available';
		ELSE
			RAISE NOTICE 'Stock available to process your order';
		END IF;
	END;
$$;

CREATE OR REPLACE PROCEDURE create_order (
    IN product_id INT,
    IN p_quantity INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Products p
    SET stock = stock - p_quantity
    WHERE p.id = product_id;

    INSERT INTO Sales (product_id, quantity, sale_date)
    VALUES (product_id, p_quantity, CURRENT_DATE);

    RAISE NOTICE 'Order processed successfully. % units sold.', p_quantity;
END;
$$;


CALL check_stock_availability(1, 10);
CALL create_order(1, 10);