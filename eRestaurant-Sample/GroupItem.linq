<Query Kind="Expression">
  <Connection>
    <ID>9291f6fb-c53e-4bc3-8660-9ae9c480f0cc</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eRestaurant</Database>
  </Connection>
</Query>

from info in Bills
where info.BillDate.Year == 2014
&& info.BillDate.Month == 9
&& info.BillDate.Day ==15
group info by info.BillDate.Hour into infoGroup 
select new{
Hour = infoGroup.Key,
CustomeBillCount= infoGroup.Count(),
CustomerCount = infoGroup.Sum(x=>x.NumberInParty)
}