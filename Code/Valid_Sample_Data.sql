-- Insert Sample Data for the Company
INSERT INTO Company (companyID, companyName) VALUES ('1', 'EASE Ltd');

-- Insert Sample Data for Branches
INSERT INTO Branch (branchID, location, numberOfRooms, companyID) VALUES ('1', 'Gloucester', '5', '1');
INSERT INTO Branch (branchID, location, numberOfRooms, companyID) VALUES ('2', 'Dursley', '8', '1');
INSERT INTO Branch (branchID, location, numberOfRooms, companyID) VALUES ('3', 'Keele', '15', '1');
INSERT INTO Branch (branchID, location, numberOfRooms, companyID) VALUES ('4', 'Stoke-on-Trent', '30', '1');

-- Insert Sample Data for Employees
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('1', 'Lily Campbell', 'Manager', '1');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('2', 'Riley Spencer', 'Administrator', '1');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('3', 'Zack Hayes', 'General Duties', '1');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('4', 'Rose Bailey', 'Cleaner', '1');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('5', 'Jacob Turner', 'Manager', '2');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('6', 'Diana Bennett', 'Administrator', '2');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('7', 'Blake Wallace', 'Technician', '2');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('8', 'George Adams', 'General Duties', '2');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('9', 'Jamie Coleman', 'Cleaner', '2');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('10', 'Edward Jenkins', 'Manager', '3');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('11', 'Sophie Scott', 'Administrator', '3');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('12', 'Taylor Lewis', 'Technician', '3');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('13', 'Benjamin Carter', 'General Duties', '3');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('14', 'Julia King', 'Cleaner', '3');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('15', 'Peter Evans', 'Cleaner', '3');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('16', 'Victor Gray', 'Cleaner', '3');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('17', 'Adam Hughes', 'Manager', '4');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('18', 'Casey Harper', 'Administrator', '4');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('19', 'Hannah Hill', 'Technician', '4');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('20', 'Wendy Long', 'Technician', '4');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('21', 'Samuel Barnes', 'General Duties', '4');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('22', 'Victor Gray', 'General Duties', '4');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('23', 'Nora Hall', 'Cleaner', '4');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('24', 'Michael Brooks', 'Cleaner', '4');
INSERT INTO Employee (employeeID, employeeName, employeeRole, branchID) VALUES ('25', 'Logan Davies', 'Cleaner', '4');

