-- MVP
-- query: find the names of the animals in a given enclosure

SELECT animals.name FROM enclosures
INNER JOIN animals
ON enclosures.id = animals.enclosure_id
WHERE enclosures.id = 4;

-- query: find the names of the staff working in a given enclosure

SELECT employees.name FROM employees
INNER JOIN assignments
ON employees.id = assignments.employee_id
INNER JOIN enclosures
ON enclosures.id = assignments.enclosure_id
WHERE enclosures.id = 4;


-- Extensions
-- query: find the names of staff working in enclosures which are closed for maintenance

SELECT employees.name FROM employees
INNER JOIN assignments
ON employees.id = assignments.employee_id
INNER JOIN enclosures
ON enclosures.id = assignments.enclosure_id
WHERE enclosures.closed_for_maintenance = TRUE;

-- query: find the name of the enclosure where the oldest animal lives. 
-- If there are two animals who are the same age choose the first one alphabetically

SELECT enclosures.name FROM enclosures
INNER JOIN animals
ON enclosures.id = animals.enclosure_id
ORDER BY (animals.age, animals.name) DESC
LIMIT 1;

-- query: find the number of different animal types a given keeper has been assigned to work with.

SELECT COUNT(DISTINCT animals.type) FROM animals
INNER JOIN enclosures
ON enclosures.id = animals.enclosure_id
INNER JOIN assignments
ON enclosures.id = assignments.enclosure_id
INNER JOIN employees
ON employees.id = assignments.employee_id
WHERE employees.name = 'Zsolt';

-- query: find the number of different keepers who have been assigned to work in a given enclosure

SELECT COUNT(DISTINCT employees.name) FROM enclosures
INNER JOIN assignments
ON enclosures.id = assignments.enclosure_id
INNER JOIN employees
ON employees.id = assignments.employee_id
WHERE enclosures.name = 'Petting Zoo';

-- query: find the names of the other animals sharing an enclosure with a given animal 
-- (eg. find the names of all the animals sharing the big cat field with Tony)

SELECT DISTINCT(animals.name) FROM animals
WHERE animals.enclosure_id = (
    SELECT enclosures.id FROM enclosures
    INNER JOIN animals
    ON enclosures.id = animals.enclosure_id
    WHERE animals.name = 'Terry'
)
AND animals.name != 'Terry';


-- SELECT enclosure_id FROM animals
-- WHERE animals.name = 'Terry';
-- SELECT DISTINCT animals.name FROM animals
-- INNER JOIN enclosures
-- ON enclosures.id = animals.enclosure_id
-- WHERE enclosures.id = 1
-- AND animals.name != 'Terry';



