DROP DATABASE IF EXISTS PlannrlyUsers;
CREATE DATABASE PlannrlyUsers;
USE PlannrlyUsers;

CREATE TABLE User (
	userID INT(11) PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NULL
);

CREATE TABLE Search (
	searchID INT(11) PRIMARY KEY AUTO_INCREMENT,
	queryInfo VARCHAR(50) NOT NULL,
    userID INT(11) NOT NULL,
    CONSTRAINT FOREIGN KEY Search(userID) REFERENCES User(userID)
);

CREATE TABLE GroupInfo (
	groupID INT(11) PRIMARY KEY AUTO_INCREMENT,
    groupName VARCHAR(50) NOT NULL,
    memberCount INT(11) NOT NULL,
    location VARCHAR(50) NOT NULL,
    price INT(11) NOT NULL,
    activityType VARCHAR(50) NOT NULL
);
CREATE TABLE GroupMember (
	groupMemID INT(11) PRIMARY KEY AUTO_INCREMENT,
    groupID INT(11) NOT NULL,
    userID INT(11) NOT NULL,
    FOREIGN KEY GroupMember(userID) REFERENCES User(userID),
    FOREIGN KEY GroupMember1UserUserGroupInfo(groupID) REFERENCES GroupInfo(groupID)
);

CREATE TABLE Votes (
  votesID INT NOT NULL AUTO_INCREMENT,
  voteName VARCHAR(200) NOT NULL,
  numVotes INT(11) NOT NULL,
  PRIMARY KEY (votesID),
  UNIQUE INDEX voteName_UNIQUE (voteName ASC) VISIBLE
);

CREATE TABLE whovoted (
  whoID int(11) NOT NULL AUTO_INCREMENT,
  votedList varchar(200) NOT NULL,
  dummy varchar(45) NOT NULL,
  PRIMARY KEY (whoID)
);

CREATE TABLE notifications (
  notID INT NOT NULL AUTO_INCREMENT,
  notification VARCHAR(200) NOT NULL,
  PRIMARY KEY (`notID`)
);
       

               
