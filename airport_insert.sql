-- Airport Management Database
-- Inserts sample data
-- Ethan Phillips, Ioannis Tzortzatos
 
set linesize 150
set pagesize 50
set echo on
 
-- AIRPORT
insert into Airport (AirportID, airportName, AirportCode, City, State, Country)
values (1, 'Hartsfield-Jackson Atlanta International Airport', 'ATL', 'Atlanta', 'Georgia', 'USA');
 
insert into Airport (AirportID, airportName, AirportCode, City, State, Country)
values (2, 'Dallas/Fort Worth International Airport', 'DFW', 'Dallas', 'Texas', 'USA');
 
insert into Airport (AirportID, airportName, AirportCode, City, State, Country)
values (3, 'Denver International Airport', 'DEN', 'Denver', 'Colorado', 'USA');
 
insert into Airport (AirportID, airportName, AirportCode, City, State, Country)
values (4, 'Los Angeles International Airport', 'LAX', 'Los Angeles', 'California', 'USA');
 
insert into Airport (AirportID, airportName, AirportCode, City, State, Country)
values (5, 'O Hare International Airport', 'ORD', 'Chicago', 'Illinois', 'USA');
 
insert into Airport (AirportID, airportName, AirportCode, City, State, Country)
values (6, 'Detroit Metropolitan Wayne County Airport', 'DTW', 'Detroit', 'Michigan', 'USA');
 
insert into Airport (AirportID, airportName, AirportCode, City, State, Country)
values (7, 'Toronto Pearson International Airport', 'YYZ', 'Toronto', 'Ontario', 'Canada');
 
insert into Airport (AirportID, airportName, AirportCode, City, State, Country)
values (8, 'Heathrow Airport', 'LHR', 'London', NULL, 'United Kingdom');
 
-- Airline
insert into Airline (AirlineID, AirlineName) values (101, 'Delta Air Lines');
insert into Airline (AirlineID, AirlineName) values (102, 'American Airlines');
insert into Airline (AirlineID, AirlineName) values (103, 'United Airlines');
insert into Airline (AirlineID, AirlineName) values (104, 'Air Canada');
insert into Airline (AirlineID, AirlineName) values (105, 'British Airways');
 
-- AIRCRAFT
insert into Aircraft (PlaneID, Model, Capacity, AirlineID) values (1001, 'Airbus A320', 180, 101);
insert into Aircraft (PlaneID, Model, Capacity, AirlineID) values (1002, 'Boeing 737-800', 160, 102);
insert into Aircraft (PlaneID, Model, Capacity, AirlineID) values (1003, 'Boeing 777-300ER', 300, 103);
insert into Aircraft (PlaneID, Model, Capacity, AirlineID) values (1004, 'Airbus A220', 145, 104);
insert into Aircraft (PlaneID, Model, Capacity, AirlineID) values (1005, 'Boeing 787-9', 290, 105);
insert into Aircraft (PlaneID, Model, Capacity, AirlineID) values (1006, 'Airbus A321', 190, 101);
insert into Aircraft (PlaneID, Model, Capacity, AirlineID) values (1007, 'Boeing 737 MAX 8', 175, 102);
insert into Aircraft (PlaneID, Model, Capacity, AirlineID) values (1008, 'Airbus A350', 315, 105);
 
-- GATES
insert into Gates (GateID, GateNumber, Terminal, AirportID) values (201, 'A1', 'A', 1);
insert into Gates (GateID, GateNumber, Terminal, AirportID) values (202, 'B4', 'B', 2);
insert into Gates (GateID, GateNumber, Terminal, AirportID) values (203, 'C7', 'C', 3);
insert into Gates (GateID, GateNumber, Terminal, AirportID) values (204, 'D2', 'D', 4);
insert into Gates (GateID, GateNumber, Terminal, AirportID) values (205, 'E9', 'E', 5);
insert into Gates (GateID, GateNumber, Terminal, AirportID) values (206, 'A6', 'A', 6);
insert into Gates (GateID, GateNumber, Terminal, AirportID) values (207, 'F3', 'F', 7);
insert into Gates (GateID, GateNumber, Terminal, AirportID) values (208, 'T5', 'T', 8);
insert into Gates (GateID, GateNumber, Terminal, AirportID) values (209, 'B8', 'B', 1);
insert into Gates (GateID, GateNumber, Terminal, AirportID) values (210, 'C3', 'C', 6);
 
