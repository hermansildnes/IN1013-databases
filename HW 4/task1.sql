CREATE TABLE petPet (
  petname VARCHAR(20) NOT NULL PRIMARY KEY,
  owner VARCHAR(45),
  species VARCHAR(45),
  gender VARCHAR(1) CHECK (gender in ('M','F')),
  birth DATE,
  death DATE
);

CREATE TABLE petEvent (
  petname VARCHAR(20),
  eventdate DATE,
  eventtype VARCHAR(15),
  remark VARCHAR(255),
  FOREIGN KEY (petname) REFERENCES petPet (petname) ON DELETE CASCADE,
  PRIMARY KEY (petname, eventdate)
);
