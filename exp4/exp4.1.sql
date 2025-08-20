-- Create Employee Table
CREATE TABLE employee (
    id INT,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id)
);


-- Insert into Department Table
INSERT INTO department (id, dept_name) VALUES
(1, 'IT'),
(2, 'SALES');


-- Insert into Employee Table
INSERT INTO employee (id, name, salary, department_id) VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(4, 'Arsh', 90000, 1),
(3, 'HENRY', 80000, 2);


SELECT d.dept_name , e.name, e.salary from employee as e
INNER JOIN department as d
on e.department_id = d.id
where e.salary IN (
  select max(salary) from employee
  where department_id =  e.department_id
);