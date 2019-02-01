<%-- 
    Document   : t_blog
    Created on : 26 Jul, 2018, 1:15:31 AM
    Author     : Inderdeep
--%>

<%@page import="database.db_Connection"%>
<%@page import="java.sql.*"%>
<%@page import="DBMS.Connections"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header2.html"/>

<%
    HttpSession s = request.getSession();
    String id = (String)request.getParameter("DID");
    out.println();
    String ID=null , qual=null , teachat=null , about=null,name=null,email=null;
    
    try
    {
        String str = "Select * from profile where ID = ?" ;
        String st = "Select * from user where SID = ?" ;
        
        Connections c = new Connections();
        PreparedStatement stmt = c.con.prepareStatement(str);
        PreparedStatement stm = c.con.prepareStatement(st);
        
        stmt.setString(1, id);
        stm.setString(1, id);
        
        ResultSet rs = stmt.executeQuery();
        ResultSet r = stm.executeQuery();
  
       while(rs.next())
       {
         ID = rs.getString("ID");
          qual = rs.getString("qualification");
           teachat = rs.getString("teachat");
            about = rs.getString("about");
        
       }
       
        while(r.next())
       {
         name = r.getString("sNAme");
        
       }
    }catch(Exception e)
    {
        out.println(e.toString());
    }
%>

<%
      String image="images/";
      
      try{
            
          Connections c = new Connections();
          PreparedStatement stmt = c.con.prepareStatement("Select PATH from images where id = ? ");
          
          stmt.setString(1,id);// o.getId());
          
          ResultSet rs = stmt.executeQuery();
          
          if(!rs.next())
          {
              image=image+"user.png";
          }
          else
          {
             image=image+rs.getString("path");
          }
 
      }catch(Exception e)
      {
          out.println(e.toString());e.printStackTrace();
      }
      
    
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>DIDACTICS</title>
  <meta charset="utf-8">
  
  <link rel="stylesheet" href="style.css">
 
  <style>
   
  </style>
</head>

<body >
   
  
<div class="container-fluid text-center" style="margin-top:0%">    
 
 <div class="row content">
   
 <!-- PERMANENT SIDE NAVIGATION -->    
   <div class="col-sm-2 sidenav " style="background-color:#b2b2b2">

    <div class="list-group" >
        <a href="t_blog.jsp" class="list-group-item" style="background-color:#8cd1ff">My Account</a>
        <a href="P_Account.jsp" class="list-group-item">Create Patient Account</a>
        <a href="patient2.jsp" class="list-group-item">Update Patient Account</a>
        <a href="edit.jsp" class="list-group-item">Edit Patient Account</a>
        <!--<a href="#" class="list-group-item">Following</a>
         <a href="#" class="list-group-item">Find</a>-->
    </div>
       
   </div>
  
 
 <!-- CONTENT OF BLOG -->
 
  <div class="col-sm-8 text-left" style="margin-top:1%"> 
     
<div class="container-fluid">

 <div class="row content">
    
     
 <!--PHOTO AND SEARCH 
 
  <div class="col-sm-3 sidenav">
     
      <h4>NAME</h4>
      
      <img src="bird.jpg" class="img-circle" height="60" width="60" alt="Avatar">
      
     <div class="input-group" style="padding-top:5%">
        <input type="text" class="form-control" placeholder="Search Blog..">
        <span class="input-group-btn">
          <button class="btn btn-default" type="button">
            <span class="glyphicon glyphicon-search"></span>
          </button>
        </span>
      </div>
   
  </div> -->
 
 
 <!-- PHOTO AND INTRO -->
 
<!-- COMPLETE BODY  -->
    <div class="col-sm-12">
    
    <h1>My Account</h1>
     
 
         <hr>
<center>  
     
     <img src="<%=image%>" class="img-circle" height="200" width="200">
     <br><br>
     <p><strong style="color: red"><%=name%></strong></p>
     <p><strong>QUALIFICATION:</strong><br><%=qual%></p>
     <p><strong>Clinic/Hospital Address:</strong><br><%=teachat%></p>
     <p><strong>ABOUT: </strong><br><%=about%></p>
     
   </center> 
 
      
  <hr>
    <!-- SEARCH PANEL -->
   
  <!-- FORM FOR COMMENT -->
  
 
  <br><br>
  
  
  <!-- AREA FOR COMMENTS -->
    
   <p><span class="badge"></span> </p><br>
      
      <div class="row">
       <!--
        <div class="col-sm-10">
          <h4>AcciVic BOT <small>Sep 29, 2015, 9:12 PM</small></h4>
        </div>-->
          
        
          
      </div>
 
    </div>
  
 </div>
</div>

      
    </div>
     
 <!-- ADS FOR DEMO -->     
    <div class="col-sm-2 sidenav" style="background-color:#8cd1ff">
        <div class="well" style="background-color:#white">
            <p style="color:black">AcciVic<br>save lives of people</p>
      </div>
        <div class="well" style="background-color:#white">
            <p style="color:black">Technology to modernize <br>health care system of our country</p>
      </div>
    </div>
  </div>
</div>


<!-- SCRIPT -->
<script>
    var myVar;
var a=0;
var pin;
function control()
{
 alert('Connect Device');   
 alert('Scanning Started ..');
 myVar = setInterval(myTimer, 1000);
 document.getElementById("scan").style.display = "inline";
}
function myTimer() {
  a++;
  if(a==5)
  {
    clearInterval(myVar);
    myStopFunction();
  }
  
}

function myStopFunction() {
  document.getElementById("scan").style.display="none";
  document.getElementById("q").style.display="inline";
  
  if(pin=="001")
  {
      alert('Welcome to AcciVic');
        alert('Please Log In To Continue');
      document.getElementById('scanbox').style.display="none";
       document.getElementById('abc').style.display="none";
      document.getElementById('form').style.display="inline";
  }
  else
  {
      alert('Finger Print not match');
        alert('DONE');
  }
  a=0;
}
function connect()
{
  pin = document.getElementById('pin').value;   
  document.getElementById('abc').style.display="inline";
  window.alert('Take a minute');
  window.alert('Acctivating');
  }
</script>                    
</body>
</html>
