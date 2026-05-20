-- Airport Database Management System
-- Ethan Phillips, Ioannis Tzortzatos
set linesize 150
set pagesize 50
set echo on

-- Drop tables if they exist
drop table Tickets;
drop table Flights;
drop table Aircraft;
drop table Gates;
drop table Staff;
drop table Passenger;
drop table Airline;
drop table Airport;


-- Airline Table
create table Airline (
    AirlineID      number            not null,
    AirlineName    varchar(100)    not null,
    constraint PK_Airline primary key (AirlineID)
);


-- Airport Table
create table Airport (
    AirportID      number             not null,
    airportName    varchar(100)    not null,
    AirportCode    varchar(10)     not null,
    City           varchar(50),
    State          varchar(50),
    Country        varchar(50),
    constraint PK_Airport primary key (AirportID)
);


-- Passenger Table
create table Passenger (
    PassengerID     number             not null,
    FirstName       varchar(50)     not null,
    Minit           char(1),
    LastName        varchar(50)     not null,
    PhoneNumber     varchar(20),
    PassportNumber  varchar(20)     not null,
    constraint PK_Passenger primary key (PassengerID)
);

-- Staff Table
create table Staff (
    StaffID        number             not null,
    FirstName      varchar(50)     not null,
    LastName       varchar(50)     not null,
    Position       varchar(50),
    Salary         DECIMAL(10, 2),
    constraint PK_Staff primary key (StaffID)
);


-- Aircraft Table
-- Airline 1 -- M Aircraft (Own relationship)
create table Aircraft (
    PlaneID        number             not null,
    Model          varchar(50),
    Capacity       number,
    AirlineID      number             not null,
    constraint PK_Aircraft primary key (PlaneID),
    constraint FK_Aircraft_Airline foreign key (AirlineID)
        references Airline(AirlineID)
);

-- Gates Table
-- Airport 1 -- M Gates (Has relationship)
create table Gates (
    GateID         number             not null,
    GateNumber     varchar(10)     not null,
    Terminal       varchar(10),
    AirportID      number             not null,
    constraint PK_Gates primary key (GateID),
    constraint FK_Gates_Airport foreign key (AirportID)
        references Airport(AirportID)
);

-- Flights Table
-- Aircraft 1 -- M Flights (Flys)
-- Airline 1 -- M Flights (operates)
-- Airport 1 -- M Flights (Departure & Arrival)
-- Gates 1 -- M Flights (Assigned/DepartureGate)
create table Flights (
    FlightID           number             not null,
    FlightNumber       varchar(20)     not null,
    DepartureTime      date        not null,
    ArrivalTime        date        not null,
    Status             varchar(20),
    PlaneID            number             not null,
    AirlineID          number             not null,
    DepartureAirportID number             not null,
    ArrivalAirportID   number             not null,
    DepartureGateID    number,
    constraint PK_Flights primary key (FlightID),
    constraint FK_Flights_Aircraft foreign key (PlaneID)
        references Aircraft(PlaneID),
    constraint FK_Flights_Airline foreign key (AirlineID)
        references Airline(AirlineID),
    constraint FK_Flights_DepartureAirport foreign key (DepartureAirportID)
        references Airport(AirportID),
    constraint FK_Flights_ArrivalAirport foreign key (ArrivalAirportID)
        references Airport(AirportID),
    constraint FK_Flights_Gate foreign key (DepartureGateID)
        references Gates(GateID)
);

-- Tickets Table
-- Passenger M -- Orders -- M Tickets
-- Flights 1 -- M Tickets (Have)
-- Airline 1 -- M Tickets (Issues)
-- Composite key: (PassengerID, FlightID, TicketID)
create table Tickets (
    TicketID       number             not null,
    PassengerID    number             not null,
    FlightID       number             not null,
    AirlineID      number             not null,
    SeatNumber     varchar(10),
    FlightDate     DATE,
    ClassType      varchar(20),
    Price          decimal(10, 2),
    constraint PK_Tickets primary key (TicketID, PassengerID, FlightID),
    constraint FK_Tickets_Passenger foreign key (PassengerID)
        references Passenger(PassengerID),
    constraint FK_Tickets_Flights foreign key (FlightID)
        references Flights(FlightID),
    constraint FK_Tickets_Airline foreign key (AirlineID)
        references Airline(AirlineID)
);
