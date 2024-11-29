-- Insert into Servers (for the online game areas)
INSERT INTO Servers (Capacity, CurrentPeople, CostPerMonth)
VALUES
(100, 20, 250),
(200, 50, 300),
(150, 30, 275);

-- Insert into GameArea (5 physical areas without servers, 3 online areas with servers)
INSERT INTO GameArea (AreaID, AreaName, CurrencyType, ServerID)
VALUES
('GA001', 'Poker Room', 'USD', NULL),
('GA002', 'Blackjack Area', 'USD', NULL),
('GA003', 'Roulette Table', 'USD', NULL),
('GA004', 'VIP Room', 'USD', NULL),
('GA005', 'High Roller Zone', 'USD', NULL),
('GA006', 'Online Poker', 'USD', 1),
('GA007', 'Online Blackjack', 'USD', 2),
('GA008', 'Online Roulette', 'USD', 3);

-- Insert into Wallet (30 wallets, 1 for each customer)
INSERT INTO Wallet (WalletID, Balance, BankWireNumber, CryptoWalletAddress)
VALUES
(1, 1000.00, 123456, '1A1zP1eP5QGefi2DMPTfTL5tQb8xwZZaPb'),
(2, 1500.00, 654321, '3C1zP1eP5QGefi2DMPTfTL5tQb8xwZZaXy'),
(3, 1200.00, 234567, '1B2zP1eP5QGefi2DMPTfTL5tQb8xwZZbCd'),
(4, 1800.00, 765432, '2D3zP1eP5QGefi2DMPTfTL5tQb8xwZZdEf'),
(5, 950.00, 345678, '4G5zP1eP5QGefi2DMPTfTL5tQb8xwZZgHi'),
(6, 1100.00, 876543, '5H6zP1eP5QGefi2DMPTfTL5tQb8xwZZiJk'),
(7, 100.00, 123123, '6J7zP1eP5QGefi2DMPTfTL5tQb8xwZZjKl'),
(8, 2000.00, 987654, '7K8zP1eP5QGefi2DMPTfTL5tQb8xwZZkLm'),
(9, 1400.00, 432987, '8L9zP1eP5QGefi2DMPTfTL5tQb8xwZZlMn'),
(10, 2200.00, 654321, '9M0zP1eP5QGefi2DMPTfTL5tQb8xwZZmNp'),
(11, 900.00, 567890, '0N1zP1eP5QGefi2DMPTfTL5tQb8xwZZnOp'),
(12, 1300.00, 876321, '1O2zP1eP5QGefi2DMPTfTL5tQb8xwZZoPq'),
(13, 1100.00, 132456, '2P3zP1eP5QGefi2DMPTfTL5tQb8xwZZpQr'),
(14, 1700.00, 654987, '3Q4zP1eP5QGefi2DMPTfTL5tQb8xwZZqRs'),
(15, 1150.00, 987321, '4R5zP1eP5QGefi2DMPTfTL5tQb8xwZZrSt'),
(16, 800.00, 234567, '5S6zP1eP5QGefi2DMPTfTL5tQb8xwZZsTu'),
(17, 900.00, 321987, '6T7zP1eP5QGefi2DMPTfTL5tQb8xwZZtUv'),
(18, 200.00, 432198, '7U8zP1eP5QGefi2DMPTfTL5tQb8xwZZuVw'),
(19, 850.00, 543210, '8V9zP1eP5QGefi2DMPTfTL5tQb8xwZZvWx'),
(20, 1000.00, 654321, '9W0zP1eP5QGefi2DMPTfTL5tQb8xwZZwXy'),
(21, 1600.00, 987123, '0X1zP1eP5QGefi2DMPTfTL5tQb8xwZZxYz'),
(22, 1400.00, 321654, '1Y2zP1eP5QGefi2DMPTfTL5tQb8xwZZyZa'),
(23, 1750.00, 654123, '2Z3zP1eP5QGefi2DMPTfTL5tQb8xwZZzAb'),
(24, 1050.00, 987654, '3A4zP1eP5QGefi2DMPTfTL5tQb8xwZZaBc'),
(25, 950.00, 432109, '4B5zP1eP5QGefi2DMPTfTL5tQb8xwZZbCd'),
(26, 800.00, 876543, '5C6zP1eP5QGefi2DMPTfTL5tQb8xwZZcDe'),
(27, 1350.00, 234875, '6D7zP1eP5QGefi2DMPTfTL5tQb8xwZZdEf'),
(28, 1850.00, 765432, '7E8zP1eP5QGefi2DMPTfTL5tQb8xwZZeFg'),
(29, 1600.00, 876123, '8F9zP1eP5QGefi2DMPTfTL5tQb8xwZZfGh'),
(30, 1200.00, 321456, '9G0zP1eP5QGefi2DMPTfTL5tQb8xwZZgHi');


