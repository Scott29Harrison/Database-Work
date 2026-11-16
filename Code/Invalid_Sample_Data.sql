-- Test for Boundry Conditions for Company
INSERT INTO Company (companyID, companyName) VALUES ('2', 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
INSERT INTO Company (companyID, companyName) VALUES ('3', '');

-- Test for Boundry Conditions for Branch
INSERT INTO Branch (branchID, location, numberOfRooms, companyID) VALUES ('5', 'Keele', '3', '1');
INSERT INTO Branch (branchID, location, numberOfRooms, companyID) VALUES ('1', 'Keele', '31', '1');
INSERT INTO Branch (branchID, location, numberOfRooms, companyID) VALUES ('2', '', '7', '1');
INSERT INTO Branch (branchID, location, numberOfRooms, companyID) VALUES ('3', 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', '9', '1');
INSERT INTO Branch (branchID, location, numberOfRooms, companyID) VALUES ('A', 'Keele', '6', '1');
INSERT INTO Branch (branchID, location, numberOfRooms, companyID) VALUES ('4', 'Keele', 'A', '1');

-- Test for Boundry Conditions for Employee
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('5', 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'Manager', '1');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('1', 'AN Other', 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', '2');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('3', 'Anyone Else', '', '3');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('4', 'Anyone  Else 2', 'Manager', 'A');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('A', 'AN Other 2', 'Manager', '4');

-- Test for Boundry Conditions for Room
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('1', 'Delux', '1');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('2', '', '2');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('3', 'Standard', 'A');

-- Test for Boundry Conditions for Customer
INSERT INTO Customer (customerID, customerName, accountType) VALUES ('4', 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'Standard');
INSERT INTO Customer (customerID, customerName, accountType) VALUES ('1', 'Company 2', 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
INSERT INTO Customer (customerID, customerName, accountType) VALUES ('2', '', 'Business');
INSERT INTO Customer (customerID, customerName, accountType) VALUES ('3', 'Company 3', '');

-- Test for Boundry Conditions for Booking
INSERT INTO Booking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('1', 'A', '2', '1', '1');
INSERT INTO Booking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('3', TO_DATE('2025-05-15', 'yyyy-mm-dd'), 'A', '1', '1');
INSERT INTO Booking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('5', TO_DATE('2025-05-17', 'yyyy-mm-dd'), '4', '1', '1');
INSERT INTO Booking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('6', TO_DATE('2025-05-18', 'yyyy-mm-dd'), '', '1', '1');
INSERT INTO Booking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('7', TO_DATE('2025-05-19', 'yyyy-mm-dd'), '4', 'A', '1');
INSERT INTO Booking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('8', TO_DATE('2025-05-20', 'yyyy-mm-dd'), '4', '', '1');
INSERT INTO Booking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('9', TO_DATE('2025-05-21', 'yyyy-mm-dd'), '4', '1', '');
INSERT INTO Booking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('10', TO_DATE('2025-05-22', 'yyyy-mm-dd'), '4', '1', 'A');
INSERT INTO Booking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('11', '', '4', '1', '1');
INSERT INTO Booking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('A', TO_DATE('2025-05-24', 'yyyy-mm-dd'), '4', '1', '1');

-- Test for Boundry Conditions for Standard
INSERT INTO Standard (bookingReference, requiresDecoration) VALUES ('1', 'A');

-- Test for Boundry Conditions for Executive
INSERT INTO Executive (bookingReference, television, internetAccess, buffetOrdered) VALUES ('3', 'A', 'N', 'Y');
INSERT INTO Executive (bookingReference, television, internetAccess, buffetOrdered) VALUES ('1', 'Y', 'A', 'Y');
INSERT INTO Executive (bookingReference, television, internetAccess, buffetOrdered) VALUES ('2', 'Y', 'N', 'A');

-- Test for Boundry Conditions for Invoice
INSERT INTO Invoice (invoiceID, bookingReference, customerID, paymentStatus) VALUES ('A', '3', '4', 'Paid');
INSERT INTO Invoice (invoiceID, bookingReference, customerID, paymentStatus) VALUES ('1', 'A', '4', 'Paid');
INSERT INTO Invoice (invoiceID, bookingReference, customerID, paymentStatus) VALUES ('2', '', '4', 'Paid');
INSERT INTO Invoice (invoiceID, bookingReference, customerID, paymentStatus) VALUES ('4', '1', 'A', 'Paid');
INSERT INTO Invoice (invoiceID, bookingReference, customerID, paymentStatus) VALUES ('6', '1', '', 'Paid');
INSERT INTO Invoice (invoiceID, bookingReference, customerID, paymentStatus) VALUES ('7', '1', '4', '');
INSERT INTO Invoice (invoiceID, bookingReference, customerID, paymentStatus) VALUES ('8', '1', '4', 'Not Paid');

-- Test for Boundry Conditions for Past Booking
INSERT INTO PastBooking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('A', TO_DATE('2025-05-15', 'yyyy-mm-dd'), '3', '4', '1');
INSERT INTO PastBooking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('', TO_DATE('2025-05-15', 'yyyy-mm-dd'), '3', '4', '1');
INSERT INTO PastBooking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('1', '', '3', '4', '1');
INSERT INTO PastBooking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('2', 'A', '3', '4', '1');
INSERT INTO PastBooking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('3', TO_DATE('2025-05-15', 'yyyy-mm-dd'), '', '4', '1');
INSERT INTO PastBooking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('5', TO_DATE('2025-05-15', 'yyyy-mm-dd'), 'A', '4', '1');
INSERT INTO PastBooking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('7', TO_DATE('2025-05-15', 'yyyy-mm-dd'), '4', '', '1');
INSERT INTO PastBooking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('8', TO_DATE('2025-05-15', 'yyyy-mm-dd'), '4', 'A', '1');
INSERT INTO PastBooking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('9', TO_DATE('2025-05-15', 'yyyy-mm-dd'), '4', '4', '');
INSERT INTO PastBooking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('11', TO_DATE('2025-05-15', 'yyyy-mm-dd'), '4', '4', 'A');

-- Test for Boundry Conditions for Supplier
INSERT INTO Supplier (supplierID, supplierName, areaServed, productsSupplied) VALUES ('7', 'Company', 'Area', 'Supplies');
INSERT INTO Supplier (supplierID, supplierName, areaServed, productsSupplied) VALUES ('', 'Company', 'Area', 'Supplies');
INSERT INTO Supplier (supplierID, supplierName, areaServed, productsSupplied) VALUES ('A', 'Company', 'Area', 'Supplies');
INSERT INTO Supplier (supplierID, supplierName, areaServed, productsSupplied) VALUES ('1', '', 'Area', 'Supplies');
INSERT INTO Supplier (supplierID, supplierName, areaServed, productsSupplied) VALUES ('2', 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'Area', 'Supplies');
INSERT INTO Supplier (supplierID, supplierName, areaServed, productsSupplied) VALUES ('3', 'Company', '', 'Supplies');
INSERT INTO Supplier (supplierID, supplierName, areaServed, productsSupplied) VALUES ('4', 'Company', 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'Supplies');
INSERT INTO Supplier (supplierID, supplierName, areaServed, productsSupplied) VALUES ('5', 'Company', 'Area', '');
INSERT INTO Supplier (supplierID, supplierName, areaServed, productsSupplied) VALUES ('6', 'Company', 'Area', 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');

-- Test for Boundry Conditions for Distributor
INSERT INTO Distributor (distributorID, branchID, supplierID) VALUES ('', '1', '1');
INSERT INTO Distributor (distributorID, branchID, supplierID) VALUES ('A', '1', '1');
INSERT INTO Distributor (distributorID, branchID, supplierID) VALUES ('1', '', '1');
INSERT INTO Distributor (distributorID, branchID, supplierID) VALUES ('1', 'A', '1');
INSERT INTO Distributor (distributorID, branchID, supplierID) VALUES ('1', '1', '');
INSERT INTO Distributor (distributorID, branchID, supplierID) VALUES ('1', '1', 'A');

-- Test For Trigger Conditions
INSERT INTO Booking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('0', TO_DATE('2025-05-15', 'yyyy-mm-dd'), '4', '1', '4');
INSERT INTO Invoice (invoiceID, bookingReference, customerID, paymentStatus) VALUES ('0', '0', '1', 'Unpaid');
INSERT INTO Distributor (distributorID, branchID, supplierID) VALUES ('0', '0', '2');