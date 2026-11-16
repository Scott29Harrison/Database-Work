-- Create the Company Table
CREATE TABLE Company (
    companyID NUMBER PRIMARY KEY,
    companyName VARCHAR2(100) NOT NULL
);

-- Create the Branch Table
CREATE TABLE Branch (
    branchID NUMBER PRIMARY KEY,
    location VARCHAR2(100) NOT NULL,
    numberOfRooms NUMBER NOT NULL CHECK (numberOfRooms BETWEEN 5 AND 30),
    companyID NUMBER NOT NULL,
    FOREIGN KEY (companyID) REFERENCES Company(companyID)
);

-- Create the Employee Table
CREATE TABLE Employee (
    employeeID NUMBER PRIMARY KEY,
    employeeName VARCHAR2(100) NOT NULL,
    employeeRole VARCHAR2(50) NOT NULL,
    branchID NUMBER NOT NULL,
    FOREIGN KEY (branchID) REFERENCES Branch(branchID)
);

-- Create the Room Table
CREATE TABLE Room (
    roomNo NUMBER PRIMARY KEY,
    roomType VARCHAR2(20) NOT NULL CHECK (roomType IN ('Standard', 'Executive')),
    branchID NUMBER NOT NULL,
    FOREIGN KEY (branchID) REFERENCES Branch(branchID)
);

-- Create the Customer Table
CREATE TABLE Customer (
    customerID NUMBER PRIMARY KEY,
    customerName VARCHAR2(100) NOT NULL,
    accountType VARCHAR2(20) NOT NULL CHECK (accountType IN ('Standard', 'Business'))
);
 
-- Create the Booking Table
CREATE TABLE Booking (
    bookingReference NUMBER PRIMARY KEY,
    bookingDate DATE NOT NULL,
    timePeriod NUMBER NOT NULL,
    customerID NUMBER NOT NULL,
    roomNo NUMBER NOT NULL,
    FOREIGN KEY (customerID) REFERENCES Customer(customerID),
    FOREIGN KEY (roomNo) REFERENCES Room(roomNo)
);

-- Create the Standard Booking Table
CREATE TABLE Standard (
    bookingReference NUMBER NOT NULL,
    requiresDecoration VARCHAR2(1) NOT NULL CHECK (requiresDecoration IN ('Y', 'N')),
    FOREIGN KEY (bookingReference) REFERENCES Booking(bookingReference)
);

-- Create the Executive Booking Table
CREATE TABLE Executive (
    bookingReference NUMBER NOT NULL,
    television VARCHAR2(1) NOT NULL CHECK (television IN ('Y', 'N')),
    internetAccess VARCHAR2(1) NOT NULL CHECK (internetAccess IN ('Y', 'N')),
    buffetOrdered VARCHAR2(1) NOT NULL CHECK (buffetOrdered IN ('Y', 'N')),
    FOREIGN KEY (bookingReference) REFERENCES Booking(bookingReference)
);

-- Create the Supplier Table
CREATE TABLE Supplier (
    supplierID NUMBER PRIMARY KEY,
    supplierName VARCHAR2(100) NOT NULL,
    areaServed VARCHAR2(100) NOT NULL,
    productsSupplied VARCHAR2(200) NOT NULL
);

-- Create the Distributor associative entity Table
CREATE TABLE Distributor (
    distributorID NUMBER PRIMARY KEY,
    branchID NUMBER NOT NULL,
    supplierID NUMBER NOT NULL,
    FOREIGN KEY (branchID) REFERENCES Branch(branchID),
    FOREIGN KEY (supplierID) REFERENCES Supplier(supplierID)
);

-- Create the Invoice Table
CREATE TABLE Invoice (
    invoiceID NUMBER PRIMARY KEY,
    bookingReference NUMBER NOT NULL,
    customerID NUMBER NOT NULL,
    paymentStatus VARCHAR2(6) NOT NULL CHECK (paymentStatus IN ('Paid', 'Unpaid')),
    FOREIGN KEY (bookingReference) REFERENCES Booking(bookingReference),
    FOREIGN KEY (customerID) REFERENCES Customer(customerID)
);
 
-- Create the Past Booking Table
CREATE TABLE PastBooking (
    bookingReference NUMBER PRIMARY KEY,
    bookingDate DATE NOT NULL,
    timePeriod NUMBER NOT NULL,
    customerID NUMBER NOT NULL,
    roomNo NUMBER NOT NULL,
    FOREIGN KEY (customerID) REFERENCES Customer(customerID),
    FOREIGN KEY (roomNo) REFERENCES Room(roomNo)
);
 
-- Create Trigger condition to ensure only Business Customers can book Executive Rooms
CREATE OR REPLACE TRIGGER CheckRoomBooking
BEFORE INSERT OR UPDATE ON Booking
FOR EACH ROW
DECLARE
    roomTypeLocal VARCHAR2(20);
    accountTypeLocal VARCHAR2(20);
BEGIN
    SELECT roomType INTO roomTypeLocal
    FROM Room
    WHERE roomNo = :NEW.roomNo;
 
    SELECT accountType INTO accountTypeLocal
    FROM Customer
    WHERE customerID = :NEW.customerID;
 
    IF roomTypeLocal = 'Executive' AND accountTypeLocal = 'Standard' THEN
        RAISE_APPLICATION_ERROR(-20001, 'Standard customers can only book standard rooms.');
    END IF;
END;
/

-- Create Trigger condition to ensure only Business Customers can pay by Invoice
CREATE OR REPLACE TRIGGER CheckInvoiceEligibility
BEFORE INSERT OR UPDATE ON Invoice
FOR EACH ROW
DECLARE
    accountTypeLocal VARCHAR2(20);
BEGIN
    -- Fetch the accountType of the customer
    SELECT accountType INTO accountTypeLocal
    FROM Customer
    WHERE customerID = :NEW.customerID;
 
    -- Check if the customer is NOT a business account
    IF accountTypeLocal != 'Business' THEN
        RAISE_APPLICATION_ERROR(-20003, 'Only business customers are allowed to pay by invoice.');
    END IF;
END;
/

-- Create Trigger condition to ensure the area served for a Supplier is the same as the location of the Branch it supplies
CREATE OR REPLACE TRIGGER CheckSupplierBranchMatch
BEFORE INSERT OR UPDATE ON Distributor
FOR EACH ROW
DECLARE
    areaServedLocal VARCHAR2(255);
    locationLocal VARCHAR2(255);
BEGIN
    -- Fetch the area served of the supplier
    SELECT areaServed INTO areaServedLocal
    FROM Supplier
    WHERE supplierID = :NEW.supplierID;
 
    -- Fetch the location of the branch
    SELECT location INTO locationLocal
    FROM Branch
    WHERE branchID = :NEW.branchID;
 
    -- Check if the supplier area served matches the branch location
    IF areaServedLocal != locationLocal THEN
        RAISE_APPLICATION_ERROR(-20004, 'Supplier area must match the branch location where the distributor is used.');
    END IF;
END;
/