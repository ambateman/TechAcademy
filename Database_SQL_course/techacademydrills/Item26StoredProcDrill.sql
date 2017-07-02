USE AdventureWorks2014
GO

CREATE PROCEDURE dbo.usbBusinessContactNames @fname nvarchar(30) = NULL, @lname nvarchar(50)= NULL
AS

SELECT  p.FirstName, p.Lastname, bec.BusinessEntityID, bea.AddressID  
FROM Person.BusinessEntityAddress bea 
INNER JOIN Person.BusinessEntityContact bec ON bea.BusinessEntityID = bec.BusinessEntityID 
INNER JOIN Person.Person p ON bec.PersonID = p.BusinessEntityID 
WHERE p.FirstName like ISNULL(@fname + '%',p.FirstName) and p.LastName like ISNULL(@lname +'%',p.LastName);

GO


exec usbbusinesscontactnames 'm','z'

