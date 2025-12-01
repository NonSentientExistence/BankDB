
-- BANK TEST DATA
-- Triggers ligger även här för att det ska bli korrekt i DB när data läggs till

USE Bank;

-- EMPLOYEES (Populerar db med anställda)

INSERT INTO Employee (FirstName, Email, Username, Password, Role, Office) VALUES
('Anna', 'anna.karlsson@dbbank.testse', 'akarlsson', 'hashed_password_1', 'admin', 'stockholm'),
('Erik', 'erik.svensson@dbbank.testse', 'esvensson', 'hashed_password_2', 'manager', 'stockholm'),
('Lisa', 'lisa.andersson@dbbank.testse', 'landersson', 'hashed_password_3', 'advisor', 'halmstad'),
('Johan', 'johan.nilsson@dbbank.testse', 'jnilsson', 'hashed_password_4', 'advisor', 'gothenburg'),
('Maria', 'maria.berg@dbbank.testse', 'mberg', 'hashed_password_5', 'teller', 'malmo');

-- BANK CLIENT (Klient 1 avser banken)

INSERT INTO Client (ClientID, NationalIdentificationNumber, FirstName, LastName, Email, PhoneNumber, Office, ServiceLevel, IsBusinessClient, CurrentStatus, KYC, ResponsibleAdvisor, Blacklist) VALUES
(1, 'BANK-000000001', 'DB', 'Bank', 'bank@dbbank.testse', '099-123-45-67', 'stockholm', 'regular', 1, 'active', 'approved', NULL, 0);

-- BANK ADDRESS (Lägger in bankens adress som en klient i DB)

INSERT INTO ClientAddress (ClientID, IsPrimary, Street, StreetNumber, City, PostalCode, Region, Country, UsCitizen) VALUES
(1, 1, 'Testbankvägen', '1', 'Stockholm', '111 22', 'Stockholm', 'sweden', 0);


-- BANK ACCOUNTS MASTERS (Konto 1 avser ett master konto som ägs av banken, Konto 2 avser ett liknande master konto för inkommande transaktioner från andra banker)

-- Master Account
INSERT INTO Account (AccountNumber, Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status, Currency, Balance) VALUES
(1, '8175-4', 'DBBASEHA', 'SE4581750000000000000001', 1, 0, 'checking', 'active', 'eur', 0.00);

-- External Transfer Account
INSERT INTO Account (AccountNumber, Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status, Currency, Balance) VALUES
(2, '8175-4', 'DBBASEHA', 'SE4581750000000000000002', 1, 0, 'checking', 'active', 'eur', 0.00);


-- CLIENTS (Lägger till klienter i db med varierande data)


INSERT INTO Client (NationalIdentificationNumber, FirstName, LastName, Email, PhoneNumber, Office, ServiceLevel, IsBusinessClient, CurrentStatus, KYC, ResponsibleAdvisor, Blacklist) VALUES
('198501152345', 'Magnus', 'Lindström', 'magnus.lindstrom@testmail.testse', '091-123-4567', 'stockholm', 'regular', 0, 'active', 'approved', 3, 0);

INSERT INTO Client (NationalIdentificationNumber, FirstName, LastName, Email, PhoneNumber, Office, ServiceLevel, IsBusinessClient, CurrentStatus, KYC, ResponsibleAdvisor, Blacklist) VALUES
('197203089876', 'Sofia', 'Bergqvist', 'sofia.bergqvist@testmail.testse', '091-234-5678', 'stockholm', 'premium', 0, 'active', 'approved', 3, 0);

INSERT INTO Client (NationalIdentificationNumber, FirstName, LastName, Email, PhoneNumber, Office, ServiceLevel, IsBusinessClient, CurrentStatus, KYC, ResponsibleAdvisor, Blacklist) VALUES
('196512201234', 'Lars', 'Andersson', 'lars.andersson@testmail.testse', '091-345-6789', 'stockholm', 'privatebanking', 0, 'active', 'approved', 4, 0);

INSERT INTO Client (NationalIdentificationNumber, FirstName, LastName, Email, PhoneNumber, Office, ServiceLevel, IsBusinessClient, CurrentStatus, KYC, ResponsibleAdvisor, Blacklist) VALUES
('556789-1234', 'Tech', 'Solutions AB', 'info@techsolutions.testse', '099-555-1234', 'stockholm', 'premium', 1, 'active', 'approved', 4, 0);

INSERT INTO Client (NationalIdentificationNumber, FirstName, LastName, Email, PhoneNumber, Office, ServiceLevel, IsBusinessClient, CurrentStatus, KYC, ResponsibleAdvisor, Blacklist) VALUES
('199008153456', 'Emma', 'Johansson', 'emma.johansson@testmail.testse', '091-456-7890', 'halmstad', 'regular', 0, 'pending', 'pending', 3, 0);

INSERT INTO Client (NationalIdentificationNumber, FirstName, LastName, Email, PhoneNumber, Office, ServiceLevel, IsBusinessClient, CurrentStatus, KYC, ResponsibleAdvisor, Blacklist) VALUES
('198806124567', 'Oskar', 'Nilsson', 'oskar.nilsson@testmail.testse', '091-567-8901', 'gothenburg', 'regular', 0, 'inactive', 'declined', 4, 0);

INSERT INTO Client (NationalIdentificationNumber, FirstName, LastName, Email, PhoneNumber, Office, ServiceLevel, IsBusinessClient, CurrentStatus, KYC, ResponsibleAdvisor, Blacklist) VALUES
('198202156789', 'Viktor', 'Eriksson', 'viktor.eriksson@testmail.testse', '091-678-9012', 'malmo', 'regular', 0, 'active', 'approved', NULL, 0);

INSERT INTO Client (NationalIdentificationNumber, FirstName, LastName, Email, PhoneNumber, Office, ServiceLevel, IsBusinessClient, CurrentStatus, KYC, ResponsibleAdvisor, Blacklist) VALUES
('198405237890', 'Petra', 'Svensson', 'petra.svensson@testmail.testse', '091-789-0123', 'malmo', 'regular', 0, 'active', 'approved', NULL, 0);