-- Insert into Cards (1 card per wallet for each customer)
INSERT INTO Cards (CreditCard_FirstName, CreditCard_LastName, CreditCard_Number, CreditCard_CVS, WalletID)
VALUES
('John', 'Doe', '1234567890123456', '123', 1),
('Jane', 'Smith', '6543210987654321', '234', 2),
('Bill', 'Johnson', '7890123456789012', '345', 3),
('Samantha', 'Brown', '2345678901234567', '456', 4),
('Michael', 'Williams', '5678901234567890', '567', 5),
('Laura', 'Davis', '8901234567890123', '678', 6),
('Chris', 'Martinez', '1234567890123456', '789', 7),
('Patricia', 'Rodriguez', '2345678901234567', '890', 8),
('Steven', 'Lee', '3456789012345678', '901', 9),
('Amy', 'Taylor', '4567890123456789', '012', 10),
('David', 'Anderson', '5678901234567890', '123', 11),
('Linda', 'Thomas', '6789012345678901', '234', 12),
('James', 'Jackson', '7890123456789012', '345', 13),
('Rebecca', 'White', '8901234567890123', '456', 14),
('Charles', 'Harris', '9012345678901234', '567', 15),
('Karen', 'Clark', '0123456789012345', '678', 16),
('Robert', 'Lewis', '1234567890123456', '789', 17),
('Michelle', 'Young', '2345678901234567', '890', 18),
('Richard', 'King', '3456789012345678', '901', 19),
('Sarah', 'Scott', '4567890123456789', '012', 20),
('Thomas', 'Baker', '5678901234567890', '123', 21),
('Helen', 'Nelson', '6789012345678901', '234', 22),
('Gary', 'Adams', '7890123456789012', '345', 23),
('Sophia', 'Carter', '8901234567890123', '456', 24),
('Jack', 'Gonzalez', '9012345678901234', '567', 25),
('Alice', 'Fox', '0123456789012345', '678', 26),
('Nancy', 'Grant', '1234567890123456', '789', 27),
('Frank', 'Harper', '2345678901234567', '890', 28),
('Victor', 'Irwin', '3456789012345678', '901', 29),
('Nancy', 'Caldwell', '4567890123456789', '012', 30);

