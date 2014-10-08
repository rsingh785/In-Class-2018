<Query Kind="Statements">
  <Connection>
    <ID>c194c494-6a9c-4040-9b9b-88fa99142d13</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eRestaurant</Database>
  </Connection>
</Query>

// Get the following from the Bills Table for the current month
// BillDate ,ID  , # people served , total amount billed
// Then display the total income for the month and the number of customers served


// 1) Set up info that might be passed in to my BLL
var month = DateTime.Today.Month -1;  // previous Month
var year = DateTime.Today.Year;  // current year

// 2) get the bill Data for the month/year with a sum of each Bill's Billitems
var billsInMonth = from item in Bills
                   where item.PaidStatus // only the bills that were/are paid
				   && item.BillDate.Month == month
				   && item.BillDate.Year == year
				   orderby item.BillDate
                   select new
				   {
				       BillDate = item.BillDate,
					   BillId = item.BillID, 
					   NumberOfCustomers = item.NumberInParty,
				       TotalAmount = item.BillItems.Sum(bi => bi.Quantity * bi.SalePrice)
				   };
				   
				   // billsInMonth.Dump();
				   
				   // Temp: Some variable for formatting 
				   var monthName = DateTime.Today.AddMonths(-1).ToString("MMM");
				   var title = string.Format ("Total income for {0} {1}" , monthName , year);
				   
				   // Temp : Perform some quick aggregate to check my query
				   
				   billsInMonth.Sum(tm => tm.TotalAmount).ToString("C").Dump(title, true);
				   
				    billsInMonth.Sum(tm => tm.NumberOfCustomers).Dump("Partons Served" , true);
					
					//3)  build a report from the BillsInMonth data
					
					var report = from item in billsInMonth 
					             group item by item.BillDate.Day into dailySummary 
					             select new
								{
				 				 Day = dailySummary.Key,
								 DailyCustomers = dailySummary.Sum(grp => grp.NumberOfCustomers),
								 Income = dailySummary.Sum(grp => grp.TotalAmount)
								};
					
				report.OrderBy(r => r.Day).Dump("Daily Income");
				