INSERT INTO Client (NationalIdentificationNumber, FirstName, LastName, Email, PhoneNumber, Office, ServiceLevel, IsBusinessClient, CurrentStatus, KYC, ResponsibleAdvisor, Blacklist) VALUES
('197509188901', 'Gustav', 'Larsson', 'gustav.larsson@testmail.testse', '091-890-1234', 'halmstad', 'regular', 0, 'active', 'approved', 3, 0);

INSERT INTO Client (NationalIdentificationNumber, FirstName, LastName, Email, PhoneNumber, Office, ServiceLevel, IsBusinessClient, CurrentStatus, KYC, ResponsibleAdvisor, Blacklist) VALUES
('196803129012', 'Karin', 'Persson', 'karin.persson@testmail.testse', '091-901-2345', 'gothenburg', 'premium', 0, 'active', 'approved', 4, 0);

INSERT INTO Client (NationalIdentificationNumber, FirstName, LastName, Email, PhoneNumber, Office, ServiceLevel, IsBusinessClient, CurrentStatus, KYC, ResponsibleAdvisor, Blacklist) VALUES
('199105140123', 'Mikael', 'Holm', 'mikael.holm@testmail.testse', '091-012-3456', 'stockholm', 'regular', 0, 'inactive', 'approved', NULL, 1);

INSERT INTO Client (NationalIdentificationNumber, FirstName, LastName, Email, PhoneNumber, Office, ServiceLevel, IsBusinessClient, CurrentStatus, KYC, ResponsibleAdvisor, Blacklist) VALUES
('198707221234', 'Fredrik', 'Gustafsson', 'fredrik.gustafsson@testmail.testse', '091-123-4560', 'malmo', 'regular', 0, 'offboarded', 'declined', NULL, 1);

INSERT INTO Client (NationalIdentificationNumber, FirstName, LastName, Email, PhoneNumber, Office, ServiceLevel, IsBusinessClient, CurrentStatus, KYC, ResponsibleAdvisor, Blacklist) VALUES
('197912032345', 'Helena', 'Karlsson', 'helena.karlsson@testmail.testse', '091-234-5601', 'halmstad', 'regular', 0, 'active', 'approved', 3, 0);

INSERT INTO Client (NationalIdentificationNumber, FirstName, LastName, Email, PhoneNumber, Office, ServiceLevel, IsBusinessClient, CurrentStatus, KYC, ResponsibleAdvisor, Blacklist) VALUES
('198011143456', 'Daniel', 'Bergman', 'daniel.bergman@testmail.testse', '091-345-6012', 'halmstad', 'regular', 0, 'active', 'approved', 3, 0);

INSERT INTO Client (NationalIdentificationNumber, FirstName, LastName, Email, PhoneNumber, Office, ServiceLevel, IsBusinessClient, CurrentStatus, KYC, ResponsibleAdvisor, Blacklist) VALUES
('196606054567', 'Ingrid', 'Malmberg', 'ingrid.malmberg@testmail.testse', '091-456-0123', 'gothenburg', 'regular', 0, 'inactive', 'approved', NULL, 0);


-- CLIENT ADDRESSES (Adresser till klienterna i databasen, flaggar primär address)

INSERT INTO ClientAddress (ClientID, IsPrimary, Street, StreetNumber, City, PostalCode, Region, Country, UsCitizen) VALUES
(2, 1, 'Exempelgatan', '12', 'Stockholm', '114 55', 'Stockholm', 'sweden', 0);

INSERT INTO ClientAddress (ClientID, IsPrimary, Street, StreetNumber, City, PostalCode, Region, Country, UsCitizen) VALUES
(3, 1, 'Fiktivvägen', '45', 'Stockholm', '111 21', 'Stockholm', 'sweden', 0),
(3, 0, 'Provstigen', '78', 'Stockholm', '114 56', 'Stockholm', 'sweden', 0);

INSERT INTO ClientAddress (ClientID, IsPrimary, Street, StreetNumber, City, PostalCode, Region, Country, UsCitizen) VALUES
(4, 1, 'Testgränden', '23', 'Stockholm', '114 42', 'Stockholm', 'sweden', 0);

INSERT INTO ClientAddress (ClientID, IsPrimary, Street, StreetNumber, City, PostalCode, Region, Country, UsCitizen) VALUES
(5, 1, 'Demostråket', '156', 'Stockholm', '113 46', 'Stockholm', 'sweden', 0);

INSERT INTO ClientAddress (ClientID, IsPrimary, Street, StreetNumber, City, PostalCode, Region, Country, UsCitizen) VALUES
(6, 1, 'Simuleringsvägen', '5', 'Halmstad', '302 43', 'Halland', 'sweden', 0);

INSERT INTO ClientAddress (ClientID, IsPrimary, Street, StreetNumber, City, PostalCode, Region, Country, UsCitizen) VALUES
(7, 1, 'Mockupgatan', '33', 'Göteborg', '411 38', 'Västra Götaland', 'sweden', 0);

INSERT INTO ClientAddress (ClientID, IsPrimary, Street, StreetNumber, City, PostalCode, Region, Country, UsCitizen) VALUES
(8, 1, 'Samplevägen', '18', 'Malmö', '211 34', 'Skåne', 'sweden', 0);

INSERT INTO ClientAddress (ClientID, IsPrimary, Street, StreetNumber, City, PostalCode, Region, Country, UsCitizen) VALUES
(9, 1, 'Dummygatan', '22', 'Malmö', '211 25', 'Skåne', 'sweden', 0),
(9, 0, 'Testipolku', '67', 'Helsinki', '00100', 'Uusimaa', 'finland', 0);

INSERT INTO ClientAddress (ClientID, IsPrimary, Street, StreetNumber, City, PostalCode, Region, Country, UsCitizen) VALUES
(10, 1, 'Fakevägen', '9', 'Halmstad', '302 45', 'Halland', 'sweden', 0);

