<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Register</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<div class="container-fluid">
  <div class="row mt-2">
       <div class="col-md-4 offset-md-4 admin" >
            <div class="card">
                <%@ include file="./components/message.jsp"%>
                <div class="card-body px-5">
                    <img src="resources/images/registerphoto.jpeg" class="rounded mx-auto d-block" alt="img" height="90px" width="90px">
                    <h3 class="text-center my-3">Visitor Registration</h3>
            <form action="customerregister" method="post">
            
                 <div class="form-group">
                     <label for="name">First Name</label>
                     <input type="text" class="form-control" id="firstname" aria-describedby="emailHelp" name="firstname" placeholder="Enter first name.." required>
                 </div>
                 
                  <div class="form-group">
                     <label for="name">Last Name</label>
                     <input type="text" class="form-control" id="lastname" aria-describedby="emailHelp" name="lastname" placeholder="Enter last name.." required>
                 </div>
             
          
                 <div class="form-group">
                     <label for="email">User name</label>
                     <input type="text" class="form-control" id="username" aria-describedby="emailHelp" name="username" placeholder="Enter email id.." required>
                 </div>
                 
                 <div class="form-group">
                     <label for="email">Email</label>
                     <input type="email" class="form-control" id="emailid" aria-describedby="emailHelp" name="emailid" placeholder="Enter email id.." required>
                 </div>
           
          
                  <div class="form-group">
                     <label for="email">Mobile</label>
                     <input type="number" class="form-control" id="mobileno" aria-describedby="emailHelp" name="mobileno" placeholder="Enter mobile no.." required>
                 </div>
                 
                  <div class="form-group">
                     <label for="name">Govt Id</label>
                     <input type="text" class="form-control" id="govtid" aria-describedby="emailHelp" name="govtid" placeholder="Enter govtid.." required>
                 </div>
                 
             
                 <div class="form-group">
                     <label for="name">Govt Id Type</label>
                     <input type="text" class="form-control" id="govtidtype" aria-describedby="emailHelp" name="govtidtype" placeholder="Enter govtidtype.." required>
                 </div>
                 
                 <div class="form-group">
                     <label for="email">citizenship</label>
                     <input type="number" class="form-control" id="citizenship" aria-describedby="emailHelp" name="citizenship" placeholder="Enter citizenship.." >
                 </div>
              
                 <div class="form-group">
                    <label for="email">state</label>
                    <input type="number" class="form-control" id="state" aria-describedby="emailHelp" name="state" placeholder="Enter state.." >
                </div>
                <div class="form-group">
                    <label for="email">City</label>
                    <input type="number" class="form-control" id="City" aria-describedby="emailHelp" name="City" placeholder="Enter City.." >
                </div>
<div class="form-group">
                <p>Looking to stay in Kanha?:</p>
  <input type="radio" id="kanha" name="fav_language" value="HTML">
  <label for="html">Yes</label><br>
  <input type="radio" id="kanha" name="fav_language" value="CSS">
  <label for="css">No</label><br>
</div>
<div class="form-group">
    <p>Stay preference options ?:</p>
  <input type="radio" id="stay" name="fav_language" value="HTML">
  <label for="html">East Premium dorm</label><br>
  <input type="radio" id="stay" name="fav_language" value="CSS">
  <label for="css">Permanent tents</label><br>
<input type="radio" id="stay" name="fav_language" value="CSS">
  <label for="css">Pearl</label><br>
<input type="radio" id="stay" name="fav_language" value="CSS">
  <label for="css">Service Appartments</label><br>
</div>
               
                 <div class="form-group">
                     <label for="password">Password</label>
                     <input type="password" class="form-control" id="password" aria-describedby="emailHelp" name="password" placeholder="Enter password.." required>
                     <small id="passwordHelpInline" class="text-muted">
                        Must be 8-20 characters long.
                     </small>
                 </div>
                 
            
                <div class="container text-center">
                      <button class="btn custom-bg text-color"><b>Register</b></button>
                 </div>
                 
            </form>
                </div>
            </div>
           
            
       </div>
  </div>
</div>
</body>
</html>