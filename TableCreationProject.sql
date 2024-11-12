-- Create the Project schema
CREATE SCHEMA Project;
USE Project;

-- Table: GameArea
CREATE TABLE GameArea (
    AreaID VARCHAR(45) PRIMARY KEY,  -- Primary key for GameArea
    AreaName VARCHAR(45),  -- Name of the area in the casino
    CurrencyType VARCHAR(45)  -- Type of currency taken in the game area
);

-- Table: Cards
CREATE TABLE Cards (
    CardID INT PRIMARY KEY AUTO_INCREMENT,  -- Unique ID of the casino card
    CreditCard_FirstName VARCHAR(45),  -- First name on the credit card
    CreditCard_LastName VARCHAR(45),  -- Last name on the credit card
    CreditCard_Number VARCHAR(16),  -- Credit card number
    CreditCard_CVS CHAR(3)  -- Credit card security code
);

-- Table: Wallet
CREATE TABLE Wallet (
    WalletID INT PRIMARY KEY AUTO_INCREMENT,  -- Unique ID for wallet
    ChipValue DECIMAL(10,2),  -- Amount of money the person has in casino credit (counted in USD)
    CardID INT,  -- Users can have a casino card that stores credit card info.
    FOREIGN KEY (CardID) REFERENCES Cards(CardID)  -- Foreign key for CardID
);

-- Table: Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,  -- Changed to INT and auto-increment for primary key
    SSN CHAR(9) UNIQUE,  -- SSN of the employee
    FirstName VARCHAR(45),  -- First name of the employee
    MiddleName VARCHAR(45),  -- Middle name of the employee
    LastName VARCHAR(45),  -- Last name of the employee
    StreetNumber VARCHAR(45),  -- Street number of the employee
    StreetName VARCHAR(45),  -- Street name of the employee
    City VARCHAR(45),  -- City of the employee
    State CHAR(2),  -- State of the employee
    Postal CHAR(5),  -- Postal code of the employee
    BirthDate DATE,  -- Birth date of the employee
    AreaID VARCHAR(45),  -- Area the employee works in, references GameArea.AreaID
    FOREIGN KEY (AreaID) REFERENCES GameArea(AreaID)
);

-- Table: Games
CREATE TABLE Games (
    GameID INT PRIMARY KEY AUTO_INCREMENT,  -- Primary key, each game is assigned unique ID
    GameName VARCHAR(45),  -- Name for the casino game
    AreaID VARCHAR(45),  -- References GameArea.AreaID to determine which section of the casino the game is in
    MinBet INT,  -- Records the minimum bet of the game
    MaxBet INT,  -- Records the maximum bet of the game
    MoneyIn DECIMAL(10,2),  -- Records total money in, references total Winnings in PlayedGames table
    MoneyOut DECIMAL(10,2),  -- Records total money out, references total Losings in PlayedGames table
    FOREIGN KEY (AreaID) REFERENCES GameArea(AreaID)
);

-- Table: Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,  -- Primary key for customer
    SSN CHAR(9) UNIQUE,  -- Social security number of the customer
    FirstName VARCHAR(45),  -- First name of the customer
    MiddleName VARCHAR(45),  -- Middle name of the customer
    LastName VARCHAR(45),  -- Last name of the customer
    PhoneNumber VARCHAR(15), -- Phone number of the customer
    StreetNumber VARCHAR(45),  -- Street number of the customer
    StreetName VARCHAR(45),  -- Street name of the customer
    City VARCHAR(45),  -- City of the customer
    State CHAR(2),  -- State of the customer
    Postal CHAR(5),  -- Postal code of the customer
    BirthDate DATE,  -- Birth date of the customer
    WalletID INT UNIQUE,  -- References Wallet.WalletID
    Banned BOOLEAN,  -- True if the customer is banned
    FOREIGN KEY (WalletID) REFERENCES Wallet(WalletID)
);

-- Table: PlayedGames
CREATE TABLE PlayedGames (
    PlayedGameID INT PRIMARY KEY AUTO_INCREMENT,  -- Unique ID for each played game
    GameID INT,  -- References Games.GameID to know which game was played
    GameDate DATE,  -- Date the game was played
    CustomerID INT,  -- References Customers.CustomerID
    Bet INT,  -- Bet made by the customer
    Winnings INT,  -- Amount won (could be null)
    Losings INT,  -- Amount lost (could be null)
    FOREIGN KEY (GameID) REFERENCES Games(GameID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Table: Support_Tickets
CREATE TABLE Support_Tickets (
    TicketID INT PRIMARY KEY AUTO_INCREMENT,  -- Unique ID of the support ticket
    CustomerID INT,  -- References Customers.CustomerID
    Subject VARCHAR(45),  -- Type of complaint (e.g., 5 types)
    Text TEXT,  -- Text of the complaint
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Table: BannedList
CREATE TABLE BannedList (
    CustomerID INT PRIMARY KEY,  -- References Customers.CustomerID
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);



