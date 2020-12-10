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

import net.spring.concurso.entity.Computadora;
import net.spring.concurso.entity.Marca;

@Controller
@RequestMapping(value = "/hola")
public class ComputadoraController {
	private String URL="http://localhost:8080/WS_Servidor/computadora";
	
	
	@RequestMapping(value = "/")
	public String principal(Model model) {
		//clase para llamar a un servicio 
		RestTemplate rt=new RestTemplate();
		//acceder a la anotaciòn GET del servicio usar el nombre "listAllComputadora"
		ResponseEntity<Computadora[]>data= rt.getForEntity(URL+"/listAllComputadora", Computadora[].class);
		//obtener el JSOn que tiene data
		Computadora[] lista=data.getBody();
		//crear un atrubuto
		model.addAttribute("dataComputadoras",lista);
		return "computadora";
	}
	@RequestMapping(value = "/listaMarcas")
	@ResponseBody
	public Marca[] listaMarcas(Model model) {
		Marca[] lista=null;
		RestTemplate rt=new RestTemplate();
		ResponseEntity<Marca[]>data= rt.getForEntity(URL+"/listAllMarca", Marca[].class);
		lista=data.getBody();
		return lista;
	}

	@RequestMapping(value = "/buscar")
	@ResponseBody
	public Computadora buscar(@RequestParam("codigo") int cod) {
		Computadora lista=null;
		RestTemplate rt=new RestTemplate();
		ResponseEntity<Computadora>data= rt.getForEntity(URL+"/findComputadora/"+cod, Computadora.class);
		lista=data.getBody();
		return lista;
	}	
	
	
	@RequestMapping(value = "/save")
	public String save(@RequestParam("codigo") int cod,
						@RequestParam("descripcion") String des,
						@RequestParam("cantidad") int can,
						@RequestParam("precio") double pre,
						@RequestParam("fecha") String fecha,
						@RequestParam("marca") int codMar,
						RedirectAttributes redirect) {
		//crear objeto de la clase Computadora
		Computadora bean=new Computadora();
		bean.setCodigoComputadora(cod);
		bean.setDescripcion(des);
		bean.setFecha(fecha);
		bean.setPrecio(pre);
		bean.setCantidad(can);
		bean.setMarca(new Marca(codMar));
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
			rt.postForObject(URL+"/saveComputadora", request, String.class);
			redirect.addFlashAttribute("MENSAJE","Registro correcto...");
		}
		else {
			//cabecera formato JSON
			HttpHeaders headers=new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			//unir json+headers
			HttpEntity<String> request=new HttpEntity<String>(json,headers);
			rt.put(URL+"/updateComputadora", request, String.class);
			redirect.addFlashAttribute("MENSAJE","Registro actualizado...");			
		}
		
		return "redirect:/hola/";
	}
	
	@RequestMapping(value = "/delete/{codigo}")
	public String delete(@PathVariable("codigo") int cod,
						RedirectAttributes redirect) {
		RestTemplate rt=new RestTemplate();
		try {
			rt.delete(URL+"/deleteComputadora/"+cod);
			redirect.addFlashAttribute("MENSAJE","Registro eliminado...");
		} catch (Exception e) {
			e.printStackTrace();
			redirect.addFlashAttribute("MENSAJE","Error en la eliminaciòn...");
		}
		return "redirect:/hola/";
	}
	
}






