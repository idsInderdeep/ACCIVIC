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
    String DID = (String)s.getAttribute("tid");
    String PID = request.getParameter("pin");
    //out.println(PID);
%>

<%
    String image="images/";
                
      
      try{
            
          Connections c = new Connections();
          PreparedStatement stmt = c.con.prepareStatement("Select PATH from images where id = ? ");
          
          stmt.setString(1,PID);// o.getId());
          
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

  <%        
         ResultSet rs=null;
          try{
          Connections c = new Connections();
          PreparedStatement stmt = c.con.prepareStatement("Select * from patientinfo where pid = ? ");
          stmt.setString(1, PID);
          
          rs = stmt.executeQuery();
          
          }catch(Exception e)
          {
              out.println(e.toString());
          }
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
   
  
<div class="container-fluid text-center" style="margin-top:0%;">    
 
 <div class="row content">
   
 <!-- PERMANENT SIDE NAVIGATION -->    
   <div class="col-sm-2 sidenav " style="background-color:#b2b2b2;">

    <div class="list-group" >
        <a href="t_blog.jsp" class="list-group-item" >My Account</a>
        <a href="P_Account.jsp" class="list-group-item" style="background-color:#8cd1ff">Create Patient Account</a>
        <a href="patient2.jsp" class="list-group-item">Update Medical Record</a>
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
    
  <h1>Patient Medical Record</h1>
      <hr>
 
  <div class="col-sm-3">
      <img src="<%out.println(image);%>" class="img-circle" alt="Cinque Terre" width="200" height="200">
    </div>   
  <!-- SEARCH PANEL -->
   <div id="scanbox"  style="display:inline">     
      <div class="form-group">
          
          <%
              while(rs.next())
              {
                  %>
                         
          
      </div>
 
 <div class="" style="margin-left:40%;width:100%">      
     <h4>Patient ID : <strong><%out.println(rs.getString(1));%></strong></h4>
     <h4>Name :<strong><%out.println(rs.getString(2));%></strong></h4> 
      <h4>Gender : <strong><%out.println(rs.getString(3));%></strong></h4>
     <h4>Email : <strong><%out.println(rs.getString(4));%></strong></h4>
      <h4>Address : <strong><%out.println(rs.getString(5));%></strong></h4>
     <h4>Mobile Number : <strong><%out.println(rs.getString(6));%></strong></h4>
      <h4>Mother's Name : <strong><%out.println(rs.getString(7));%></strong></h4>
     <h4>Mother's Mobile Number : <strong><%out.println(rs.getString(8));%></strong></h4>
      <h4>Father's Name : <strong><%out.println(rs.getString(9));%></strong></h4>
     <h4>Father's Mobile Number: <strong><%out.println(rs.getString(10));%></strong></h4>

  </div>
</div> 
       <%    
              }
          %>  
  
  <!-- FORM-->
   
<div class="container" >
  <h2>Medical Record</h2>
  <p>_________________________________________</p>         
  <table class="table table-bordered" style="margin:0%">
    <thead>
      <tr>
        <th>Blood Group</th>
        <th>Blood Glucose</th>
        <th>Thyroid</th>
        <th>Allergy</th>
        <th>Uric Acid</th>
        <th>Temperature</th>
        <th>Disease/Injury</th>
        <th>Doctor's Prescription</th>
        <th>Physically Disabled</th>
        <th>Others</th>
        <th>Doctor</th>
      </tr>
    </thead>
    <tbody>

       <%
          ResultSet rst=null;
          try{
          Connections c = new Connections();
          PreparedStatement stmt = c.con.prepareStatement("Select * from MedicalRecord where pid = ? ");
          stmt.setString(1, PID);
          
          rst = stmt.executeQuery();
          
          }catch(Exception e)
          {
              out.println(e.toString());
          }   
       while(rst.next())
       {
           %>
        <tr>   
            <td><%out.println(rst.getString(3));%></td>
        <td><%out.println(rst.getString(4));%></td>
        <td><%out.println(rst.getString(5));%></td>
        <td><%out.println(rst.getString(6));%></td>
        <td><%out.println(rst.getString(7));%></td>
        <td><%out.println(rst.getString(8));%></td>
        <td><%out.println(rst.getString(9));%></td>
        <td><%out.println(rst.getString(10));%></td>
        <td><%out.println(rst.getString(11));%></td>
        <td><%out.println(rst.getString(12));%></td>
        <td><form method="GET" action="Doctor.jsp"><input style="display:none" name="DID" value="<%out.println(rst.getString(2));%>"><button type="submit">Info</button></form></td>
        </tr> 
        <%
       }
       %>   
      
    </tbody>
  </table>
</div>


  

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

