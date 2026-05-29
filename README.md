# Airport Database Management System

A relational database management system for tracking the operations of multiple airports, built as the final project for an Introduction to Database Management course (ITC-341).

**Developed by:** Ioannis Tzortzatos & Ethan Phillips

---

## Overview

This project models the core data relationships of a real-world airport network — airlines, airports, aircraft, gates, staff, passengers, flights, and ticketing — using a normalised relational schema in Oracle SQL. It includes scripts to create the schema, populate it with sample data, define stored procedures and functions, and run queries against them.

---

## Database Schema

The system is built around 8 tables with clearly defined primary and foreign key relationships:

| Table | Description |
|---|---|
| `Airline` | Airlines operating flights in the system |
| `Airport` | Airport locations with IATA-style codes, city, state, and country |
| `Aircraft` | Individual planes owned by an airline, with model and capacity |
| `Gates` | Departure gates belonging to a specific airport terminal |
| `Staff` | Airport/airline employees with position and salary |
| `Passenger` | Travellers identified by passport number |
| `Flights` | Scheduled flights linking aircraft, airlines, airports, and gates |
| `Tickets` | Issued tickets connecting passengers to flights, with seat, class, and price |

### Entity Relationships

- An **Airline** owns many **Aircraft** and operates many **Flights**
- An **Airport** has many **Gates** and serves as departure/arrival for many **Flights**
- A **Flight** is assigned one **Aircraft**, one departure **Gate**, and connects two **Airports**
- A **Passenger** can hold many **Tickets** across multiple **Flights** (many-to-many resolved via `Tickets`)
- `Tickets` uses a composite primary key `(TicketID, PassengerID, FlightID)`

---

## File Structure

```
airport_create.sql      — DROP and CREATE statements for all 8 tables with constraints
airport_insert.sql      — Sample data inserts to populate the database
airport_functions.sql   — PL/SQL functions and stored procedures
airport_query.sql       — Example queries and procedure calls
```

---

## Functions & Procedures

### `get_flight_route(p_flight_id)` — Function
Returns a formatted string showing the departure and arrival airport codes and the calculated flight duration.

```sql
SELECT get_flight_route(501) AS Route FROM dual;
-- Example output: LAX -> JFK (Duration: 5h 30m)
```

---

### `update_flight_arrival_time(p_flight_id, p_new_arrival_time, p_status)` — Procedure
Updates the arrival time of a flight. Validates that the new arrival time is after the departure time and returns a descriptive status message via an OUT parameter.

```sql
SET SERVEROUTPUT ON;
DECLARE
    v_status VARCHAR2(200);
BEGIN
    update_flight_arrival_time(
        p_flight_id        => 501,
        p_new_arrival_time => TO_DATE('2026-04-10 11:30', 'YYYY-MM-DD HH24:MI'),
        p_status           => v_status
    );
    DBMS_OUTPUT.PUT_LINE(v_status);
END;
/
```

---

### `get_airport_daily_flights(p_airport_id, p_flight_date)` — Function
Returns the total number of flights (departing or arriving) at a given airport on a specific date.

```sql
SELECT get_airport_daily_flights(1, TO_DATE('2026-04-10', 'YYYY-MM-DD')) AS TotalFlights FROM dual;
```

---

### `update_flight_status(p_flight_id, p_status)` — Procedure *(in airport_query.sql)*
Updates the status of a flight (e.g. ON TIME, DELAYED, CANCELLED). Checks that the flight exists before updating.

```sql
BEGIN
    update_flight_status(501, 'DELAYED');
END;
/
```

---

## Setup & Usage

### Requirements
- Oracle SQL (tested with Oracle SQL*Plus / SQL Developer)

### Running the scripts

Execute the files in this order:

```sql
@airport_create.sql     -- Creates all tables (drops existing ones first)
@airport_insert.sql     -- Loads sample data
@airport_functions.sql  -- Creates functions and stored procedures
@airport_query.sql      -- Runs example queries and procedure calls
```

> `airport_create.sql` drops all tables before recreating them, so it is safe to re-run from scratch.

---

## Authors

- **Ioannis Tzortzatos** — [GitHub](https://github.com/IoannisTzor)
- **Ethan Phillips**

---

*Final project for ITC-341 — Introduction to Database Management*