-- STAFF  (no AirportID per schema)
insert into Staff (StaffID, FirstName, LastName, Position, Salary) values (301, 'John', 'Smith', 'Gate Agent', 52000);
insert into Staff (StaffID, FirstName, LastName, Position, Salary) values (302, 'Franklin', 'Wong', 'Operations Manager', 78000);
insert into Staff (StaffID, FirstName, LastName, Position, Salary) values (303, 'Alicia', 'Zelaya', 'Customer Service Agent', 50000);
insert into Staff (StaffID, FirstName, LastName, Position, Salary) values (304, 'Jennifer', 'Wallace', 'Airport Supervisor', 82000);
insert into Staff (StaffID, FirstName, LastName, Position, Salary) values (305, 'Ramesh', 'Narayan', 'Maintenance Technician', 61000);
insert into Staff (StaffID, FirstName, LastName, Position, Salary) values (306, 'Joyce', 'English', 'Security Officer', 54000);
insert into Staff (StaffID, FirstName, LastName, Position, Salary) values (307, 'Ahmad', 'Jabbar', 'Baggage Handler', 47000);
insert into Staff (StaffID, FirstName, LastName, Position, Salary) values (308, 'James', 'Borg', 'Airport Director', 98000);
 
-- PASSENGER
insert into Passenger (PassengerID, FirstName, Minit, LastName, PhoneNumber, PassportNumber)
values (401, 'John', 'B', 'Smith', '3135551001', 'P12345601');
 
insert into Passenger (PassengerID, FirstName, Minit, LastName, PhoneNumber, PassportNumber)
values (402, 'Franklin', 'T', 'Wong', '3135551002', 'P12345602');
 
insert into Passenger (PassengerID, FirstName, Minit, LastName, PhoneNumber, PassportNumber)
values (403, 'Alicia', 'J', 'Zelaya', '3135551003', 'P12345603');
 
insert into Passenger (PassengerID, FirstName, Minit, LastName, PhoneNumber, PassportNumber)
values (404, 'Jennifer', 'S', 'Wallace', '3135551004', 'P12345604');
 
insert into Passenger (PassengerID, FirstName, Minit, LastName, PhoneNumber, PassportNumber)
values (405, 'Ramesh', 'K', 'Narayan', '3135551005', 'P12345605');
 
insert into Passenger (PassengerID, FirstName, Minit, LastName, PhoneNumber, PassportNumber)
values (406, 'Joyce', 'A', 'English', '3135551006', 'P12345606');
 
insert into Passenger (PassengerID, FirstName, Minit, LastName, PhoneNumber, PassportNumber)
values (407, 'Ahmad', 'V', 'Jabbar', '3135551007', 'P12345607');
 
insert into Passenger (PassengerID, FirstName, Minit, LastName, PhoneNumber, PassportNumber)
values (408, 'James', 'E', 'Borg', '3135551008', 'P12345608');
 
-- FLIGHTS
insert into Flights (FlightID, FlightNumber, DepartureTime, ArrivalTime, Status,
                     PlaneID, AirlineID, DepartureAirportID, ArrivalAirportID, DepartureGateID)
values (501, 'DL120',
        to_date('2026-04-10 08:00', 'YYYY-MM-DD HH24:MI'),
        to_date('2026-04-10 10:15', 'YYYY-MM-DD HH24:MI'),
        'SCHEDULED', 1001, 101, 1, 6, 201);
 
insert into Flights (FlightID, FlightNumber, DepartureTime, ArrivalTime, Status,
                     PlaneID, AirlineID, DepartureAirportID, ArrivalAirportID, DepartureGateID)
values (502, 'AA245',
        to_date('2026-04-10 09:30', 'YYYY-MM-DD HH24:MI'),
        to_date('2026-04-10 12:00', 'YYYY-MM-DD HH24:MI'),
        'SCHEDULED', 1002, 102, 2, 4, 202);
 
insert into Flights (FlightID, FlightNumber, DepartureTime, ArrivalTime, Status,
                     PlaneID, AirlineID, DepartureAirportID, ArrivalAirportID, DepartureGateID)
values (503, 'UA310',
        to_date('2026-04-10 13:00', 'YYYY-MM-DD HH24:MI'),
        to_date('2026-04-10 15:20', 'YYYY-MM-DD HH24:MI'),
        'BOARDING', 1003, 103, 3, 5, 203);
 
insert into Flights (FlightID, FlightNumber, DepartureTime, ArrivalTime, Status,
                     PlaneID, AirlineID, DepartureAirportID, ArrivalAirportID, DepartureGateID)
values (504, 'AC411',
        to_date('2026-04-11 07:15', 'YYYY-MM-DD HH24:MI'),
        to_date('2026-04-11 08:25', 'YYYY-MM-DD HH24:MI'),
        'SCHEDULED', 1004, 104, 7, 6, 207);
 
insert into Flights (FlightID, FlightNumber, DepartureTime, ArrivalTime, Status,
                     PlaneID, AirlineID, DepartureAirportID, ArrivalAirportID, DepartureGateID)
