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

import net.spring.concurso.entity.Empleado;
import net.spring.concurso.entity.Rol;
import net.spring.concurso.entity.Usuario;

@Controller
@RequestMapping(value = "/clienteReg")
public class UsuarioClienteController {
	private String URL="http://localhost:8080/WS_Servidor/cliente";
	

	@RequestMapping(value = "/")
	public String principal(Model model) {
		//clase para llamar a un servicio 
		RestTemplate rt=new RestTemplate();
		//acceder a la anotaciòn GET del servicio usar el nombre "listAllComputadora"
		ResponseEntity<Usuario[]>data= rt.getForEntity(URL+"/listAllUsuario", Usuario[].class);
		//obtener el JSOn que tiene data
		Usuario[] lista=data.getBody();
		//crear un atrubuto
		model.addAttribute("dataUsuarios",lista);
		return "usuario";
	}
	@RequestMapping(value = "/re")
	public String secundario(Model model) {
		//clase para llamar a un servicio 
		RestTemplate rt=new RestTemplate();
		//acceder a la anotaciòn GET del servicio usar el nombre "listAllComputadora"
		ResponseEntity<Usuario[]>data= rt.getForEntity(URL+"/listAllUsuario", Usuario[].class);
		//obtener el JSOn que tiene data
		Usuario[] lista=data.getBody();
		//crear un atrubuto
		model.addAttribute("dataUsuarios",lista);
		return "session";
	}
	@RequestMapping(value = "/listaRoles")
	@ResponseBody
	public Rol[] listaRoles(Model model) {
		Rol[] lista=null;
		RestTemplate rt=new RestTemplate();
		ResponseEntity<Rol[]>data= rt.getForEntity(URL+"/listAllRol", Rol[].class);
		lista=data.getBody();
		return lista;
	}

	@RequestMapping(value = "/listaEmpleados")
	@ResponseBody
	public Empleado[] listaEmpleados(Model model) {
		Empleado[] lista=null;
		RestTemplate rt=new RestTemplate();
		ResponseEntity<Empleado[]>data= rt.getForEntity(URL+"/listAllEmpleado", Empleado[].class);
		lista=data.getBody();
		return lista;
	}
	
	@RequestMapping(value = "/buscar")
	@ResponseBody
	public Usuario buscar(@RequestParam("codigo") int cod) {
		Usuario lista=null;
		RestTemplate rt=new RestTemplate();
		ResponseEntity<Usuario>data= rt.getForEntity(URL+"/findUsuario/"+cod, Usuario.class);
		lista=data.getBody();
		return lista;
	}	
	///regisro solo
	@RequestMapping(value = "/save2")
	public String save2(@RequestParam("codigo") int cod,
						@RequestParam("login") String log,
						@RequestParam("password") String pas,
						@RequestParam("rol")  int idrol,
						@RequestParam("empleado")  int codigoEmpleado,
						RedirectAttributes redirect) {
		//crear objeto de la clase Computadora
		Usuario bean=new Usuario();
		bean.setCodUsuario(cod);
		bean.setLogin(log);
		bean.setPassword(pas);
		bean.setRol(new Rol(idrol));
		bean.setEmpleado(new Empleado(codigoEmpleado));
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
			rt.postForObject(URL+"/saveUsuario", request, String.class);
			redirect.addFlashAttribute("MENSAJE","Registro correcto...");
		}
		return "redirect:/clienteReg/reg";
	}
	////////////
	
	@RequestMapping(value = "/save")
	public String save(@RequestParam("codigo") int cod,
						@RequestParam("login") String log,
						@RequestParam("password") String pas,
						@RequestParam("rol")  int idrol,
						@RequestParam("empleado")  int codigoEmpleado,
						RedirectAttributes redirect) {
		//crear objeto de la clase Computadora
		Usuario bean=new Usuario();
		bean.setCodUsuario(cod);
		bean.setLogin(log);
		bean.setPassword(pas);
		bean.setRol(new Rol(idrol));
		bean.setEmpleado(new Empleado(codigoEmpleado));
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
			rt.postForObject(URL+"/saveUsuario", request, String.class);
			redirect.addFlashAttribute("MENSAJE","Registro correcto...");
		}
		else {
			//cabecera formato JSON
			HttpHeaders headers=new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			//unir json+headers
			HttpEntity<String> request=new HttpEntity<String>(json,headers);
			rt.put(URL+"/updateUsuario", request, String.class);
			redirect.addFlashAttribute("MENSAJE","Actualizado datos...");			
		}
		
		return "redirect:/clienteReg/";
	}
	
	@RequestMapping(value = "/delete/{codigo}")
	public String delete(@PathVariable("codigo") int cod,
						RedirectAttributes redirect) {
		RestTemplate rt=new RestTemplate();
		try {
			rt.delete(URL+"/deleteUsuario/"+cod);
			redirect.addFlashAttribute("MENSAJE","Registro eliminado...");
		} catch (Exception e) {
			e.printStackTrace();
			redirect.addFlashAttribute("MENSAJE","Error en la eliminaciòn...");
		}
		return "redirect:/clienteReg/";
	}
	
}
