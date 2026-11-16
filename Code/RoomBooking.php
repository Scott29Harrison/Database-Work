<?php

//Program to read the contents of ITEM and display them in a table

//putenv("ORACLE_SID=teaching"); Causes a warning so commented out

// This is the section of the file that holds all of the php SQL queries 

// Connects to my Oracle SQL server, where the database is stored
if ($Connection = oci_connect("y0o37", "HollowKnight25!"))
{
	// Fetch the company name from the database
	$sql = "SELECT companyName FROM Company WHERE companyID=1";
	$Statement = oci_parse($Connection, $sql);
	oci_execute($Statement);
	if (oci_fetch($Statement)) 
	{
 		$companyName = oci_result($Statement, 1);
	}
	oci_free_statement($Statement);	
	
	// Fetch the branch IDs from the database
	$sql = "SELECT branchID FROM Branch WHERE companyID = 1";
	$Statement = oci_parse($Connection, $sql);
	oci_execute($Statement);
	$branches = [];
	while ($row = oci_fetch_assoc($Statement)) 
	{
	    $branches[] = $row;
	}
	oci_free_statement($Statement);

	// Fetch Branch Details from the database for the chosen Branch
	$branchDetails = null;
	if (isset($_GET['branchID'])) {
		$branchID = $_GET['branchID'];

		// Fetch details of the selected branch
		$sql = "SELECT * FROM Branch WHERE branchID = :branchID";
		$Statement = oci_parse($Connection, $sql);
		oci_bind_by_name($Statement, ":branchID", $branchID);
		oci_execute($Statement);

		$branchDetails = oci_fetch_assoc($Statement);

		oci_free_statement($Statement);
	}
 	
	// Fetch Employee Details from the database for the chosen Branch
	$employeeDetails = [];
	if (isset($_GET['branchID'])) {
		$branchID = $_GET['branchID'];
 
		// Fetch details of the selected branch
		$sql = "SELECT * FROM Employee WHERE branchID = :branchID";
		$Statement = oci_parse($Connection, $sql);
		oci_bind_by_name($Statement, ":branchID", $branchID);
		oci_execute($Statement);
 		
		while ($row = oci_fetch_assoc($Statement)) 
		{
			$employeeDetails[] = $row;
		}
 
		oci_free_statement($Statement);
	}

	// Fetch Supplier Details from the database for the chosen Branch
	$supplierDetails = [];
	if (isset($_GET['branchID'])) {
		$branchID = $_GET['branchID'];
 
		// Fetch supplier details for the branch
		$sql = "SELECT s.* FROM Distributor d JOIN Supplier s ON d.supplierID = s.supplierID WHERE d.branchID = :branchID";
		$Statement = oci_parse($Connection, $sql);
		oci_bind_by_name($Statement, ":branchID", $branchID);
		oci_execute($Statement);
 		
		while ($row = oci_fetch_assoc($Statement)) 
		{
			$supplierDetails[] = $row;
		}
 
		oci_free_statement($Statement);
	}

	// Fetch Room Numbers from the database for the chosen Branch
	if (isset($_GET['branchID'])) {
		$branchID = $_GET['branchID'];

		// Fetch the room numbers for the branch
		$sql = "SELECT roomNo FROM Room WHERE branchID = :branchID";
		$Statement = oci_parse($Connection, $sql);
		oci_bind_by_name($Statement, ":branchID", $branchID);
		oci_execute($Statement);
		$rooms = [];
		while ($row = oci_fetch_assoc($Statement)) 
		{
	   		$rooms[] = $row;
		}
		oci_free_statement($Statement);

		// Fetch Room Details from the database for the chosen Room
		$roomType = null;
		if (isset($_GET['roomNo'])) {
			$roomNo = $_GET['roomNo'];

			// Fetch room type of the selected room
			$sql = "SELECT roomType FROM Room WHERE roomNo = :roomNo";
			$Statement = oci_parse($Connection, $sql);
			oci_bind_by_name($Statement, ":roomNo", $roomNo);
			oci_execute($Statement);

			$roomType = oci_fetch_assoc($Statement);

			oci_free_statement($Statement);

			// Fetch Booking Details from the database for the chosen Branch based on room type
			$bookingDetails = [];
			if ($roomType['ROOMTYPE'] == 'Standard') {
				$roomNo = $_GET['roomNo'];
 
				// Fetch booking details for the standard room
				$sql = "SELECT * FROM Booking b JOIN Standard s ON b.bookingReference = s.bookingReference 
				JOIN Customer c ON b.customerID = c.customerID 
				WHERE b.roomNo = :roomNo";
				$Statement = oci_parse($Connection, $sql);
				oci_bind_by_name($Statement, ":roomNo", $roomNo);
				oci_execute($Statement);
 		
				while ($row = oci_fetch_assoc($Statement)) 
				{
					$bookingDetails[] = $row;
				}
 
				oci_free_statement($Statement);
			}
			if ($roomType['ROOMTYPE'] == 'Executive') {
 				$roomNo = $_GET['roomNo'];
 
				// Fetch booking details for the executive room
				$sql = "SELECT * FROM Booking b JOIN Executive e ON b.bookingReference = e.bookingReference 
				JOIN Customer c ON b.customerID = c.customerID 
				WHERE b.roomNo = :roomNo";
				$Statement = oci_parse($Connection, $sql);
				oci_bind_by_name($Statement, ":roomNo", $roomNo);
				oci_execute($Statement);
 		
				while ($row = oci_fetch_assoc($Statement)) 
				{
					$bookingDetails[] = $row;
				}
 
				oci_free_statement($Statement);
			}

			// Fetch Invoice Details from the database for the chosen Branch
			$invoiceDetails = [];
			if (isset($_GET['roomNo'])) {
				$roomNo = $_GET['roomNo'];
 
				// Fetch invoice details for the room
				$sql = "SELECT i.* FROM Booking b JOIN Invoice i ON b.bookingReference = i.bookingReference WHERE b.roomNo = :roomNo";
				$Statement = oci_parse($Connection, $sql);
				oci_bind_by_name($Statement, ":roomNo", $roomNo);
				oci_execute($Statement);
 		
				while ($row = oci_fetch_assoc($Statement)) 
				{
					$invoiceDetails[] = $row;
				}
 
				oci_free_statement($Statement);
			}

			// Fetch Past Booking Details from the database for the chosen Branch
			$pastBookingDetails = [];
			if (isset($_GET['roomNo'])) {
				$roomNo = $_GET['roomNo'];
 
				// Fetch past booking details for the room
				$sql = "SELECT * FROM PastBooking p JOIN Customer c ON p.customerID = c.customerID WHERE p.roomNo = :roomNo";
				$Statement = oci_parse($Connection, $sql);
				oci_bind_by_name($Statement, ":roomNo", $roomNo);
				oci_execute($Statement);
 		
				while ($row = oci_fetch_assoc($Statement)) 
				{
					$pastBookingDetails[] = $row;
				}
 
				oci_free_statement($Statement);
			}

		}

	}

	// Fetch the Customer Names from the database
	$sql = "SELECT customerName FROM Customer";
	$Statement = oci_parse($Connection, $sql);
	oci_execute($Statement);
	$customerNames = [];
	while ($row = oci_fetch_assoc($Statement)) 
	{
	    $customerNames[] = $row;
	}
	oci_free_statement($Statement);

	// Fetch Customer Details from the database for the chosen Customer
	$customerDetails = null;
	if (isset($_GET['customerName']))
	{
		$customerName = $_GET['customerName'];
	    $customerBookingDetails = [];
	    $customerInvoiceDetails = [];
 	    $customerPastBookingDetails = [];

	    // Fetch details of the selected customer
		$sql = "SELECT * FROM Customer WHERE customerName = :customerName";
		$Statement = oci_parse($Connection, $sql);
		oci_bind_by_name($Statement, ":customerName", $customerName);
		oci_execute($Statement);

		$customerDetails = oci_fetch_assoc($Statement);

		oci_free_statement($Statement);

	    // Fetch Booking Details for the chosen Customer
		if ($customerDetails['CUSTOMERID'] != NULL)
		{
			$roomTypeC = [];
		
			// Fetch room details of the bookings for the selected customer
			$sql = "SELECT DISTINCT roomType FROM Booking b JOIN Room r ON b.roomNo = r.roomNo WHERE b.customerID = " .$customerDetails['CUSTOMERID'];
			$Statement = oci_parse($Connection, $sql);
			oci_execute($Statement);
 
			while ($row = oci_fetch_assoc($Statement))
			{
				$roomTypeC[] = $row;
			}
    		oci_free_statement($Statement);

			// Fetch Booking Details from the database for the chosen Customer
			$customerBookingDetailsStd = [];
			$customerBookingDetailsEx = [];
			foreach ($roomTypeC as $type) 
			{
				// Fetch Booking Details of a Standard Room from the database for the chosen Customer
				if ($type['ROOMTYPE'] == 'Standard') 
				{
		
					// Fetch booking details for the standard room
					$sql = "SELECT * FROM Booking b JOIN Room r ON b.roomNo = r.roomNo
					JOIN Standard s ON b.bookingReference = s.bookingReference 
					WHERE b.customerID = " .$customerDetails['CUSTOMERID'];
					$Statement = oci_parse($Connection, $sql);
					oci_execute($Statement);
			
					while ($row = oci_fetch_assoc($Statement)) 
					{
						$customerBookingDetailsStd[] = $row;
					}
	
					oci_free_statement($Statement);
				}

				// Fetch Booking Details of a Executive Room from the database for the chosen Customer
				if ($type['ROOMTYPE'] == 'Executive') 
				{
	
					// Fetch booking details for the executive room
					$sql = "SELECT * FROM Booking b JOIN Room r ON b.roomNo = r.roomNo
					JOIN Executive e ON b.bookingReference = e.bookingReference 
					WHERE b.customerID = " .$customerDetails['CUSTOMERID'];
					$Statement = oci_parse($Connection, $sql);
					oci_execute($Statement);
			
					while ($row = oci_fetch_assoc($Statement)) 
					{
						$customerBookingDetailsEx[] = $row;
					}
	
					oci_free_statement($Statement);
				}
			} 

	        // Fetch Invoices for Business Customers
	        if ($customerDetails['ACCOUNTTYPE'] == 'Business')
	        {
				$sql = "SELECT * FROM Invoice WHERE customerID = " .$customerDetails['CUSTOMERID'];
				$Statement = oci_parse($Connection, $sql);
				oci_execute($Statement);
	            while ($row = oci_fetch_assoc($Statement)) 
	            {
	                $customerInvoiceDetails[] = $row;
	            }
	        }

	        // Fetch Past Booking Details from the database for the chosen Customer
			$sql = "SELECT * FROM PastBooking p JOIN Room r ON p.roomNo = r.roomNo 
			WHERE customerID = " .$customerDetails['CUSTOMERID']; 
			$Statement = oci_parse($Connection, $sql);
			oci_execute($Statement);
	        while ($row = oci_fetch_assoc($Statement)) 
	        {
	            $customerPastBookingDetails[] = $row;
	        }
		}
	}
	oci_close($Connection);
}
else
{
	var_dump(oci_error($Connection));
} // end of if expression

