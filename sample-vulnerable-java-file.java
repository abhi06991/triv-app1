import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

public class VulnerableApp {
    
    // Hardcoded credentials (Sensitive data exposure)
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "password123";

    public static void main(String[] args) {
        String userInput = "admin' OR '1'='1";  // SQL injection vulnerability
        
        // Insecure database connection (JDBC without proper sanitization)
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", DB_USER, DB_PASSWORD);
            Statement stmt = conn.createStatement();
            
            // Vulnerable to SQL injection
            String query = "SELECT * FROM users WHERE username = '" + userInput + "'";
            ResultSet rs = stmt.executeQuery(query);
            
            while (rs.next()) {
                System.out.println("User: " + rs.getString("username"));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        // Insecure HTTP connection (No HTTPS)
        try {
            URL url = new URL("http://example.com");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            
            int responseCode = conn.getResponseCode();
            System.out.println("Response Code : " + responseCode);
            
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
