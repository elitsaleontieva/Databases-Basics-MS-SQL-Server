CREATE TABLE Majors(
MajorID INT NOT NULL PRIMARY KEY,
Name NVARCHAR(50)
)

CREATE TABLE Students(
StudentID INT NOT NULL PRIMARY KEY,
StudentNumber INT,
StudentName NVARCHAR(50),
MajorID INT FOREIGN KEY REFERENCES Majors(MajorID)
)

CREATE TABLE Payments(
PaymentID INT NOT NULL PRIMARY KEY,
PaymentDate DATE,
PaymentAmount DECIMAL(15,2),
StudentID INT FOREIGN KEY REFERENCES Students(StudentID)
)
CREATE TABLE Subjects(
SubjectID INT NOT NULL PRIMARY KEY,
SubjectName NVARCHAR(50)
)

CREATE TABLE Agenda(
StudentID INT NOT NULL FOREIGN KEY REFERENCES Students(StudentID),
SubjectID INT NOT NULL  FOREIGN KEY REFERENCES Subjects(SubjectID),
CONSTRAINT CK_StudentIdSubjectId PRIMARY KEY (StudentID, SubjectID)
)
