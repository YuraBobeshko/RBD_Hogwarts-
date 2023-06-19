-- Update 'Count_Of_Grade' in the House table to reflect the actual number of grades by students from each house
UPDATE House h
SET Count_Of_Grade = (
	SELECT COUNT(*)
	FROM Grade g
	JOIN Student s ON g.Student_ID = s.ID
	WHERE s.House_ID = h.ID
);

-- Delete the events that weren't attended by any students
DELETE FROM Event e
WHERE e.ID NOT IN (
	SELECT DISTINCT Event_ID
	FROM Event_Student
);
