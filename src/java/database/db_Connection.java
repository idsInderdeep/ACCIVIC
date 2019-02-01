/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * 
 * @author Inderdeep
 */
public class db_Connection {
     public Connection Connection()
    {
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/didactics?","root","");
    
            
            return con;
        } catch (ClassNotFoundException | SQLException ex) {Logger.getLogger(db_Connection.class.getName()).log(Level.SEVERE, null, ex);}
        return null;
    }
}
