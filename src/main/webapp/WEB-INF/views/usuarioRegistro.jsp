<jsp:include page="menu.jsp"/>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cliente</title>
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
	

	<div class="container">
	<c:if test="${MENSAJE !=null}">
	<div class="alert alert-warning alert-dismissible fade show" role="alert" id="success-alert">
	  <strong>Sistema:</strong> ${MENSAJE}
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	    <span aria-hidden="true">&times;</span>
	  </button>
	</div>
	</c:if>
	<c:remove var="MENSAJE"/>
	
		
		<!-- Modal -->
		<div class="modal fade" id="modalUsuario" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="idTitulo">REGISTRAR Cliente</h5>
		      </div>
		      <div class="modal-body">
		        <form id="frmUsuario" action="save" method="post" data-toggle="validator" role="form">
				  <input type="text" name="codigo" id="codigo" value="0">
				  <div class="form-group">
				    <label for="exampleInputEmail1">Login</label>
				    <input type="text" class="form-control" name="login" id="login">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">Password</label>
				    <input type="text" class="form-control" name="password" id="password">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">Rol</label>
				    <select class="form-control" name="rol" id="rol">
				      <option value=" ">[Seleccione Rol]</option>
				    </select>
				  </div>
				   <div class="form-group">
				    <label for="exampleInputEmail1">Empleado</label>
				    <select class="form-control" name="empleado" id="empleado">
				      <option value=" ">[Seleccione Empleado]</option>
				    </select>
				  </div>
				  <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" id="btnCerrar">Cerrar</button>
			        <button type="submit" class="btn btn-primary">Guardar</button>
			      </div>	
				</form>
		      </div>
		    </div>
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
			cargarRoles();
			cargarEmpleados();
	} );
	
	
//---------------------------------COMBO-------------------------------------//	
function cargarRoles(){
	fetch("listaRoles")
	.then(response=>response.json())
	.then(roles=>{
			roles.forEach(rol=>{
				$("#rol").append("<option value='"+ rol.idrol +"'>"+
						rol.descripcion+"</option>");	
			})
	})
	
	
}
function cargarEmpleados(){
	fetch("listaEmpleados")
	.then(response=>response.json())
	.then(empleados=>{
		   empleados.forEach(empleado=>{
				$("#empleado").append("<option value='"+ empleado.codigoEmpleado+"'>"+
						empleado.nombres+"</option>");	
			})
	})
	
	
}

//---------------------------------CERRAR-------------------------------------//	
$(document).on("click","#btnCerrar",function(){
	$('#frmUsuario').trigger("reset");
	$('#frmUsuario').data('bootstrapValidator').resetForm(true);
	$("#codigo").val("0");		
	$("#idTitulo").text("REGISTRAR USUARIO");
	$('#modalUsuario').modal("hide");
})

</script>
<script type="text/javascript">    
    $(document).ready(function(){     
        $('#frmUsuario').bootstrapValidator({      
        	 fields:{
        		 login:{
        			 	validators:{
        			 		notEmpty:{
        			 			message:'Campo login es obligatorio'	
        			 		},
        			 		regexp:{
        			 			regexp:/^[a-zA-Z\s\ñ\Ñ\á\é]{3,15}$/,
        			 			message:'Campo login solo letras min 3 hasta max 15 letras'
        			 		}
        			 	}
        		 },   
        		 password:{
     			 	validators:{
     			 		notEmpty:{
     			 			message:'Campo contraseña es obligatorio'	
     			 		},
     			 		regexp:{
     			 			regexp:/^[a-zA-Z\s\ñ\Ñ\á\é]{3,15}$/,
     			 			message:'Campo contraseña solo letras min 3 hasta max 15 letras'
     			 		}
     			 	}
     		    },   
     		    rol:{
 			     	validators:{
 			 		   notEmpty:{
 			 			message:'Campo rol es obligatorio'	
 			 		   }
 			 	   }
 		 	    },     
     		 	empleado:{
     			 	validators:{
     			 		notEmpty:{
     			 			message:'Campo empleado es obligatorio'	
     			 		}
     			 	}
     		 	 },   
        	 }
        });   
			
    });    
</script>
	
</body>
</html>