INSERT INTO ClientAddress (ClientID, IsPrimary, Street, StreetNumber, City, PostalCode, Region, Country, UsCitizen) VALUES
(11, 1, 'Plasticgatan', '54', 'Göteborg', '413 04', 'Västra Götaland', 'sweden', 0);

INSERT INTO ClientAddress (ClientID, IsPrimary, Street, StreetNumber, City, PostalCode, Region, Country, UsCitizen) VALUES
(12, 1, 'Imaginärvägen', '88', 'Stockholm', '111 27', 'Stockholm', 'sweden', 0);

INSERT INTO ClientAddress (ClientID, IsPrimary, Street, StreetNumber, City, PostalCode, Region, Country, UsCitizen) VALUES
(13, 1, 'Fictional Avenue', '1234', 'New York', '10001', 'NY', 'us', 1);

INSERT INTO ClientAddress (ClientID, IsPrimary, Street, StreetNumber, City, PostalCode, Region, Country, UsCitizen) VALUES
(14, 1, 'Påhittvägen', '15', 'Halmstad', '302 50', 'Halland', 'sweden', 0);

INSERT INTO ClientAddress (ClientID, IsPrimary, Street, StreetNumber, City, PostalCode, Region, Country, UsCitizen) VALUES
(15, 1, 'Fantasigatan', '42', 'Halmstad', '302 44', 'Halland', 'sweden', 0),
(15, 0, 'Testengate', '12', 'Oslo', '0154', 'Oslo', 'norway', 0);

INSERT INTO ClientAddress (ClientID, IsPrimary, Street, StreetNumber, City, PostalCode, Region, Country, UsCitizen) VALUES
(16, 1, 'Virtuellagatan', '67', 'Göteborg', '411 37', 'Västra Götaland', 'sweden', 0);

-- ACCOUNTS (Klient konton. Påbörjar account no uppräkning från 123456001 för att simulera något så när lite riktiga konto nr)

ALTER TABLE Account AUTO_INCREMENT = 123456001;

INSERT INTO Account (Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status) VALUES
('8175-4', 'DBBASEHA', 'SE4581750000000123456001', 2, 0, 'checking', 'active');

INSERT INTO Account (Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status) VALUES
('8175-4', 'DBBASEHA', 'SE4581750000000123456002', 3, 0, 'checking', 'active'),
('8175-4', 'DBBASEHA', 'SE4581750000000123456003', 3, 0, 'savings', 'active');

INSERT INTO Account (Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status) VALUES
('8175-4', 'DBBASEHA', 'SE4581750000000123456004', 4, 0, 'checking', 'active');

INSERT INTO Account (Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status) VALUES
('8175-4', 'DBBASEHA', 'SE4581750000000123456005', 5, 0, 'business', 'active');

INSERT INTO Account (Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status) VALUES
('8175-4', 'DBBASEHA', 'SE4581750000000123456006', 8, 0, 'checking', 'active');

INSERT INTO Account (Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status) VALUES
('8175-4', 'DBBASEHA', 'SE4581750000000123456007', 10, 0, 'checking', 'active');

INSERT INTO Account (Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status) VALUES
('8175-4', 'DBBASEHA', 'SE4581750000000123456008', 11, 0, 'checking', 'active');

INSERT INTO Account (Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status) VALUES
('8175-4', 'DBBASEHA', 'SE4581750000000123456009', 14, 0, 'checking', 'active');

INSERT INTO Account (Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status) VALUES
('8175-4', 'DBBASEHA', 'SE4581750000000123456010', 16, 0, 'checking', 'frozen');

INSERT INTO Account (Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status) VALUES
('8175-4', 'DBBASEHA', 'SE4581750000000123456011', 6, 0, 'checking', 'pending');

INSERT INTO Account (Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status) VALUES
('8175-4', 'DBBASEHA', 'SE4581750000000123456012', 2, 0, 'savings', 'active');

INSERT INTO Account (Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status, Currency) VALUES
('8175-4', 'DBBASEHA', 'SE4581750000000123456013', 12, 0, 'checking', 'frozen', 'eur');

INSERT INTO Account (Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status, Currency) VALUES
('8175-4', 'DBBASEHA', 'SE4581750000000123456014', 13, 0, 'checking', 'closed', 'eur');


-- BLACKLIST ENTRIES (Intern svartlistning i banken)

INSERT INTO Blacklist (ClientID, Reason, Description, BlacklistedBy, LoginAllowed) VALUES
(12, 'kyc', 'Failed to provide valid identification documents after multiple requests. Unable to verify identity.', 2, 0);

INSERT INTO Blacklist (ClientID, Reason, Description, BlacklistedBy, LoginAllowed) VALUES
(13, 'aml', 'Suspicious transaction patterns detected. Multiple large cash deposits with no clear source. Account flagged for money laundering investigation.', 2, 1);

INSERT INTO Blacklist (ClientID, Reason, Description, BlacklistedBy, LoginAllowed) VALUES
(7, 'harassment', 'Repeated threatening behavior towards bank staff. Multiple complaints filed by employees at Gothenburg office.', 2, 1);

-- Triggers för databasen. Uppdaterar account balance för varje row som läggs till i transactions table. Ändrar flagga på Account om JointAccountHolder läggs till/tas bort

DELIMITER ||

-- trigger för transaktioner

CREATE TRIGGER after_transaction_insert
AFTER INSERT ON Transaction
FOR EACH ROW
BEGIN
  -- Uppdatera balance om ny rad skapas och om status är completed
  IF NEW.Status = 'completed' THEN
    UPDATE Account 
    SET Balance = Balance + NEW.Credit - NEW.Debit
    WHERE AccountNumber = NEW.AccountNumber;
  END IF;
END||

CREATE TRIGGER after_transaction_update
AFTER UPDATE ON Transaction
FOR EACH ROW
BEGIN
  -- Om status inte är completed och den nya statusen är completed, uppdatera Balance i Account table med tidigare balance + ny credit - ny debit 
  IF OLD.Status != 'completed' AND NEW.Status = 'completed' THEN
    UPDATE Account 
    SET Balance = Balance + NEW.Credit - NEW.Debit
    WHERE AccountNumber = NEW.AccountNumber;
  END IF;

