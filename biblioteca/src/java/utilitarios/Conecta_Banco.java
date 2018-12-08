package utilitarios;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Ig0r
 */
public class Conecta_Banco {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/";
    
    static final String USER = "root";
    static final String PASS = "";
    
    Connection conn = null;
    
    public Connection conectaMysql(String banco) throws SQLException{
    
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try {
            conn = DriverManager.getConnection(DB_URL+banco, USER, PASS);
            } catch (SQLException ex) {
                Logger.getLogger(Conecta_Banco.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Conecta_Banco.class.getName()).log(Level.SEVERE, null, ex);
        }
    
        return conn;
    }
}
