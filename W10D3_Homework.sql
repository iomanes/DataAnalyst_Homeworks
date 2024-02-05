USE AdventureWorksDW2020;

-- ESERCIZIO: esplora la tabella FactResellerSales
SELECT *
FROM FactResellerSales

-- 1) esponi l'elenco degli ordini (SalesOrderNumber) e delle transazioni (SalesOrderLineNumber)
SELECT salesordernumber, salesorderlinenumber
FROM factresellersales

-- 2) conta il numero di transazioni per ciascun ordine
SELECT salesordernumber, count(*) AS nTransaction
FROM factresellersales
GROUP BY salesordernumber

-- 3) arricchisci il risultato precendete della quantità totale totale venduta (OrderQuantity) per ordine e della somma dell'importo (SalesAmount)
SELECT salesordernumber, count(*) AS nTransaction, sum(orderquantity) AS Quantità, sum(salesamount) AS totIncasso
FROM factresellersales
GROUP BY salesordernumber


-- ESERCIZIO: esistono codici prodotti (ProductKey) che hanno il medesimo nome prodotto (EnglishProductName)?
SELECT productkey, count(englishproductname) AS nameQunatity
FROM DimProduct
group by productkey
having count(englishproductname) != 1

-- ESERCIZIO: analisi prodotti. Calcola il fatturato totale, la quantità totale, il numero di transazioni e la media del prezzo di vendita per ciascun prodotto.
-- tip: Il result set deve contenere il nome prodotto e le aggregazioni richieste. Utilizza gli operatori COUNT, SUM, AVG

SELECT ProductKey
	, SUM(SalesAmount) AS TotalSales
	, SUM(OrderQuantity) AS TotalQuantity
	, COUNT(*) AS nTransaction
	, AVG(UnitPrice) AS AveragePrice
FROM FactResellerSales
GROUP BY ProductKey

-- ESERCIZIO: esistono prodotti che non sono mai stati venduti?

SELECT p.ProductKey, s.ProductKey
FROM DimProduct p
	LEFT OUTER JOIN FactResellerSales s
	ON p.ProductKey = s.ProductKey
WHERE s.ProductKey is NULL -- Filtra solo i risultati per i quali non c'è corrispondenza verso destra




	


