<%@ page import ="com.complaintmanagement.model.*"%>
<%@ page import ="com.complaintmanagement.dao.*"%>
<%@ page import ="com.complaintmanagement.constants.*"%>
<%@ page import ="org.springframework.context.ApplicationContext"%>
<%@ page import ="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>


<%

String userType=(String)session.getAttribute("user-type");
Admin admin = null;
Customer customer = null ;
ProductAdmin productAdmin = null;
ProductHandler productHandler = null;

if(userType != null && userType.equals("admin")){
	 admin = (Admin) session.getAttribute("active-user");
}

else if(userType != null && userType.equals("customer")){
	 customer= (Customer)session.getAttribute("active-user");
}

else if(userType != null && userType.equals("productAdmin")){
	 productAdmin= (ProductAdmin)session.getAttribute("active-user");
}

else if(userType != null && userType.equals("productHandler")){
	 productHandler= (ProductHandler)session.getAttribute("active-user");
}

ApplicationContext context =  WebApplicationContextUtils.getWebApplicationContext(getServletContext());
AdminDao adminDao = context.getBean(AdminDao.class);
ProductDao productDao = context.getBean(ProductDao.class);
ProductHandlerDao productHandlerDao = context.getBean(ProductHandlerDao.class);
ProductAdminDao productAdminDao =context.getBean(ProductAdminDao.class);
ComplaintsDao complaintsDao =context.getBean(ComplaintsDao.class);
CustomerDao customerDao =context.getBean(CustomerDao.class);
      
%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">

<div class="container-fluid">
  <a class="navbar-brand" href="/"><h3 class="text-color"><i>heartfulness</i></h3></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
    
    
    <%
        	 if(userType != null && userType.equals("admin"))
        	 {
    %>
                 <li class="nav-item active">
                    <a class="nav-link" href="admindashboard"><b class="text-color">Admin Dashboard</b> <span class="sr-only">(current)</span></a>
                 </li>
    <%
        	 }
    %>
     
      
      <li class="nav-item active text-color ml-2" data-toggle="modal" data-target=".aboutusmodal">
          <div class="nav-link" ><b class="text-color">About us</b></div>
      </li>
      
      <li class="nav-item active text-color ml-2" data-toggle="modal" data-target=".contactusmodal">
          <div class="nav-link" ><b class="text-color">Contact us</b></div>
      </li>
     
    </ul>
    
        <%
           if(userType != null) {
        %>
          <ul class="navbar-nav ml-auto">
              
              <%
                  if(userType.equals("customer"))
                  {	  
              %>
                     <li class="nav-item active" data-toggle="modal" data-target=".mycomplaints">
                        <div class="nav-link text-color">My Complaints</div>
                     </li> 
                     
                     <li class="nav-item active text-color">
                        <a class="nav-link" href="mycomplaintstatus"><b class="text-color">Check Complaint Status</b></a>
                     </li>
                     
                     <li class="nav-item active text-color">
                        <a class="nav-link" href="adddetails"><b class="text-color">Add details</b></a>
                     </li>
                     
                     <li class="nav-item active" data-toggle="modal" data-target=".customerchange">
                        <div class="nav-link text-color">Change Password</div>
                     </li> 
                     
              <%
                  }
             %> 
             
             <%
                  if(userType.equals("admin"))
                  {	  
              %>
                     
                     <li class="nav-item active" data-toggle="modal" data-target=".adminchange">
                        <div class="nav-link text-color">Change Password</div>
                     </li> 
                     
              <%
                  }
             %> 
             
             <%
                  if(userType.equals("productHandler"))
                  {	  
              %>
              
                    <li class="nav-item active">
                     <a class="nav-link" href="assignedcomplaints"><b class="text-color">Assigned Complaints</b></a>
                     </li>
                     
              <%
                  }
             %>
             
             <%
                  if(userType.equals("productAdmin"))
                  {	  
              %>
                     <li class="nav-item active">
                     <a class="nav-link" href="totalcomplaints"><b class="text-color">Total Complaints</b></a>
                     </li> 
                    
                     
                     <li class="nav-item active" data-toggle="modal" data-target=".addproduct">
                        <div class="nav-link text-color">Add Product</div>
                     </li> 
                     
              <%
                  }
             %>  
                  
              <li class="nav-item active text-color">
               <div class="nav-link" data-toggle="modal" data-target=".changepasswordmodal"><b>change password</b></div>
             </li>
             
             <li class="nav-item active text-color" data-toggle="modal" data-target=".logout-modal">
               <a class="nav-link" href="#" ><b>Logout</b></a>
             </li> 
              
               
              </ul>   
              <%
             
           }     
              
                    
        else
        {
    %>
      <ul class="navbar-nav ml-auto text-color">
    
      <li class="nav-item active text-color">
        <a class="nav-link" href="/registerpage"><b class="text-color">Register</b></a>
      </li>  
      
      <li class="nav-item text-color active">
        <a class="nav-link" href="/loginpage"><b class="text-color">Login</b></a>
      </li>    
    </ul>
    
    <%
        }
    %>     
    
  </div>
  </div>
</nav>


<!-- add product modal -->
     
<div class="modal fade addproduct" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLongTitle" >Add Product details.</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="addproduct" method="post">
               <div class="form-group">
                   <input type="text" class="form-control" name="name" placeholder="Enter Product Title here" required>
               </div>
               
               <div class="form-group">
                   <textarea style="height:150px" class="form-control" name="description" placeholder="Enter Product Description here" required></textarea>
               </div>
               
               <div class="form-group">
                   <input type="text" class="form-control" name="scheme" placeholder="Enter Product Scheme here" required>
               </div>
              
               <div class="container text-center">
                   <button class="btn custom-bg text-white">Add Product</button>
                   <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
               </div>   
          </form>
      </div>
    </div>
  </div>
