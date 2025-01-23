<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>

	<div class="text-center mt-5">
		<h2 class="text-color">Global Complaint Management System</h2>
	</div>
	
	<div class="row mt-5">
	
	<div class="col-sm-3">
        <div class="card custom-bg ml-5 mr-3 mb-5">
    <div class="card-body">
      <a href="/adminlogin" class="card-title non-underline-link text-color non-underline-link"><h2 class="card-title text-center text-color">Admin Login</h2></a>
      <p class="card-text">Admin Login</p>
    </div>
  </div>
    </div>
    
    <div class="col-sm-3">
        <div class="card custom-bg ml-5 mr-3 mb-5">
    <div class="card-body">
      <a href="/customerlogin" class="card-title non-underline-link text-color non-underline-link"><h2 class="card-title text-center text-color">Customer Login</h2></a>
      <p class="card-text">Customer Login</p>
    </div>
  </div>
    </div>
    <div class="col-sm-3">
        <div class="card custom-bg ml-5 mr-3 mb-5">
    <div class="card-body">
      <a href="/producthandlerlogin" class="card-title non-underline-link text-color non-underline-link"><h2 class="card-title text-center text-color">Product Handler Login</h2></a>
      <p class="card-text">Product Handler Login</p>
    </div>
  </div>
    </div>
    <div class="col-sm-3">
        <div class="card custom-bg ml-5 mr-3 mb-5">
    <div class="card-body">
      <a href="/productadminlogin" class="card-title non-underline-link text-color non-underline-link"><h2 class="card-title text-center text-color">Product Handler Login</h2></a>
      <p class="card-text">Product Admin Login</p>                                                                                          
    </div>
  </div>
    </div>
</div>  
</body>
</html>