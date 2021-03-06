<jsp:include page="menu.jsp"/>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editorial</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"/>
<style type="text/css">
	.help-block {
	  		color: red;
	}
	
	.form-group.has-error .form-control-label {
	  color: red;
	}
	
	.form-group.has-error .form-control {
	  border: 1px solid red;
	  box-shadow: 0 0 0 0.2rem rgba(250, 16, 0, 0.18);
	}

</style>
</head>		
<body>
            <h1 align="center">Consultar de Editoriales</h1>

	 	 	<!-- Button trigger modal -->
			<div class="mt-5">
			
			<div id="table_wrapper" class="dataTables_wrapper no-footer">
			<div id="table_filter" class="dataTables_filter">
			 <label>
			 "Buscando Editorial:"   <input type="search" class placeholder aria-controls="table">
			 </label>
			 
			  </div>
			<table id="table" class="table table-striped table-bordered" style="width:100%">
	
		        <thead>
		            <tr>
		                <th>C�digo</th>
		                <th>Nombre</th>
		                <th>Direcci�n</th>
		                <th>Telefono</th>
		                <th>Correo</th>
		                <th>Pais</th>
		            </tr>
		        </thead>
		        <tbody>
				<c:forEach items="${requestScope.dataEditoriales}" var="row">
		            <tr>
		                <td>${row.idEditorial}</td>
		                <td>${row.nombre}</td>
		                <td>${row.direccion}</td>
		                <td>${row.telefono}</td>
		                <td>${row.correo}</td>
		                <td>${row.pais.nombre}</td> 
		            </tr>
				</c:forEach>
		        </tbody>
	    	</table>		
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.min.js"></script>

	
<script type="text/javascript">
	
	$(document).ready(function() {
			$("#table").DataTable();
		    cargarPaises();
	} );
	$(document).on("click","btnBuscar",function(){
		//obtener el c�digo de la computadora seg�n la fila actual
		var cod;
		cod=$(this).parents("tr").find("td")[0].innerHTML;
		fetch("buscar?codigo="+cod)
		.then(response=>response.json())
		.then(editorial=>{
			//console.log(computadora);
			$("#codigo").val(editorial.idEditorial);
			$("#nombre").val(editorial.nombre);
			$("#direccion").val(editorial.direccion);
			$("#telefono").val(editorial.telefono);
			$("#correo").val(editorial.correo);
			$("#pais").val(editorial.pais.idPais);
		})
	
//---------------------------------COMBO-------------------------------------//	

//---------------------------------EDITAR-------------------------------------//	



</script>
<script type="text/javascript">    
  
</script>
</body>
</html>