END||

-- Trigger för medkontohavare

CREATE TRIGGER after_joint_holder_insert
AFTER INSERT ON JointAccountHolder
FOR EACH ROW
BEGIN
  -- Ändrar JointAccountHolder flaggan i accounts till 1 om en JointAccountHolder läggs till
  UPDATE Account 
  SET JointAccountHolder = 1 
  WHERE AccountNumber = NEW.AccountNumber;
END||

CREATE TRIGGER after_joint_holder_delete
AFTER DELETE ON JointAccountHolder
FOR EACH ROW
BEGIN
  DECLARE holder_count INT;
  
  -- Kontrollerar om det finns några JointAccountHolders kvar, annars ändra JointAccountHolder flaggan i account till 0
  SELECT COUNT(*) INTO holder_count 
  FROM JointAccountHolder 
  WHERE AccountNumber = OLD.AccountNumber;
  
  IF holder_count = 0 THEN
    UPDATE Account 
    SET JointAccountHolder = 0 
    WHERE AccountNumber = OLD.AccountNumber;
  END IF;
END$$

DELIMITER ;

-- JOINT ACCOUNT HOLDERS (Lägger till medkontohavare efter att triggern är skapad för JointAccountHolder)

INSERT INTO JointAccountHolder (AccountNumber, ClientID) VALUES
(123456006, 9);

INSERT INTO JointAccountHolder (AccountNumber, ClientID) VALUES
(123456003, 9);

INSERT INTO JointAccountHolder (AccountNumber, ClientID) VALUES
(123456009, 15);

INSERT INTO JointAccountHolder (AccountNumber, ClientID) VALUES
(123456012, 3),
(123456012, 4);

-- BANK TRANSACTIONS INITIAL FUNDING (Initial funding av klientkonton och master accounts. Klienter efter att master accounts har fått funding)

START TRANSACTION;

USE Bank;

-- 1. INITIAL FUNDING OF ACCOUNT 2 (External Transfer Account)
-- Totalt: 1 100 000 000 EUR (1 000 m till konto 1 för funding till master account. 100 m ligger kvar på external master account)
-- Har ingen matchande debit, tänkt som en extern funding av banken

INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(2, 'credit', 0.00, 1100000000.00, 'eur', 'completed', 'EXT-FUND-001', 'External funding - Initial capital injection', '2024-11-01 09:00:00');

-- 2. TRANSFER FROM ACCOUNT 2 TO ACCOUNT 1 (Master Account. Då funding av Master acc som alla transaktioner går genom)

-- debit från konto 2
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(2, 'debit', 1000000000.00, 0.00, 'eur', 'completed', 'TXN-001', 'Transfer to Master Account', '2024-11-01 09:15:00');

-- credit till konto 1
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(1, 'credit', 0.00, 1000000000.00, 'eur', 'completed', 'TXN-001', 'Initial capital deposit', '2024-11-01 09:15:00');

-- 3. CLIENT FUNDING (Populerar db med "initial funding" till klient konto transaktioner)

INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(2, 'debit', 3450.00, 0.00, 'eur', 'completed', 'TXN-002', 'Transfer to account 123456001', '2024-11-01 10:00:00'),
(123456001, 'credit', 0.00, 3450.00, 'eur', 'completed', 'TXN-002', 'Account opening deposit', '2024-11-01 10:00:00');

INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(2, 'debit', 15200.00, 0.00, 'eur', 'completed', 'TXN-003', 'Transfer to account 123456002', '2024-11-01 10:05:00'),
(123456002, 'credit', 0.00, 15200.00, 'eur', 'completed', 'TXN-003', 'Account opening deposit', '2024-11-01 10:05:00');

INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(2, 'debit', 18750.00, 0.00, 'eur', 'completed', 'TXN-004', 'Transfer to account 123456003', '2024-11-01 10:10:00'),
(123456003, 'credit', 0.00, 18750.00, 'eur', 'completed', 'TXN-004', 'Account opening deposit', '2024-11-01 10:10:00');

INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(2, 'debit', 42500.00, 0.00, 'eur', 'completed', 'TXN-005', 'Transfer to account 123456004', '2024-11-01 10:15:00'),
(123456004, 'credit', 0.00, 42500.00, 'eur', 'completed', 'TXN-005', 'Account opening deposit', '2024-11-01 10:15:00');

INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(2, 'debit', 50000.00, 0.00, 'eur', 'completed', 'TXN-006', 'Transfer to account 123456005', '2024-11-01 10:20:00'),
(123456005, 'credit', 0.00, 50000.00, 'eur', 'completed', 'TXN-006', 'Account opening deposit', '2024-11-01 10:20:00');

INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(2, 'debit', 4800.00, 0.00, 'eur', 'completed', 'TXN-007', 'Transfer to account 123456006', '2024-11-01 10:25:00'),
(123456006, 'credit', 0.00, 4800.00, 'eur', 'completed', 'TXN-007', 'Account opening deposit', '2024-11-01 10:25:00');

INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(2, 'debit', 2150.00, 0.00, 'eur', 'completed', 'TXN-008', 'Transfer to account 123456007', '2024-11-01 10:30:00'),
(123456007, 'credit', 0.00, 2150.00, 'eur', 'completed', 'TXN-008', 'Account opening deposit', '2024-11-01 10:30:00');

INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(2, 'debit', 12400.00, 0.00, 'eur', 'completed', 'TXN-009', 'Transfer to account 123456008', '2024-11-01 10:35:00'),
(123456008, 'credit', 0.00, 12400.00, 'eur', 'completed', 'TXN-009', 'Account opening deposit', '2024-11-01 10:35:00');

INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(2, 'debit', 3700.00, 0.00, 'eur', 'completed', 'TXN-010', 'Transfer to account 123456009', '2024-11-01 10:40:00'),
(123456009, 'credit', 0.00, 3700.00, 'eur', 'completed', 'TXN-010', 'Account opening deposit', '2024-11-01 10:40:00');

INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(2, 'debit', 1250.00, 0.00, 'eur', 'completed', 'TXN-011', 'Transfer to account 123456010', '2024-11-01 10:45:00'),
(123456010, 'credit', 0.00, 1250.00, 'eur', 'completed', 'TXN-011', 'Account opening deposit', '2024-11-01 10:45:00');

INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(2, 'debit', 35000.00, 0.00, 'eur', 'completed', 'TXN-013', 'Transfer to account 123456012', '2024-11-01 10:55:00'),
(123456012, 'credit', 0.00, 35000.00, 'eur', 'completed', 'TXN-013', 'Account opening deposit', '2024-11-01 10:55:00');

INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(2, 'debit', 1640.00, 0.00, 'eur', 'completed', 'TXN-037', 'Transfer to account 123456013', '2024-11-01 10:58:00'),
(123456013, 'credit', 0.00, 1640.00, 'eur', 'completed', 'TXN-037', 'Account opening deposit', '2024-11-01 10:58:00');


-- NORMAL TRANSACTIONS (Data för vanliga transaktioner som skett efter initial funding)

-- Transaktion TXN-014
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(123456001, 'debit', 250.00, 0.00, 'eur', 'completed', 'TXN-014', 'Transfer to Sofia Bergqvist', '2024-11-02 09:15:00'),
(1, 'credit', 0.00, 250.00, 'eur', 'completed', 'TXN-014', 'Transfer from Magnus Lindström', '2024-11-02 09:15:00'),
(1, 'debit', 250.00, 0.00, 'eur', 'completed', 'TXN-014', 'Transfer to Sofia Bergqvist', '2024-11-02 09:15:00'),
(123456002, 'credit', 0.00, 250.00, 'eur', 'completed', 'TXN-014', 'Transfer from Magnus Lindström', '2024-11-02 09:15:00'),
(123456001, 'fee', 1.00, 0.00, 'eur', 'completed', 'TXN-014', 'Transfer fee', '2024-11-02 09:15:00'),
(1, 'fee', 0.00, 1.00, 'eur', 'completed', 'TXN-014', 'Transfer fee income', '2024-11-02 09:15:00');

-- Transaktion TXN-015
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(123456003, 'debit', 500.00, 0.00, 'eur', 'completed', 'TXN-015', 'Transfer to Lars Andersson', '2024-11-02 10:30:00'),
(1, 'credit', 0.00, 500.00, 'eur', 'completed', 'TXN-015', 'Transfer from Sofia Bergqvist', '2024-11-02 10:30:00'),
(1, 'debit', 500.00, 0.00, 'eur', 'completed', 'TXN-015', 'Transfer to Lars Andersson', '2024-11-02 10:30:00'),
(123456004, 'credit', 0.00, 500.00, 'eur', 'completed', 'TXN-015', 'Transfer from Sofia Bergqvist', '2024-11-02 10:30:00'),
(123456003, 'fee', 1.00, 0.00, 'eur', 'completed', 'TXN-015', 'Transfer fee', '2024-11-02 10:30:00'),
(1, 'fee', 0.00, 1.00, 'eur', 'completed', 'TXN-015', 'Transfer fee income', '2024-11-02 10:30:00');

-- Transaktion  TXN-016
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(123456005, 'debit', 2000.00, 0.00, 'eur', 'completed', 'TXN-016', 'Payment to Viktor & Petra', '2024-11-02 14:20:00'),
(1, 'credit', 0.00, 2000.00, 'eur', 'completed', 'TXN-016', 'Transfer from Tech Solutions AB', '2024-11-02 14:20:00'),
(1, 'debit', 2000.00, 0.00, 'eur', 'completed', 'TXN-016', 'Transfer to Viktor & Petra', '2024-11-02 14:20:00'),
(123456006, 'credit', 0.00, 2000.00, 'eur', 'completed', 'TXN-016', 'Payment from Tech Solutions AB', '2024-11-02 14:20:00'),
(123456005, 'fee', 1.00, 0.00, 'eur', 'completed', 'TXN-016', 'Transfer fee', '2024-11-02 14:20:00'),
(1, 'fee', 0.00, 1.00, 'eur', 'completed', 'TXN-016', 'Transfer fee income', '2024-11-02 14:20:00');

-- Transaktion TXN-017
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(123456007, 'debit', 150.00, 0.00, 'eur', 'completed', 'TXN-017', 'Transfer to external bank', '2024-11-02 16:45:00'),
(1, 'credit', 0.00, 150.00, 'eur', 'completed', 'TXN-017', 'Transfer from Gustav Larsson', '2024-11-02 16:45:00'),
(1, 'debit', 150.00, 0.00, 'eur', 'completed', 'TXN-017', 'Transfer to outgoing account', '2024-11-02 16:45:00'),
(2, 'credit', 0.00, 150.00, 'eur', 'completed', 'TXN-017', 'Outgoing transfer to external bank', '2024-11-02 16:45:00'),
(123456007, 'fee', 1.00, 0.00, 'eur', 'completed', 'TXN-017', 'Transfer fee', '2024-11-02 16:45:00'),
(1, 'fee', 0.00, 1.00, 'eur', 'completed', 'TXN-017', 'Transfer fee income', '2024-11-02 16:45:00');

-- Transaktion TXN-018
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(123456008, 'debit', 800.00, 0.00, 'eur', 'completed', 'TXN-018', 'Transfer to Helena & Daniel', '2024-11-03 11:00:00'),
(1, 'credit', 0.00, 800.00, 'eur', 'completed', 'TXN-018', 'Transfer from Karin Persson', '2024-11-03 11:00:00'),
(1, 'debit', 800.00, 0.00, 'eur', 'completed', 'TXN-018', 'Transfer to Helena & Daniel', '2024-11-03 11:00:00'),
(123456009, 'credit', 0.00, 800.00, 'eur', 'completed', 'TXN-018', 'Transfer from Karin Persson', '2024-11-03 11:00:00'),
(123456008, 'fee', 1.00, 0.00, 'eur', 'completed', 'TXN-018', 'Transfer fee', '2024-11-03 11:00:00'),
(1, 'fee', 0.00, 1.00, 'eur', 'completed', 'TXN-018', 'Transfer fee income', '2024-11-03 11:00:00');

