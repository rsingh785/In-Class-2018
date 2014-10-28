<Query Kind="Statements">
  <Connection>
    <ID>d0a2d45d-ccf9-47c7-9822-3f32a9ab2067</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eRestaurant</Database>
  </Connection>
</Query>

 // Find out the occupancy information on the tables in the restaurant ar a specific date/time
 
 //Create a date and Time object to use for the sample input data
var date = Bills.Max(b => b.BillDate).Date;
var time = Bills.Max(b => b.BillDate).TimeOfDay.Add(new TimeSpan(0, 30, 0));
date.Add(time).Dump("the test Date/Time I am Using");

// Step-1 Get The Table Information along with walkin 

var step1 = from data in Tables
            select new 
			{
			Table = data .TableNumber,
			Seating = data.Capacity,
			// this sub query get the bills for walk in customers
			Bills = from billing in data.Bills
			        where 
					      billing.BillDate.Year == date.Year
						  && billing.BillDate.Month == date.Month
						  && billing.BillDate.Day == date.Day
						  && billing.BillDate.TimeOfDay <= time
						  && (!billing.PaidStatus || billing.OrderPaid >= time)
						   select billing,
						   // This sub query gets the bills for reservatrion 
						   
						   Reservations = from booking in data.ReservationTables
						   from billing in booking.Reservation.Bills
						    where 
					      billing.BillDate.Year == date.Year
						  && billing.BillDate.Month == date.Month
						  && billing.BillDate.Day == date.Day
						  && billing.BillDate.TimeOfDay <= time
						  && (!billing.PaidStatus || billing.OrderPaid >= time)
						   select billing
			};
			
			
			step1.Dump("Step 1 of my queries");
			
			
			// Step 2
			
			var step2 = from data in step1.ToList()
			            select new
			{
			Table = data.Table,
			Seating = data.Seating,
			CommonBilling = from info in data.Bills.Union(data.Reservations)
			                 select info
							 };
			step2.Dump("Step 2 of my queries - unioning the result");
			
	// Step3
	
	var step3 = from data in step2
	            select new 
			{
			Table = data.Table,
			 Seating = data.Seating,
			 Taken = data.CommonBilling.Count() > 0,
			 CommonBilling = data.CommonBilling.FirstOrDefault()
			 
			 
			};
			
			step3.Dump("Step3 in my Query - pull out the first (only) item from the common billing list");
			
			
			
			var step4 = from data in step3
		                select new
			{
			Table = data.Table,
			 Seating = data.Seating,
			 Taken = data.Taken,
			BillID = data.Taken ? // if the data is taken the value if the statement is true
			         data.CommonBilling.BillID
					      :(int?) null
			};
			step4.Dump("Step4 - my final results that i need for the form");
			
			
			
			
			
			
			
			