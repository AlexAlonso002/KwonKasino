/*Chris Sotirovski
 * Sql #2
 * 11/29/2025
 */
//-- 2: Find out who won the most amount of money on each game by inputing the game in the parameter 
//-- this way, we can see if that player is taking too much money from us and then we will have the choice to ban them
//-- because if they are winning more than what they are spending, we are losing money, which is bad
//-- we have the right to ban anyone we want without notice or explanation 

import java.sql.*;

public class Chris_S_Sql2 {

	public static void main(String[] args) {
		Connection conn ;


        // SQL to create the stored procedure
        String createProcedureSQL = 
            "CREATE PROCEDURE top_winner_per_game(IN name_of_game VARCHAR(45))\n" +
            "BEGIN\n" +
            "    SELECT c.CustomerID, c.FirstName, c.LastName, MAX(p.cashout) AS MaxWinnings, g.GameName\n" +
            "    FROM PlayedGames p\n" +
            "    JOIN Games g ON p.GameID = g.GameID\n" +
            "    JOIN Customers c ON p.CustomerID = c.CustomerID\n" +
            "    WHERE g.GameName = name_of_game\n" +
            "    GROUP BY c.CustomerID, g.GameName\n" +
            "    ORDER BY MaxWinnings DESC\n" +
            "    LIMIT 1;\n" +
            "END;";

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "Gracie0008")) {
            
            try (Statement statement = connection.createStatement()) {
                
                statement.execute(createProcedureSQL);
                System.out.println("Stored procedure 'top_winner_per_game' created successfully.");
                
                String callProcedure = "{CALL top_winner_per_game(?)}";

                try (CallableStatement callStatement = connection.prepareCall(callProcedure)) {
                    callStatement.setString(1, "Mega Jackpot Slots"); // PUT GAME NAME HERE
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
            e.printStackTrace(); // Log any SQL errors
        }
    }
}