-- Transaktion TXN-019
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(123456006, 'debit', 350.00, 0.00, 'eur', 'completed', 'TXN-019', 'Transfer to Magnus Lindström', '2024-11-04 13:30:00'),
(1, 'credit', 0.00, 350.00, 'eur', 'completed', 'TXN-019', 'Transfer from Viktor & Petra', '2024-11-04 13:30:00'),
(1, 'debit', 350.00, 0.00, 'eur', 'completed', 'TXN-019', 'Transfer to Magnus Lindström', '2024-11-04 13:30:00'),
(123456001, 'credit', 0.00, 350.00, 'eur', 'completed', 'TXN-019', 'Transfer from Viktor & Petra', '2024-11-04 13:30:00'),
(123456006, 'fee', 1.00, 0.00, 'eur', 'completed', 'TXN-019', 'Transfer fee', '2024-11-04 13:30:00'),
(1, 'fee', 0.00, 1.00, 'eur', 'completed', 'TXN-019', 'Transfer fee income', '2024-11-04 13:30:00');

-- Transaktion TXN-020
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(123456004, 'debit', 1500.00, 0.00, 'eur', 'completed', 'TXN-020', 'Payment to Tech Solutions AB', '2024-11-05 09:45:00'),
(1, 'credit', 0.00, 1500.00, 'eur', 'completed', 'TXN-020', 'Transfer from Lars Andersson', '2024-11-05 09:45:00'),
(1, 'debit', 1500.00, 0.00, 'eur', 'completed', 'TXN-020', 'Transfer to Tech Solutions AB', '2024-11-05 09:45:00'),
(123456005, 'credit', 0.00, 1500.00, 'eur', 'completed', 'TXN-020', 'Payment from Lars Andersson', '2024-11-05 09:45:00'),
(123456004, 'fee', 1.00, 0.00, 'eur', 'completed', 'TXN-020', 'Transfer fee', '2024-11-05 09:45:00'),
(1, 'fee', 0.00, 1.00, 'eur', 'completed', 'TXN-020', 'Transfer fee income', '2024-11-05 09:45:00');

-- Transaktion TXN-021
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(123456012, 'debit', 5000.00, 0.00, 'eur', 'completed', 'TXN-021', 'Transfer to external bank', '2024-11-05 15:20:00'),
(1, 'credit', 0.00, 5000.00, 'eur', 'completed', 'TXN-021', 'Transfer from joint savings account', '2024-11-05 15:20:00'),
(1, 'debit', 5000.00, 0.00, 'eur', 'completed', 'TXN-021', 'Transfer to outgoing account', '2024-11-05 15:20:00'),
(2, 'credit', 0.00, 5000.00, 'eur', 'completed', 'TXN-021', 'Outgoing transfer to external bank', '2024-11-05 15:20:00'),
(123456012, 'fee', 1.00, 0.00, 'eur', 'completed', 'TXN-021', 'Transfer fee', '2024-11-05 15:20:00'),
(1, 'fee', 0.00, 1.00, 'eur', 'completed', 'TXN-021', 'Transfer fee income', '2024-11-05 15:20:00');

-- Transaktion TXN-022
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(123456002, 'debit', 120.00, 0.00, 'eur', 'completed', 'TXN-022', 'Transfer to Gustav Larsson', '2024-11-06 10:15:00'),
(1, 'credit', 0.00, 120.00, 'eur', 'completed', 'TXN-022', 'Transfer from Sofia Bergqvist', '2024-11-06 10:15:00'),
(1, 'debit', 120.00, 0.00, 'eur', 'completed', 'TXN-022', 'Transfer to Gustav Larsson', '2024-11-06 10:15:00'),
(123456007, 'credit', 0.00, 120.00, 'eur', 'completed', 'TXN-022', 'Transfer from Sofia Bergqvist', '2024-11-06 10:15:00'),
(123456002, 'fee', 1.00, 0.00, 'eur', 'completed', 'TXN-022', 'Transfer fee', '2024-11-06 10:15:00'),
(1, 'fee', 0.00, 1.00, 'eur', 'completed', 'TXN-022', 'Transfer fee income', '2024-11-06 10:15:00');

-- Transaktion TXN-023
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(123456009, 'debit', 600.00, 0.00, 'eur', 'completed', 'TXN-023', 'Transfer to Karin Persson', '2024-11-07 14:00:00'),
(1, 'credit', 0.00, 600.00, 'eur', 'completed', 'TXN-023', 'Transfer from Helena & Daniel', '2024-11-07 14:00:00'),
(1, 'debit', 600.00, 0.00, 'eur', 'completed', 'TXN-023', 'Transfer to Karin Persson', '2024-11-07 14:00:00'),
(123456008, 'credit', 0.00, 600.00, 'eur', 'completed', 'TXN-023', 'Transfer from Helena & Daniel', '2024-11-07 14:00:00'),
(123456009, 'fee', 1.00, 0.00, 'eur', 'completed', 'TXN-023', 'Transfer fee', '2024-11-07 14:00:00'),
(1, 'fee', 0.00, 1.00, 'eur', 'completed', 'TXN-023', 'Transfer fee income', '2024-11-07 14:00:00');

-- Transaktion TXN-024
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(123456001, 'debit', 300.00, 0.00, 'eur', 'completed', 'TXN-024', 'Transfer to external bank', '2024-11-08 11:30:00'),
(1, 'credit', 0.00, 300.00, 'eur', 'completed', 'TXN-024', 'Transfer from Magnus Lindström', '2024-11-08 11:30:00'),
(1, 'debit', 300.00, 0.00, 'eur', 'completed', 'TXN-024', 'Transfer to outgoing account', '2024-11-08 11:30:00'),
(2, 'credit', 0.00, 300.00, 'eur', 'completed', 'TXN-024', 'Outgoing transfer to external bank', '2024-11-08 11:30:00'),
(123456001, 'fee', 1.00, 0.00, 'eur', 'completed', 'TXN-024', 'Transfer fee', '2024-11-08 11:30:00'),
(1, 'fee', 0.00, 1.00, 'eur', 'completed', 'TXN-024', 'Transfer fee income', '2024-11-08 11:30:00');

