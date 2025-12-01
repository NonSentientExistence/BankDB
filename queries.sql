-- Då jag hade mycket av kraven med i mina views så har jag lagt till dessa som queries här också

-- 3 tabell sökning som ger advisors belägna i stockholm eller halmstad som har kund med över 10 000 på ett konto 

SELECT Concat(c.FirstName,' ', c.LastName) as AccountHolderName, 
  c.ResponsibleAdvisor, 
  a.AccountNumber, 
  a.Balance, 
  e.FirstName as AdvisorFirstName,
  e.Office
FROM Client as c
LEFT JOIN Account as a on c.ClientID = a.AccountHolder
LEFT JOIN Employee as e on c.ResponsibleAdvisor = e.EmployeeID
WHERE (e.Office = 'halmstad' OR e.Office = 'stockholm')
AND a.AccountNumber IS NOT NULL
AND a.Balance > 10000
ORDER BY a.Balance DESC;


-- Query som bara visar saldo på alla konton över 0 och inte är något av master accounts
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

-- Query som bara visar svartlistade klienter med ett positivt saldo på kontot och sorterar efter saldo 
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

-- Query där man ser konton som inte har en dedikerad advisor och ett saldo över 5000
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

-- Query där man ser advisors med mer än en klient tilldelad. Bra för att se vilka advisors som flertalet klienter och ev "presterar bäst"
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

-- Query där man får en flagga om det är ett joint account samt antalet medkontohavare. Sorterat på antalet medkontohavare primärt, saldo sekundärt. Utan master accounts
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

-- Query som visar alla kunder som inte har ett sparkonto + en count på hur många konton de har. Bra för kampanj att få kunder att öppna sparkonto, därför är kontakt info inkluderat
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