-- Insert into Employees (25 employees)
INSERT INTO Employees (SSN, FirstName, MiddleName, LastName, Address, City, State, Postal, BirthDate, AreaID)
VALUES
('111223333', 'John', 'A', 'Doe', '123 Casino St', 'Las Vegas', 'NV', '89001', '1985-06-15', 'GA001'),
('222334444', 'Jane', 'B', 'Smith', '456 Casino Ave', 'Las Vegas', 'NV', '89002', '1990-07-20', 'GA002'),
('333445555', 'Bill', 'C', 'Johnson', '789 Casino Blvd', 'Las Vegas', 'NV', '89003', '1992-08-25', 'GA003'),
('444556666', 'Samantha', 'D', 'Brown', '1234 Casino Ln', 'Las Vegas', 'NV', '89004', '1987-05-18', 'GA004'),
('555667777', 'Michael', 'E', 'Williams', '5678 Casino Dr', 'Las Vegas', 'NV', '89005', '1980-03-10', 'GA005'),
('666778888', 'Laura', 'F', 'Davis', '910 Casino Way', 'Las Vegas', 'NV', '89006', '1991-02-12', 'GA001'),
('777889999', 'Chris', 'G', 'Martinez', '1112 High St', 'Las Vegas', 'NV', '89007', '1983-04-22', 'GA002'),
('888990000', 'Patricia', 'H', 'Rodriguez', '1314 Grand Ave', 'Las Vegas', 'NV', '89008', '1995-09-14', 'GA003'),
('999001111', 'Steven', 'I', 'Lee', '1516 Main Blvd', 'Las Vegas', 'NV', '89009', '1986-11-01', 'GA004'),
('000112222', 'Amy', 'J', 'Taylor', '1718 Sunset Dr', 'Las Vegas', 'NV', '89010', '1994-07-08', 'GA005'),
('101122333', 'David', 'K', 'Anderson', '1920 Park Rd', 'Las Vegas', 'NV', '89011', '1988-06-13', 'GA001'),
('202233444', 'Linda', 'L', 'Thomas', '2122 Beach Ave', 'Las Vegas', 'NV', '89012', '1993-01-15', 'GA002'),
('303344555', 'James', 'M', 'Jackson', '2324 Valley Rd', 'Las Vegas', 'NV', '89013', '1987-09-19', 'GA003'),
('404455666', 'Rebecca', 'N', 'White', '2526 Hilltop Dr', 'Las Vegas', 'NV', '89014', '1990-03-22', 'GA004'),
('505566777', 'Charles', 'O', 'Harris', '2728 Ridge Rd', 'Las Vegas', 'NV', '89015', '1982-05-25', 'GA005'),
('606677888', 'Karen', 'P', 'Clark', '2930 River St', 'Las Vegas', 'NV', '89016', '1984-11-30', 'GA001'),
('707788999', 'Robert', 'Q', 'Lewis', '3132 Canyon Dr', 'Las Vegas', 'NV', '89017', '1996-12-01', 'GA002'),
('808899000', 'Michelle', 'R', 'Young', '3334 Lakeview Ave', 'Las Vegas', 'NV', '89018', '1991-01-14', 'GA003'),
('909900111', 'Richard', 'S', 'King', '3536 Mountain Rd', 'Las Vegas', 'NV', '89019', '1989-04-23', 'GA004'),
('010011222', 'Sarah', 'T', 'Scott', '3738 Forest Ln', 'Las Vegas', 'NV', '89020', '1992-06-16', 'GA005'),
('111122333', 'Thomas', 'U', 'Baker', '3930 Oakwood Blvd', 'Las Vegas', 'NV', '89021', '1981-07-29', 'GA001'),
('212233444', 'Helen', 'V', 'Nelson', '4142 Maple Dr', 'Las Vegas', 'NV', '89022', '1993-10-05', 'GA002'),
('313344555', 'Gary', 'W', 'Adams', '4344 Pine St', 'Las Vegas', 'NV', '89023', '1987-02-14', 'GA003'),
('414455666', 'Sophia', 'X', 'Carter', '4546 Spruce Ave', 'Las Vegas', 'NV', '89024', '1994-12-19', 'GA004'),
('515566777', 'Jack', 'Y', 'Gonzalez', '4748 Fir Rd', 'Las Vegas', 'NV', '89025', '1983-03-12', 'GA005');


-- Insert into Games (30 games with random bets, game areas, and corresponding server or null values)
INSERT INTO Games (GameName, AreaID, MinBet, MaxBet)
VALUES
('Poker Classic', 'GA001', 10, 500),  -- Physical Poker Room
('Poker VIP', 'GA001', 50, 1000),     -- Physical Poker Room
('Blackjack Classic', 'GA002', 10, 500),  -- Physical Blackjack Area
('Blackjack VIP', 'GA002', 50, 1000),     -- Physical Blackjack Area
('Roulette Pro', 'GA003', 5, 1000),      -- Physical Roulette Table
('Roulette Deluxe', 'GA003', 10, 500),    -- Physical Roulette Table
('High Stakes Poker', 'GA004', 100, 5000),  -- Physical VIP Room
('Blackjack Royale', 'GA002', 20, 1000),   -- Physical Blackjack Area
('High Roller Poker', 'GA005', 200, 10000), -- Physical High Roller Zone
('Blackjack High Stakes', 'GA002', 100, 5000),  -- Physical Blackjack Area
('Progressive Slots', 'GA005', 1, 100),     -- Physical High Roller Zone
('Mega Jackpot Slots', 'GA005', 5, 200),    -- Physical High Roller Zone
('Online Poker Classic', 'GA006', 10, 500),  -- Online Poker
('Online Poker Tournament', 'GA006', 50, 2000),  -- Online Poker
('Online Blackjack Classic', 'GA007', 10, 500),  -- Online Blackjack
('Online Blackjack VIP', 'GA007', 50, 1000),   -- Online Blackjack
('Online Roulette Classic', 'GA008', 5, 1000),  -- Online Roulette
('Online Roulette Pro', 'GA008', 10, 500),     -- Online Roulette
('Poker Night', 'GA001', 30, 500),  -- Physical Poker Room
('Texas Hold em VIP', 'GA001', 100, 2000),  -- Physical Poker Room
('Blackjack Double Exposure', 'GA002', 15, 300),  -- Physical Blackjack Area
('Roulette 3D', 'GA003', 20, 2000),    -- Physical Roulette Table
('Fruit Slots', 'GA005', 0.50, 50),    -- Physical High Roller Zone
('Wheel of Fortune Slots', 'GA005', 3, 150),  -- Physical High Roller Zone
('Poker Tournament', 'GA001', 50, 1000),  -- Physical Poker Room
('Omaha Poker', 'GA001', 20, 1000),   -- Physical Poker Room
('Blackjack Double Deck', 'GA002', 10, 500),  -- Physical Blackjack Area
('Spin to Win Roulette', 'GA003', 2, 200),   -- Physical Roulette Table
('Spin & Win Roulette', 'GA003', 10, 500);   -- Physical Roulette Table

