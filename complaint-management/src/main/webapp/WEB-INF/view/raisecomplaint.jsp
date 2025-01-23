<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Raise Complaint</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<%@ include file="./components/message.jsp"%>
<%
    String productId = (String)request.getAttribute("productId");
    int id = Integer.parseInt(productId);
%>

<div class="col-md-4 offset-md-4 admin" >
            <div class="card">
                <div class="card-body px-5">
                    <h3 class="text-center my-3">Raise Complaint</h3>
            <form action="raisecomplaint" method="post">
                 <input type="hidden" name="customerId" value="<%=customer.getId()%>">
            
                 <div class="form-group">
                     <label for="name">Product Id</label>
                     <input type="number" class="form-control" aria-describedby="emailHelp" name="productId" value="<%=id %>" required readonly>
                 </div>
                 
                  <div class="form-group">
                   <textarea style="height:150px" class="form-control" name="complaint" required placeholder="Enter Complaint."></textarea>
                  </div>
             
                <div class="container text-center">
                      <button class="btn custom-bg text-color"><b>Register</b></button>
                 </div>
                 
            </form>
                </div>
            </div>
                       
       </div>

</body>
</html>