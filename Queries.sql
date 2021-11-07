USE AdventureWorks2019
----------------------ЗАДАНИЕ №1-----------------------------
--Вывести всю информацию из таблицы Sales.Customer 
-------------------------------------------------------------
SELECT * FROM Sales.Customer; 

----------------------ЗАДАНИЕ №2-----------------------------
--Вывести всю информацию из таблицы Sales.Store отсортированную 
--по Name в алфавитном порядке
-------------------------------------------------------------
SELECT * FROM Sales.Store
ORDER BY Name ASC;

----------------------ЗАДАНИЕ №3-----------------------------
--Вывести из таблицы HumanResources.Employee всю информацию
--о десяти сотрудниках, которые родились позже 1989-09-28
-------------------------------------------------------------

SELECT TOP 10 * FROM HumanResources.Employee E
WHERE E.BirthDate > CONVERT(datetime, '1989-09-28');

----------------------ЗАДАНИЕ №4-----------------------------
--Вывести из таблицы HumanResources.Employee сотрудников
--у которых последний символ LoginID является 0.
--Вывести только NationalIDNumber, LoginID, JobTitle.
--Данные должны быть отсортированы по JobTitle по убиванию
-------------------------------------------------------------

SELECT NationalIDNumber, LoginID, JobTitle FROM HumanResources.Employee
WHERE LoginID LIKE '%0'
ORDER BY JobTitle DESC;

----------------------ЗАДАНИЕ №5-----------------------------
--Вывести из таблицы Person.Person всю информацию о записях, которые были 
--обновлены в 2008 году (ModifiedDate) и MiddleName содержит
--значение и Title не содержит значение 
-------------------------------------------------------------

SELECT * FROM Person.Person
WHERE (DATEPART(yy, ModifiedDate) = 2008)
AND MiddleName IS NOT NULL
AND Title IS NULL;

----------------------ЗАДАНИЕ №6-----------------------------
--Вывести название отдела (HumanResources.Department.Name) БЕЗ повторений
--в которых есть сотрудники
--Использовать таблицы HumanResources.EmployeeDepartmentHistory и HumanResources.Department
-------------------------------------------------------------

SELECT DISTINCT [Name] FROM HumanResources.Department D
JOIN HumanResources.EmployeeDepartmentHistory H ON D.DepartmentID=H.DepartmentID
WHERE H.BusinessEntityID IS NOT NULL;

----------------------ЗАДАНИЕ №7-----------------------------
--Сгрупировать данные из таблицы Sales.SalesPerson по TerritoryID
--и вывести сумму CommissionPct, если она больше 0
-------------------------------------------------------------
SELECT TerritoryID,
SUM(CommissionPct) AS CommissionSum
FROM Sales.SalesPerson
GROUP BY TerritoryID
HAVING SUM(CommissionPct) > 0;

----------------------ЗАДАНИЕ №8-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют самое большое кол-во 
--отпуска (HumanResources.Employee.VacationHours)
-------------------------------------------------------------

SELECT *
FROM HumanResources.Employee
WHERE VacationHours = (SELECT MAX(VacationHours) from HumanResources.Employee);

----------------------ЗАДАНИЕ №9-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют позицию (HumanResources.Employee.JobTitle)
--'Sales Representative' или 'Network Administrator' или 'Network Manager'
-------------------------------------------------------------

SELECT * FROM HumanResources.Employee
WHERE JobTitle = 'Sales Representative'
OR JobTitle = 'Network Administrator'
OR JobTitle = 'Network Manager';

----------------------ЗАДАНИЕ №10-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) и 
--их заказах (Purchasing.PurchaseOrderHeader). ЕСЛИ У СОТРУДНИКА НЕТ
--ЗАКАЗОВ ОН ДОЛЖЕН БЫТЬ ВЫВЕДЕН ТОЖЕ!!!
-------------------------------------------------------------

SELECT E.*, P.*
FROM HumanResources.Employee E
RIGHT JOIN Purchasing.PurchaseOrderHeader P ON P.EmployeeID = E.BusinessEntityID;

