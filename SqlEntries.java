import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class SqlEntries {

	public static void main(String[] args) {
		 Connection conn ;

	        try {
	            // 1. Driver Loading and DB connection							schema name	change user name and pw
	            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "Password");
	            System.out.println("DB connection successful");
	            
	            String AlexSQL1 =
	                    "CREATE PROCEDURE Taxforms(IN CustID INT, IN DateYear INT, IN DateMonth INT) " +
	                            "BEGIN " +
	                            "    DECLARE i INT DEFAULT 1; " +
	                            "    DECLARE MonthRevenue INT DEFAULT 0; " +
	                            "    DECLARE MonthBet INT DEFAULT 0; " +
	                            "    DECLARE MonthCashout INT DEFAULT 0; " +
	                            "    DECLARE result TEXT DEFAULT ''; " +
	                            
	                            "    SELECT SUM(bet), SUM(Cashout) " +
	                            "    INTO MonthBet, MonthCashout " + 
	                            "    FROM PlayedGames " +
	                            "    WHERE YEAR(GameDate) = DateYear AND MONTH(GameDate) = DateMonth AND CustomerID = CustID; " +
	                            
	                            "    SET MonthRevenue = MonthCashout - MonthBet; " +
	                            				// this is new
	                            "    SELECT MonthBet , MonthCashout , MonthRevenue ; " +
	                            "END;";
	            
	            String CallAlexSQl = "call Project.Taxforms(15, 2024,4); " ;
	            
	            String AlexSQL2 = 
	            	    "CREATE PROCEDURE MonthlyProfit(IN Month2 INT, IN DateYear INT) " +
	            	    "BEGIN " +
	            	    "    DECLARE NumberOfEmployees INT DEFAULT 0; " +
	            	    "    DECLARE MonthlyWage INT DEFAULT 0; " +
	            	    "    DECLARE GamblerBet INT DEFAULT 0; " +
	            	    "    DECLARE GamblerRev INT DEFAULT 0; " +
	            	    "    DECLARE ProfitFromGambling INT DEFAULT 0; " +
	            	    "    DECLARE ServerCost INT DEFAULT 0; " +
	            	    "    DECLARE Profit INT DEFAULT 0; " +

	            	    "    SELECT COUNT(EmployeeID) " +
	            	    "    INTO NumberOfEmployees " +
	            	    "    FROM Employees; " +

	            	    "    SET MonthlyWage = NumberOfEmployees * 3000; " +

	            	    "    SELECT SUM(Bet), SUM(Cashout) " +
	            	    "    INTO GamblerBet, GamblerRev " +
	            	    "    FROM PlayedGames " +
	            	    "    WHERE YEAR(GameDate) = DateYear AND MONTH(GameDate) = Month2; " +

	            	    "    SET ProfitFromGambling = GamblerRev - GamblerBet; " +

	            	    "    SELECT SUM(CostPerMonth) " +
	            	    "    INTO ServerCost " +
	            	    "    FROM Servers; " +

	            	    "    SET Profit = ProfitFromGambling - (MonthlyWage + ServerCost); " +

	            	    "    SELECT Profit; " +
	            	    "END;";
	            
	            String CallAlexSQl2 = "call Project.MonthlyProfit(2, 2024);" ; 

	            String AlexSQL3 = 
	            		"CREATE PROCEDURE AutoBan(CustID INT) BEGIN DECLARE Rev INT; " +
	            		"SELECT SUM(Cashout) - SUM(Bet) INTO Rev FROM PlayedGames WHERE CustomerID = CustID; " +
	            		"IF Rev > 10000 THEN UPDATE Customers SET Banned = 1 WHERE CustomerID = CustID; END IF; " +
	            		"END ; "  ;
	            		
	            String AlexSQL3p2 = 
	            	    "CREATE TRIGGER AutoBanSystem AFTER INSERT ON PlayedGames FOR EACH ROW " +
	            	    "BEGIN " +
	            	    "CALL AutoBan(NEW.CustomerID); " +
	            	    "END;" ;
	           
	            String BradSQL1 =
	                    "CREATE FUNCTION `Support_Status` (FName varchar(45), LName varchar(45)) " +
	                    		"RETURNS varchar(45) "+
	                    		"READS SQL DATA " +
	                            "BEGIN " +
	                            "    DECLARE ticket_status VARCHAR(45); " +
	                            "    DECLARE helper_firstname VARCHAR(45); " +
	                            "    DECLARE helper_lastname VARCHAR(45); " +
	                            "    declare customer_FName varchar(45); " +
	                            "    declare customer_LName varchar(45); " +
	                            "	 DECLARE employee_ID INT; "+
	                            
								"SELECT C.FirstName, C.LastName, ST.EmployeeHelper, E.FirstName, E.LastName "+
								"INTO customer_FName, Customer_LName, employee_ID, helper_firstname, helper_lastname "+
								"FROM Customers C JOIN Support_Tickets ST using(CustomerID) "+
								"join employees E on (E.EmployeeID = ST.EmployeeHelper) "+
								"WHERE C.FirstName= FName AND C.LastName = LName; "+
	                            
								"IF employee_ID IS NULL THEN "+
								"SET ticket_status = 'Claim not helped yet.'; "+
								"ELSE "+
								"SET ticket_status = CONCAT(helper_firstname, ' ', helper_lastname, ' helped with the ticket.'); "+
								"END IF; "+
								
								"RETURN ticket_status; "+
	                            "END;";
	            
	            String CallBradSQl = "select Project.Support_Status('John', 'Doe'); " ;
	            
	            String BradSQL2 = 
	            	    "CREATE PROCEDURE `Resolve_Support_Ticket` (Customer_ID int , Employee_ID INT) " +
	            	    "BEGIN " +
	            	    "	declare result varchar(100); "+
	            	    "	declare employee_FName varchar(45); "+
	            		"	declare employee_LName varchar(45); "+
	            	    "	declare FName varchar(45); "+
	            	    "	declare LName varchar(45); "+
	            	    "	declare header varchar(45); "+
	            	    "	declare body text; "+

	            	    "	select Subject, Text into header, body from Support_Tickets where CustomerID = Customer_ID; " +
	            	    "	select FirstName, LastName "+
	            	    "	into FName, LName "+
	            	    "	from Customers "+
	            	    "	where CustomerID = Customer_ID; "+

						"	select FirstName, LastName "+
						"	into employee_FName, employee_LName "+
						"	from Employees "+
						"	where EmployeeID = Employee_ID; "+

	            	    "	select Project.Support_Status(FName, LName) into result; " +

						"	if result = 'Claim not helped yet.' then "+
						"		set result = concat('Ticket resolved by ',employee_FName, ' ', employee_LName, '.'); "+
						"		update Support_Tickets "+
						"		set EmployeeHelper = Employee_ID "+
						"		where CustomerID = Customer_ID; "+
						"	else "+
						"		set result = concat('This ticket has already been resolved.', ' ', result); "+
						"	end if; "+
						"	select result, header, body; "+
	            	    "END;";
	            
	            String CallBradSQl2 = "call Project.Resolve_Support_Ticket(18, 7);" ; 

	            String BradSQL3 = 
	            		"CREATE FUNCTION `CustomerMostPlayed` (Customer_ID int) "+
	            		"RETURNS varchar(45) "+
	            		"reads sql data "+
	            		"BEGIN "+
	            		"	declare played_most varchar(45); "+
	            		"   declare gameid int; "+
	            		"   declare count int; "+
	            			
	            		"	 select PG.PlayedGameID, G.GameName, count(GA.AreaName) "+
	            		"    into gameid, played_Most, count "+
	            		"    from playedGames PG join Games G using (GameID) "+
	            		"    join GameArea GA using (AreaID) "+
	            		"    where CustomerID = Customer_ID "+
	            		"    group by PG.PlayedGameID "+
	            		"    order by count(GA.AreaName) desc "+
	            		"    limit 1; "+
	            		    
	            		    "return played_most; "+

	            		"END; ";
	            		
	            String CallBradSQl3 = "call Project.CustomerMostPlayed(10);";
	            
	            String BradSQL4 = 
	            		"CREATE DEFINER=`root`@`localhost` PROCEDURE `Automated_mail`() "+
	            		"BEGIN "+
	            		"DECLARE game VARCHAR(45); "+
	            	    "DECLARE Customer_ID INT; "+
	            	    "DECLARE FName VARCHAR(45); "+
	            	    "DECLARE LName VARCHAR(45); "+
	            	    "DECLARE Address1 VARCHAR(100); "+
	            	    "DECLARE City1 VARCHAR(45); "+
	            	    "DECLARE State1 VARCHAR(45); "+
	            	    "DECLARE Postal1 VARCHAR(20); "+
	            	    "DECLARE FullAddress VARCHAR(255); "+
	            	    "DECLARE done INT DEFAULT FALSE; "+
	            	    
						"DECLARE customer_cursor CURSOR FOR "+
						"SELECT CustomerID, FirstName, LastName "+
						"FROM Customers; "+		
	            		"DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE; "+
	            		"OPEN customer_cursor; "+
	            		"mail_loop: LOOP "+
	            		"    FETCH customer_cursor INTO Customer_ID, FName, LName; "+
	            		"    IF done THEN "+
	            		"    LEAVE mail_loop; "+
	            		"    END IF; "+
	            		"select Address, City, State, Postal "+
	                    "into Address1, City1, State1, Postal1 "+
	                    "from Customers "+
	                    "where CustomerID = Customer_ID; "+
	                    
	            		"SET FullAddress = CONCAT(Address1, ', ', City1, ' ', State1, ' ', Postal1); "+
	            		"SELECT CustomerMostPlayed(Customer_ID) INTO game; "+
	            		"INSERT INTO PhysicalMailQueue (CustomerID, Address, Subject, Body) "+
	            		"VALUES ( "+
	            	            "Customer_ID, "+
	            	            "FullAddress, "+
	            	            "CONCAT('Special Offer for ', FName, ' ', LName), "+
	            	            "CONCAT('Dear ', FName, ' ', LName, ',\n\nThank you for your time at KwonKasino. We are glad to see that you are enjoying your experience.\n We have a special "
	            	            + "offer related to your favorite game: ', game, '.\n Please enjoy a 20% Cashout Bonus for the game, ',game,' during your next visit!\n\nBest regards, \nKwonKasino.')); "+
	            	     
	            	    "END LOOP; "+
	            	    "CLOSE customer_cursor; "+
	            		"END; ";
	            		
	            String CallBradSQl4 = "call Project.Automated_mail();";
	            
	            Statement stmt = conn.createStatement();
	            boolean result1 = stmt.execute(AlexSQL1);
	            boolean result2 = stmt.execute(AlexSQL2);
	            boolean result3 = stmt.execute(AlexSQL3);
	            boolean result4 = stmt.execute(AlexSQL3p2);
	            boolean result5 = stmt.execute(BradSQL1);
	            boolean result6 = stmt.execute(BradSQL2);
	            boolean result7 = stmt.execute(BradSQL3);
	            boolean result8 = stmt.execute(BradSQL4);
			
	            System.out.println("Procedure Created: " + result1);
	            System.out.println("Procedure Created: " + result2);
	            System.out.println("Procedure Created: " + result3);
	            System.out.println("Procedure Created: " + result4);
	            System.out.println("Procedure Created: " + result5);
	            System.out.println("Procedure Created: " + result6);
	            System.out.println("Procedure Created: " + result7);
	            System.out.println("Procedure Created: " + result8);
	            
	            
	            ResultSet rs1 = stmt.executeQuery(CallAlexSQl);
	           
	            
	            while (rs1.next()) {
					String SName = rs1.getString("MonthBet");
					String SID = rs1.getString("MonthCashout");
					String SID2 = rs1.getString("MonthRevenue");

					System.out.println("Month Bet: " + SName + "\n" + "Month CashOut: " + SID + "\n" + "Month Revenue " + SID2 + "\n");
				}
			
	            ResultSet rs2 = stmt.executeQuery(CallAlexSQl2);
	            while (rs2.next()) {
					String Profit = rs2.getString("Profit");

					System.out.println("Profit of Month Bet: " + Profit + "\n");
				}
	            ResultSet rs3 = stmt.executeQuery(CallBradSQl2);
	            while (rs3.next()) {
	            	String result = rs3.getString("result");
	            	String header = rs3.getString("header");
	            	String body = rs3.getString("body");

	            	System.out.println(result);
	            	System.out.println(header);
	            	System.out.println(body+"\n");
	            	
	            }
	            stmt.executeQuery(CallBradSQl4);
	            ResultSet rs4 = stmt.executeQuery("select CustomerID, Address, Subject, Body from PhysicalMailQueue");
	            while (rs4.next()) {
	            	String CustomerID = rs4.getString("CustomerID");
	            	String Address = rs4.getString("Address");
	            	String subject = rs4.getString("Subject");
	            	String body = rs4.getString("Body");

	            	System.out.println("CustomerID: "+CustomerID+"\n");
	            	System.out.println(Address);
	            	System.out.println(subject +"\n");
	            	System.out.println(body+"\n");
	            	System.out.println("-------------------------------------------------");
	            	
	            }

	            if (stmt != null) {
	                stmt.close();
	            }

	            if (conn != null) {
	                conn.close();
	            }

	        	} catch (Exception e) {
	            System.out.println("ERROR: " + e);
	        	}

	        
	       
	}

}