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

import net.spring.concurso.entity.Libro;
import net.spring.concurso.entity.TipoLibro;

@Controller
@RequestMapping(value = "/cliente")
public class LibroController {
	private String URL="http://localhost:8080/WS_Servidor/libro";
	
	
	@RequestMapping(value = "/")
	public String principal(Model model) {
		//clase para llamar a un servicio 
		RestTemplate rt=new RestTemplate();
		//acceder a la anotaciòn GET del servicio usar el nombre "listAllComputadora"
		ResponseEntity<Libro[]>data= rt.getForEntity(URL+"/listAllLibro", Libro[].class);
		//obtener el JSOn que tiene data
		Libro[] lista=data.getBody();
		//crear un atrubuto
		model.addAttribute("dataLibros",lista);
		return "libro";
	}
	@RequestMapping(value = "/listaTipos")
	@ResponseBody
	public TipoLibro[] listaTipos(Model model) {
		TipoLibro[] lista=null;
		RestTemplate rt=new RestTemplate();
		ResponseEntity<TipoLibro[]>data= rt.getForEntity(URL+"/listAllTipoLibro", TipoLibro[].class);
		lista=data.getBody();
		return lista;
	}

	@RequestMapping(value = "/buscar")
	@ResponseBody
	public Libro buscar(@RequestParam("idLibro") int idlib) {
		Libro lista=null;
		RestTemplate rt=new RestTemplate();
		ResponseEntity<Libro>data= rt.getForEntity(URL+"/findLibro/"+idlib, Libro.class);
		lista=data.getBody();
		return lista;
	}	
	
	
	@RequestMapping(value = "/save")
	public String save(@RequestParam("idLibro") int idlib,
						@RequestParam("codigo") String cod,
						@RequestParam("titulo") String tit,
						@RequestParam("estado") String est,
						@RequestParam("tipo") String tip,
						@RequestParam("tipolibro") int codTipol,
						RedirectAttributes redirect) {
		//crear objeto de la clase Computadora
		Libro bean=new Libro();
		bean.setCodigoLibro(idlib);
		bean.setCodigo(cod);
		bean.setTitulo(tit);
		bean.setEstado(est);
		bean.setTipo(tip);
		bean.setTipolibro(new TipoLibro(codTipol));
		//serializar
		Gson gson=new Gson();
		String json=gson.toJson(bean);
		//
		RestTemplate rt=new RestTemplate();
		//validar cod
		if(idlib==0) {
			//cabecera formato JSON
			HttpHeaders headers=new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			//unir json+headers
			HttpEntity<String> request=new HttpEntity<String>(json,headers);
			rt.postForObject(URL+"/saveLibro", request, String.class);
			redirect.addFlashAttribute("MENSAJE","Registro de Libro Exitoso...");
		}
		else {
			//cabecera formato JSON
			HttpHeaders headers=new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			//unir json+headers
			HttpEntity<String> request=new HttpEntity<String>(json,headers);
			rt.put(URL+"/updateLibro", request, String.class);
			redirect.addFlashAttribute("MENSAJE","Libro Actualizado Exitosamente...");			
		}
		
		return "redirect:/cliente/";
	}
	
	@RequestMapping(value = "/delete/{idLibro}")
	public String delete(@PathVariable("idLibro") int idlib,
						RedirectAttributes redirect) {
		RestTemplate rt=new RestTemplate();
		try {
			rt.delete(URL+"/deleteLibro/"+idlib);
			redirect.addFlashAttribute("MENSAJE","Registro eliminado...");
		} catch (Exception e) {
			e.printStackTrace();
			redirect.addFlashAttribute("MENSAJE","Error en la eliminaciòn...");
		}
		return "redirect:/cliente/";
	}
	
	
}






