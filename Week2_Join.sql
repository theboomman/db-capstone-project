use LittleLemonDB;
select c.CustomerID, c.Name, o.OrderID, o.TotalCost, m.Name, mi.Course, mi.Starter 
from Customers as c inner join Orders as o on c.CustomerID=o.CustomerID 
inner join MenusList as ml on o.MenuID=ml.MenuID 
inner join MenuContent as mc on m.MenuID=mc.MenuID 
inner join MenuNames as mn on mc.MenuItemID=mn.MenuItemID 
where o.TotalCost>500;