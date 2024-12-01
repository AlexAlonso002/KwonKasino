import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class SqlEntries {

	public static void main(String[] args) {
		 Connection conn ;

	        try {
	            // 1. Driver Loading and DB connection							schema name	change user name and pw
	            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "0Cyclone6!");
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
	            
	            String CallAlexSQl = "call Project.Taxforms(2002, 2023,1); " ;
	            
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
	            
	            String CallAlexSQl2 = "call Project.MonthlyProfit(2, 2023);" ; 

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
	            
	            Statement stmt = conn.createStatement();
	            boolean result1 = stmt.execute(AlexSQL1);
	            boolean result2 = stmt.execute(AlexSQL2);
	            boolean result3 = stmt.execute(AlexSQL3);
	            boolean result4 = stmt.execute(AlexSQL3p2);
			
	            System.out.println("Procedure Created: " + result1);
	            
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
