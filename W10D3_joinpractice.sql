/* Recuperate i nomi dei prodotti e i loro prezzi di listino per i prodotti nella categoria "Bikes".
TIP: utilizzate le tabelle "DimProduct" e "DimProductCategory".*/

SELECT *
FROM DimProduct --da qui recupero codice prodotto e nome prodotto

SELECT *
FROM DimProductSubcategory 

SELECT EnglishProductSubcategoryName, EnglishProductName, ListPrice
FROM  DimProduct p
	INNER JOIN DimProductSubcategory s
	ON p.ProductSubcategoryKey = s.ProductSubcategoryKey
WHERE s.EnglishProductSubcategoryName like '%bike%'



/* Elencate tutti i dipendenti e le relative vendite per l'anno 2019.
TIP: utilizzate le tabelle "DimEmployee" e "FactResellerSales".*/

SELECT *
FROM DimEmployee -- cardinalità 1 (EmployeeKey)

SELECT *
FROM FactResellerSales -- cardinalità n

SELECT p.EmployeeKey, SUM(s.SalesAmount) AS SalesAmount
FROM DimEmployee p
	LEFT OUTER JOIN FactResellerSales s
	ON p.EmployeeKey = s.EmployeeKey
WHERE s.OrderDate like '%2019%'
GROUP BY p.EmployeeKey
ORDER BY EmployeeKey 


/* Visualizzate i nomi di tutti i territori di vendita e l'importo totale delle vendite. Includete solo i territori con importi di vendita superiori a $50,000.
TIP: utilizzate le tabelle "DimSalesTerritory" e "FactResellerSales".*/

SELECT *
FROM DimSalesTerritory -- cardinalità 1 (SalesTerritoryKey)

SELECT *
FROM FactResellerSales -- cardinalità n

SELECT p.SalesTerritoryRegion, SUM(s.SalesAmount) AS SalesRegionAmount
FROM DimSalesTerritory p
	LEFT OUTER JOIN FactResellerSales s
	ON p.SalesTerritoryKey = s.SalesTerritoryKey
GROUP BY p.SalesTerritoryRegion
	HAVING SUM(s.SalesAmount)>50000
ORDER BY SalesRegionAmount


/* Recuperate i nomi dei prodotti e i loro importi totali delle vendite.
TIP: utilizzate le tabelle "DimProduct" e "FactResellerSales".*/

SELECT *
FROM DimProduct -- cardinalità 1

SELECT * 
FROM FactResellerSales -- cardinalità n

SELECT p.EnglishProductName, SUM(s.SalesAmount) AS TotalProductSales
FROM DimProduct p
	INNER JOIN FactResellerSales s
	ON p.ProductKey = s.ProductKey
GROUP BY p.EnglishProductName
ORDER BY TotalProductSales