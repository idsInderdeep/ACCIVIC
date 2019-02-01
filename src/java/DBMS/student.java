/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBMS;

import BEANS.signBean;
import java.sql.PreparedStatement;

/**
 *
 * @author Inderdeep
 */
public class student {
     public String insert(signBean user)
  {
        String n=null;
  try{  
 Connections c = new Connections();
 String sql="Insert into user values(?,?,?,?,?)";
 PreparedStatement stmt = c.con.prepareStatement(sql);
 

 
  String name = user.getName();
  String email=user.getEmail();
  String pwd=user.getPassword();
  String cpwd=user.getId();
  String prof = user.getProf();
  
 n=pwd;
  
 stmt.setString(1,pwd);
 stmt.setString(2,email);
 stmt.setString(3,cpwd);
 stmt.setString(4,name);
 stmt.setString(5,prof);
 
 stmt.executeUpdate();
 
 //System.out.println( user.getName());
 
  }catch(Exception e)
  {
      e.printStackTrace();
     return(e.toString());

  }

  
   return null;
    }
    
     
     
}
