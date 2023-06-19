-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-05-06 06:46:32.454

-- tables
-- Table: Club
CREATE TABLE Club (
    ID integer  NOT NULL,
    Name varchar2(30)  NOT NULL,
    Description varchar2(200)  NOT NULL,
    CONSTRAINT Club_pk PRIMARY KEY (ID)
) ;

-- Table: Club_Student
CREATE TABLE Club_Student (
    Club_ID integer  NOT NULL,
    Student_ID integer  NOT NULL,
    CONSTRAINT Club_Student_pk PRIMARY KEY (Club_ID,Student_ID)
) ;

-- Table: Club_Teacher
CREATE TABLE Club_Teacher (
    Club_ID integer  NOT NULL,
    Teacher_ID integer  NOT NULL,
    CONSTRAINT Club_Teacher_pk PRIMARY KEY (Club_ID,Teacher_ID)
) ;

-- Table: Event
CREATE TABLE Event (
    ID integer  NOT NULL,
    Name varchar2(30)  NOT NULL,
    Description varchar2(200)  NOT NULL,
    "Date" date  NOT NULL,
    Duration date  NOT NULL,
    CONSTRAINT Event_pk PRIMARY KEY (ID)
) ;

-- Table: Event_Student
CREATE TABLE Event_Student (
    Student_ID integer  NOT NULL,
    Event_ID integer  NOT NULL,
    CONSTRAINT Event_Student_pk PRIMARY KEY (Student_ID,Event_ID)
) ;

-- Table: Event_Teacher
CREATE TABLE Event_Teacher (
    Teacher_ID integer  NOT NULL,
    Event_ID integer  NOT NULL,
    CONSTRAINT Event_Teacher_pk PRIMARY KEY (Teacher_ID,Event_ID)
) ;

-- Table: Grade
CREATE TABLE Grade (
    ID integer  NOT NULL,
    Grade integer  NOT NULL,
    "Date" date  NOT NULL,
    Description varchar2(200)  NULL,
    Student_ID integer  NOT NULL,
    Teacher_ID integer  NOT NULL,
    Subject_ID integer  NOT NULL,
    CONSTRAINT Grade_pk PRIMARY KEY (ID)
) ;

-- Table: House
CREATE TABLE House (
    ID integer  NOT NULL,
    Name varchar2(30)  NOT NULL,
    Description varchar2(200)  NOT NULL,
    Count_Of_Grade integer  NOT NULL,
    Teacher_ID integer  NOT NULL,
    Student_ID integer  NOT NULL,
    CONSTRAINT House_pk PRIMARY KEY (ID)
) ;

-- Table: Position
CREATE TABLE Position (
    ID integer  NOT NULL,
    Name varchar2(30)  NOT NULL,
    CONSTRAINT Position_pk PRIMARY KEY (ID)
) ;

-- Table: Quidditch
CREATE TABLE Quidditch (
    ID integer  NOT NULL,
    name varchar2(30)  NOT NULL,
    Description varchar2(200)  NULL,
    Winner_House_ID integer  NOT NULL,
    CONSTRAINT Quidditch_pk PRIMARY KEY (ID)
) ;

-- Table: Quidditch_Student
CREATE TABLE Quidditch_Student (
    Student_ID integer  NOT NULL,
    Quidditch_ID integer  NOT NULL,
    Position_ID integer  NOT NULL,
    CONSTRAINT Quidditch_Student_pk PRIMARY KEY (Student_ID,Quidditch_ID,Position_ID)
) ;

-- Table: Schedule
CREATE TABLE Schedule (
    ID integer  NOT NULL,
    "Date" date  NOT NULL,
    Duration date  NOT NULL,
    Subject_ID integer  NOT NULL,
    Student_ID integer  NOT NULL,
    Teacher_ID integer  NOT NULL,
    Task varchar2(200)  NULL,
    Material varchar2(200)  NULL,
    CONSTRAINT Schedule_pk PRIMARY KEY (ID)
) ;

-- Table: Student
CREATE TABLE Student (
    ID integer  NOT NULL,
    FirstName varchar2(30)  NOT NULL,
    MiddleName varchar2(30)  NULL,
    LastName varchar2(30)  NOT NULL,
    Birth date  NOT NULL,
    Gender integer  NOT NULL,
    "Level" integer  NOT NULL,
    House_ID integer  NOT NULL,
    CONSTRAINT Student_pk PRIMARY KEY (ID)
) ;

-- Table: Subject
CREATE TABLE Subject (
    ID integer  NOT NULL,
    Name varchar2(30)  NOT NULL,
    Description varchar2(200)  NOT NULL,
    CONSTRAINT Subject_pk PRIMARY KEY (ID)
) ;

-- Table: Subject_Teacher
CREATE TABLE Subject_Teacher (
    Teacher_ID integer  NOT NULL,
    Subject_ID integer  NOT NULL,
    CONSTRAINT Subject_Teacher_pk PRIMARY KEY (Subject_ID,Teacher_ID)
) ;

-- Table: Teacher
CREATE TABLE Teacher (
    ID integer  NOT NULL,
    FirstName varchar2(30)  NOT NULL,
    MiddleName varchar2(30)  NOT NULL,
    LastName varchar2(30)  NOT NULL,
    Birth date  NOT NULL,
    Gender integer  NOT NULL,
    House_ID integer,
    CONSTRAINT Teacher_pk PRIMARY KEY (ID)
) ;