-- Insert into Customers (30 customers with random, unique SSNs)
INSERT INTO Customers (SSN, FirstName, MiddleName, LastName, PhoneNumber, Address, City, State, Postal, BirthDate, WalletID, Banned)
VALUES
('647029781', 'John', 'A', 'Doe', '555-1234', '123 Main St', 'Las Vegas', 'NV', '89001', '1985-06-15', 1, FALSE),
('238475964', 'Jane', 'B', 'Smith', '555-2345', '456 Oak Rd', 'Las Vegas', 'NV', '89002', '1990-07-20', 2, FALSE),
('431265728', 'Bill', 'C', 'Johnson', '555-3456', '789 Pine Ave', 'Las Vegas', 'NV', '89003', '1992-08-25', 3, FALSE),
('578239614', 'Samantha', 'D', 'Brown', '555-4567', '1234 Birch Rd', 'Las Vegas', 'NV', '89004', '1987-05-18', 4, FALSE),
('812736495', 'Michael', 'E', 'Williams', '555-5678', '5678 Cedar Ln', 'Las Vegas', 'NV', '89005', '1980-03-10', 5, FALSE),
('572184396', 'Laura', 'F', 'Davis', '555-6789', '910 Walnut St', 'Las Vegas', 'NV', '89006', '1991-02-12', 6, FALSE),
('347812659', 'Chris', 'G', 'Martinez', '555-7890', '1112 Maple Blvd', 'Las Vegas', 'NV', '89007', '1983-04-22', 7, FALSE),
('492765831', 'Patricia', 'H', 'Rodriguez', '555-8901', '1314 Oakwood Dr', 'Las Vegas', 'NV', '89008', '1995-09-14', 8, FALSE),
('328471659', 'Steven', 'I', 'Lee', '555-9012', '1516 Sunset Blvd', 'Las Vegas', 'NV', '89009', '1986-11-01', 9, FALSE),
('509837162', 'Amy', 'J', 'Taylor', '555-0123', '1718 Park Ave', 'Las Vegas', 'NV', '89010', '1994-07-08', 10, FALSE),
('183726459', 'David', 'K', 'Anderson', '555-1234', '1920 Park Rd', 'Las Vegas', 'NV', '89011', '1988-06-13', 11, FALSE),
('276193845', 'Linda', 'L', 'Thomas', '555-2345', '2122 Beach Ave', 'Las Vegas', 'NV', '89012', '1993-01-15', 12, FALSE),
('604931752', 'James', 'M', 'Jackson', '555-3456', '2324 Valley Rd', 'Las Vegas', 'NV', '89013', '1987-09-19', 13, FALSE),
('419283765', 'Rebecca', 'N', 'White', '555-4567', '2526 Hilltop Dr', 'Las Vegas', 'NV', '89014', '1990-03-22', 14, FALSE),
('713496280', 'Charles', 'O', 'Harris', '555-5678', '2728 Ridge Rd', 'Las Vegas', 'NV', '89015', '1982-05-25', 15, FALSE),
('516738294', 'Karen', 'P', 'Clark', '555-6789', '2930 River St', 'Las Vegas', 'NV', '89016', '1984-11-30', 16, FALSE),
('835927461', 'Robert', 'Q', 'Lewis', '555-7890', '3132 Canyon Dr', 'Las Vegas', 'NV', '89017', '1996-12-01', 17, FALSE),
('284536179', 'Michelle', 'R', 'Young', '555-8901', '3334 Lakeview Ave', 'Las Vegas', 'NV', '89018', '1991-01-14', 18, FALSE),
('692813547', 'Richard', 'S', 'King', '555-9012', '3536 Mountain Rd', 'Las Vegas', 'NV', '89019', '1989-04-23', 19, FALSE),
('507926381', 'Sarah', 'T', 'Scott', '555-0123', '3738 Forest Ln', 'Las Vegas', 'NV', '89020', '1992-06-16', 20, FALSE),
('214689753', 'Thomas', 'U', 'Baker', '555-1234', '3930 Oakwood Blvd', 'Las Vegas', 'NV', '89021', '1981-07-29', 21, FALSE),
('983726504', 'Helen', 'V', 'Nelson', '555-2345', '4142 Maple Dr', 'Las Vegas', 'NV', '89022', '1993-10-05', 22, FALSE),
('674892371', 'Gary', 'W', 'Adams', '555-3456', '4344 Pine St', 'Las Vegas', 'NV', '89023', '1987-02-14', 23, FALSE),
('583971264', 'Sophia', 'X', 'Carter', '555-4567', '4546 Spruce Ave', 'Las Vegas', 'NV', '89024', '1994-12-19', 24, FALSE),
('238675401', 'Jack', 'Y', 'Gonzalez', '555-5678', '4748 Fir Rd', 'Las Vegas', 'NV', '89025', '1983-03-12', 25, FALSE),
('327486509', 'Alice', 'Z', 'Fox', '555-6789', '4949 Cedar Blvd', 'Las Vegas', 'NV', '89026', '1994-02-14', 26, FALSE),
('638192457', 'Nancy', 'A', 'Grant', '555-7890', '5150 Oak Ln', 'Las Vegas', 'NV', '89027', '1987-08-23', 27, FALSE),
('591827364', 'Frank', 'B', 'Harper', '555-8901', '5252 Pine Rd', 'Las Vegas', 'NV', '89028', '1990-04-05', 28, FALSE),
('764539821', 'Victor', 'C', 'Irwin', '555-9012', '5353 Maple Dr', 'Las Vegas', 'NV', '89029', '1989-12-01', 29, FALSE),
('872643195', 'Nancy', 'D', 'Caldwell', '555-0123', '5454 Birch Ln', 'Las Vegas', 'NV', '89030', '1992-06-19', 30, FALSE);



