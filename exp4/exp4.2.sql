create Table A (
    id INT,
    name VARCHAR(50),
    salary INT,
);

create Table B (
    id INT,
    name VARCHAR(50),
    salary INT,
);

INSERT INTO A (id, name, salary) VALUES
(1, 'AA', 1000),
(2, 'BB', 300);

INSERT INTO B (id, name, salary) VALUES
(2, 'BB', 400),
(3, 'CC', 100);

SELECT id, name, min(salary)
FROM 
(
  SELECT * from A
  union all
  SELECT * from B
) as result
group BY id, name;