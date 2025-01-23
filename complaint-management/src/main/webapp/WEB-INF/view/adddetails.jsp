<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Details</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
 <div class="col-md-4 offset-md-4 admin" >
            <div class="card mt-5">
                <%@ include file="./components/message.jsp"%>
                <div class="card-body px-5">
                    <img src="resources/images/registerphoto.jpeg" class="rounded mx-auto d-block" alt="img" height="90px" width="90px">
                    <h3 class="text-center my-3">Add Details</h3>
            <form action="adddetails" method="post">
                 <div class="form-group">
                     <label for="email">Reference Id</label>
                     <input type="text" class="form-control" id="username" aria-describedby="emailHelp" name="referenceId" placeholder="Enter email id.." required>
                 </div>
              
                 <div class="form-group">
                    <label for="email">Details</label>
                   <textarea style="height:150px" class="form-control" name="detail" placeholder="Enter Details here" required></textarea>
               </div>
        
                <div class="container text-center">
                      <button class="btn custom-bg text-color"><b>Add Detail</b></button>
                </div>
                 
            </form>
                </div>
            </div>
           
            
       </div>

</body>
</html>