-- Insert Sample Data for Rooms
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('1', 'Standard', '1');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('2', 'Standard', '1');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('3', 'Standard', '1');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('4', 'Executive', '1');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('5', 'Executive', '1');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('6', 'Standard', '2');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('7', 'Standard', '2');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('8', 'Standard', '2');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('9', 'Standard', '2');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('10', 'Executive', '2');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('11', 'Executive', '2');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('12', 'Executive', '2');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('13', 'Executive', '2');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('14', 'Standard', '3');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('15', 'Standard', '3');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('16', 'Standard', '3');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('17', 'Standard', '3');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('18', 'Standard', '3');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('19', 'Executive', '3');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('20', 'Executive', '3');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('21', 'Executive', '3');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('22', 'Executive', '3');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('23', 'Executive', '3');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('24', 'Executive', '3');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('25', 'Executive', '3');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('26', 'Executive', '3');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('27', 'Executive', '3');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('28', 'Executive', '3');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('29', 'Executive', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('30', 'Executive', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('31', 'Executive', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('32', 'Standard', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('33', 'Standard', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('34', 'Standard', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('35', 'Standard', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('36', 'Standard', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('37', 'Standard', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('38', 'Standard', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('39', 'Standard', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('40', 'Standard', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('41', 'Standard', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('42', 'Standard', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('43', 'Standard', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('44', 'Executive', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('45', 'Executive', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('46', 'Executive', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('47', 'Standard', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('48', 'Standard', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('49', 'Standard', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('50', 'Standard', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('51', 'Standard', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('52', 'Standard', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('53', 'Standard', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('54', 'Executive', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('55', 'Executive', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('56', 'Standard', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('57', 'Standard', '4');
INSERT INTO Room (roomNo, roomType, branchID) VALUES ('58', 'Standard', '4');

-- Insert Sample Data for Customers
INSERT INTO Customer (customerID, customerName, accountType) VALUES ('1', 'Keele University', 'Business');
INSERT INTO Customer (customerID, customerName, accountType) VALUES ('2', 'Scott Harrison', 'Standard');
INSERT INTO Customer (customerID, customerName, accountType) VALUES ('3', 'Gloucester Rugby', 'Business');
INSERT INTO Customer (customerID, customerName, accountType) VALUES ('4', 'Graham Childs', 'Standard');
INSERT INTO Customer (customerID, customerName, accountType) VALUES ('5', 'Stoke Ski Club', 'Business');

-- Insert Sample Data for Bookings
INSERT INTO Booking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('1', TO_DATE('2025-05-10', 'yyyy-mm-dd'), '3', '1', '15');
INSERT INTO Booking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('2', TO_DATE('2025-05-15', 'yyyy-mm-dd'), '3', '1', '20');
INSERT INTO Booking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('3', TO_DATE('2025-05-12', 'yyyy-mm-dd'), '2', '3', '1');
INSERT INTO Booking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('4', TO_DATE('2025-05-16', 'yyyy-mm-dd'), '6', '5', '44');
INSERT INTO Booking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('5', TO_DATE('2025-05-17', 'yyyy-mm-dd'), '6', '5', '54');
INSERT INTO Booking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('6', TO_DATE('2025-06-18', 'yyyy-mm-dd'), '8', '2', '14');
INSERT INTO Booking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('7', TO_DATE('2025-06-18', 'yyyy-mm-dd'), '8', '2', '15');
INSERT INTO Booking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('8', TO_DATE('2025-06-18', 'yyyy-mm-dd'), '8', '2', '16');
INSERT INTO Booking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('9', TO_DATE('2025-05-14', 'yyyy-mm-dd'), '4', '4', '7');
INSERT INTO Booking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('10', TO_DATE('2025-05-14', 'yyyy-mm-dd'), '4', '4', '8');

-- Insert Sample Data for Standard Bookings
INSERT INTO Standard (bookingReference, requiresDecoration) VALUES ('3', 'Y');
INSERT INTO Standard (bookingReference, requiresDecoration) VALUES ('9', 'Y');
INSERT INTO Standard (bookingReference, requiresDecoration) VALUES ('10', 'Y');
INSERT INTO Standard (bookingReference, requiresDecoration) VALUES ('6', 'Y');
INSERT INTO Standard (bookingReference, requiresDecoration) VALUES ('1', 'N');
INSERT INTO Standard (bookingReference, requiresDecoration) VALUES ('7', 'Y');
INSERT INTO Standard (bookingReference, requiresDecoration) VALUES ('8', 'Y');

-- Insert Sample Data for Executive Bookings
INSERT INTO Executive (bookingReference, television, internetAccess, buffetOrdered) VALUES ('2', 'N', 'N', 'Y');
INSERT INTO Executive (bookingReference, television, internetAccess, buffetOrdered) VALUES ('4', 'Y', 'Y', 'Y');
INSERT INTO Executive (bookingReference, television, internetAccess, buffetOrdered) VALUES ('5', 'N', 'N', 'Y');

-- Insert Sample Data for Invoices
INSERT INTO Invoice (invoiceID, bookingReference, customerID, paymentStatus) VALUES ('1', '1', '1', 'Paid');
INSERT INTO Invoice (invoiceID, bookingReference, customerID, paymentStatus) VALUES ('2', '2', '1', 'Paid');
INSERT INTO Invoice (invoiceID, bookingReference, customerID, paymentStatus) VALUES ('3', '3', '3', 'Unpaid');
INSERT INTO Invoice (invoiceID, bookingReference, customerID, paymentStatus) VALUES ('4', '4', '5', 'Unpaid');
INSERT INTO Invoice (invoiceID, bookingReference, customerID, paymentStatus) VALUES ('5', '5', '5', 'Unpaid');

-- Insert Sample Data for Past Bookings
INSERT INTO PastBooking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('1', TO_DATE('2024-05-10', 'yyyy-mm-dd'), '2', '1', '15');
INSERT INTO PastBooking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('2', TO_DATE('2024-05-15', 'yyyy-mm-dd'), '1', '1', '20');
INSERT INTO PastBooking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('3', TO_DATE('2024-05-12', 'yyyy-mm-dd'), '4', '3', '1');
INSERT INTO PastBooking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('4', TO_DATE('2024-05-16', 'yyyy-mm-dd'), '5', '5', '44');
INSERT INTO PastBooking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('5', TO_DATE('2024-05-17', 'yyyy-mm-dd'), '5', '5', '54');
INSERT INTO PastBooking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('6', TO_DATE('2024-06-18', 'yyyy-mm-dd'), '4', '2', '14');
INSERT INTO PastBooking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('7', TO_DATE('2024-06-18', 'yyyy-mm-dd'), '4', '2', '15');
INSERT INTO PastBooking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('8', TO_DATE('2024-06-18', 'yyyy-mm-dd'), '4', '2', '16');
INSERT INTO PastBooking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('9', TO_DATE('2024-05-14', 'yyyy-mm-dd'), '8', '4', '7');
INSERT INTO PastBooking (bookingReference, bookingDate, timePeriod, customerID, roomNo) VALUES ('10', TO_DATE('2024-05-14', 'yyyy-mm-dd'), '8', '4', '8');

-- Insert Sample Data for Suppliers
INSERT INTO Supplier (supplierID, supplierName, areaServed, productsSupplied) VALUES ('1', 'Gloucester Catering', 'Gloucester', 'Sandwiches');
INSERT INTO Supplier (supplierID, supplierName, areaServed, productsSupplied) VALUES ('2', 'Gloucester Office Supplies', 'Gloucester', 'Toilet Rolls, Table Cloths');
INSERT INTO Supplier (supplierID, supplierName, areaServed, productsSupplied) VALUES ('3', 'Event Supplies', 'Dursley', 'Sandwiches, Toilet Rolls, Table Cloths');
INSERT INTO Supplier (supplierID, supplierName, areaServed, productsSupplied) VALUES ('4', 'Catering 4 You', 'Keele', 'Sandwiches, Table Cloths');
INSERT INTO Supplier (supplierID, supplierName, areaServed, productsSupplied) VALUES ('5', 'Tesco', 'Keele', 'Toilet Rolls');
INSERT INTO Supplier (supplierID, supplierName, areaServed, productsSupplied) VALUES ('6', 'Subway', 'Stoke-on-Trent', 'Sandwiches');
INSERT INTO Supplier (supplierID, supplierName, areaServed, productsSupplied) VALUES ('7', 'Asda', 'Stoke-on-Trent', 'Toilet Rolls');
INSERT INTO Supplier (supplierID, supplierName, areaServed, productsSupplied) VALUES ('8', 'Hotel Supplies', 'Stoke-on-Trent', 'Table Cloths');

-- Insert Sample Data for Distributors
INSERT INTO Distributor (distributorID, branchID, supplierID) VALUES ('1', '1', '1');
INSERT INTO Distributor (distributorID, branchID, supplierID) VALUES ('2', '1', '2');
INSERT INTO Distributor (distributorID, branchID, supplierID) VALUES ('3', '2', '3');
INSERT INTO Distributor (distributorID, branchID, supplierID) VALUES ('4', '3', '4');
INSERT INTO Distributor (distributorID, branchID, supplierID) VALUES ('5', '3', '5');
INSERT INTO Distributor (distributorID, branchID, supplierID) VALUES ('6', '4', '6');
INSERT INTO Distributor (distributorID, branchID, supplierID) VALUES ('7', '4', '7');
INSERT INTO Distributor (distributorID, branchID, supplierID) VALUES ('8', '4', '8');

-- Commit Data to Server
COMMIT;
