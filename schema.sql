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

-- För sök mot konto, väldigt vanlig sökning i DBn
CREATE INDEX idx_transaction_account ON Transaction(AccountNumber);

-- Filtrera status bland transaktioner, hade vart en vanlig filtrering i en bank DB.
CREATE INDEX idx_transaction_status ON Transaction(Status);

-- Referens sök, där man vill hitta hela transaktions kedjan på referensen
CREATE INDEX idx_transaction_reference ON Transaction(Reference);

-- Sök där man vill filtrera på transaktionstyp. Vanligt i rapporter eller sök mot ett konto
CREATE INDEX idx_transaction_type ON Transaction(TransactionType);

-- För transaktioner under visst datum tex, mycket vanligt i rapporter.
CREATE INDEX idx_transaction_date ON Transaction(TransactionDate);

-- Skapar en view som bara visar saldo på alla konton över 0 och inte är något av master accounts
CREATE VIEW AccountBalances AS 
SELECT Concat(c.FirstName,' ', c.LastName) AS AccountHolderName, 
  c.ResponsibleAdvisor, 
  a.AccountNumber, 
  a.Balance, 
  a.AccountType, 
  a.Status
FROM Client as c 
LEFT JOIN Account as a on c.ClientID = a.AccountHolder
WHERE a.Balance > 0 AND a.AccountNumber != 1 AND a.AccountNumber != 2
ORDER BY a.Balance DESC;

-- Skapar en view som bara visar svartlistade klienter med ett positivt saldo på kontot och sorterar efter saldo 
CREATE VIEW BlacklistedClientWithBalance AS
SELECT Concat(c.FirstName,' ', c.LastName) AS AccountHolderName, 
  c.ResponsibleAdvisor,
  a.AccountNumber, 
  a.Balance,
  a.Status
FROM Client as c 
LEFT JOIN Account as a on c.ClientID = a.AccountHolder
WHERE (c.Blacklist = 1) AND (a.Balance > 0)
ORDER BY a.Balance DESC;

-- Skapar en view där man ser konton som inte har en dedikerad advisor och ett saldo över 5000
CREATE VIEW HighBalanceNoAdvisor AS
SELECT Concat(c.FirstName,' ', c.LastName) AS AccountHolderName, 
  c.ResponsibleAdvisor, 
  a.AccountNumber, 
  a.Balance, 
  a.AccountType, 
  a.Status
FROM Client as c 
LEFT JOIN Account as a on c.ClientID = a.AccountHolder
WHERE a.Balance > 5000 AND (c.ResponsibleAdvisor IS NULL OR c.ResponsibleAdvisor = 0) AND a.AccountNumber != 1 AND a.AccountNumber != 2
ORDER BY a.Balance DESC;

-- Skapar en view där man ser advisors med mer än en klient tilldelad. Bra för att se vilka advisors som flertalet klienter och ev "presterar bäst"
CREATE VIEW AdvisorMultipleClients AS
SELECT 
  e.EmployeeID,
	e.FirstName AS AdvisorName,
  e.Office,
  COUNT(c.ClientID) AS NumberOfClients,
  COUNT(CASE WHEN c.ServiceLevel = 'premium' THEN 1 END) AS PremiumClients,
  COUNT(CASE WHEN c.ServiceLevel = 'privatebanking' THEN 1 END) AS PrivateBankingClients
FROM Employee as e     
LEFT JOIN Client c ON e.EmployeeID = c.ResponsibleAdvisor
WHERE e.Role = 'advisor'
GROUP BY e.EmployeeID 

-- Skapar en view där man får en flagga om det är ett joint account samt antalet medkontohavare. Sorterat på antalet medkontohavare primärt, saldo sekundärt. Utan master accounts
CREATE VIEW SortJointAccounts AS
SELECT 
  a.AccountNumber,
  CONCAT(c.FirstName, ' ', c.LastName) AS PrimaryAccountHolder,
  a.Balance,
  COUNT(j.ClientID) AS NoOfJointAccountHolders,
  CASE 
    WHEN a.JointAccountHolder = 1 THEN 'Yes'
    ELSE 'No'
  END AS JointAccount
FROM Account AS a
LEFT JOIN Client as c ON a.AccountHolder = c.ClientID
LEFT JOIN JointAccountHolder as j ON a.AccountNumber = j.AccountNumber
WHERE (a.AccountNumber != 1 AND a.AccountNumber != 2)
GROUP BY a.AccountNumber, a.JointAccountHolder
ORDER BY NoOfJointAccountHolders DESC, a.Balance DESC;

-- Skapar view som visar alla kunder som inte har ett sparkonto + en count på hur många konton de har. Bra för kampanj att få kunder att öppna sparkonto, därför är kontakt info inkluderat
CREATE VIEW NoSavingsAccount AS
SELECT 
	c.ClientID,
  CONCAT(c.FirstName, ' ', c.LastName) AS Client,
  c.Email,
  c.PhoneNumber,
  COUNT(a.AccountNumber) AS NumberOfAccounts,
  COUNT(CASE WHEN a.AccountType = 'savings' THEN 1 END) AS SavingsAccounts
FROM Client AS c
LEFT JOIN Account AS a ON c.ClientID = a.AccountHolder
WHERE c.ClientID != 1
GROUP BY c.ClientID, c.FirstName, c.LastName, c.Email, c.PhoneNumber
HAVING COUNT(CASE WHEN a.AccountType = 'savings' THEN 1 END) = 0
ORDER BY NumberOfAccounts DESC;

-- Skapar en Prodecure som ändrar status från pending till completed om transaktions referensen finns och har status pending 

DELIMITER ||

CREATE PROCEDURE ApproveTransaction(
    IN procedure_reference VARCHAR(50),
    OUT procedure_status VARCHAR(100)
)
BEGIN
    DECLARE transaction_count INT;
    
    -- Kontrollera om transaktion existerar och har status pending
    SELECT COUNT(*) INTO transaction_count
    FROM Transaction
    WHERE Reference = procedure_reference AND Status = 'pending';
    
    IF transaction_count = 0 THEN
        SET procedure_status = 'ERROR: No pending transactions with this reference found';
    ELSE
        -- Uppdatera alla transaktioner med denna referens till status completed
        UPDATE Transaction
        SET Status = 'completed'
        WHERE Reference = procedure_reference AND Status = 'pending';
        
        SET procedure_status = CONCAT('Succssess: Completed ', transaction_count, ' transactions');
    END IF;
END||

DELIMITER ;