</div>   
   
  <!-- end add product modal -->
  
<!-- add product modal -->
  <%
              if(userType!=null && userType.equals("customer") && customer!=null){
             
              List<Complaints> mycomplaints = complaintsDao.findByCustomerId(customer.getId());
          %>   
<div class="modal fade mycomplaints" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLongTitle" >Add Product details.</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="table-responsive">
          <table class="table">
  <thead class="custom-bg text-white">
    <tr>
      <th scope="col">Complaint Id</th>
      <th scope="col">Reference Id</th>
      <th scope="col">Product Name</th>
      <th scope="col">Complaint</th>
      <th scope="col">Complaint Status</th>
      <th scope="col">Product Handler Name</th>
      <th scope="col">Complaint Response</th>
    </tr>
  </thead>
  <tbody>
  
   <%
      for(Complaints  com :mycomplaints)
      {
    	  
    	  Optional<Product> optional1 = productDao.findById(com.getProductId());
  		  Product p = optional1.get();
  		  
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
      <td class="mid-align"><%  if(ph != null){ %><%=ph.getFirstname() %> <% } %></td>
      <td class="mid-align"><%if(com.getResponse() != null){ %><%=com.getResponse()%><% } %></td>
    </tr>
    <%
      }
    %>
  </tbody>
</table>
</div>
      </div>
    </div>
  </div>
</div>   

<%

}%>
   
  <!-- end add product modal -->


<!-- Logout modal -->

<div class="modal fade logout-modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Log Out</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="modal-body text-center">
            <h5>Do you want to logout?</h5>
          
          <div class="text-center">
            <a href="logout"><button type="button" class="btn custom-bg text-white">Yes</button></a>
            <button type="button" class="btn btn-secondary ml-5" data-dismiss="modal">No</button>
          </div> 
     </div>     
    </div>
  </div>
</div>

<!-- *********** -->

<!-- About us modal -->

<div class="modal fade aboutusmodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
       <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >About Us</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
        <div class="container">
        <p style="font-size:20px;">
          <b>
              An e-commerce website, by definition, is a website that allows you to buy and sell tangible goods,
               digital products or services online. Trade, be it barter exchange or buying and selling of goods and
                services has been prevalent for centuries. No one can be self-sufficient. And this brings out the need
                 for demand and supply of goods and services.<br><br> Transactions have been going on all over the world
                  for centuries, locally, and across locations. Keeping the same concept in mind, now think electronic.
                   However, also bear in mind that with the whole world going online, data privacy laws have become increasingly stringent.
                    And before you begin, an eCommerce venture you should be aware of all the legal policies required for your eCommerce website.
          </b>
        </p>
        </div>
      </div>
      <div class="modal-footer">
       <div class="text-center">
        <button type="button" class="btn custom-bg text-white" data-dismiss="modal">Close</button>
       </div>
      </div>
    </div>
  </div>
</div>
<!-- ********** -->

<!-- Contact us modal -->

<div class="modal fade contactusmodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
       <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Contact Us</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
        <div class="container text-center">
        <p style="font-size:23px;">
            <b>
                <img src="resources/images/phonee.png" style="width:27px;" alt="img">+91 XXXXXXXXXX / +91 XXXXXXXXXX<br>
                <img src="resources/images/emaill.png" style="width:29px;" alt="img">xxxxxxxxx@gmail.com
            </b>
        </p>
        </div>
      </div>
      <div class="modal-footer">
       <div class="text-center">
        <button type="button" class="btn custom-bg text-white" data-dismiss="modal">Close</button>
       </div>
      </div>
    </div>
  </div>
</div>
<!-- ********** -->

<!-- customer change password modal -->

<div class="modal fade customerchange" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Change Password</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="customerchangepassword" method="post">
           
  <div class="form">
 
    <div class="form-group ">
      <label for="inputPassword4">Email</label>
      <input type="email" class="form-control" id="inputPassword4" name="email" value="<%if(userType!=null && userType.equals("customer") && customer!=null){ %><%=customer.getEmailid() %><%}%>" readonly>
    </div>
    <div class="form-group">
      <label for="inputPassword4">Password</label>
      <input type="password" class="form-control" id="pass" name="pass" >
    </div>
    <div class="form-group">
      <label for="inputPassword4">Confirm Password</label>
      <input type="password" class="form-control" id="cpass" name="cpass">
    </div>
  </div>
 
  <div class="container text-center">
       
       <input type="submit" class="btn custom-bg text-light" value="Change">
       <button type="button" class="btn custom-bg text-light ml-5" data-dismiss="modal">Close</button>
                                      
  </div>   
</form>
      </div>
    </div>
  </div>
</div>


<!--  -->


<!-- admin change password modal -->

<div class="modal fade adminchange" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Change Password</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="adminchangepassword" method="post">
           
  <div class="form">
 
    <div class="form-group ">
      <label for="inputPassword4">Email</label>
      <input type="email" class="form-control" id="inputPassword4" name="email" value="<%if(userType!=null && userType.equals("admin") && admin!=null){ %><%=admin.getEmailid() %><%}%>" readonly>
    </div>
    <div class="form-group">
      <label for="inputPassword4">Password</label>
      <input type="password" class="form-control" id="pass" name="pass" >
    </div>
    <div class="form-group">
      <label for="inputPassword4">Confirm Password</label>
      <input type="password" class="form-control" id="cpass" name="cpass">
    </div>
  </div>
 
  <div class="container text-center">
       
       <input type="submit" class="btn custom-bg text-light" value="Change">
       <button type="button" class="btn custom-bg text-light ml-5" data-dismiss="modal">Close</button>
                                      
  </div>   
</form>
      </div>
    </div>
  </div>
</div>


<!--  -->