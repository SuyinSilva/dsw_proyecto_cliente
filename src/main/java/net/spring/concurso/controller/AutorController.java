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

import net.spring.concurso.entity.Autor;
import net.spring.concurso.entity.Pais;

@Controller
@RequestMapping(value = "/autor")
public class AutorController {
	private String URL="http://localhost:8080/WS_Servidor/autor";
	
	
	@RequestMapping(value = "/")
	public String principal(Model model) {
		//clase para llamar a un servicio 
		RestTemplate rt=new RestTemplate();
		//acceder a la anotaciòn GET del servicio usar el nombre "listAllAutor"
		ResponseEntity<Autor[]>data= rt.getForEntity(URL+"/listAllAutor", Autor[].class);
		//obtener el JSOn que tiene data
		Autor[] lista=data.getBody();
		//crear un atrubuto
		model.addAttribute("dataAutores",lista);
		return "autor";
	}
	@RequestMapping(value = "/listaPaises")
	@ResponseBody
	public Pais[] listaPaiss(Model model) {
		Pais[] lista=null;
		RestTemplate rt=new RestTemplate();
		ResponseEntity<Pais[]>data= rt.getForEntity(URL+"/listAllPais", Pais[].class);
		lista=data.getBody();
		return lista;
	}

	@RequestMapping(value = "/buscar")
	@ResponseBody
	public Autor buscar(@RequestParam("idAutor") int cod) {
		Autor lista=null;
		RestTemplate rt=new RestTemplate();
		ResponseEntity<Autor>data= rt.getForEntity(URL+"/findAutor/"+cod, Autor.class);
		lista=data.getBody();
		return lista;
	}	
	
	
	@RequestMapping(value = "/save")
	public String save(@RequestParam("idAutor") int cod,
						@RequestParam("nombres") String nom,
						@RequestParam("apaterno") String apa,
						@RequestParam("amaterno") String ama,
						@RequestParam("pais") int idpa,
						RedirectAttributes redirect) {
		//crear objeto de la clase Autor
		Autor bean=new Autor();
		bean.setIdAutor(cod);
		bean.setNombres(nom);
		bean.setApaterno(apa);
		bean.setAmaterno(ama);
		bean.setPais(new Pais(idpa));
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
			rt.postForObject(URL+"/saveAutor", request, String.class);
			redirect.addFlashAttribute("MENSAJE","Registro correcto...");
		}
		else {
			//cabecera formato JSON
			HttpHeaders headers=new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			//unir json+headers
			HttpEntity<String> request=new HttpEntity<String>(json,headers);
			rt.put(URL+"/updateAutor", request, String.class);
			redirect.addFlashAttribute("MENSAJE","Registro actualizado...");			
		}
		
		return "redirect:/autor/";
	}
	@RequestMapping(value = "/delete/{idAutor}")
	public String delete(@PathVariable("idAutor") int cod,
						RedirectAttributes redirect) {
		RestTemplate rt=new RestTemplate();
		try {
			rt.delete(URL+"/deleteAutor/"+cod);
			redirect.addFlashAttribute("MENSAJE","Registro eliminado...");
		} catch (Exception e) {
			e.printStackTrace();
			redirect.addFlashAttribute("MENSAJE","Error en la eliminaciòn...");
		}
		return "redirect:/autor/";
	}
	
	
}