-- Insert 5 played games for each game
INSERT INTO PlayedGames (GameID, GameDate, CustomerID, Bet, Cashout)
VALUES
-- Game 1: Poker Classic (GameID = 1)
(1, '2024-01-10', 5, 60, 0),
(1, '2024-02-15', 12, 120, 0),
(1, '2024-03-10', 8, 90, 0),
(1, '2024-04-01', 20, 70, 135.00),
(1, '2024-05-22', 3, 100, 30.00),

-- Game 2: Poker VIP (GameID = 2)
(2, '2024-01-20', 14, 160, 140.00),
(2, '2024-02-25', 25, 220, 200.00),
(2, '2024-03-12', 2, 140, 0),
(2, '2024-04-18', 18, 200, 180.00),
(2, '2024-05-15', 7, 240, 220.00),

-- Game 3: Blackjack Classic (GameID = 3)
(3, '2024-01-15', 30, 50, 20.00),
(3, '2024-02-18', 10, 80, 100.00),
(3, '2024-03-25', 6, 120, 0),
(3, '2024-04-10', 21, 60, 40.00),
(3, '2024-05-30', 16, 90, 70.00),

-- Game 4: Blackjack VIP (GameID = 4)
(4, '2024-01-22', 28, 120, 100.00),
(4, '2024-02-05', 17, 180, 150.00),
(4, '2024-03-14', 4, 140, 0),
(4, '2024-04-08', 15, 150, 130.00),
(4, '2024-05-12', 11, 200, 180.00),

