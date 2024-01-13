/*
ESERCITAZIONE T-SQL
*/

/* ES 1:
Esponi l'elenco dei prodotti vendibili cioè i prodotti per i quali il campo
FinishedGoodsFlag = 1.
Il result set deve esporre i campi: ProductKey, ProductAlternateKey ,EnglishProductName e FinishedGoodsFlag.
*/

select ProductKey, ProductAlternateKey, EnglishProductName, FinishedGoodsFlag
from DimProduct
where FinishedGoodsFlag=1


/* ES 2:
Esponi l'elenco dei prodotti vendibili cioè i prodotti per i quali il campo
FinishedGoodsFlag = 1 e il cui ProductAlternateKey inizia per FR.
Il result set deve esporre i campi: ProductKey, ProductAlternateKey ,EnglishProductName, FinishedGoodsFlag
Tip : utilizza l'operatore like e %.
*/

select ProductKey, ProductAlternateKey ,EnglishProductName, FinishedGoodsFlag
from DimProduct
where FinishedGoodsFlag=1 and ProductAlternateKey like 'FR%'


/* ES 3:
Esplora la tabella DimReseller.
Tip: SELECT * FROM DimReseller.
*/

select *
from DimReseller


/*
ES 4:
Interroga la tabella DimReseller al fine di esporre i campi: ResellerKey, BusinessType, ResellerName.
*/

select ResellerKey, BusinessType, ResellerName
from DimReseller


/*
ES 5:
Interroga la tabella DimReseller al fine di esporre i campi: ResellerKey, BusinessType, ResellerName
per il Business Specialty Bike Shop.
Tip: utilizza l'operatore LIKE passando la stringa tra apici!
*/

select ResellerKey, BusinessType, ResellerName
from DimReseller
where BusinessType like 'Specialty Bike Shop'


/*
ES 6:
Esplora la tabella DimEmployee.
La tabella contiene i dati relativi ai dipendenti aziendali.
*/

select *
from DimEmployee


/*
ES 7:
Filtra i record della tabella DimEmployee per i quali la condizione SalespersonFlag = 1 è vera.
Otterrai in output l'elenco degli agenti!
Il result set deve esporre i campi EmployeeKey, FirstName, LastName e Title
*/

select EmployeeKey, FirstName, LastName, Title
from DimEmployee
where SalesPersonFlag=1


/*
ES 8:
Esplora la tabella FactResellerSales.
La tabelle mostra le transazioni di vendita.
Esponi SalesOrderNumber, SalesOrderLineNumber, ProductKey e OrderDate
*/

select SalesOrderNumber, SalesOrderLineNumber, ProductKey, OrderDate
from FactResellerSales


/*
ES 9:
Interroga la tabella FactResellerSales.
Esponi in output SalesOrderNumber, OrderDate.
Occore esporre l'elenco degli ordini e della relativa data di registrazione
*/

select SalesOrderNumber, OrderDate
from FactResellerSales
	/* 
	se osservi il risultato (l'ho scritta anche io sotto al commento :) ) noterai che per la stessa transazione avvenuta in un giorno particolare
	ci sono molti record.
	Non è un errore! semplicemente ci sono tante righe quante sono le righe di corpo (i diversi articoli acquistati).
	Guarda ai risultati dell'es precedente dove hai evidenza della riga di corpo SalesOrderNumber per SalesOrderNumber
	e anche del codice articolo.

	L'istruzione SELECT NON RIMUOVE I DUPLICATI MA SOTTOINTENDE LA CLAUSOLA ALL CHE VIENE SEMPRE OMESSA!!
	ALL significa ALL ROWS... tutte le righe della tabella... è implicito nella SELECT infatti si omette sempre!!
	*/

	-- questa:
SELECT SalesOrderNumber, OrderDate
FROM FactResellerSales

	-- è equivalente a questa:
SELECT ALL SalesOrderNumber, OrderDate
FROM FactResellerSales

	-- Guardate il conteggio dei record (in basso a dx)..  è lo stesso

	/*
	se bisogna esporre i valori univoci (analogia con Excel?... rimuovi duplicati..) bisogna indicare nella SELECT
	la clausola DISTINCT
	*/

SELECT DISTINCT SalesOrderNumber, OrderDate
FROM FactResellerSales
	-- DISTINCT RIMUOVE I RECORD DUPLICATI CONSIDERANDO TUTTE LE COLONNE INDICATE NELLA SELECT LIST
	
/*
ES 10:
Interroga la tabella FactResellerSales.
Esponi in output SalesOrderNumber, SalesOrderLineNumber, ProductKey, ResellerKey, OrderDate, SalesAmount, UnitPrice, OrderQuantity
*/

select SalesOrderNumber, SalesOrderLineNumber, ProductKey, ResellerKey, OrderDate, SalesAmount, UnitPrice, OrderQuantity
from FactResellerSales


/*
ES 11:
Interroga la tabella FactResellerSales.
Esponi in output SalesOrderNumber, SalesOrderLineNumber, ProductKey, ResellerKey, OrderDate, SalesAmount, UnitPrice, OrderQuantity.
Filtra le righe per le quali la quantità venduta OrderQuantity è strettamente maggiore di 6
*/

select SalesOrderNumber, SalesOrderLineNumber, ProductKey, ResellerKey, OrderDate, SalesAmount, UnitPrice, OrderQuantity
from FactResellerSales
where OrderQuantity>6


/*
ES 11:
Interroga la tabella FactResellerSales.
Esponi in output SalesOrderNumber, SalesOrderLineNumber, ProductKey, ResellerKey, OrderDate, SalesAmount, UnitPrice, OrderQuantity.
Filtra le transazioni con una data compresa tra 2017-07-01 e 2019-08-13.
Tip: WHERE OrderDate BETWEEN '2018-07-01' AND '2019-08-13'

L'operatore BETWEEN è molto comodo per ricerche in archi temporali definiti.
*/

select SalesOrderNumber, SalesOrderLineNumber, ProductKey, ResellerKey, OrderDate, SalesAmount, UnitPrice, OrderQuantity
from FactResellerSales
where OrderDate between '2018-07-01' and '2019-08-13'


/*
ES 12:
Interroga la tabella FactResellerSales.
Esponi in output SalesOrderNumber, SalesOrderLineNumber, ProductKey, ResellerKey, OrderDate, SalesAmount, UnitPrice, OrderQuantity.
Filtra le transazioni con una data compresa tra 2017-12-31 e 2019-01-01 e reltivi ai codici articolo 534, 491, 512
*/

select SalesOrderNumber, SalesOrderLineNumber, ProductKey, ResellerKey, OrderDate, SalesAmount, UnitPrice, OrderQuantity
from FactResellerSales
where OrderDate 
	between '2017-12-31' and '2019-01-01'
		and ProductKey in (534, 491, 512)
