-- Query to find the events attended by Harry Potter
SELECT e.Name 
FROM Event e 
JOIN Event_Student es ON e.ID = es.Event_ID 
JOIN Student s ON s.ID = es.Student_ID 
WHERE s.FirstName = 'Harry' AND s.LastName = 'Potter';

-- Query to find the subjects taught by Severus Snape
SELECT sub.Name 
FROM Subject sub 
JOIN Subject_Teacher st ON sub.ID = st.Subject_ID 
JOIN Teacher t ON t.ID = st.Teacher_ID 
WHERE t.FirstName = 'Severus' AND t.LastName = 'Snape';

-- Query to find the average score in Potions
SELECT AVG(g.Score) 
FROM Grade g 
JOIN Subject sub ON g.Subject_ID = sub.ID 
WHERE sub.Name = 'Potions';

-- Query to count the number of students in each house
SELECT h.Name, COUNT(*) 
FROM House h 
JOIN Student s ON h.ID = s.House_ID 
GROUP BY h.Name;

-- Query to find students who attended the same events as Harry Potter
SELECT DISTINCT s2.FirstName, s2.LastName
FROM Student s2
JOIN Event_Student es2 ON s2.ID = es2.Student_ID
WHERE es2.Event_ID IN (
	SELECT es.Event_ID
	FROM Event_Student es
	JOIN Student s ON s.ID = es.Student_ID
	WHERE s.FirstName = 'Harry' AND s.LastName = 'Potter'
);

-- Query to find the teachers who taught subjects to Harry Potter
SELECT t.FirstName, t.LastName
FROM Teacher t
JOIN Subject_Teacher st ON t.ID = st.Teacher_ID
WHERE st.Subject_ID IN (
	SELECT g.Subject_ID
	FROM Grade g
	JOIN Student s ON g.Student_ID = s.ID
	WHERE s.FirstName = 'Harry' AND s.LastName = 'Potter'
);

-- Query to find houses that have more than the average number of students
SELECT h.Name
FROM House h
WHERE (
	SELECT COUNT(*)
	FROM Student s
	WHERE s.House_ID = h.ID
) > (
	SELECT AVG(stud_cnt)
	FROM (
		SELECT COUNT(*) AS stud_cnt
		FROM Student s
		GROUP BY s.House_ID
	)
);
