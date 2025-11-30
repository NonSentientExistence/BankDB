CREATE DATABASE Bank;

USE Bank;


CREATE TABLE Employee (
  EmployeeID BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  FirstName VARCHAR(50) NOT NULL,
  Email VARCHAR(254) UNIQUE NOT NULL,
  Username VARCHAR(50) UNIQUE NOT NULL,
  Password VARCHAR(255) NOT NULL,
  Role ENUM('teller', 'advisor', 'manager', 'admin') NOT NULL,
  Office ENUM('halmstad', 'stockholm', 'gothenburg', 'malmo') NOT NULL,
  AddedDate DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
  Status ENUM('active', 'inactive', 'suspended') DEFAULT 'active'
);

CREATE TABLE Client (
  ClientID BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT , 
  NationalIdentificationNumber VARCHAR(20) UNIQUE NOT NULL, 
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(100) NOT NULL, 
  Email VARCHAR(254) UNIQUE NOT NULL, 
  PhoneNumber VARCHAR(20) NOT NULL, 
  Office ENUM('halmstad', 'stockholm', 'gothenburg', 'malmo') NOT NULL,
  ServiceLevel ENUM('regular', 'premium', 'privatebanking') DEFAULT 'regular' NOT NULL, 
  IsBusinessClient TINYINT DEFAULT 0 NOT NULL, 
  CurrentStatus ENUM('active', 'inactive', 'pending', 'offboarded') DEFAULT 'pending' NOT NULL, 
  KYC ENUM('approved','declined','pending') DEFAULT 'pending' NOT NULL, 
  ResponsibleAdvisor BIGINT UNSIGNED NULL,
  Blacklist TINYINT DEFAULT 0 NOT NULL,
  FOREIGN KEY (ResponsibleAdvisor) REFERENCES Employee(EmployeeID) ON DELETE SET NULL
);

CREATE TABLE ClientAddress(
  AddressID BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  ClientID BIGINT UNSIGNED NOT NULL,
  IsPrimary TINYINT NOT NULL,
  Street VARCHAR(50) NOT NULL, 
  StreetNumber VARCHAR(20) NOT NULL,
  City VARCHAR(50) NOT NULL, 
  PostalCode VARCHAR(20) NOT NULL, 
  Region VARCHAR(50),
  Country ENUM('sweden', 'finland', 'norway', 'us') DEFAULT 'sweden' NOT NULL,
  UsCitizen TINYINT DEFAULT 0 NOT NULL,
  FOREIGN KEY (ClientID) REFERENCES Client(ClientID) ON DELETE CASCADE
);  

CREATE TABLE Account (
  AccountNumber BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT, 
  Routing VARCHAR(20) NOT NULL default '8175-4', 
  SWIFT VARCHAR(11) DEFAULT 'dbbaseha', 
  IBAN VARCHAR(34) UNIQUE NOT NULL, 
  AccountHolder BIGINT UNSIGNED NOT NULL, 
  JointAccountHolder TINYINT NOT NULL, 
  AccountType ENUM('checking', 'savings', 'business') DEFAULT 'checking',
  Status ENUM('active', 'closed', 'frozen', 'pending') DEFAULT 'pending',
  OpenedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  ClosedDate TIMESTAMP DEFAULT NULL,
  Currency ENUM('eur','sek','usd') default 'eur', 
  Balance DECIMAL(15,2) default 0, 
  FOREIGN KEY (AccountHolder) REFERENCES Client(ClientID) ON DELETE RESTRICT
);

CREATE TABLE Blacklist (
  BlacklistID INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  ClientID BIGINT UNSIGNED NOT NULL, 
  Reason ENUM('kyc', 'aml', 'harassment') NOT NULL, 
  Description TEXT NOT NULL, 
  BlacklistedBy BIGINT UNSIGNED NOT NULL, 
  LoginAllowed TINYINT NOT NULL DEFAULT 1, 
  BlacklistDateTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(), 
  FOREIGN KEY (ClientID) REFERENCES Client(ClientID) ON DELETE CASCADE,
  FOREIGN KEY (BlacklistedBy) REFERENCES Employee(EmployeeID) ON DELETE RESTRICT
);

CREATE TABLE Transaction (
  TransactionId BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  AccountNumber BIGINT UNSIGNED NOT NULL,
  TransactionType ENUM('debit', 'credit', 'fee', 'interest', 'adjustment') NOT NULL,
  Debit DECIMAL(15,2) DEFAULT 0,
  Credit DECIMAL(15,2) DEFAULT 0,
  Currency ENUM('eur','sek','usd') default 'eur' NOT NULL,
  Status ENUM('pending', 'completed', 'failed', 'reversed') DEFAULT 'pending',
  Reference VARCHAR(50),
  Description VARCHAR(255),
  TransactionDate DATETIME DEFAULT CURRENT_TIMESTAMP(),
  FOREIGN KEY (AccountNumber) REFERENCES Account(AccountNumber));

CREATE TABLE JointAccountHolder(
  AccountNumber BIGINT UNSIGNED NOT NULL,
  ClientID BIGINT UNSIGNED NOT NULL,
  AddedDate DATETIME DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (AccountNumber, ClientID),
  FOREIGN KEY (AccountNumber) REFERENCES Account(AccountNumber) ON DELETE CASCADE,
  FOREIGN KEY (ClientID) REFERENCES Client(ClientID) ON DELETE CASCADE
);