-- Transaktion TXN-025
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(123456005, 'debit', 3500.00, 0.00, 'eur', 'completed', 'TXN-025', 'Payment to Lars Andersson', '2024-11-08 16:00:00'),
(1, 'credit', 0.00, 3500.00, 'eur', 'completed', 'TXN-025', 'Transfer from Tech Solutions AB', '2024-11-08 16:00:00'),
(1, 'debit', 3500.00, 0.00, 'eur', 'completed', 'TXN-025', 'Transfer to Lars Andersson', '2024-11-08 16:00:00'),
(123456004, 'credit', 0.00, 3500.00, 'eur', 'completed', 'TXN-025', 'Payment from Tech Solutions AB', '2024-11-08 16:00:00'),
(123456005, 'fee', 1.00, 0.00, 'eur', 'completed', 'TXN-025', 'Transfer fee', '2024-11-08 16:00:00'),
(1, 'fee', 0.00, 1.00, 'eur', 'completed', 'TXN-025', 'Transfer fee income', '2024-11-08 16:00:00');

-- Transaktion TXN-026
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(123456007, 'debit', 200.00, 0.00, 'eur', 'pending', 'TXN-026', 'Transfer to Sofia Bergqvist', '2024-11-09 09:00:00'),
(1, 'credit', 0.00, 200.00, 'eur', 'pending', 'TXN-026', 'Transfer from Gustav Larsson', '2024-11-09 09:00:00'),
(1, 'debit', 200.00, 0.00, 'eur', 'pending', 'TXN-026', 'Transfer to Sofia Bergqvist', '2024-11-09 09:00:00'),
(123456002, 'credit', 0.00, 200.00, 'eur', 'pending', 'TXN-026', 'Transfer from Gustav Larsson', '2024-11-09 09:00:00'),
(123456007, 'fee', 1.00, 0.00, 'eur', 'pending', 'TXN-026', 'Transfer fee', '2024-11-09 09:00:00'),
(1, 'fee', 0.00, 1.00, 'eur', 'pending', 'TXN-026', 'Transfer fee income', '2024-11-09 09:00:00');

-- Transaktion TXN-027
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(123456008, 'debit', 1000.00, 0.00, 'eur', 'pending', 'TXN-027', 'Transfer to external bank', '2024-11-09 12:30:00'),
(1, 'credit', 0.00, 1000.00, 'eur', 'pending', 'TXN-027', 'Transfer from Karin Persson', '2024-11-09 12:30:00'),
(1, 'debit', 1000.00, 0.00, 'eur', 'pending', 'TXN-027', 'Transfer to outgoing account', '2024-11-09 12:30:00'),
(2, 'credit', 0.00, 1000.00, 'eur', 'pending', 'TXN-027', 'Outgoing transfer to external bank', '2024-11-09 12:30:00'),
(123456008, 'fee', 1.00, 0.00, 'eur', 'pending', 'TXN-027', 'Transfer fee', '2024-11-09 12:30:00'),
(1, 'fee', 0.00, 1.00, 'eur', 'pending', 'TXN-027', 'Transfer fee income', '2024-11-09 12:30:00');

-- Transaktion TXN-028
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(123456006, 'debit', 450.00, 0.00, 'eur', 'pending', 'TXN-028', 'Transfer to Helena & Daniel', '2024-11-10 08:45:00'),
(1, 'credit', 0.00, 450.00, 'eur', 'pending', 'TXN-028', 'Transfer from Viktor & Petra', '2024-11-10 08:45:00'),
(1, 'debit', 450.00, 0.00, 'eur', 'pending', 'TXN-028', 'Transfer to Helena & Daniel', '2024-11-10 08:45:00'),
(123456009, 'credit', 0.00, 450.00, 'eur', 'pending', 'TXN-028', 'Transfer from Viktor & Petra', '2024-11-10 08:45:00'),
(123456006, 'fee', 1.00, 0.00, 'eur', 'pending', 'TXN-028', 'Transfer fee', '2024-11-10 08:45:00'),
(1, 'fee', 0.00, 1.00, 'eur', 'pending', 'TXN-028', 'Transfer fee income', '2024-11-10 08:45:00');

-- Transaktion TXN-029
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(123456004, 'debit', 2000.00, 0.00, 'eur', 'pending', 'TXN-029', 'Transfer to joint savings account', '2024-11-10 14:00:00'),
(1, 'credit', 0.00, 2000.00, 'eur', 'pending', 'TXN-029', 'Transfer from Lars Andersson', '2024-11-10 14:00:00'),
(1, 'debit', 2000.00, 0.00, 'eur', 'pending', 'TXN-029', 'Transfer to joint savings account', '2024-11-10 14:00:00'),
(123456012, 'credit', 0.00, 2000.00, 'eur', 'pending', 'TXN-029', 'Transfer from Lars Andersson', '2024-11-10 14:00:00'),
(123456004, 'fee', 1.00, 0.00, 'eur', 'pending', 'TXN-029', 'Transfer fee', '2024-11-10 14:00:00'),
(1, 'fee', 0.00, 1.00, 'eur', 'pending', 'TXN-029', 'Transfer fee income', '2024-11-10 14:00:00');

-- Transaktion TXN-030
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(123456003, 'debit', 750.00, 0.00, 'eur', 'pending', 'TXN-030', 'Transfer to Magnus Lindström', '2024-11-10 16:30:00'),
(1, 'credit', 0.00, 750.00, 'eur', 'pending', 'TXN-030', 'Transfer from Sofia Bergqvist', '2024-11-10 16:30:00'),
(1, 'debit', 750.00, 0.00, 'eur', 'pending', 'TXN-030', 'Transfer to Magnus Lindström', '2024-11-10 16:30:00'),
(123456001, 'credit', 0.00, 750.00, 'eur', 'pending', 'TXN-030', 'Transfer from Sofia Bergqvist', '2024-11-10 16:30:00'),
(123456003, 'fee', 1.00, 0.00, 'eur', 'pending', 'TXN-030', 'Transfer fee', '2024-11-10 16:30:00'),
(1, 'fee', 0.00, 1.00, 'eur', 'pending', 'TXN-030', 'Transfer fee income', '2024-11-10 16:30:00');