values (505, 'BA522',
        to_date('2026-04-11 16:40', 'YYYY-MM-DD HH24:MI'),
        to_date('2026-04-11 20:10', 'YYYY-MM-DD HH24:MI'),
        'DELAYED', 1005, 105, 8, 1, 208);
 
insert into Flights (FlightID, FlightNumber, DepartureTime, ArrivalTime, Status,
                     PlaneID, AirlineID, DepartureAirportID, ArrivalAirportID, DepartureGateID)
values (506, 'DL333',
        to_date('2026-04-12 06:45', 'YYYY-MM-DD HH24:MI'),
        to_date('2026-04-12 08:55', 'YYYY-MM-DD HH24:MI'),
        'SCHEDULED', 1006, 101, 6, 2, 210);
 
insert into Flights (FlightID, FlightNumber, DepartureTime, ArrivalTime, Status,
                     PlaneID, AirlineID, DepartureAirportID, ArrivalAirportID, DepartureGateID)
values (507, 'AA178',
        to_date('2026-04-12 11:00', 'YYYY-MM-DD HH24:MI'),
        to_date('2026-04-12 13:30', 'YYYY-MM-DD HH24:MI'),
        'SCHEDULED', 1007, 102, 4, 3, 204);
 
insert into Flights (FlightID, FlightNumber, DepartureTime, ArrivalTime, Status,
                     PlaneID, AirlineID, DepartureAirportID, ArrivalAirportID, DepartureGateID)
values (508, 'BA610',
        to_date('2026-04-13 18:20', 'YYYY-MM-DD HH24:MI'),
        to_date('2026-04-13 21:50', 'YYYY-MM-DD HH24:MI'),
        'SCHEDULED', 1008, 105, 8, 7, 208);
 
-- TICKETS
insert into Tickets (TicketID, PassengerID, FlightID, AirlineID, SeatNumber, FlightDate, ClassType, Price)
values (601, 401, 501, 101, '12A', to_date('2026-04-10', 'YYYY-MM-DD'), 'ECONOMY', 240.00);
 
insert into Tickets (TicketID, PassengerID, FlightID, AirlineID, SeatNumber, FlightDate, ClassType, Price)
values (602, 402, 501, 101, '12B', to_date('2026-04-10', 'YYYY-MM-DD'), 'ECONOMY', 240.00);
 
insert into Tickets (TicketID, PassengerID, FlightID, AirlineID, SeatNumber, FlightDate, ClassType, Price)
values (603, 403, 502, 102, '3C',  to_date('2026-04-10', 'YYYY-MM-DD'), 'BUSINESS', 620.00);
 
insert into Tickets (TicketID, PassengerID, FlightID, AirlineID, SeatNumber, FlightDate, ClassType, Price)
values (604, 404, 503, 103, '1A',  to_date('2026-04-10', 'YYYY-MM-DD'), 'FIRST', 980.00);
 
insert into Tickets (TicketID, PassengerID, FlightID, AirlineID, SeatNumber, FlightDate, ClassType, Price)
values (605, 405, 504, 104, '14D', to_date('2026-04-11', 'YYYY-MM-DD'), 'ECONOMY', 210.00);
 
insert into Tickets (TicketID, PassengerID, FlightID, AirlineID, SeatNumber, FlightDate, ClassType, Price)
values (606, 406, 505, 105, '5B',  to_date('2026-04-11', 'YYYY-MM-DD'), 'PREMIUM', 850.00);
 
insert into Tickets (TicketID, PassengerID, FlightID, AirlineID, SeatNumber, FlightDate, ClassType, Price)
values (607, 407, 506, 101, '7F',  to_date('2026-04-12', 'YYYY-MM-DD'), 'ECONOMY', 180.00);
 
insert into Tickets (TicketID, PassengerID, FlightID, AirlineID, SeatNumber, FlightDate, ClassType, Price)
values (608, 408, 507, 102, '2D',  to_date('2026-04-12', 'YYYY-MM-DD'), 'BUSINESS', 540.00);
 
insert into Tickets (TicketID, PassengerID, FlightID, AirlineID, SeatNumber, FlightDate, ClassType, Price)
values (609, 401, 508, 105, '10A', to_date('2026-04-13', 'YYYY-MM-DD'), 'ECONOMY', 730.00);
 
insert into Tickets (TicketID, PassengerID, FlightID, AirlineID, SeatNumber, FlightDate, ClassType, Price)
values (610, 403, 506, 101, '7A',  to_date('2026-04-12', 'YYYY-MM-DD'), 'ECONOMY', 180.00);
 
COMMIT;