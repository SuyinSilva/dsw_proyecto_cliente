<jsp:include page="menu.jsp"/>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Empleado</title>
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
	<!-- The Modal -->
	  <div class="modal fade" id="modalEliminar" data-backdrop="static">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">Sistema</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	        	Seguro de eliminar Empleado? 
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <form action="" method="post" name="myForm">	
			  	  <a class="btn btn-primary" id="btnEliminar">Si</a>
		          <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>		           
	          </form>
	        </div>
	        
	      </div>
	    </div>
	  </div>


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
	
	
	
	 	<h1 align="center">Listado de Empleados</h1>
	 	
	 	<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalEmpleado">
		  Nueva Empleado
		</button>
		<div class="mt-5">
			<table id="table" class="table table-striped table-bordered" style="width:100%">
		        <thead>
		            <tr>
		                <th>Código</th>
		                <th>Nombre</th>
		                <th>Apellidos</th>
		                <th>Sexo</th>
		                <th>Fecha Nacimiento</th>
		                <th>Dirección</th>
		                <th>Distrito</th>
		                <th>Tipo Empleado</th>
		                <th></th>
		                <th></th>
		            </tr>
		        </thead>
		        <tbody>
				<c:forEach items="${requestScope.dataEmpleados}" var="row">
		            <tr>
		                <td>${row.codigoEmpleado}</td>
		                <td>${row.nombres}</td>
		                 <td>${row.apellidos}</td>
		                <td>${row.sexo}</td>
		                <td>${row.fechaNacimiento}</td>
		                <td>${row.direccion}</td>
		                <td>${row.distritoEmpleado.nombreDistrito}</td>
		                <td>${row.tipoEmpleado.nombreTipoEmpleado}</td>
		                <td><button type="button" class="btn btn-info btnEditar">Editar</button></td>
		                   <td><a href="delete/${row.codigoEmpleado}" class="btn btn-danger btnEliminar">Eliminar</a></td>  
		            </tr>
				</c:forEach>
		        </tbody>
	    	</table>		
		</div>
	
		
		<!-- Modal -->
		<div class="modal fade" id="modalEmpleado" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="idTitulo">REGISTRAR Empleado</h5>
		      </div>
		      <div class="modal-body">
		        <form id="frmEmpleado" action="save" method="post" data-toggle="validator" role="form">
				  <input type="text" name="codigo" id="codigo" value="0">
				  <div class="form-group">
				    <label for="exampleInputEmail1">Nombre</label>
				    <input type="text" class="form-control" name="nombre" id="nombre">
				  </div>
				   <div class="form-group">
				    <label for="exampleInputEmail1">Apellidos</label>
				    <input type="text" class="form-control" name="apellido" id="apellido">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">Sexo</label>
				    <input type="text" class="form-control" name="sexo" id="sexo">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">Fecha Registro</label>
				    <input type="date" class="form-control" name="fecReg" id="fecReg">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">Fecha Nacimiento</label>
				    <input type="date" class="form-control" name="fecNac" id="fecNac">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">Direccion</label>
				    <input type="text" class="form-control" name="direccion" id="direccion">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">Distrito</label>
				    <select class="form-control" name="distritoEmpleado" id="distritoEmpleado">
				      <option value=" ">[Seleccione Distrito]</option>
				    </select>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">Tipo Empleado</label>
				    <select class="form-control" name=tipoEmpleado id="tipoEmpleado">
				      <option value=" ">[Seleccione Tipo]</option>
				    </select>
				  </div>
				  <div class="modal-footer">
			         <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
			        <button type="submit" class="btn btn-primary">Guardar</button>
			      </div>	
				</form>
		      </div>
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
			cargarDistritos();
			cargarTipoEmpleados();
	} );
	
	