-- Game 5: Roulette Pro (GameID = 5)
(5, '2024-01-11', 23, 30, 25.00),
(5, '2024-02-28', 1, 60, 50.00),
(5, '2024-03-16', 19, 40, 0),
(5, '2024-04-20', 27, 50, 40.00),
(5, '2024-05-18', 9, 80, 60.00),

-- Game 6: Roulette Deluxe (GameID = 6)
(6, '2024-01-28', 24, 30, 33.00),
(6, '2024-02-14', 26, 60, 10.00),
(6, '2024-03-02', 13, 40, 0),
(6, '2024-04-05', 22, 70, 54.00),
(6, '2024-05-21', 8, 90, 70.00),

-- Game 7: High Stakes Poker (GameID = 7)
(7, '2024-01-17', 3, 400, 300.00),
(7, '2024-02-22', 6, 450, 350.00),
(7, '2024-03-08', 29, 300, 0),
(7, '2024-04-12', 20, 500, 400.00),
(7, '2024-05-02', 12, 600, 500.00),

-- Game 8: Blackjack Royale (GameID = 8)
(8, '2024-01-30', 7, 100, 80.00),
(8, '2024-02-18', 25, 140, 120.00),
(8, '2024-03-04', 18, 90, 0),
(8, '2024-04-25', 15, 110, 90.00),
(8, '2024-05-10', 1, 180, 150.00),

-- Game 9: High Roller Poker (GameID = 9)
(9, '2024-01-25', 11, 600, 500.00),
(9, '2024-02-12', 22, 800, 700.00),
(9, '2024-03-30', 13, 500, 0),
(9, '2024-04-15', 9, 700, 600.00),
(9, '2024-05-08', 16, 1000, 800.00),

-- Game 10: Blackjack High Stakes (GameID = 10)
(10, '2024-01-21', 14, 180, 150.00),
(10, '2024-02-09', 5, 250, 200.00),
(10, '2024-03-13', 28, 120, 0),
(10, '2024-04-06', 30, 150, 130.00),
(10, '2024-05-19', 10, 220, 180.00),

-- Game 11: Roulette Royale (GameID = 11)
(11, '2024-01-10', 19, 50, 40.00),
(11, '2024-02-22', 27, 60, 50.00),
(11, '2024-03-07', 21, 40, 0),
(11, '2024-04-14', 23, 70, 60.00),
(11, '2024-05-29', 4, 100, 80.00),

-- Game 12: High Stakes Roulette (GameID = 12)
(12, '2024-01-25', 26, 400, 300.00),
(12, '2024-02-08', 29, 450, 350.00),
(12, '2024-03-16', 24, 300, 0),
(12, '2024-04-18', 6, 500, 400.00),
(12, '2024-05-23', 17, 600, 500.00),

-- Game 13: Texas Hold'em Poker (GameID = 13)
(13, '2024-01-14', 20, 180, 150.00),
(13, '2024-02-10', 12, 250, 200.00),
(13, '2024-03-22', 2, 120, 0),
(13, '2024-04-27', 9, 150, 130.00),
(13, '2024-05-16', 25, 220, 180.00),

-- Game 14: Baccarat Classic (GameID = 14)
(14, '2024-01-30', 30, 50, 40.00),
(14, '2024-02-24', 14, 80, 60.00),
(14, '2024-03-05', 7, 120, 0),
(14, '2024-04-20', 22, 70, 50.00),
(14, '2024-05-04', 8, 90, 70.00),

-- Game 15: Baccarat High Stakes (GameID = 15)
(15, '2024-01-22', 28, 400, 300.00),
(15, '2024-02-06', 13, 450, 350.00),
(15, '2024-03-09', 1, 300, 0),
(15, '2024-04-15', 16, 500, 400.00),
(15, '2024-05-14', 18, 600, 500.00),

-- Game 16: Baccarat Royale (GameID = 16)
(16, '2024-01-13', 5, 180, 150.00),
(16, '2024-02-18', 10, 250, 200.00),
(16, '2024-03-25', 28, 150, 0),
(16, '2024-04-30', 3, 220, 180.00),
(16, '2024-05-18', 27, 300, 250.00),

