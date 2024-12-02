import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;

public class AgustinSQL {

    public static void main(String[] args) {
        // Database connection details
        String url = "jdbc:mysql://localhost:3306/Project"; 
        String user = "root";
        String password = "ChelseaFC012603";

        try (Connection conn = DriverManager.getConnection(url, user, password);
             Statement stmt = conn.createStatement()) {

            System.out.println("Database connection established.");

            // 1. Create a view: gameplayeddetails
            String createViewGamePlayedDetails = """
                CREATE VIEW gameplayeddetails AS
                SELECT 
                    pg.gameid,
                    g.gamename,
                    SUM(pg.bet) AS totalbet,
                    SUM(pg.cashout) AS totalcashout
                FROM 
                    playedgames pg
                JOIN 
                    games g ON pg.gameid = g.gameid
                GROUP BY 
                    pg.gameid, g.gamename;
            """;
            stmt.execute(createViewGamePlayedDetails);
            System.out.println("View 'gameplayeddetails' created successfully.");

         // Create a function: calculaterevenue
            String createFunctionCalculateRevenue = """
                CREATE FUNCTION calculaterevenue(game_id INT)
                RETURNS DECIMAL(10, 2)
                DETERMINISTIC
                BEGIN
                    DECLARE revenue DECIMAL(10, 2);
                    SELECT 
                        (totalbet - totalcashout) INTO revenue
                    FROM 
                        gameplayeddetails
                    WHERE 
                        gameid = game_id;
                    RETURN revenue;
                END;
            """;
            stmt.execute(createFunctionCalculateRevenue);
            System.out.println("Function 'calculaterevenue' created successfully.");

            // 3. Query to get revenue for all games
            String queryRevenueForGames = """
                SELECT 
                    g.gamename,
                    calculaterevenue(g.gameid) AS revenue
                FROM 
                    games g
                ORDER BY 
                    revenue DESC;
            """;
            try (ResultSet rs = stmt.executeQuery(queryRevenueForGames)) {
                System.out.println("Revenue for all games:");
                System.out.println();
                while (rs.next()) {
                    String gameName = rs.getString("gamename");
                    double revenue = rs.getDouble("revenue");
                    System.out.printf("Game: %s, Revenue: %.2f%n", gameName, revenue);
                }
            }

         // 4. Create a stored procedure: gettopemployeebytickets
            String createProcedureTopEmployeeByTickets = """
                CREATE PROCEDURE gettopemployeebytickets()
                BEGIN
                    CREATE TEMPORARY TABLE topemployeetickets AS
                    SELECT 
                        ga.areaname,
                        CONCAT(e.firstname, ' ', e.lastname) AS employeename,
                        COUNT(st.ticketid) AS ticketsresolved
                    FROM 
                        support_tickets st
                    JOIN 
                        employees e ON st.employeehelper = e.employeeid
                    JOIN 
                        gamearea ga ON e.areaid = ga.areaid
                    GROUP BY 
                        ga.areaname, e.employeeid
                    ORDER BY 
                        ticketsresolved DESC;

                    SELECT * FROM topemployeetickets;
                END;
            """;
            stmt.execute(createProcedureTopEmployeeByTickets);
            System.out.println("Procedure 'gettopemployeebytickets' created successfully.");

            // 5. Call the procedure
            String callProcedure = "CALL gettopemployeebytickets();";
            try (ResultSet rs = stmt.executeQuery(callProcedure)) {
                System.out.println("Top employees by tickets resolved:");
                System.out.println();
                while (rs.next()) {
                    String areaName = rs.getString("areaname");
                    String employeeName = rs.getString("employeename");
                    int ticketsResolved = rs.getInt("ticketsresolved");
                    System.out.printf("Area: %s, Employee: %s, Tickets Resolved: %d%n",
                    		areaName, employeeName, ticketsResolved);
                }
            }

            // 6. Create a view: highstakesbets
            String createViewHighStakesBets = """
                CREATE VIEW highstakesbets AS
                SELECT 
                    pg.customerid,
                    pg.gameid,
                    pg.bet,
                    pg.cashout,
                    c.firstname,
                    c.lastname,
                    g.gamename
                FROM 
                    playedgames pg
                JOIN 
                    customers c ON pg.customerid = c.customerid
                JOIN 
                    games g ON pg.gameid = g.gameid
                WHERE 
                    pg.bet > 500;
            """;
            stmt.execute(createViewHighStakesBets);
            System.out.println("View 'highstakesbets' created successfully.");

            // 7. Query high-stakes customers and their game history
            String queryHighStakesCustomers = """
                SELECT 
                    hs.firstname,
                    hs.lastname,
                    hs.gamename,
                    hs.bet,
                    hs.cashout,
                    (hs.cashout - hs.bet) AS netprofit
                FROM 
                    highstakesbets hs
                ORDER BY 
                    netprofit DESC;
            """;
            try (ResultSet rs = stmt.executeQuery(queryHighStakesCustomers)) {
                System.out.println("High-stakes customers and their game history:");
                System.out.println();
                while (rs.next()) {
                    String firstName = rs.getString("firstname");
                    String lastName = rs.getString("lastname");
                    String gameName = rs.getString("gamename");
                    double bet = rs.getDouble("bet");
                    double cashout = rs.getDouble("cashout");
                    double netProfit = rs.getDouble("netprofit");
                    System.out.printf("Customer: %s %s, Game: %s, Bet: %.2f, Cashout: %.2f, Net Profit: %.2f%n",
                        firstName, lastName, gameName, bet, cashout, netProfit);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