-- foreign keys
-- Reference: Event_Student_Event (table: Event_Student)
ALTER TABLE Event_Student ADD CONSTRAINT Event_Student_Event
    FOREIGN KEY (Event_ID)
    REFERENCES Event (ID);

-- Reference: Event_Student_Student (table: Event_Student)
ALTER TABLE Event_Student ADD CONSTRAINT Event_Student_Student
    FOREIGN KEY (Student_ID)
    REFERENCES Student (ID);

-- Reference: Event_Teacher_Event (table: Event_Teacher)
ALTER TABLE Event_Teacher ADD CONSTRAINT Event_Teacher_Event
    FOREIGN KEY (Event_ID)
    REFERENCES Event (ID);

-- Reference: Event_Teacher_Teacher (table: Event_Teacher)
ALTER TABLE Event_Teacher ADD CONSTRAINT Event_Teacher_Teacher
    FOREIGN KEY (Teacher_ID)
    REFERENCES Teacher (ID);

-- Reference: Game_Quidditch (table: Quidditch_Student)
ALTER TABLE Quidditch_Student ADD CONSTRAINT Game_Quidditch
    FOREIGN KEY (Quidditch_ID)
    REFERENCES Quidditch (ID);

-- Reference: Game_Student (table: Quidditch_Student)
ALTER TABLE Quidditch_Student ADD CONSTRAINT Game_Student
    FOREIGN KEY (Student_ID)
    REFERENCES Student (ID);

-- Reference: Grade_Student (table: Grade)
ALTER TABLE Grade ADD CONSTRAINT Grade_Student
    FOREIGN KEY (Student_ID)
    REFERENCES Student (ID);

-- Reference: Grade_Subject (table: Grade)
ALTER TABLE Grade ADD CONSTRAINT Grade_Subject
    FOREIGN KEY (Subject_ID)
    REFERENCES Subject (ID);

-- Reference: Grade_Teacher (table: Grade)
ALTER TABLE Grade ADD CONSTRAINT Grade_Teacher
    FOREIGN KEY (Teacher_ID)
    REFERENCES Teacher (ID);

-- Reference: House_Student (table: House)
ALTER TABLE House ADD CONSTRAINT House_Student
    FOREIGN KEY (Student_ID)
    REFERENCES Student (ID);

-- Reference: House_Teacher (table: House)
ALTER TABLE House ADD CONSTRAINT House_Teacher
    FOREIGN KEY (Teacher_ID)
    REFERENCES Teacher (ID);

-- Reference: Quidditch_House (table: Quidditch)
ALTER TABLE Quidditch ADD CONSTRAINT Quidditch_House
    FOREIGN KEY (Winner_House_ID)
    REFERENCES House (ID);

-- Reference: Quidditch_Student_Position (table: Quidditch_Student)
ALTER TABLE Quidditch_Student ADD CONSTRAINT Quidditch_Student_Position
    FOREIGN KEY (Position_ID)
    REFERENCES Position (ID);

-- Reference: Schedule_Student (table: Schedule)
ALTER TABLE Schedule ADD CONSTRAINT Schedule_Student
    FOREIGN KEY (Student_ID)
    REFERENCES Student (ID);

-- Reference: Schedule_Subject (table: Schedule)
ALTER TABLE Schedule ADD CONSTRAINT Schedule_Subject
    FOREIGN KEY (Subject_ID)
    REFERENCES Subject (ID);

-- Reference: Schedule_Teacher (table: Schedule)
ALTER TABLE Schedule ADD CONSTRAINT Schedule_Teacher
    FOREIGN KEY (Teacher_ID)
    REFERENCES Teacher (ID);

-- Reference: Student_House (table: Student)
ALTER TABLE Student ADD CONSTRAINT Student_House
    FOREIGN KEY (House_ID)
    REFERENCES House (ID);

-- Reference: Table_15_Club (table: Club_Teacher)
ALTER TABLE Club_Teacher ADD CONSTRAINT Table_15_Club
    FOREIGN KEY (Club_ID)
    REFERENCES Club (ID);

-- Reference: Table_15_Teacher (table: Club_Teacher)
ALTER TABLE Club_Teacher ADD CONSTRAINT Table_15_Teacher
    FOREIGN KEY (Teacher_ID)
    REFERENCES Teacher (ID);

-- Reference: Table_16_Club (table: Club_Student)
ALTER TABLE Club_Student ADD CONSTRAINT Table_16_Club
    FOREIGN KEY (Club_ID)
    REFERENCES Club (ID);

-- Reference: Table_16_Student (table: Club_Student)
ALTER TABLE Club_Student ADD CONSTRAINT Table_16_Student
    FOREIGN KEY (Student_ID)
    REFERENCES Student (ID);

-- Reference: Table_17_Subject (table: Subject_Teacher)
ALTER TABLE Subject_Teacher ADD CONSTRAINT Table_17_Subject
    FOREIGN KEY (Subject_ID)
    REFERENCES Subject (ID);

-- Reference: Table_17_Teacher (table: Subject_Teacher)
ALTER TABLE Subject_Teacher ADD CONSTRAINT Table_17_Teacher
    FOREIGN KEY (Teacher_ID)
    REFERENCES Teacher (ID);

-- Reference: Teacher_House (table: Teacher)
ALTER TABLE Teacher ADD CONSTRAINT Teacher_House
    FOREIGN KEY (House_ID)
    REFERENCES House (ID);

-- End of file.

