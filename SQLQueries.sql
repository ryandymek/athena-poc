SELECT * FROM product;

SELECT * FROM bonus;

Select * FROM expenses;

SELECT * FROM budget;

SELECT * FROM Pets;

-- Joins two ddb tables and restricts on whether bonus is true
SELECT product.CustId, bonus.GetsBonus, product.Price
FROM product
JOIN bonus ON product.CustId = bonus.CustId
WHERE bonus.GetsBonus = true;

--joins a DDB table with S3 data in two different catalogs/data sources in athena
--this is a federated query
SELECT product.CustId, "AwsDataCatalog"."nbme-poc".budget.budget, product.Price
FROM product
JOIN "AwsDataCatalog"."nbme-poc".budget ON product.CustId = "AwsDataCatalog"."nbme-poc".budget.CustId;

SELECT product.CustId, "AwsDataCatalog"."nbme-poc".budget.budget, "Aurora"."poc".Pets.PetName, product.Price
FROM product
JOIN "AwsDataCatalog"."nbme-poc".budget ON product.CustId = "AwsDataCatalog"."nbme-poc".budget.CustId
JOIN "Aurora"."poc".Pets ON "AwsDataCatalog"."nbme-poc".budget.CustId = "Aurora"."poc".Pets.CustId;


