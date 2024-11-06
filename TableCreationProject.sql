Create schema Project;
use Project;

Create table Servers
(
	ServerID int primary key auto_increment,
    HostGame varchar(45) , 
    Capacity int ,
    PricePerDay int 
);

Create table Customers
(
	SSN varchar(45) primary key,
    FirstName varchar(45) ,
    MiddleName varchar(45) , 
    LastName varchar(45) ,
    Address varchar(45) ,
    State varchar(2) ,
    City varchar(45) ,
    BirthDate varchar(45) 
    #Banned ? 
);

Create table Games
(
	GameID int primary key ,
    GameName varchar(45) ,
    HostedServer int ,
    GameDate Date ,
    Player varchar(45) ,
    Bet int , 
    Cashout int ,
    foreign key (Player) references Customers(SSN) ,
    foreign key (HostedServer) references Servers(ServerID) 
);

#maybe add employees table so each ticket has an employee ID
Create table Support_Tickets
(
	TicketID int primary key auto_increment ,
    Customer varchar(45) ,
    Subject varchar(45) ,
    Text varchar(45) ,
    
    foreign key (Customer) references Customers(SSN) 
);


#maybe make this into 2 for deposit and withdraws
Create table Transaction
(
	TransactionID int primary key auto_increment ,
    Deposit int ,
    CreditCard varchar(45),
    CreditCard_Owner varchar(45), 
    CreditCard_CVS int(3) ,
    Bank varchar(45) , 
	Address varchar(45) ,
    State varchar(2) ,
    City varchar(45) ,
    Customer varchar(45) ,
    TransactionDate date ,
    foreign key (Customer) references Customers(SSN) 
);

Create table BannedList
(
) 

