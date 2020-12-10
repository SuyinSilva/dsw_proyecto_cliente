<jsp:include page="menu.jsp"/>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Curso</title>
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
	        	Seguro de eliminar Curso? 
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
	
	
	
	 	<h1 align="center">Listado de Cursos</h1>
	 	
	 	<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalCurso">
		  Nuevo Curso
		</button>
		<div class="mt-5">
			<table id="table" class="table table-striped table-bordered" style="width:100%">
		        <thead>
		            <tr>
		                <th>idCurso</th>
		                <th>C�digo</th>
		                <th>Nombre</th>
		                <th>Estado</th>
		                <th>Sistema de Evaluaci�n</th>
		                <th>Actualizar</th>
		                <th>Eliminar</th>
		            </tr>
		        </thead>
		        <tbody>
				<c:forEach items="${requestScope.dataCursos}" var="row">
		            <tr>
		                <td>${row.codigoCurso}</td>
		                <td>${row.codigo}</td>
		                <td>${row.nombre}</td>
		                <td>${row.estado}</td>
		                <td>${row.sistemaevaluacion.nombreSistemae}</td>
		                <td><button type="button" class="btn btn-info btnEditar">Editar</button></td>
		                <td><a href="delete/${row.codigoCurso}" class="btn btn-danger btnEliminar">Eliminar</a></td>  
		     
		            </tr>
				</c:forEach>
		        </tbody>
	    	</table>		
		</div>
	
		
		<!-- Modal -->
		<div class="modal fade" id="modalCurso" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="idTitulo">REGISTRAR CURSO</h5>
		      </div>
		      <div class="modal-body">
		        <form id="frmComputadora" action="save" method="post" data-toggle="validator" role="form">
				  <input type="text" name="idCurso" id="idCurso" value="0">
				  <div class="form-group">
				    <label for="exampleInputEmail1">C�digo</label>
				    <input type="text" class="form-control" name="codigo" id="codigo">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">Nombre</label>
				    <input type="text" class="form-control" name="nombre" id="nombre">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">Estado</label>
				    <input type="text" class="form-control" name="estado" id="estado">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">Sistema de Evaluacion</label>
				    <select class="form-control" name="sistemaevaluacion" id="sistemaevaluacion">
				      <option value=" ">[Seleccione Categoria]</option>
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
		    cargarSistemas();
	} );
	
	
//---------------------------------COMBO-------------------------------------//	
function cargarSistemas(){
	fetch("listaSistemas")
	.then(response=>response.json())
	.then(sistemaevaluacions=>{
		sistemaevaluacions.forEach(sistemaevaluacion=>{
				$("#sistemaevaluacion").append("<option value='"+ sistemaevaluacion.sisEvaluacion+"'>"+
						sistemaevaluacion.nombreSistemae+"</option>");	
			})
	})
	
	
}

//---------------------------------ELIMINAR-------------------------------------//	
	$(document).on("click",".btnEliminar",function(){
		//evento por defecto
		event.preventDefault();
		//obtener el href del bot�n seleccionado
		var ruta;
		ruta=$(this).attr("href");
		//enviar el valor de la variable "href" al ID "btnEliminar"
		$("#btnEliminar").attr("href",ruta);
		$("#modalEliminar").modal("show");

	})

//---------------------------------EDITAR-------------------------------------//	
$(document).on("click",".btnEditar",function(){
	//obtener el c�digo de la computadora seg�n la fila actual
	var idcur;
	idcur=$(this).parents("tr").find("td")[0].innerHTML;
	fetch("buscar?idCurso="+idcur)
	.then(response=>response.json())
	.then(curso=>{
		//console.log(computadora);
		$("#idCurso").val(curso.codigoCurso);
		$("#codigo").val(curso.codigo);
		$("#nombre").val(curso.nombre);
		$("#estado").val(curso.estado);
		$("#sistemaevaluacion").val(curso.sistemaevaluacion.sisEvaluacion);
	})
	
	$("#idTitulo").text("ACTUALIZAR LIBRO");
	$('#modalCurso').modal({backdrop: 'static',keyboard:false,show:true});

	    
});	

/*
//---------------------------------CERRAR-------------------------------------//	
$(document).on("click","#btnCerrar",function(){
	$('#frmCurso').trigger("reset");
	$('#frmCurso').data('bootstrapValidator').resetForm(true);
	$("#idCurso").val("0");		
	$("#idTitulo").text("REGISTRAR LIBRO");
	$('#modalCurso').modal("hide");
})*/

</script>
<script type="text/javascript">    
    $(document).ready(function(){     
        $('#frmCurso').bootstrapValidator({      
        	 fields:{
        		 codigo:{
      			 	validators:{
      			 		notEmpty:{
      			 			message:'Campo c�digo es obligatorio'	
      			 		},
      			 		digits:{
      			 			message:'Campo c�digo solo digitos'
      			 		},
      			 		regexp:{
     			 			regexp:/^(\d|[1-5][0-9])$/,
     			 			message:'Campo c�digo max 59'
     			 		}
      			 	}
      		 	 },  
             	 
        		 nombre:{
        			 	validators:{
        			 		notEmpty:{
        			 			message:'Campo nombre es obligatorio'	
        			 		},
        			 		regexp:{
        			 			regexp:/^[a-zA-Z\s\�\�\�\�]{3,15}$/,
        			 			message:'Campo nombre solo letras min 3 hasta max 15 letras'
        			 		}
        			 	}
        		 },   
        		 estado:{
     			 	validators:{
     			 		notEmpty:{
     			 			message:'Campo estado es obligatorio'	
     			 		},
     			 		regexp:{
     			 			regexp:/^[a-zA-Z\s\�\�\�\�]{3,15}$/,
     			 			message:'Campo estado solo letras min 3 hasta max 15 letras'
     			 		}
     			 	}
     		     }, 
     			tipo:{
 			 		validators:{
 			 			notEmpty:{
 			 				message:'Campo tipo es obligatorio'	
 			 			},
 			 			regexp:{
 			 				regexp:/^[a-zA-Z\s\�\�\�\�]{3,15}$/,
 			 				message:'Campo tipo solo letras min 3 hasta max 15 letras'
 			 			}
 			 		}
 		     	 },   
 		     	sitemaevaluacion:{
     			 	validators:{
     			 		notEmpty:{
     			 			message:'Campo sistema de evaluaci�n es obligatorio'	
     			 		}
     			 	}
     		 	 },    
     		 	 
     		 	 
        	 }
        });   
			
    });    
</script>
	
	
	
	
</body>
</html>