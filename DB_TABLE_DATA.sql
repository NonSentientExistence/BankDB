
-- BANK TEST DATA

-- START TRANSACTION

START TRANSACTION;

USE Bank;

-- 1. EMPLOYEES


INSERT INTO Employee (FirstName, Email, Username, Password, Role, Office) VALUES
('Anna', 'anna.karlsson@dbbank.testse', 'akarlsson', 'hashed_password_1', 'admin', 'stockholm'),
('Erik', 'erik.svensson@dbbank.testse', 'esvensson', 'hashed_password_2', 'manager', 'stockholm'),
('Lisa', 'lisa.andersson@dbbank.testse', 'landersson', 'hashed_password_3', 'advisor', 'halmstad'),
('Johan', 'johan.nilsson@dbbank.testse', 'jnilsson', 'hashed_password_4', 'advisor', 'gothenburg'),
('Maria', 'maria.berg@dbbank.testse', 'mberg', 'hashed_password_5', 'teller', 'malmo');

-- 2. BANK CLIENT (Klient 1 avser banken)

INSERT INTO Client (ClientID, NationalIdentificationNumber, FirstName, LastName, Email, PhoneNumber, Office, ServiceLevel, IsBusinessClient, CurrentStatus, KYC, ResponsibleAdvisor, Blacklist) VALUES
(1, 'BANK-000000001', 'DB', 'Bank', 'bank@dbbank.testse', '099-123-45-67', 'stockholm', 'regular', 1, 'active', 'approved', NULL, 0);

-- 3. BANK ADDRESS

INSERT INTO ClientAddress (ClientID, IsPrimary, Street, StreetNumber, City, PostalCode, Region, Country, UsCitizen) VALUES
(1, 1, 'Testbankvägen', '1', 'Stockholm', '111 22', 'Stockholm', 'sweden', 0);


-- 4. BANK ACCOUNTS (Konto 1 avser ett master konto som ägs av banken, Konto 2 avser ett liknande master konto för inkommande transaktioner från andra banker)

-- Master Account
INSERT INTO Account (AccountNumber, Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status, Currency, Balance) VALUES
(1, '8175-4', 'DBBASEHA', 'SE4581750000000000000001', 1, 0, 'checking', 'active', 'eur', 0.00);

-- External Transfer Account
INSERT INTO Account (AccountNumber, Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status, Currency, Balance) VALUES
(2, '8175-4', 'DBBASEHA', 'SE4581750000000000000002', 1, 0, 'checking', 'active', 'eur', 0.00);

-- ============================================
-- 5. REGULAR CLIENTS (15 clients with variety)
-- ============================================

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


-- 6. CLIENT ADDRESSES

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

-- 7. ACCOUNTS (Påbörjar account no uppräkning från 123456001 för att simulera något så när lite riktiga konto nr)

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
('8175-4', 'DBBASEHA', 'SE4581750000000123456006', 8, 1, 'checking', 'active');

INSERT INTO Account (Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status) VALUES
('8175-4', 'DBBASEHA', 'SE4581750000000123456007', 10, 0, 'checking', 'active');

INSERT INTO Account (Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status) VALUES
('8175-4', 'DBBASEHA', 'SE4581750000000123456008', 11, 0, 'checking', 'active');

INSERT INTO Account (Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status) VALUES
('8175-4', 'DBBASEHA', 'SE4581750000000123456009', 14, 1, 'checking', 'active');

INSERT INTO Account (Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status) VALUES
('8175-4', 'DBBASEHA', 'SE4581750000000123456010', 16, 0, 'checking', 'frozen');

INSERT INTO Account (Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status) VALUES
('8175-4', 'DBBASEHA', 'SE4581750000000123456011', 6, 0, 'checking', 'pending');

INSERT INTO Account (Routing, SWIFT, IBAN, AccountHolder, JointAccountHolder, AccountType, Status) VALUES
('8175-4', 'DBBASEHA', 'SE4581750000000123456012', 2, 1, 'savings', 'active');

-- 8. JOINT ACCOUNT HOLDERS (Many-to-Many) (Med kontohavare på konton)

INSERT INTO JointAccountHolder (AccountNumber, ClientID) VALUES
(123456006, 9);

INSERT INTO JointAccountHolder (AccountNumber, ClientID) VALUES
(123456003, 9);

INSERT INTO JointAccountHolder (AccountNumber, ClientID) VALUES
(123456009, 15);

INSERT INTO JointAccountHolder (AccountNumber, ClientID) VALUES
(123456012, 3),
(123456012, 4);


-- 9. BLACKLIST ENTRIES (Intern svartlistning i banken)

INSERT INTO Blacklist (ClientID, Reason, Description, BlacklistedBy, LoginAllowed) VALUES
(12, 'kyc', 'Failed to provide valid identification documents after multiple requests. Unable to verify identity.', 2, 0);

INSERT INTO Blacklist (ClientID, Reason, Description, BlacklistedBy, LoginAllowed) VALUES
(13, 'aml', 'Suspicious transaction patterns detected. Multiple large cash deposits with no clear source. Account flagged for money laundering investigation.', 2, 1);

INSERT INTO Blacklist (ClientID, Reason, Description, BlacklistedBy, LoginAllowed) VALUES
(7, 'harassment', 'Repeated threatening behavior towards bank staff. Multiple complaints filed by employees at Gothenburg office.', 2, 1);
