<%-- 
    Document   : login
    Created on : 25 Jul, 2018, 1:50:04 AM
    Author     : Inderdeep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.html" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AcciVic</title>
    </head>
    
    <body>
    
        <div class="container-fluid " style="margin-left:40%">  
       
        <div class="col-sm-3"></div>
        
     <div class="form-group ">
      <h1> Log In</h1>
   
      </div>
   
        
   <div id="scanbox"  style="display:inline">     
    <center style="width:200px;"> 
      <div class="form-group">
              <label class="control-label"> Activate Scanner </label>
              <input  type="password"  class="form-control"  placeholder="PIN" id="pin" required>
              <center>
                <br>   
                <button type="submit" class="btn btn-default align-center" onclick="connect()" >ACTIVATE</button></center>
            
      </div>
        
     </center>   
        </div> 
        
         <!-- SCAN-->
         <div id="abc" style="display:none">
               <button  class="btn btn-default align-center" onclick="setTimeout(control(), 3000);" style="margin-top:10px" id="scanb">Scan</button>
              
              <div class="col-sm-10" style="margin-top:10px;display:none;" id="scan" >
               <img src="images/scan.gif" width="200" height="100">          
              </div>
              <p id="q" style="display:none" >scan complete</p>
           </div>

         <!-- PATIENT PIN -->
         
         
            
        <!-- FORM -->
   <form class="form-horizontal" action="Login" method="POST" id="form" style="display:none">
         
   
    <div class="col-sm-6 ">   
   
         
      <div class="form-group">
          
            <label class="control-label"> Email : </label>
            <input type="text" class="form-control"  placeholder="Enter your Email" name="email" required>
     
            <label class="control-label"> Password : </label>
            <input type="password" class="form-control"  placeholder="Enter your Password" name="password" required>
          
      </div>
        
            <center>
                <button type="submit" class="btn btn-default align-center">CONFIRM</button></center>
    </div>  
      
    <div class="form-group">
      
    </div>
  
   </form>     
   </div>     
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
  alert('Acctivating');
  }
</script>


         
    </body>

</html>
