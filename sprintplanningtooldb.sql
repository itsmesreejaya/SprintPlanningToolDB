create database sprintplanningtooldb;
use sprintplanningtooldb;

-- Create User table
CREATE TABLE User (
  UserID INT PRIMARY KEY,
  FirstName VARCHAR(255),
  LastName VARCHAR(255),
  Email VARCHAR(255),
  Role VARCHAR(50)
);

-- Create Project table
CREATE TABLE Project (
  ProjectID INT PRIMARY KEY,
  ManagedBy INT REFERENCES User(UserID),
  ProjectName VARCHAR(255),
  Description TEXT,
  CreatedDate DATE,
  StartDate DATE,
  EndDate DATE
);

-- Create Sprint table
CREATE TABLE Sprint (
  SprintID INT PRIMARY KEY,
  ProjectID INT REFERENCES Project(ProjectID),
  CreatedBy INT REFERENCES User(UserID),
  SprintName VARCHAR(255),
  CreatedDate DATE,
  StartDate DATE,
  EndDate DATE,
  Status VARCHAR(50)
);

-- Create UserStory table
CREATE TABLE UserStory (
  StoryID INT PRIMARY KEY,
  SprintID INT REFERENCES Sprint(SprintID),
  CreatedBy INT REFERENCES User(UserID),
  Title VARCHAR(255),
  Description TEXT,
  Priority INT,
  Points INT,
  Status VARCHAR(50),
  CreatedDate DATE
);

-- Create Task table
CREATE TABLE Task (
  TaskID INT PRIMARY KEY,
  AssignedTo INT REFERENCES User(UserID),
  StoryID INT REFERENCES UserStory(StoryID),
  Description TEXT,
  CreatedDate DATE,
  EstimatedHours INT,
  ActualHours INT,
  Status VARCHAR(50)
);
