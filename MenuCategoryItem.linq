<Query Kind="Expression">
  <Connection>
    <ID>a560d919-29d6-4ea4-bebc-733774a973ca</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eRestaurant</Database>
  </Connection>
</Query>

from cat in Items
orderby cat.MenuCategory.Description , cat.Description
select new
{
CategoryDescription = cat.MenuCategory.Description,
 ItemDescprition = cat.Description, 
 Price = cat.CurrentPrice, 
 Calories = cat.Calories, 
 Comment = cat.Comment

}