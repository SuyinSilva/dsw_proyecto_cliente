<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<!--<link href="<c:url value="/resources/css/style2.css"/>" rel="stylesheet"> -->
</head>
<body>

<div class="container">

<div class="m-5">
	<div class="login">
		<c:if test="${MENSAJE !=null}">
		<div class="alert alert-warning alert-dismissible fade show" role="alert" id="success-alert">
		  <strong>Sistema:</strong> ${MENSAJE}
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
		</c:if>
	</div>
	
</div>	
    <div class="login">
		<h1>INGRESAR INTRANET</h1>
			<form method="post" action="iniciar">
				  <div class="form-group">
					<label for="exampleInputEmail1">Usuario</label>
					<input type="text" class="form-control" name="login" required="required">
				  </div>
				  <div class="form-group">
					<label for="exampleInputPassword1">Clave</label>
					<input type="password" class="form-control" name="clave" required="required">
				  </div>
				  <div class="form-group">
					<button type="submit" class="form-control btn btn-primary">Ingresar</button>
				  </div>	
			</form>
    </div>
    	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalUsuario">
		  Nueva Cliente
		</button>	
  </div>
  <div>
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
			        <button type="submit" class="btn btn-crimary">Guardar</button>
			      </div>	
				</form>
		      </div>
		    </div>
		  </div>
		</div>
	<!-- Modal -->
		<div class="modal fade" id="modalEmpleado" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="idTitulo">DATOS</h5>
		      </div>
		      <div class="modal-body">
		        <form id="frmEmpleado" action="save" method="post" data-toggle="validator" role="form">
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
			        <button type="button" class="btn btn-secondary" id="btnCerrarE">Cerrar</button>
			        <button type="submit" class="btn btn-primary">Guardar</button>
			      </div>	
				</form>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script   src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
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