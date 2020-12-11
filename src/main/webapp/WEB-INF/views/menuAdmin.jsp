<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value="resources/css/style.css"/>">

</head>
<body >
	 <nav  class="navbar navbar-expand-sm bg-dark">  
	 <!-- <nav class="navbar navbar-expand-sm bg-dark navbar-dark">  --> 
    <!-- <div  class="navbar-nav ml-auto bg-dark navbar-dark"> -->
	    <ul>
		  <li class="navbar-nav">
	<div class="navbar-header">

	 <h5 style="color: white">______________________</h5>
	     		 <a class="navbar-brand" href="#">OTHER BOOK.COM   </a>
	     		 <h5 style="color: white">______________________</h5>
	     		 <h7 style="color: white">Bienvenido(a):<span class="nav-item nav-link">   
		      ${sessionScope.dataUsuario.empleado.apellidos} 
		     		${sessionScope.dataUsuario.empleado.nombres}
		     	</span> </h7>
	     		  
	     		    </li>
	     		       <li>
	     		 <h7 style="color: white">       Cargo :</h7>   	<h7	style="color: white">  <span class="nav-item nav-link">   
		     		${sessionScope.dataUsuario.rol.descripcion}
		     	</span> </h7>  </li>
	  			</div>
	  </li>
    	 </ul>
    	  <ul>
		  <li class="navbar-nav">
		  <c:forEach items="${sessionScope.dataEnlaces}" var="row">
			    <ul class="nav-item">
			   <!--  <h5 style="color: blue;">-</h5>    --> 
			  <a style="font-size: 21px; text-align: center;" class="nav-link" href="${row.ruta}">${row.descripcion}</a>
			    </ul>
			</c:forEach> 
			
<div class="navbar-nav mr-auto">
	
<a style="color: white; font-size: 20px" href="http://localhost:8080/WS_Cliente_Spring/sesion/" class="nav-item nav-link">Cerrar Sesión=> </a>
	      </div> 
		  </li>
    	 </ul>		
    </div>
</nav>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script   src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>



</body>
</html>

