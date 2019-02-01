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
    String PID = (String)s.getAttribute("PID");
    //out.println(PID);
%>



<!DOCTYPE html>
<html lang="en">
<head>
    <link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
<meta charset=utf-8 />

<!--[if IE]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<style>
  article, aside, figure, footer, header, hgroup, 
  menu, nav, section { display: block; }
</style>
  <title>AcciVic</title>
  <meta charset="utf-8">
  
  <link rel="stylesheet" href="style.css">

</head>

<body >
   
  
<div class="container-fluid text-center" style="margin-top:0%">    
 
 <div class="row content">
   
 <!-- PERMANENT SIDE NAVIGATION -->    
   <div class="col-sm-2 sidenav " style="background-color:#b2b2b2;">

    <div class="list-group" >
        <a href="t_blog.jsp" class="list-group-item" >My Account</a>
        <a href="P_Account.jsp" class="list-group-item" style="background-color:#8cd1ff">Create Patient Account</a>
        <a href="Patient.jsp" class="list-group-item">Update Medical Record</a>
        <a href="follower.jsp" class="list-group-item">Edit Patient Account</a>
        <br>
        <!--<a href="#" class="list-group-item">Following</a>
         <a href="#" class="list-group-item">Find</a>-->
    </div>
       
   </div>

  
 
 <!-- CONTENT OF BLOG -->
 
 <div class="col-sm-8 text-left" style="margin-top:1%"> 
     
<div class="container-fluid">

 <div class="row content">
    
 
 <!-- PHOTO AND INTRO -->
 
 
<!-- COMPLETE BODY  -->
    <div class="col-sm-9">
    
    <h1>Create Patient Account</h1>
    <h4>PAtient ID : <%out.println(PID);%></h4>
      <hr>
  <h4>2. Upload photograph and Finger Scan</h4>
  <hr>
    
  
  <!-- FORM-->
 <form action="Pimage" enctype="multipart/form-data" method="POST"> 
 <!-- BODY --> 
 <div class="col-sm-4" style="margin-left:50%">
 
     
     <!-- Image upload -->
    
   <center>
       <h3>Upload Patient Image</h3>  
      <!-- <img src="images/user.png" id="p" class="img-circle" width="200" height="200" />-->
     <img id="blah" src="#"  class="img-circle" alt="Patient Image" width="200" height="200" />
     <br>
     <input type='file' onchange="readURL(this);" name="image" onclick="a()"/> 
     <br><br>
   </center>
     <hr>
   <!-- SCAN PANEL -->
 <center> 
   <div id="scanbox"  style="display:inline">     
    <center style="width:200px;"> 
      <div class="form-group">
              <h3>Scan Finger Print</h3>  
              <label class="control-label"> Activate Scanner </label>
              <input  type="password"  class="form-control"  placeholder="Activate key" id="pin" required>
              <center>
                <br>   
                <button type="submit" class="btn btn-default align-center" onclick="connect()" >ACTIVATE</button></center>
            
      </div>
        
     </center>   
        </div> 
        <br>
         <!-- SCAN-->
         <div id="abc" style="display:none">
               <button  class="btn btn-default align-center" onclick="setTimeout(control(), 3000);" style="margin-top:10px" id="scanb">Scan</button>
              <br>
              <div class="col-sm-10" style="margin-top:10px;display:none;" id="scan" >
               <img src="images/scan.gif" width="200" height="100">          
              </div>
              <p id="q" style="display:none" >scan complete</p>
              <br>
           </div>
       
  </center>  
     <button type="submit" style="margin-left:10%;margin-bottom:10%" class="form-control">UPLOAD </button>
     <hr>
 </div>    
 
 </form>
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
    <div class="col-sm-2 sidenav" style="background-color:#8cd1ff;">
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

function a(){document.getElementById('p').style.display='none';window.alert('jj');}
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
  function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah')
                    .attr('src', e.target.result)
                    .width(150)
                    .height(200);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>                    
</body>
</html>

