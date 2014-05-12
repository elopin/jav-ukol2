/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ukol3.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Třída zajišťující spojení s databází.
 * 
 * @author Lukáš Janáček
 */
public class ConnectionProvider {
    private final String DRIVER = "com.mysql.jdbc.Driver";
    private final String dbUrl = "jdbc:mysql://project.iivos.cz:9906/iivos3Dalfa?characterEncoding=utf8";
    private final String LOGIN = "janacek";
    private final String PASSWORD = "Lukas.Janacek";
    
    private static Connection connection;
    
    public ConnectionProvider() {
        try {
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(dbUrl,LOGIN, PASSWORD);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ConnectionProvider.class.getName()).log(Level.SEVERE, null, ex);
        } 
                
    }
    
    /**
     * Vrací spojení do databáze.
     * @return 
     */
    public Connection getConnection() {
        return connection;
    }
}
