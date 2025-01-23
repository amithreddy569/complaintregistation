<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assign Complaint</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<%@ include file="./components/message.jsp"%>

<%
   Complaints cmp = (Complaints)request.getAttribute("complaint");
    Optional<Product> optional = productDao.findById(cmp.getProductId());
   Product p = optional.get();
 %>

<div class="col-md-4 offset-md-4 admin" >
            <div class="card">
                <div class="card-body px-5">
                    <h3 class="text-center my-3">Assign Complaint</h3>
            <form action="assigncomplaint" method="post">
                  <div class="form-group">
                     <label for="password">Reference Id</label>
                     <input type="text" class="form-control" id="password" aria-describedby="emailHelp" name="referenceId" value="<%= cmp.getReferenceId()%>" required>
                 </div>
                 
                 <div class="form-group">
                     <label for="password">Product Name</label>
                     <input type="text" class="form-control" id="password" aria-describedby="emailHelp" name="name" value="<%= p.getName()%>" required>
                 </div>
                 
                 <div class="form-group">
                    <label for="email">Complaints</label>
                   <textarea style="height:150px" class="form-control" name="complaint" required><%=cmp.getComplaint() %></textarea>
               </div>
            
                 <div class="form-group">
                     <label for="email">Product Handler Id</label>
                     <input type="number" class="form-control" id="username" aria-describedby="emailHelp" name="handlerId" placeholder="Enter Product handler id.." required>
                 </div>
              
                <div class="container text-center">
                      <button class="btn custom-bg text-color"><b>Assign Complaint</b></button>
                </div>
                 
            </form>
                </div>
            </div>
           
            
       </div>


</body>
</html>