?>
<!DOCTYPE html>
	<html lang="en">

	<!-- This section of the file holds the style information for the webpage that could be stored in a .css file -->
	<!-- This is the style information for all the tables in the web page -->
	<title>Table</title>
	<style>
		table
		{
			width: 100%
			border-collapse: collapse;
		}
		th, td
		{
			border: 1px solid black;
			padding: 10px;
			text-align: left;
		}
		th
		{
			background-color: lightgrey;
		}
	</style>

	<!-- This is the style information for the tabs in the web page -->
	<title>Tabs</title>
	<style>
		.tab-container
		{
			display: flex;
			gap: 10px;
		}
		.tab-button
		{
			display: inline-block;
			padding: 10px;
			text-decoration: none;
			color: white;
			background-color: grey;
			border-radius: 5px;
			cursor: pointer;
		}
		.tab-button:hover
		{
			background-color: darkgrey;
		}
		.tab-content
		{
			display: none;
			padding: 20px;
			border: 1px solid #ccc;
		}
		.tab-content:target
		{
			display: block;
		}
	</style>

	<!-- This section of the file holds all of the html functionas and structure -->

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- Title of the web page -->
		<title>Room Booking System</title>
		<style>
			body { font-family: Arial, sans-serif; }
			.container { width: 80%; margin: auto; }
			table, th, td { border: 1px solid black; border-collapse: collapse; padding: 5px; }
		</style>
	</head>
	<body>
	
		<h2>Room Booking System</h2>
	
		<!-- Company Name -->
		<form method="GET" action="">
			<label for="companyName">Company Name:</label>
			<input type="text" name="companyName" value="<?= htmlspecialchars($companyName); ?>" readonly><br><br>

			<!-- Branch Selection -->
			<label for="branchID">Branch:</label>
			<select name="branchID" onchange="this.form.submit()">
				<option value="">Select</option>
				<?php foreach ($branches as $branch): ?>
					<option value="<?= htmlspecialchars($branch['BRANCHID']) ?>"
					<?= isset($_GET['branchID']) && $_GET['branchID'] == $branch['BRANCHID'] ? 'selected' : '' ?>>
					<?= htmlspecialchars($branch['BRANCHID']) ?>
				</option>
				<?php endforeach; ?>
			</select>

			<!-- Branch Details -->
			<?php if ($branchDetails): ?>
				<!-- Add Branch Details from the SQL queries to the web page -->
				<h2>Branch Information</h2>
				<p>Location: <?= htmlspecialchars($branchDetails['LOCATION']) ?></p>
				<p>Number of Rooms: <?= htmlspecialchars($branchDetails['NUMBEROFROOMS']) ?></p>
				</div> 

				<!-- Prepare tab buttons -->
				<div class="tab-container">
					<a href="#tab1" class="tab-button">Room Information</a> 
					<a href="#tab2" class="tab-button">Employee Information</a> 
					<a href="#tab3" class="tab-button">Supplier Information</a> 
					<a href="#tab4" class="tab-button">Customer Information</a> 
				</div>

				<!-- Tab for Room Information -->
				<div id="tab1" class="tab-content">

					<!-- Room Selection -->
					<h2 for="roomNo">Room Number:
						<select name="roomNo" onchange="this.form.submit()">
							<option value="">Select</option>
							<?php foreach ($rooms as $room): ?>
								<option value="<?= htmlspecialchars($room['ROOMNO']) ?>"
									<?= isset($_GET['roomNo']) && $_GET['roomNo'] == $room['ROOMNO'] ? 'selected' : '' ?>>
									<?= htmlspecialchars($room['ROOMNO']) ?>
								</option>
							<?php endforeach; ?>
						</select>
					</h2>

					<!-- Room Details -->
					<?php if ($roomType): ?>
						<p>Room Type: <?= htmlspecialchars($roomType['ROOMTYPE']) ?></p>

						<!-- Booking Details -->
						<h2>Booking Information</h2>
						<?php if ($bookingDetails): ?>
							<table>
								<tr>
									<th>Booking Reference</th>
									<th>Booking Date</th>
									<th>Time Period (Hrs)</th>
									<th>Customer Name</th>
									<th>Customer Account Type</th>
								<?php if ($roomType['ROOMTYPE'] == 'Standard'): ?>
									<th>Requires Decoration</th>
								<?php else: ?>
									<th>Television</th>
									<th>Internet Access</th>
									<th>Buffet Ordered</th>
								<?php endif; ?>
								</tr>

								<!-- Add Booking Details from the SQL queries to the web page -->
								<?php foreach ($bookingDetails as $booking): ?>
									<tr>
										<td><?= htmlspecialchars($booking['BOOKINGREFERENCE']) ?></td>
										<td><?= htmlspecialchars($booking['BOOKINGDATE']) ?></td>
										<td><?= htmlspecialchars($booking['TIMEPERIOD']) ?></td>
										<td><?= htmlspecialchars($booking['CUSTOMERNAME']) ?></td>
										<td><?= htmlspecialchars($booking['ACCOUNTTYPE']) ?></td>
										<?php if ($roomType['ROOMTYPE'] == 'Standard'): ?>
											<td><?= htmlspecialchars($booking['REQUIRESDECORATION']) ?></td>
										<?php else: ?>
											<td><?= htmlspecialchars($booking['TELEVISION']) ?></td>
											<td><?= htmlspecialchars($booking['INTERNETACCESS']) ?></td>
											<td><?= htmlspecialchars($booking['BUFFETORDERED']) ?></td>
										<?php endif; ?>
									</tr>
								<?php endforeach; ?>
							</table>
						<?php else: ?>
							<p>No Current Bookings Found</p>
						<?php endif; ?>

						<!-- Invoice Details -->
						<h2>Invoice Information</h2>
						<?php if ($invoiceDetails): ?>
							<table>
								<tr>
									<th>Invoice ID</th>
									<th>Booking Reference</th>
									<th>Customer ID</th>
									<th>Payment Status</th>
								</tr>

								<!-- Add Invoice Details from the SQL queries to the web page -->
								<?php foreach ($invoiceDetails as $invoice): ?>
									<tr>
										<td><?= htmlspecialchars($invoice['INVOICEID']) ?></td>
										<td><?= htmlspecialchars($invoice['BOOKINGREFERENCE']) ?></td>
										<td><?= htmlspecialchars($invoice['CUSTOMERID']) ?></td>
										<td><?= htmlspecialchars($invoice['PAYMENTSTATUS']) ?></td>
									</tr>
								<?php endforeach; ?>
							</table>
						<?php else: ?>
							<p>No Invoices Found</p>
						<?php endif; ?>

						<!-- Past Booking Details -->
						<h2> Past Booking Information</h2>
						<?php if ($pastBookingDetails): ?>
							<table>
								<tr>
									<th>Booking Reference</th>
									<th>Booking Date</th>
									<th>Time Period (Hrs)</th>
									<th>Customer Name</th>
									<th>Customer Account Type</th>
								</tr>

								<!-- Add Past Booking Details from the SQL queries to the web page -->
								<?php foreach ($pastBookingDetails as $pastBooking): ?>
									<tr>
										<td><?= htmlspecialchars($pastBooking['BOOKINGREFERENCE']) ?></td>
										<td><?= htmlspecialchars($pastBooking['BOOKINGDATE']) ?></td>
										<td><?= htmlspecialchars($pastBooking['TIMEPERIOD']) ?></td>
										<td><?= htmlspecialchars($pastBooking['CUSTOMERNAME']) ?></td>
										<td><?= htmlspecialchars($pastBooking['ACCOUNTTYPE']) ?></td>
									</tr>
								<?php endforeach; ?>
							</table>
						<?php else: ?>
							<p>No Past Bookings Found</p>
						<?php endif; ?>
					<?php endif; ?>

				</div>

				<!-- Tab for Employee Information -->
				<div id="tab2" class="tab-content">

					<!-- Employee Details -->
					<h2>Employee Information</h2>
					<table>
						<tr>
							<th>Employee ID</th>
							<th>Employee Name</th>
							<th>Employee Role</th>
						</tr>

						<!-- Add Employee Details from the SQL queries to the web page -->
						<?php foreach ($employeeDetails as $employee): ?>
							<tr>
								<td><?= htmlspecialchars($employee['EMPLOYEEID']) ?></td>
								<td><?= htmlspecialchars($employee['EMPLOYEENAME']) ?></td>
								<td><?= htmlspecialchars($employee['EMPLOYEEROLE']) ?></td>
							</tr>
						<?php endforeach; ?>
					</table>
				</div>

				<!-- Tab for Supplier Information -->
				<div id="tab3" class="tab-content">

					<!-- Supplier Details -->
					<h2>Supplier Information</h2>
					<table>
						<tr>
							<th>Supplier ID</th>
							<th>Supplier Name</th>
							<th>Area Supplied</th>
							<th>Products Supplied</th>
						</tr>

						<!-- Add Supplier Details from the SQL queries to the web page -->
						<?php foreach ($supplierDetails as $supplier): ?>
							<tr>
								<td><?= htmlspecialchars($supplier['SUPPLIERID']) ?></td>
								<td><?= htmlspecialchars($supplier['SUPPLIERNAME']) ?></td>
								<td><?= htmlspecialchars($supplier['AREASERVED']) ?></td>
								<td><?= htmlspecialchars($supplier['PRODUCTSSUPPLIED']) ?></td>
							</tr>
						<?php endforeach; ?>
					</table>
				</div>
			<?php endif; ?>

			<!-- Tab for Customer Information -->
			<div id="tab4" class="tab-content">

				<!-- Customer Selection -->
				<h2 for="customerName">Customer:
					<select name="customerName" onchange="this.form.submit()">
						<option value="">Select</option>
						<?php foreach ($customerNames as $customerName): ?>
							<option value="<?= htmlspecialchars($customerName['CUSTOMERNAME']) ?>"
								<?= isset($_GET['customerName']) && $_GET['customerName'] == $customerName['CUSTOMERNAME'] ? 'selected' : '' ?>>
								<?= htmlspecialchars($customerName['CUSTOMERNAME']) ?>
							</option>
						<?php endforeach; ?>
					</select>
				</h2>

				<!-- Customer Details -->
				<?php if ($customerDetails): ?>
					<p>Customer ID: <?= htmlspecialchars($customerDetails['CUSTOMERID']) ?></p>
					<p>Account Type: <?= htmlspecialchars($customerDetails['ACCOUNTTYPE']) ?></p>

					<!-- Customer Booking Details -->
					<h2>Booking Information</h2>

					<!-- Standard Bookings -->
					<?php if ($customerBookingDetailsStd): ?>
						<table>
							<tr>
								<th>Booking Reference</th>
								<th>Room Number</th>
								<th>Room Type</th>
								<th>Booking Date</th>
								<th>Time Period (Hrs)</th>
								<th>Requires Decoration</th>
							</tr>

							<!-- Add Customer Standard Booking Details from the SQL queries to the web page -->
							<?php foreach ($customerBookingDetailsStd as $customerBooking): ?>
								<tr>
									<td><?= htmlspecialchars($customerBooking['BOOKINGREFERENCE']) ?></td>
									<td><?= htmlspecialchars($customerBooking['ROOMNO']) ?></td>
									<td><?= htmlspecialchars($customerBooking['ROOMTYPE']) ?></td>
									<td><?= htmlspecialchars($customerBooking['BOOKINGDATE']) ?></td>
									<td><?= htmlspecialchars($customerBooking['TIMEPERIOD']) ?></td>
									<td><?= htmlspecialchars($customerBooking['REQUIRESDECORATION']) ?></td>
								</tr>
							<?php endforeach; ?>
						</table>
						<br></br>
					<?php endif; ?>

					<!-- Executive Bookings -->
					<?php if ($customerBookingDetailsEx): ?>
						<table>
							<tr>
								<th>Booking Reference</th>
								<th>Room Number</th>
								<th>Room Type</th>
								<th>Booking Date</th>
								<th>Time Period (Hrs)</th>
								<th>Television</th>
								<th>Internet Access</th>
								<th>Buffet Ordered</th>
							</tr>

							<!-- Add Customer Executive Booking Details from the SQL queries to the web page -->
							<?php foreach ($customerBookingDetailsEx as $customerBooking): ?>
								<tr>
									<td><?= htmlspecialchars($customerBooking['BOOKINGREFERENCE']) ?></td>
									<td><?= htmlspecialchars($customerBooking['ROOMNO']) ?></td>
									<td><?= htmlspecialchars($customerBooking['ROOMTYPE']) ?></td> 
									<td><?= htmlspecialchars($customerBooking['BOOKINGDATE']) ?></td>
									<td><?= htmlspecialchars($customerBooking['TIMEPERIOD']) ?></td>
									<td><?= htmlspecialchars($customerBooking['TELEVISION']) ?></td> 
									<td><?= htmlspecialchars($customerBooking['INTERNETACCESS']) ?></td>
									<td><?= htmlspecialchars($customerBooking['BUFFETORDERED']) ?></td>
								</tr>
							<?php endforeach; ?>
						</table>
						<br></br>
					<?php endif; ?>
					<?php if ($customerBookingDetailsEx == NULL && $customerBookingDetailsStd == NULL): ?>
						<p>No Current Bookings Found</p>
					<?php endif; ?>

					<!-- Customer Invoice Details -->
					<?php if ($customerDetails['ACCOUNTTYPE'] == 'Business'): ?>
						<h2>Invoice Information</h2>
						<?php if ($customerInvoiceDetails): ?>
							<table>
								<tr>
									<th>Invoice ID</th>
									<th>Booking Reference</th>
									<th>Payment Status</th>
								</tr>

								<!-- Add Customer Invoice Details from the SQL queries to the web page -->
								<?php foreach ($customerInvoiceDetails as $customerInvoice): ?>
									<tr>
										<td><?= htmlspecialchars($customerInvoice['INVOICEID']) ?></td>
										<td><?= htmlspecialchars($customerInvoice['BOOKINGREFERENCE']) ?></td>
										<td><?= htmlspecialchars($customerInvoice['PAYMENTSTATUS']) ?></td>
									</tr>
								<?php endforeach; ?>
							</table>
						<?php else: ?>
							<p>No Invoices Found</p>
						<?php endif; ?>
					<?php endif; ?>

					<!-- Customer Past Booking Details -->
					<h2> Past Booking Information</h2>
					<?php if ($customerPastBookingDetails): ?>
						<table>
							<tr>
								<th>Booking Reference</th>
								<th>Room Number</th>
									<th>Room Type</th>
								<th>Booking Date</th>
								<th>Time Period (Hrs)</th>
							</tr>

							<!-- Add Customer Past Booking Details from the SQL queries to the web page -->
							<?php foreach ($customerPastBookingDetails as $customerPastBooking): ?>
								<tr>
									<td><?= htmlspecialchars($customerPastBooking['BOOKINGREFERENCE']) ?></td>
									<td><?= htmlspecialchars($customerPastBooking['ROOMNO']) ?></td>
									<td><?= htmlspecialchars($customerPastBooking['ROOMTYPE']) ?></td> 
									<td><?= htmlspecialchars($customerPastBooking['BOOKINGDATE']) ?></td>
									<td><?= htmlspecialchars($customerPastBooking['TIMEPERIOD']) ?></td>
								</tr>
							<?php endforeach; ?>
						</table>
					<?php else: ?>
						<p>No Past Bookings Found</p>
					<?php endif; ?>
				<?php endif; ?>
			</div>
		</form>
	</body>
</html>
 