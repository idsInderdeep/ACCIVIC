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
    String id = (String)s.getAttribute("tid");
    
%>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>AcciVic</title>
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
        <a href="follower.jsp" class="list-group-item">Edit Patient Account</a>
        <!--<a href="#" class="list-group-item">Following</a>
         <a href="#" class="list-group-item">Find</a>-->
    </div>
       
   </div>
  
 
 <!-- CONTENT OF BLOG -->
 
  <div class="col-sm-8 text-left" style="margin-top:1%"> 
     
<div class="container-fluid">

 <div class="row content">
   
 
 
 
 
<!-- COMPLETE BODY  -->
    <div class="col-sm-9">
    
    <h1>Edit Patient Information</h1>
      <hr>

      
  <h4>Search Patient Information</h4>
  <hr>
    <!-- SEARCH PANEL -->
 <center> 
   <div id="scanbox"  style="display:inline">     
    <center style="width:200px;"> 
      <div class="form-group">
              <label class="control-label"> Activate Scanner </label>
              <input  type="password"  class="form-control"  placeholder="Activate key" id="pin" required>
              <center>
                <br>   
                <button type="submit" class="btn btn-default align-center" onclick="connect()" >ACTIVATE</button></center>
            
      </div>
        
     </center>   
        </div> 
        
         <!-- SCAN-->
         <div id="abc" style="display:none">
               <button  class="btn btn-default align-center" onclick="setTimeout(control(), 3000);" style="margin-top:10px" id="scanb">Scan</button>
              <br>
              <div class="col-sm-10" style="margin-top:10px;display:none;" id="scan" >
               <img src="images/scan.gif" width="200" height="100">          
              </div>
              <p id="q" style="display:none" >scan complete</p>
           </div>
         
         <form id="form" style="display:none" action="edit1.jsp"> 
          <div class="form-group" >
              <label class="control-label"> Enter Authentication Key </label>
              <input  style="width:20%" type="password"  class="form-control"  placeholder="PIN" name="pin" required>
              <center>
                <br>   
                <button type="submit" class="btn btn-default align-center"  >Search</button></center>   
          </div>
        </form>    
  </center>
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
