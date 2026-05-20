-- Airport Management Database
-- Change Flight Status
-- Ethan Phillips, Ioannis Tzortzatos

SET SERVEROUTPUT ON;

SELECT * FROM flights;

CREATE OR REPLACE PROCEDURE update_flight_status (
    p_flight_id IN flights.flightid%TYPE,
    p_status    IN flights.status%TYPE
)
IS
    v_count NUMBER;
BEGIN
    -- Check if flight exists
    SELECT COUNT(*)
    INTO v_count
    FROM flights
    WHERE flightid = p_flight_id;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Flight not found');
        RETURN;
    END IF;

    -- Update status
    UPDATE flights
    SET status = UPPER(p_status)
    WHERE flightid = p_flight_id;

    DBMS_OUTPUT.PUT_LINE('Flight status updated successfully');

END;
/



BEGIN
    update_flight_status(501, 'DELAYED');
END;
/

SELECT * FROM flights;




-- Before
--SELECT flightid, status FROM flights WHERE flightid = 501;

-- Run procedure
--BEGIN
--    update_flight_status(501, 'DELAYED');
--END;
--/

-- After
--SELECT flightid, status FROM flights WHERE flightid = 501;


