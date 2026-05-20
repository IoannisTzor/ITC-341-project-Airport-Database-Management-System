-- Airport Database Management System - Functions
-- Ethan Phillips, Ioannis Tzortzatos
set linesize 150
set pagesize 50
set echo on

-- Function 1: get_flight_route
CREATE OR REPLACE FUNCTION get_flight_route (
    p_flight_id IN Flights.FlightID%TYPE
) RETURN VARCHAR2
IS
    v_dep_code      Airport.AirportCode%TYPE;
    v_arr_code      Airport.AirportCode%TYPE;
    v_dep_time      Flights.DepartureTime%TYPE;
    v_arr_time      Flights.ArrivalTime%TYPE;
    v_total_minutes NUMBER;
    v_hours         NUMBER;
    v_minutes       NUMBER;
    v_result        VARCHAR2(100);
BEGIN
    SELECT dep.AirportCode,
           arr.AirportCode,
           f.DepartureTime,
           f.ArrivalTime
    INTO   v_dep_code,
           v_arr_code,
           v_dep_time,
           v_arr_time
    FROM   Flights f
           JOIN Airport dep ON f.DepartureAirportID = dep.AirportID
           JOIN Airport arr ON f.ArrivalAirportID   = arr.AirportID
    WHERE  f.FlightID = p_flight_id;

    v_total_minutes := ROUND((v_arr_time - v_dep_time) * 24 * 60);
    v_hours         := FLOOR(v_total_minutes / 60);
    v_minutes       := MOD(v_total_minutes, 60);

    v_result := v_dep_code || ' -> ' || v_arr_code ||
                ' (Duration: ' || v_hours || 'h ' || v_minutes || 'm)';

    RETURN v_result;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Flight not found';
    WHEN OTHERS THEN
        RETURN 'Error: ' || SQLERRM;
END;
/

-- Function 2: update_flight_arrival
CREATE OR REPLACE PROCEDURE update_flight_arrival_time (
    p_flight_id        IN  Flights.FlightID%TYPE,
    p_new_arrival_time IN  DATE,
    p_status           OUT VARCHAR2
)
IS
    v_dep_time      Flights.DepartureTime%TYPE;
    v_old_arrival   Flights.ArrivalTime%TYPE;
    v_flight_number Flights.FlightNumber%TYPE;
BEGIN
    -- Verify flight exists and get current info
    SELECT DepartureTime, ArrivalTime, FlightNumber
    INTO   v_dep_time, v_old_arrival, v_flight_number
    FROM   Flights
    WHERE  FlightID = p_flight_id;
 
    -- Validate: new arrival must be after departure
    IF p_new_arrival_time <= v_dep_time THEN
        p_status := 'Error: New arrival time must be after departure time ('
                    || TO_CHAR(v_dep_time, 'YYYY-MM-DD HH24:MI') || ')';
        RETURN;
    END IF;
 
    -- Perform the update
    UPDATE Flights
    SET    ArrivalTime = p_new_arrival_time
    WHERE  FlightID    = p_flight_id;
 
    COMMIT;
 
    p_status := 'Success: Flight ' || v_flight_number ||
                ' arrival updated from ' ||
                TO_CHAR(v_old_arrival, 'YYYY-MM-DD HH24:MI') ||
                ' to ' ||
                TO_CHAR(p_new_arrival_time, 'YYYY-MM-DD HH24:MI');
 
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_status := 'Error: Flight ID ' || p_flight_id || ' not found';
    WHEN OTHERS THEN
        ROLLBACK;
        p_status := 'Error: ' || SQLERRM;
END;
/

-- Function 3: get_airport_daily_flights
CREATE OR REPLACE FUNCTION get_airport_daily_flights (
    p_airport_id   IN Airport.AirportID%TYPE,
    p_flight_date  IN DATE
) RETURN NUMBER
IS
    v_flight_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO   v_flight_count
    FROM   Flights
    WHERE  (DepartureAirportID = p_airport_id
            AND TRUNC(DepartureTime) = TRUNC(p_flight_date))
       OR  (ArrivalAirportID   = p_airport_id
            AND TRUNC(ArrivalTime)   = TRUNC(p_flight_date));

    RETURN v_flight_count;

EXCEPTION
    WHEN OTHERS THEN
        RETURN -1;
END;
/

--SELECT get_flight_route(501) AS Route FROM dual;


/*SET SERVEROUTPUT ON;
 
 DECLARE
    v_status VARCHAR2(200);
BEGIN
    update_flight_arrival_time(
        p_flight_id        => 501,
        p_new_arrival_time => TO_DATE('2026-04-10 11:30','YYYY-MM-DD HH24:MI'),
        p_status           => v_status
    );
    DBMS_OUTPUT.PUT_LINE(v_status);
END;
/ */


--SELECT get_airport_daily_flights(1, TO_DATE('2026-04-10','YYYY-MM-DD')) AS TotalFlights FROM dual;