-- Game 17: Ultimate Poker (GameID = 17)
(17, '2024-01-21', 20, 40, 100.00),
(17, '2024-02-05', 16, 60, 140.00),
(17, '2024-03-11', 22, 100, 0),
(17, '2024-04-17', 12, 70, 150.00),
(17, '2024-05-28', 25, 80, 200.00),

-- Game 18: Caribbean Poker (GameID = 18)
(18, '2024-01-27', 30, 40, 90.00),
(18, '2024-02-15', 8, 50, 120.00),
(18, '2024-03-19', 17, 35, 0),
(18, '2024-04-26', 11, 60, 150.00),
(18, '2024-05-23', 6, 80, 200.00),

-- Game 19: Triple 7 Slots (GameID = 19)
(19, '2024-01-09', 13, 5, 20.00),
(19, '2024-02-12', 21, 7, 15.00),
(19, '2024-03-14', 4, 8, 0),
(19, '2024-04-18', 23, 6, 12.00),
(19, '2024-05-09', 9, 10, 25.00),

-- Game 20: Jackpot Party Slots (GameID = 20)
(20, '2024-01-25', 15, 10, 30.00),
(20, '2024-02-17', 19, 5, 15.00),
(20, '2024-03-23', 1, 4, 0),
(20, '2024-04-29', 2, 6, 18.00),
(20, '2024-05-22', 14, 12, 35.00),

-- Game 21: Mega Roulette (GameID = 21)
(21, '2024-01-16', 18, 30, 75.00),
(21, '2024-02-26', 24, 50, 10.00),
(21, '2024-03-07', 29, 35, 0),
(21, '2024-04-20', 7, 60, 30.00),
(21, '2024-05-13', 22, 80, 100.00),

-- Game 22: Vegas Slots Mania (GameID = 22)
(22, '2024-01-28', 20, 4, 0.25),
(22, '2024-02-06', 19, 7, 1.00),
(22, '2024-03-16', 30, 5, 0),
(22, '2024-04-05', 12, 6, 0.10),
(22, '2024-05-19', 8, 10, 7.25),

-- Game 23: Wild West Poker (GameID = 23)
(23, '2024-01-18', 9, 50, 30.00),
(23, '2024-02-09', 16, 40, 20.00),
(23, '2024-03-10', 4, 35, 0),
(23, '2024-04-22', 5, 60, 100.00),
(23, '2024-05-25', 13, 70, 50.00),

-- Game 24: Dragon's Lair Slots (GameID = 24)
(24, '2024-01-12', 11, 2, 0.00),
(24, '2024-02-08', 27, 5, 0.00),
(24, '2024-03-03', 15, 3, 0),
(24, '2024-04-15', 14, 4, 4.00),
(24, '2024-05-28', 1, 6, 10.00),

-- Game 25: Neon Nights Slots (GameID = 25)
(25, '2024-01-20', 6, 10, 00.00),
(25, '2024-02-01', 25, 12, 00.00),
(25, '2024-03-21', 19, 8, 2),
(25, '2024-04-07', 29, 15, 10.00),
(25, '2024-05-26', 17, 20, 60.00),

-- Game 26: Treasure Quest Slots (GameID = 26)
(26, '2024-01-14', 10, 20, 50.00),
(26, '2024-02-11', 28, 40, 20.00),
(26, '2024-03-18', 2, 30, 0),
(26, '2024-04-24', 22, 25, 40.00),
(26, '2024-05-05', 20, 35, 20.00),

-- Game 27: Showdown Poker (GameID = 27)
(27, '2024-01-11', 13, 60, 54.00),
(27, '2024-02-14', 30, 50, 55.00),
(27, '2024-03-30', 5, 35, 0),
(27, '2024-04-13', 4, 80, 83.00),
(27, '2024-05-21', 18, 90, 52.00),

-- Game 28: Mystic Spins Slots (GameID = 28)
(28, '2024-01-15', 7, 5, 0.00),
(28, '2024-02-04', 3, 10, 8.00),
(28, '2024-03-22', 16, 8, 1.00),
(28, '2024-04-09', 1, 15, 5.00),
(28, '2024-05-06', 24, 20, 33.00),

