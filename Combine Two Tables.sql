select A.FirstName, A.LastName,B.City,B.State 
from Person A left join Address B 
on A.PersonId = B.PersonId;