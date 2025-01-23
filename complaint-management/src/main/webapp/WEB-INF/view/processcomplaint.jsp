<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Process Complaint</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<%@ include file="./components/message.jsp"%>

<%
   Complaints cmpls = (Complaints)request.getAttribute("complaint");
    Optional<Product> optional = productDao.findById(cmpls.getProductId());
   Product p = optional.get();
   
   Optional<Customer> optional3 = customerDao.findById(cmpls.getCustomerId());
		Customer c = optional3.get();
 %>

<div class="col-md-4 offset-md-4 admin" >
            <div class="card">
                <div class="card-body px-5">
                    <h3 class="text-center my-3">Assign Complaint</h3>
            <form action="processcomplaint" method="post">
            <input type="hidden" name="complaintId" value="<%=cmpls.getId()%>">
                  <div class="form-group">
                     <label for="password">Reference Id</label>
                     <input type="text" class="form-control" id="password" aria-describedby="emailHelp" name="referenceId" value="<%= cmpls.getReferenceId()%>" required>
                 </div>
                 
                 <div class="form-group">
                     <label for="password">Product Name</label>
                     <input type="text" class="form-control" id="password" aria-describedby="emailHelp" name="name" value="<%= p.getName()%>" required>
                 </div>
                 
                 <div class="form-group">
                    <label for="email">Complaints</label>
                   <textarea style="height:150px" class="form-control" name="complaint" required><%=cmpls.getComplaint() %></textarea>
               </div>
                 
                 <div class="form-group">
                    <label for="email">Response</label>
                   <textarea style="height:150px" class="form-control" name="response" placeholder="Enter Response here" required></textarea>
               </div>
               
               <div class="form-group">
                   <select name="status" class="form-control">
                       <option value="0">Update Status</option>
                       <%
                           for(Constants.ComplaintStatus statuses : Constants.ComplaintStatus.values())
                           {
                       %>
                       <option value="<%=statuses.value()%>"><%=statuses.value() %></option>
                       <%
                           }
                       %>
                   </select>
               </div>
              
                <div class="container text-center">
                      <button class="btn custom-bg text-color"><b>Process Complaint</b></button>
                </div>
                 
            </form>
                </div>
            </div>
           
            
       </div>

</body>
</html>