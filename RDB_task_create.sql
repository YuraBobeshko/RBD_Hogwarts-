-- Table: Subject_Teacher
DROP TABLE Subject_Teacher;

-- Table: Teacher
DROP TABLE Teacher;

-- Table: Subject
DROP TABLE Subject;

-- Table: Student
DROP TABLE Student;

-- Table: Schedule
DROP TABLE Schedule;

-- Table: Quidditch_Student
DROP TABLE Quidditch_Student;

-- Table: Quidditch
DROP TABLE Quidditch;

-- Table: Position
DROP TABLE Position;

-- Table: House
DROP TABLE House;

-- Table: Grade
DROP TABLE Grade;

-- Table: Event_Teacher
DROP TABLE Event_Teacher;

-- Table: Event_Student
DROP TABLE Event_Student;

-- Table: Event
DROP TABLE Event;

-- Table: Club_Teacher
DROP TABLE Club_Teacher;

-- Table: Club_Student
DROP TABLE Club_Student;

-- Table: Club
DROP TABLE Club;


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

CREATE TABLE Schedule (
    ID integer  NOT NULL,
    "Date" date  NOT NULL,
    Duration INTERVAL DAY TO SECOND  NOT NULL,
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
);

-- Table: Subject_Teacher
CREATE TABLE Subject_Teacher (
    Teacher_ID integer  NOT NULL,
    Subject_ID integer  NOT NULL,
    CONSTRAINT Subject_Teacher_pk PRIMARY KEY (Subject_ID,Teacher_ID)
);

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
