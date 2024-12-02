/*Chris Sotirovski
 * Sql #3
 * 11/29/2025
 * 
 * 
*-- Say there people are cheating in a particular game
*-- We can ban everyone that is playing that game
*-- All we have to do is input the game, and everyone thats in the game gets banned
*-- We only run this code when we know for certain that everyone in that particular game is cheating
 */


import java.sql.*;

public class Chris_S_Sql3 {

	public static void main(String[] args) {
		
        String gameName = "Poker Classic"; // Put the game name here, and after running it, everyone that is playing this games gets banned

        // SQL for creating the stored procedure
        String createProcedureSQL = 
        	    "CREATE PROCEDURE ban_all_users_in_game(IN game_name VARCHAR(45)) " +
        	    "BEGIN " +
        	    "    UPDATE customers c " +
        	    "    JOIN PlayedGames p ON c.CustomerID = p.CustomerID " +
        	    "    JOIN Games g ON p.GameID = g.GameID " +
        	    "    SET c.banned = TRUE " +
        	    "    WHERE g.GameName = game_name; " +
        	    "    COMMIT; " +
        	    "END;";

        // SQL to call the stored procedure
        String callProcedure = "{call ban_all_users_in_game(?)}";

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "Gracie0008")) {
            
            // Step 1: Create the stored procedure
            try (Statement stmt = conn.createStatement()) {
                stmt.execute(createProcedureSQL);
                System.out.println("Stored procedure created successfully.");
            }

            // Step 2: Call the stored procedure
            try (CallableStatement stmt = conn.prepareCall(callProcedure)) {
                // Set the input parameter for the stored procedure
                stmt.setString(1, gameName);

                // Execute the stored procedure
                stmt.execute();
                System.out.println("Stored procedure executed successfully!");
            }
            
            // Step 3: Print out the number of affected rows (banned users)
            try (Statement stmt2 = conn.createStatement()) {
                // Get the count of banned users
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
            e.printStackTrace(); // Log any SQL errors
        }
    }
}