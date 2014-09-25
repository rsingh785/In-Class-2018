<Query Kind="Statements">
  <Connection>
    <ID>494a43c3-280b-4549-915f-7841a653e415</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eRestaurant</Database>
  </Connection>
</Query>

var result = from row in Tables
             where row.Capacity > 3
             select row;
			 
			 result.Dump();
			 
string[] names = {"dan" , "Raja" , "sharan"};
names.Dump();


var shortlist = from person in names
                where person.StartsWith("D")
				select person;

shortlist.Dump();

/*example3 :
find the most recent Billl and its total*/

var allBills = from thingy in Bills
				where thingy.OrderPlaced.HasValue
				select new
				{
				 BillDate = thingy.BillDate, 
				 IsReady = thingy.OrderReady
				 };
				 
allBills.Count().Dump();
allBills.Take(5).Dump();