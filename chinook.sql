-- #1 Show Customers NOT from USA
-- SELECT CustomerId, FirstName, LastName, Country FROM Customer WHERE Country != 'USA'

-- #2 Only show Customers from Brazil
-- SELECT CustomerId, FirstName, LastName, Country FROM Customer WHERE Country = 'Brazil'

-- #3 Show Invoice of Customer from Brazil, show customer's fullname, InvoiceId, Date of invoice and Billing Country
-- SELECT c.CustomerId, c.FirstName, c.LastName, c.Country, i.InvoiceId, i.InvoiceDate, i.BillingCountry 
-- FROM Customer c 
-- JOIN Invoice i ON  c.CustomerId = i.InvoiceId 
-- WHERE Country = 'Brazil'

-- #4 `sales_agents.sql`: Provide a query showing only the Employees who are Sales Agents.
-- SELECT FirstName, LastName, Title 
-- FROM Employee 
-- WHERE Title = 'Sales Support Agent'

-- #5 `unique_invoice_countries.sql`: Provide a query showing a unique/distinct list of billing countries from the Invoice table.
-- SELECT BillingCountry 
-- FROM Invoice

-- #6 `sales_agent_invoices.sql`: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
-- SELECT e.FirstName + ' ' + e.LastName AS EmployeeFullName, i.InvoiceId 
-- FROM Employee e 
-- JOIN Invoice i ON i.InvoiceId = e.EmployeeId 
-- WHERE Title = 'Sales Support Agent'

-- #7 `invoice_totals.sql`: Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
-- SELECT e.FirstName + ' ' + e.LastName AS SalesAgentName, i.Total, 
-- c.FirstName + ' ' + c.LastName AS CustomerFullName, c.Country 
-- FROM Employee e 
-- JOIN Invoice i ON e.EmployeeId = i.InvoiceId 
-- JOIN Customer c ON i.CustomerId = c.CustomerId
-- WHERE Title = 'Sales Support Agent'

-- #8 `total_invoices_{year}.sql`: How many Invoices were there in 2009 and 2011?
-- SELECT COUNT(*) AS TOTAL
-- FROM Invoice
-- WHERE YEAR(InvoiceDate) IN (2009, 2011)

-- brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
-- SELECT c.CustomerId, c.FirstName, c.LastName, i.InvoiceId, i.BillingCountry, i.InvoiceDate
-- FROM Customer c
-- JOIN Invoice i on c.CustomerId = i.CustomerId
-- WHERE i.BillingCountry = 'Brazil'


-- top_5_tracks.sql: Provide a query that shows the top 5 most purchased songs.
-- SELECT TOP 5 t.[Name] as TrackName, 
-- Count(*) as TrackPurchaseCount 
-- FROM InvoiceLine IL 
-- JOIN Invoice I on I.InvoiceId = IL.InvoiceId
-- JOIN Track t on t.TrackId = IL.TrackId
-- WHERE YEAR(I.InvoiceDate) = 2013
-- GROUP BY t.[Name]
-- ORDER BY TrackPurchaseCount DESC
-- count(*) = numbers of row

--  top_3_artists.sql: Provide a query that shows the top 3 best selling artists.
-- SELECT TOP 3 AR.[Name] as ArtistName, 
-- Count(*) as TrackPurchaseCount 
-- FROM InvoiceLine IL 
-- JOIN Invoice I on I.InvoiceId = IL.InvoiceId
-- JOIN Track t on t.TrackId = IL.TrackId
-- JOIN Album AL on AL.AlbumId = t.AlbumId
-- JOIN Artist AR on AR.ArtistId = AL.ArtistId
-- GROUP BY AR.[Name]
-- ORDER BY TrackPurchaseCount DESC

-- top_media_type.sql: Provide a query that shows the most purchased Media Type.
-- SELECT TOP 1 MT.[Name] as MediaType, 
-- Count(*) as TrackPurchaseCount 
-- FROM InvoiceLine IL 
-- JOIN Invoice I on I.InvoiceId = IL.InvoiceId
-- JOIN Track t on t.TrackId = IL.TrackId
-- JOIN MediaType MT on MT.MediaTypeId = t.MediaTypeId
-- GROUP BY MT.[Name]
-- ORDER BY TrackPurchaseCount DESC