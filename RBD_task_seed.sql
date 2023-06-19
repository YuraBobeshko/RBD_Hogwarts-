-- Populate House table
INSERT INTO House(ID, Name, Description, Count_Of_Grade, Teacher_ID, Student_ID)
SELECT 1, 'Gryffindor', 'House for the brave and courageous', 0, 1, 1 FROM dual UNION ALL
SELECT 2, 'Slytherin', 'House for the cunning and ambitious', 0, 2, 2 FROM dual UNION ALL
SELECT 3, 'Hufflepuff', 'House for the loyal and hard-working', 0, 3, 3 FROM dual UNION ALL
SELECT 4, 'Ravenclaw', 'House for the intelligent and witty', 0, 4, 4 FROM dual;

-- Populate Position table
INSERT INTO Position(ID, Name)
SELECT 1, 'Seeker' FROM dual UNION ALL
SELECT 2, 'Chaser' FROM dual UNION ALL
SELECT 3, 'Beater' FROM dual UNION ALL
SELECT 4, 'Keeper' FROM dual;

-- Populate Subject table
INSERT INTO Subject(ID, Name, Description)
SELECT 1, 'Potions', 'Study of magical potions and brews' FROM dual UNION ALL
SELECT 2, 'Transfiguration', 'Study of spells that change the form and appearance of the object' FROM dual UNION ALL
SELECT 3, 'Defence Against the Dark Arts', 'Study of defending against dark magic' FROM dual UNION ALL
SELECT 4, 'Charms', 'Study of spells that add properties to things' FROM dual;

-- Populate Club table
INSERT INTO Club(ID, Name, Description)
SELECT 1, 'Dumbledore"s Army', 'A student organisation for studying Defence Against the Dark Arts' FROM dual UNION ALL
SELECT 2, 'Slug Club', 'A club of students chosen by Professor Slughorn' FROM dual UNION ALL
SELECT 3, 'Gobstones Club', 'A club that plays Gobstones' FROM dual;

-- Populate Event table
INSERT INTO Event(ID, Name, Description, "Date", Duration)
SELECT 1, 'Triwizard Tournament', 'A magical contest held between the three largest wizarding schools of Europe', TO_DATE('2023-10-31','YYYY-MM-DD'), TO_DATE('2024-06-24','YYYY-MM-DD') FROM dual UNION ALL
SELECT 2, 'Quidditch World Cup', 'The Quidditch world cup tournament', TO_DATE('2024-07-01','YYYY-MM-DD'), TO_DATE('2024-07-31','YYYY-MM-DD') FROM dual UNION ALL
SELECT 3, 'Yule Ball', 'A formal dance party on the night of Christmas', TO_DATE('2023-12-25','YYYY-MM-DD'), TO_DATE('2023-12-26','YYYY-MM-DD') FROM dual;

-- Populate Quidditch table
INSERT INTO Quidditch(ID, Name, Description, Winner_House_ID)
SELECT 1, 'Gryffindor vs Slytherin', 'Quidditch match between Gryffindor and Slytherin', 1 FROM dual UNION ALL
SELECT 2, 'Hufflepuff vs Ravenclaw', 'Quidditch match between Hufflepuff and Ravenclaw', 4 FROM dual UNION ALL
SELECT 3, 'Slytherin vs Hufflepuff', 'Quidditch match between Slytherin and Hufflepuff', 2 FROM dual UNION ALL
SELECT 4, 'Ravenclaw vs Gryffindor', 'Quidditch match between Ravenclaw and Gryffindor', 1 FROM dual;

-- Populate Student table
INSERT INTO Student(ID, FirstName, MiddleName, LastName, Birth, Gender, "Level", House_ID)
SELECT 1, 'Harry', 'MiddleName', 'Potter', TO_DATE('1980-07-31','YYYY-MM-DD'), 1, 5, 1 FROM dual UNION ALL
SELECT 2, 'Hermione', 'MiddleName', 'Granger', TO_DATE('1979-09-19','YYYY-MM-DD'), 0, 5, 1 FROM dual UNION ALL
SELECT 3, 'Ron', 'MiddleName', 'Weasley', TO_DATE('1980-03-01','YYYY-MM-DD'), 1, 5, 1 FROM dual UNION ALL
SELECT 4, 'Draco', 'MiddleName', 'Malfoy', TO_DATE('1980-06-05','YYYY-MM-DD'), 1, 5, 2 FROM dual UNION ALL
SELECT 5, 'Vincent', 'MiddleName', 'Crabbe', TO_DATE('1980-12-31','YYYY-MM-DD'), 1, 5, 2 FROM dual UNION ALL
SELECT 6, 'Gregory', 'MiddleName', 'Goyle', TO_DATE('1980-06-30','YYYY-MM-DD'), 1, 5, 2 FROM dual UNION ALL
SELECT 7, 'Cedric', 'MiddleName', 'Diggory', TO_DATE('1977-10-01','YYYY-MM-DD'), 1, 7, 3 FROM dual UNION ALL
SELECT 8, 'Cho', 'MiddleName', 'Chang', TO_DATE('1979-02-14','YYYY-MM-DD'), 0, 5, 4 FROM dual;

