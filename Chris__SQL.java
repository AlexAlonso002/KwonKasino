/*Chris Sotirovski
 * Below are my 3 SQL Queries For the final Database Project
 * The date is 11/29/2025
 * I left comments above each query explaining what each of them do
 */
import java.sql.*;

public class Chris__SQL {
    public static void main(String[] args) {
    	/*
	-- 1: This is a stored procedure with an input parameter to find banned or unbanned customers.
	-- Say we have a problem where a customer that wants to join our Casino, but they look/sound fimilar 
	-- we can simply pull up the records of all the banned customers to see if they are on that list
 	*/   // here is the procedure
        String createProcedure = 
            "CREATE PROCEDURE banned_customers(IN boolean_Banned BOOLEAN) " +
            "BEGIN " +
            "SELECT CustomerID, FirstName, LastName, banned " +
            "FROM customers " +
            "WHERE banned = boolean_Banned; " +
            "END;";

        // I am calling the procedure here
        String callProcedure = "{CALL banned_customers(?)}";
        
        // connecting the database here
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "Gracie0008")) {

            try (Statement statement = connection.createStatement()) {
                statement.execute(createProcedure);
                System.out.println("Stored procedure created successfully.");
            } catch (SQLException e) {
                System.out.println("Procedure creation failed-it may already exist: " + e.getMessage());
            }
           
            try (CallableStatement callStatement = connection.prepareCall(callProcedure)) {
                callStatement.setBoolean(1, false); // I have to Pass the parameter to the procedure here, or do it in sql, both are good
                ResultSet resultSet = callStatement.executeQuery();

               
                System.out.println("Results:");
                while (resultSet.next()) {
                    int customerID = resultSet.getInt("CustomerID");
                    String firstName = resultSet.getString("FirstName");
                    String lastName = resultSet.getString("LastName");
                    boolean banned = resultSet.getBoolean("banned");

                    System.out.printf("CustomerID: %d, FirstName: %s, LastName: %s, Banned: %b%n",
                            customerID, firstName, lastName, banned);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
       
      //-- 2: This is a stored procedure to find out who won the most amount of money on each game by inputing the game in the parameter 
      //-- this way, we can see if that player is taking too much money from us and then we will have the choice to ban them
      //-- because if they are winning more than what they are spending, we are losing money, which is bad
      //-- we have the right to ban anyone we want without notice or explanation 
        
        String createProcedureSQL = 
            "CREATE PROCEDURE top_winner_per_game(IN name_of_game VARCHAR(45))\n" +
            "BEGIN\n" +
            "SELECT c.CustomerID, c.FirstName, c.LastName, MAX(p.cashout) AS MaxWinnings, g.GameName\n" +
            "FROM PlayedGames p\n" +
            "JOIN Games g ON p.GameID = g.GameID\n" +
            "JOIN Customers c ON p.CustomerID = c.CustomerID\n" +
            "WHERE g.GameName = name_of_game\n" +
            "GROUP BY c.CustomerID, g.GameName\n" +
            "ORDER BY MaxWinnings DESC\n" +
            "LIMIT 1;\n" +
            "END;";

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "Gracie0008")) {
            
            try (Statement statement = connection.createStatement()) {
                
                statement.execute(createProcedureSQL);
                System.out.println("Stored procedure 'top_winner_per_game' created successfully.");
                
                String callProcedure1 = "{CALL top_winner_per_game(?)}";

                try (CallableStatement callStatement = connection.prepareCall(callProcedure1)) {
                    callStatement.setString(1, "Mega Jackpot Slots"); // PUT GAME NAME HERE <---------
                    try (ResultSet resultSet = callStatement.executeQuery()) {
                        while (resultSet.next()) {
                            
                            System.out.printf("CustomerID: %d, Name: %s %s, MaxWinnings: %.2f, Game: %s%n",
                                resultSet.getInt("CustomerID"),
                                resultSet.getString("FirstName"),
                                resultSet.getString("LastName"),
                                resultSet.getDouble("MaxWinnings"),
                                resultSet.getString("GameName")
                            );
                        }
                    }
                }

            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        // 3: this is a stored procedure- Say we want to ban all previous players of a game to give new players spots to play
        // We can ban everyone that has played that game
        // All we have to do is input the game, and everyone thats played the game before gets banned
        
        String gameName = "Poker Classic"; // Put the game name here, and after running it, everyone that has played this games gets banned

        
        String createProcedureSQL1 = 
        	    "CREATE PROCEDURE ban_all_users_in_game(IN game_name VARCHAR(45)) " +
        	    "BEGIN " +
        	    "UPDATE customers c " +
        	    "JOIN PlayedGames p ON c.CustomerID = p.CustomerID " +
        	    "JOIN Games g ON p.GameID = g.GameID " +
        	    "SET c.banned = TRUE " +
        	    "WHERE g.GameName = game_name; " +
        	    "COMMIT; " +
        	    "END;";
        String callProcedure1 = "{call ban_all_users_in_game(?)}";

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "Gracie0008")) {
            try (Statement stmt = conn.createStatement()) {
                stmt.execute(createProcedureSQL1);
                System.out.println("Stored procedure created successfully.");
            }
            try (CallableStatement stmt = conn.prepareCall(callProcedure1)) {
                stmt.setString(1, gameName);        
                stmt.execute();
                System.out.println("Stored procedure executed successfully!");
            }
            try (Statement stmt2 = conn.createStatement()) {
                String countSQL = "SELECT COUNT(*) FROM customers c " +
                                  "JOIN PlayedGames p ON c.CustomerID = p.CustomerID " +
                                  "JOIN Games g ON p.GameID = g.GameID " +
                                  "WHERE g.GameName = '" + gameName + "' AND c.banned = TRUE";
                ResultSet rs = stmt2.executeQuery(countSQL);
                if (rs.next()) {
                    int bannedCount = rs.getInt(1);
                    System.out.println(bannedCount + " users were banned from the game: " + gameName);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace(); 
        }
   
    }
    
    
}


