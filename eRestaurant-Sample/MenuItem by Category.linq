<Query Kind="Expression">
  <Connection>
    <ID>9291f6fb-c53e-4bc3-8660-9ae9c480f0cc</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eRestaurant</Database>
  </Connection>
</Query>

from cat in MenuCategories
orderby cat.Description
select new
{
 Description = cat.Description,
 MenuItems = from item in cat.Items
 where item.Active
 orderby item.Description
 select new
	{
	Description = item.Description,
	Price = item.CurrentPrice,
	Calories = item.Calories,
	Comment = item.Comment
	}
 
}