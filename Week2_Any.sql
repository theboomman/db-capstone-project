use LittleLemonDB;
select Name from MenuNames where MenuNameID=any (select MenuID from Orders where Quantity>2) 