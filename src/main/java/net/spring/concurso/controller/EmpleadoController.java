package net.spring.concurso.controller;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.google.gson.Gson;
import net.spring.concurso.entity.Distrito;
import net.spring.concurso.entity.Empleado;
import net.spring.concurso.entity.TipoEmpleado;

@Controller
@RequestMapping(value = "/empleadoA")
public class EmpleadoController {
	private String URL="http://localhost:8080/WS_Servidor/empleado";
	
	@RequestMapping(value = "/")
	public String principal(Model model) {
		//clase para llamar a un servicio 
		RestTemplate rt=new RestTemplate();
		//acceder a la anotaciòn GET del servicio usar el nombre "listAllComputadora"
		ResponseEntity<Empleado[]>data= rt.getForEntity(URL+"/listAllEmpleado", Empleado[].class);
		//obtener el JSOn que tiene data
		Empleado[] lista=data.getBody();
		//crear un atrubuto
		model.addAttribute("dataEmpleados",lista);
		return "empleado";
	}
	@RequestMapping(value = "/listaTipoEmpleados")
	@ResponseBody
	public TipoEmpleado[] listaTipoEmpleados(Model model) {
		TipoEmpleado[] lista=null;
		RestTemplate rt=new RestTemplate();
		ResponseEntity<TipoEmpleado[]>data= rt.getForEntity(URL+"/listAllTipoEmpleado", TipoEmpleado[].class);
		lista=data.getBody();
		return lista;
	}

	@RequestMapping(value = "/buscar")
	@ResponseBody
	public Empleado buscar(@RequestParam("codigo") int cod) {
		Empleado lista=null;
		RestTemplate rt=new RestTemplate();
		ResponseEntity<Empleado>data= rt.getForEntity(URL+"/findEmpleado/"+cod, Empleado.class);
		lista=data.getBody();
		return lista;
	}	
	
	
	@RequestMapping(value = "/save")
	public String save(@RequestParam("codigo") int cod,
						@RequestParam("nombre") String nom,
						@RequestParam("apellidos") String ape,
						@RequestParam("sexo") String sex,
						@RequestParam("direccion") String dir,
						@RequestParam("distrito") int idDistrito,
						@RequestParam("tipo") int codigoTipoEmpleado,
						RedirectAttributes redirect) {
		//crear objeto de la clase Computadora
		Empleado bean=new Empleado();
		bean.setCodigoEmpleado(cod);
		bean.setNombres(nom);
		bean.setApellidos(dir);
		bean.setSexo(sex);
		bean.setDireccion(dir);
		bean.setDistritoEmpleado(new Distrito(idDistrito));
		bean.setTipoEmpleado(new TipoEmpleado(codigoTipoEmpleado));
		//serializar
		Gson gson=new Gson();
		String json=gson.toJson(bean);
		//
		RestTemplate rt=new RestTemplate();
		//validar cod
		if(cod==0) {
			//cabecera formato JSON
			HttpHeaders headers=new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			//unir json+headers
			HttpEntity<String> request=new HttpEntity<String>(json,headers);
			rt.postForObject(URL+"/saveEditorial", request, String.class);
			redirect.addFlashAttribute("MENSAJE","Registro correcto...");
		}
		else {
			//cabecera formato JSON
			HttpHeaders headers=new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			//unir json+headers
			HttpEntity<String> request=new HttpEntity<String>(json,headers);
			rt.put(URL+"/updateEditorial", request, String.class);
			redirect.addFlashAttribute("MENSAJE","Actualizado...");			
		}
		
		return "redirect:/editorial/";
	}
	
	@RequestMapping(value = "/delete/{codigo}")
	public String delete(@PathVariable("codigo") int cod,
						RedirectAttributes redirect) {
		RestTemplate rt=new RestTemplate();
		try {
			rt.delete(URL+"/deleteEditorial/"+cod);
			redirect.addFlashAttribute("MENSAJE","Editorial eliminado Correctamente...");
		} catch (Exception e) {
			e.printStackTrace();
			redirect.addFlashAttribute("MENSAJE","Error en la eliminaciòn...");
		}
		return "redirect:/editorial/";
	}
}