//---------------------------------COMBO-------------------------------------//	
function cargarDistritos(){
	fetch("listaDistritos")
	.then(response=>response.json())
	.then(distritoEmpleados=>{
		distritoEmpleados.forEach(distritoEmpleado=>{
				$("#distritoEmpleado").append("<option value='"+ distritoEmpleado.idDistrito+"'>"+
						distritoEmpleado.nombreDistrito+"</option>");	
			})
	})
	
	
}
function cargarTipoEmpleados(){
	fetch("listaTipoEmpleados")
	.then(response=>response.json())
	.then(tipoEmpleados=>{
		tipoEmpleados.forEach(tipoEmpleado=>{
				$("#tipoEmpleado").append("<option value='"+ tipoEmpleado.codigoTipoEmpleado+"'>"+
						tipoEmpleado.nombreTipoEmpleado+"</option>");	
			})
	})
	
	
}
//---------------------------------ELIMINAR-------------------------------------//	
$(document).on("click",".btnEliminar",function(){
	//evento por defecto
	event.preventDefault();
	//obtener el href del botòn seleccionado
	var ruta;
	ruta=$(this).attr("href");
	//enviar el valor de la variable "href" al ID "btnEliminar"
	$("#btnEliminar").attr("href",ruta);
	$("#modalEliminar").modal("show");

})
//---------------------------------EDITAR-------------------------------------//	
$(document).on("click",".btnEditar",function(){
	//obtener el còdigo de la computadora segùn la fila actual
	var cod;
	cod=$(this).parents("tr").find("td")[0].innerHTML;
	fetch("buscar?codigo="+cod)
	.then(response=>response.json())
	.then(empleado=>{
		//console.log(computadora);
		$("#codigo").val(empleado.codigoEmpleado);
		$("#nombre").val(empleado.nombres);
		$("#apellido").val(empleado.apellidos);
		$("#sexo").val(empleado.sexo);
		$("#fecReg").val(empleado.fechaRegistro);
		$("#fecNac").val(empleado.fechaNacimiento);
		$("#direccion").val(empleado.direccion);
		$("#distritoEmpleado").val(empleado.distritoEmpleado.idDistrito);
		$("#tipoEmpleado").val(empleado.tipoEmpleado.codigoTipoEmpleado);
	})
	
	$("#idTitulo").text("ACTUALIZAR Empleado");
	$('#modalEmpleado').modal({backdrop: 'static',keyboard:false,show:true});

	    
});	


//---------------------------------CERRAR-------------------------------------//	
$(document).on("click","#btnCerrar",function(){
	$('#frmEmpleado').trigger("reset");
	$('#frmEmpleado').data('bootstrapValidator').resetForm(true);
	$("#codigo").val("0");		
	$("#idTitulo").text("REGISTRAR Empleado");
	$('#modalEmpleado').modal("hide");
})

</script>
<script type="text/javascript">    
    $(document).ready(function(){     
        $('#frmEmpleado').bootstrapValidator({      
        	 fields:{
        		 nombre:{
        			 	validators:{
        			 		notEmpty:{
        			 			message:'Campo nombre es obligatorio'	
        			 		},
        			 		regexp:{
        			 			regexp:/^[a-zA-Z\s\ñ\Ñ\á\é]{2,15}$/,
        			 			message:'Campo nombre solo letras min 2 hasta max 15 letras'
        			 		}
        			 	}
        		 },
        		 apellido :{
     			 	validators:{
     			 		notEmpty:{
     			 			message:'Campo nombre es obligatorio'	
     			 		},
     			 		regexp:{
     			 			regexp:/^[a-zA-Z\s\ñ\Ñ\á\é]{5,15}$/,
     			 			message:'Campo nombre solo letras min 5 hasta max 15 letras'
     			 		}
     			 	}
     		 },      
     		sexo :{
  			 	validators:{
  			 		notEmpty:{
  			 			message:'Campo nombre es obligatorio'	
  			 		},
  			 		regexp:{
  			 			regexp:/^[a-zA-Z\s\ñ\Ñ\á\é]{5,15}$/,
  			 			message:'Campo nombre solo letras min 5 hasta max 15 letras'
  			 		}
  			 	}
  		      }, 
        		 direccion:{
        			 validators:{
     			 		notEmpty:{
     			 			message:'Campo nombre es obligatorio'	
     			 		},
     			 		regexp:{
     			 			regexp:/^[a-zA-Z\s\ñ\Ñ\á\é]{5,20}$/,
     			 			message:'Campo nombre solo letras min 5 hasta max 20 letras'
     			 		}
     			 	}
     		    },     
     		     
     		   distritoEmpleado:{
     			 	validators:{
     			 		notEmpty:{
     			 			message:'Campo distrito es obligatorio'	
     			 		}
     			 	}
     		 	 },    
     		 	tipoEmpleado:{
       			 	validators:{
       			 		notEmpty:{
       			 			message:'Campo tipo Empleado es obligatorio'	
       			 		}
       			 	}
       		 	 },  
     		 	 
        	 }
        });   
			
    });    
</script>
	
	
	
	
</body>
</html>