-- Populate Teacher table
INSERT INTO Teacher(ID, FirstName, MiddleName, LastName, Birth, Gender, House_ID)
SELECT 1, 'Minerva', 'MiddleName', 'McGonagall', TO_DATE('1935-10-04','YYYY-MM-DD'), 0, 1 FROM dual UNION ALL
SELECT 2, 'Severus', 'MiddleName', 'Snape', TO_DATE('1960-01-09','YYYY-MM-DD'), 1, 2 FROM dual UNION ALL
SELECT 3, 'Pomona', 'MiddleName', 'Sprout', TO_DATE('1941-05-15','YYYY-MM-DD'), 0, 3 FROM dual UNION ALL
SELECT 4, 'Filius', 'MiddleName', 'Flitwick', TO_DATE('1958-10-17','YYYY-MM-DD'), 1, 4 FROM dual UNION ALL
SELECT 5, 'Albus', 'Percival Wulfric Brian', 'Dumbledore', TO_DATE('1881-08-01','YYYY-MM-DD'), 1, NULL FROM dual UNION ALL
SELECT 6, 'Dolores', 'Jane', 'Umbridge', TO_DATE('1965-08-26','YYYY-MM-DD'), 0, NULL FROM dual UNION ALL
SELECT 7, 'Horace', 'Eugene Flaccus', 'Slughorn', TO_DATE('1882-04-28','YYYY-MM-DD'), 1, NULL FROM dual;

-- Populate Grade table
INSERT INTO Grade(ID, Student_ID, Subject_ID, Score, "Date")
SELECT 1, 1, 1, 85, TO_DATE('2023-12-10','YYYY-MM-DD') FROM dual UNION ALL
SELECT 2, 2, 2, 95, TO_DATE('2023-12-10','YYYY-MM-DD') FROM dual UNION ALL
SELECT 3, 3, 3, 75, TO_DATE('2023-12-10','YYYY-MM-DD') FROM dual UNION ALL
SELECT 4, 4, 4, 70, TO_DATE('2023-12-10','YYYY-MM-DD') FROM dual;

-- Populate Schedule table
INSERT INTO Schedule(ID, Subject_ID, Student_ID, Teacher_ID, "Date", Duration, Task, Material)
SELECT 1, 1, 1, 2, TO_DATE('2023-06-20', 'YYYY-MM-DD'), NUMTODSINTERVAL((9*60+00)-(8*60+30),'MINUTE'), '', '' FROM dual UNION ALL
SELECT 2, 2, 2, 1, TO_DATE('2023-06-21', 'YYYY-MM-DD'), NUMTODSINTERVAL((10*60+00)-(9*60+30),'MINUTE'), '', '' FROM dual UNION ALL
SELECT 3, 3, 3, 5, TO_DATE('2023-06-22', 'YYYY-MM-DD'), NUMTODSINTERVAL((11*60+30)-(11*60+00),'MINUTE'), '', '' FROM dual UNION ALL
SELECT 4, 4, 4, 4, TO_DATE('2023-06-23', 'YYYY-MM-DD'), NUMTODSINTERVAL((13*60+00)-(12*60+30),'MINUTE'), '', '' FROM dual;


-- Populate Club_Student table
INSERT INTO Club_Student(Club_ID, Student_ID)
SELECT 1, 1 FROM dual UNION ALL
SELECT 1, 2 FROM dual UNION ALL
SELECT 1, 3 FROM dual UNION ALL
SELECT 2, 4 FROM dual;

-- Populate Club_Teacher table
INSERT INTO Club_Teacher(Club_ID, Teacher_ID)
SELECT 1, 1 FROM dual UNION ALL
SELECT 2, 7 FROM dual;

-- Populate Event_Student table
INSERT INTO Event_Student(Event_ID, Student_ID)
SELECT 1, 1 FROM dual UNION ALL
SELECT 1, 7 FROM dual UNION ALL
SELECT 2, 1 FROM dual UNION ALL
SELECT 3, 1 FROM dual UNION ALL
SELECT 3, 2 FROM dual UNION ALL
SELECT 3, 3 FROM dual UNION ALL
SELECT 3, 4 FROM dual;

-- Populate Event_Teacher table
INSERT INTO Event_Teacher(Event_ID, Teacher_ID)
SELECT 1, 5 FROM dual UNION ALL
SELECT 2, 5 FROM dual UNION ALL
SELECT 3, 5 FROM dual UNION ALL
SELECT 3, 1 FROM dual;

-- Populate Quidditch_Student table
INSERT INTO Quidditch_Student(Quidditch_ID, Student_ID, Position_ID)
SELECT 1, 1, 1 FROM dual UNION ALL
SELECT 1, 2, 2 FROM dual UNION ALL
SELECT 1, 3, 3 FROM dual UNION ALL
SELECT 2, 4, 1 FROM dual;

-- Populate Subject_Teacher table
INSERT INTO Subject_Teacher(Subject_ID, Teacher_ID)
SELECT 1, 2 FROM dual UNION ALL
SELECT 2, 1 FROM dual UNION ALL
SELECT 3, 5 FROM dual UNION ALL
SELECT 4, 4 FROM dual;