-- Reference: TXN-031
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(123456001, 'debit', 5000.00, 0.00, 'eur', 'failed', 'TXN-031', 'Transfer to Gustav Larsson - FAILED', '2024-11-09 15:00:00'),
(1, 'credit', 0.00, 5000.00, 'eur', 'failed', 'TXN-031', 'Transfer from Magnus Lindström - FAILED', '2024-11-09 15:00:00'),
(1, 'debit', 5000.00, 0.00, 'eur', 'failed', 'TXN-031', 'Transfer to Gustav Larsson - FAILED', '2024-11-09 15:00:00'),
(123456007, 'credit', 0.00, 5000.00, 'eur', 'failed', 'TXN-031', 'Transfer from Magnus Lindström - FAILED', '2024-11-09 15:00:00');

-- Reference: TXN-032
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description, TransactionDate) VALUES
(123456006, 'debit', 10000.00, 0.00, 'eur', 'failed', 'TXN-032', 'Transfer to external bank - FAILED', '2024-11-10 10:00:00'),
(1, 'credit', 0.00, 10000.00, 'eur', 'failed', 'TXN-032', 'Transfer from Viktor & Petra - FAILED', '2024-11-10 10:00:00'),
(1, 'debit', 10000.00, 0.00, 'eur', 'failed', 'TXN-032', 'Transfer to outgoing account - FAILED', '2024-11-10 10:00:00'),
(2, 'credit', 0.00, 10000.00, 'eur', 'failed', 'TXN-032', 'Outgoing transfer to external bank - FAILED', '2024-11-10 10:00:00');

-- Reference: TXN-033
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description) VALUES
(123456008, 'debit', 23.00, 0.00, 'eur', 'completed', 'TXN-033', 'Transfer to Tech Solutions'),
(1, 'credit', 0.00, 23.00, 'eur', 'completed', 'TXN-033', 'Transfer from Karin Persson'),
(1, 'debit', 23.00, 0.00, 'eur', 'completed', 'TXN-033', 'Transfer to Tech Solutions AB'),
(123456005, 'credit', 0.00, 23.00, 'eur', 'completed', 'TXN-033', 'Transfer from Sofia Bergqvist'),
(123456008, 'fee', 1.00, 0.00, 'eur', 'completed', 'TXN-033', 'Transfer fee'),
(1, 'fee', 0.00, 1.00, 'eur', 'completed', 'TXN-033', 'Transfer fee income');

-- Reference: TXN-034
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description) VALUES
(123456008, 'debit', 87.00, 0.00, 'eur', 'completed', 'TXN-034', 'Transfer to Tech Solutions'),
(1, 'credit', 0.00, 87.00, 'eur', 'completed', 'TXN-034', 'Transfer from Karin Persson'),
(1, 'debit', 87.00, 0.00, 'eur', 'completed', 'TXN-034', 'Transfer to Tech Solutions AB'),
(123456005, 'credit', 0.00, 87.00, 'eur', 'completed', 'TXN-034', 'Transfer from Sofia Bergqvist'),
(123456008, 'fee', 1.00, 0.00, 'eur', 'completed', 'TXN-034', 'Transfer fee'),
(1, 'fee', 0.00, 1.00, 'eur', 'completed', 'TXN-034', 'Transfer fee income');

-- Reference: TXN-035
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description) VALUES
(123456008, 'debit', 2.30, 0.00, 'eur', 'completed', 'TXN-035', 'Transfer to Tech Solutions'),
(1, 'credit', 0.00, 2.30, 'eur', 'completed', 'TXN-035', 'Transfer from Karin Persson'),
(1, 'debit', 2.30, 0.00, 'eur', 'completed', 'TXN-035', 'Transfer to Tech Solutions AB'),
(123456005, 'credit', 0.00, 2.30, 'eur', 'completed', 'TXN-035', 'Transfer from Sofia Bergqvist'),
(123456008, 'fee', 1.00, 0.00, 'eur', 'completed', 'TXN-035', 'Transfer fee'),
(1, 'fee', 0.00, 1.00, 'eur', 'completed', 'TXN-035', 'Transfer fee income');

-- Reference: TXN-036
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description) VALUES
(123456008, 'debit', 134.30, 0.00, 'eur', 'completed', 'TXN-036', 'Transfer to Tech Solutions'),
(1, 'credit', 0.00, 134.30, 'eur', 'completed', 'TXN-036', 'Transfer from Karin Persson'),
(1, 'debit', 134.30, 0.00, 'eur', 'completed', 'TXN-036', 'Transfer to Tech Solutions AB'),
(123456005, 'credit', 0.00, 134.30, 'eur', 'completed', 'TXN-036', 'Transfer from Sofia Bergqvist'),
(123456008, 'fee', 1.00, 0.00, 'eur', 'completed', 'TXN-036', 'Transfer fee'),
(1, 'fee', 0.00, 1.00, 'eur', 'completed', 'TXN-036', 'Transfer fee income');

-- Reference: TXN-039
INSERT INTO Transaction (AccountNumber, TransactionType, Debit, Credit, Currency, Status, Reference, Description) VALUES
(123456008, 'debit', 134.30, 0.00, 'eur', 'failed', 'TXN-038', 'Transfer to Tech Solutions'),
(1, 'credit', 0.00, 134.30, 'eur', 'failed', 'TXN-038', 'Transfer from Karin Persson'),
(1, 'debit', 134.30, 0.00, 'eur', 'failed', 'TXN-038', 'Transfer to Tech Solutions AB'),
(123456005, 'credit', 0.00, 134.30, 'eur', 'failed', 'TXN-038', 'Transfer from Sofia Bergqvist');