-- Game 29: All-In Poker (GameID = 29)
(29, '2024-01-17', 14, 200, 211.00),
(29, '2024-02-02', 11, 300, 0.00),
(29, '2024-03-28', 21, 150, 0),
(29, '2024-04-16', 9, 400, 1000.00),
(29, '2024-05-24', 26, 500, 800.00);




-- Insert into Support_Tickets (30 casino-related complaints with randomized CustomerID)
INSERT INTO Support_Tickets (TicketID, CustomerID, Subject, Text, EmployeeHelper)
VALUES
(1, 18, 'Roulette table malfunction', 'The roulette table malfunctioned during my game, I lost my bet.', NULL),
(2, 25, 'Unprofessional dealer', 'The dealer at blackjack was rude and unprofessional, making me uncomfortable.', 3),
(3, 6, 'Poker game disconnection', 'My online poker game keeps disconnecting, losing me hands and chips.', NULL),
(4, 12, 'Slot machine payout error', 'The payout on my slot machine was incorrect, I didn’t get my winnings.', NULL),
(5, 3, 'Delayed cashout', 'I requested a cashout for my winnings but haven’t received it after 5 days.', NULL),
(6, 20, 'Video poker malfunction', 'The video poker machine malfunctioned and didn’t register my bet.', NULL),
(7, 1, 'Blackjack dealer mistakes', 'The dealer at the blackjack table kept making mistakes with my hand.', 2),
(8, 14, 'Baccarat game freeze', 'I tried to play the online baccarat game, but the game keeps freezing.', NULL),
(9, 11, 'Noisy slot machine', 'The slot machine near my table was very noisy and distracted me while playing.', NULL),
(10, 24, 'Overcharged at bar', 'I was charged for multiple drinks at the casino bar that I never ordered.', 5),
(11, 9, 'Crowded casino floor', 'The casino floor was very crowded and noisy, making it difficult to focus on my game.', NULL),
(12, 7, 'Unjustified poker room expulsion', 'I was kicked out of the poker room for no apparent reason.', 4),
(13, 19, 'Suspected rigged roulette wheel', 'The roulette wheel seemed to be rigged, I’ve been losing consistently on the same numbers.', NULL),
(14, 10, 'Unhelpful staff at blackjack', 'I requested a change of dealer at blackjack, but the staff was unhelpful and rude.', 6),
(15, 16, 'Account lock due to verification', 'My account was locked due to a verification issue, but I’ve already submitted the documents.', NULL),
(16, 2, 'Live dealer game lag', 'The live dealer game was lagging and I couldn’t place my bets on time.', NULL),
(17, 8, 'Dealer cheating suspicion', 'I noticed the dealer kept dealing cards from the bottom of the deck, very suspicious.', 8),
(18, 21, 'Faulty craps table button', 'The craps table had a faulty button and didn’t register my bet correctly.', NULL),
(19, 5, 'VIP lounge access denial', 'I was denied access to the VIP lounge without being told why, very frustrating.', 7),
(20, 27, 'Poker chip payout error', 'I was not paid out the correct amount of chips for my win at the poker table.', NULL),
(21, 23, 'Overcharged for drinks', 'I was overcharged on my drink tab, I only ordered two drinks but was billed for five.', 3),
(22, 4, 'Overcrowded blackjack table', 'The blackjack table was overcrowded, and I couldn’t even get a seat to play.', 2),
(23, 30, 'Online slots bonus issue', 'The online slots bonus didn’t trigger after I met the requirements.', NULL),
(24, 17, 'Deposit not reflected', 'I made a deposit but it hasn’t reflected in my online casino account yet.', 5),
(25, 13, 'Pending payout for over a week', 'I’ve been waiting for a payout at the casino for over a week with no updates.', 6),
(26, 22, 'Cashout error at cashier', 'The cashier made a mistake and gave me less money when I cashed out.', 4),
(27, 28, 'Poker tournament booking issue', 'The poker table was overbooked, I couldn’t get into the tournament I registered for.', NULL),
(28, 26, 'Slow customer support response', 'The customer service team took too long to respond to my email, and my issue is unresolved.', 9),
(29, 15, 'Bonus chip restriction', 'I received bonus chips, but they couldn’t be used on the games I wanted to play.', NULL),
(30, 29, 'Blackjack game glitch', 'There was a glitch in the online blackjack game, causing my bet to be automatically placed as a minimum bet.', 3);

