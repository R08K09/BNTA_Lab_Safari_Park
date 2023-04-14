-- MVP
-- query: find names of the animals in a given enclosure

SELECT animals.name FROM enclosures
INNER JOIN animals
ON enclosures.id = animals.enclosure_id
WHERE enclosures.id = 4;

-- query: find names of the staff working in a given enclosure
SELECT employees.name FROM employees
INNER JOIN assignments
ON employees.id = assignments.employee_id
INNER JOIN enclosures
ON enclosures.id = assignments.enclosure_id
WHERE enclosures.id = 4;


-- Extensions
-- query:



