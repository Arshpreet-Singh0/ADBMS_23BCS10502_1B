CREATE TABLE Transaction (
  id INTEGER PRIMARY KEY,
  value INTEGER
);

INSERT INTO Transaction VALUES (GENERATE_SERIES(1, 1000000), RANDOM());

SELECT *FROM Transaction limit 100;

CREATE OR REPLACE VIEW vE_Transaction_View AS
	SELECT AVG(value) as AVG, COUNT(*) as total_orders from  Transaction;

SELECT *FROM vE_Transaction_View;

CREATE OR REPLACE VIEW vE_Materialized_Transaction_View AS
	SELECT AVG(value) as AVG, COUNT(*) as total_orders from  Transaction;

SELECT * FROM vE_Materialized_Transaction_View;


SELECT *FROM vE_Materialized_Transaction_View;

EXPLAIN ANALYSE
SELECT *FROM vE_Transaction_View;

EXPLAIN ANALYSE
SELECT * FROM vE_Materialized_Transaction_View;


