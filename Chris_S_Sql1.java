/*Chris Sotirovski
 * Sql #1
 * 11/29/2025
 */
import java.sql.*;

public class Chris_S_Sql1 {
    public static void main(String[] args) {
/*
-- 1: This is a stored procedure with an input parameter to find banned or unbanned customers.
-- Say we have a promblem where a customer that wants to join our Casino, but they look/sound fimilar 
-- we can simply pull up the records of all the banned customers to see if they are on that list
 * 
 */   // Corrected SQL to create the procedure
        String createProcedure = 
            "CREATE PROCEDURE banned_customers(IN boolean_Banned BOOLEAN) " +
            "BEGIN " +
            "SELECT CustomerID, FirstName, LastName, banned " +
            "FROM customers " +
            "WHERE banned = boolean_Banned; " +
            "END;";

        // I am calling the procedure here
        String callProcedure = "{CALL banned_customers(?)}";
        
        // connecting the database
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
    }
}

