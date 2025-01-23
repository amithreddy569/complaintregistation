<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home- Complaint Management</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>
	<%@ include file="./components/message.jsp"%>

	
	<div class="container-fluid">

   <!-- show products -->
   
   <%
       List<Product> products = productDao.findAll();
       if(products!=null)
       {
   %>
     
     <div class="col-md-12">
         
             <div class="row mt-4">
                 <div class="col-md-12 admin">
                     <div class="card-columns hover">
                     
                         <%
                             for(Product p: products)
                             {
                         %>
                        
                         <div class="card">
                              
                             <div class="card-header text-center">
                                <h2><%=p.getName() %></h2>
                             </div>
                             <div class="card-body">
                                <h5><%=p.getDescription() %></h5>
                             </div>
                             
                             <%
                                if(customer != null ){
                                	
                               
                             %>
                             
                             
                             <div class="card-footer text-center">
                                <a href="raisecomplaint?productId=<%=p.getId()%>"><input type="button" class="btn btn-danger" value="Raise Complaint"></a>    
                             </div>
                             
                             
                             <%
                                }
                             %>
                             
                         </div>
                         
                       
                         <%
                             }
                         %>
                     </div>
                 </div>
             </div>
            
         </div>
         
   <%
       }
   %>
    
         
      <!-- ******* -->
 
   
         
    </div>



</body>
</html>