<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assigned Complaints</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<%@ include file="./components/message.jsp"%>

<div class="table-responsive mt-5">
          <table class="table">
  <thead class="custom-bg text-color">
    <tr>
      <th scope="col">Complaint Id</th>
      <th scope="col">Reference Id</th>
      <th scope="col">Product Name</th>
      <th scope="col">Complaint</th>
      <th scope="col">Complaint Status</th>
      <th scope="col">Customer Name</th>
      <th scope="col">Complaint Response</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  
   <%
   List<Complaints> cmps = complaintsDao.findByProductHandlerId(productHandler.getId());
  
    %>
  <tbody>
     <%
     
     if(cmps != null) {
      for(Complaints  com :cmps)
      {
    	 Optional<Product> optional1 = productDao.findById(com.getProductId());
  		 Product p = optional1.get();
  		 
  		Optional<Customer> optional3 = customerDao.findById(com.getCustomerId());
  		Customer c = optional3.get();
  		  
  		 Optional<ProductHandler> optional2 = productHandlerDao.findById(com.getProductHandlerId());
  		 ProductHandler ph=null;
  		 if(optional2.isPresent()){
  			ph = optional2.get();
  		 }
  		  
    %>
    <tr>
      <th scope="row" class="mid-align"><%=com.getId() %></th>
      <td class="mid-align"><%=com.getReferenceId() %></td>
      <td class="mid-align"><%=p.getName() %></td>
      <td class="mid-align"><%=com.getComplaint() %></td>
      <td class="mid-align"><%=com.getStatus()%></td>
      <td class="mid-align"><%  if(c != null){ %><%=c.getFirstname() %> <% } %></td>
      <td class="mid-align"><%if(com.getResponse() != null){ %><%=com.getResponse()%><% } %></td>
      <td><a href="processcomplaint?complaintId=<%=com.getId()%>"><input type="button" class="btn btn-danger" value="Process Complaint"></a></td>    
      
    </tr>
    <%
      }
     }
    %>
  </tbody>
   
</table>
   </div>


</body>
</html>