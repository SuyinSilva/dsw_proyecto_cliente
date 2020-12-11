package net.spring.concurso.controller;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.springframework.web.bind.annotation.PathVariable;

import com.google.gson.Gson;

import net.spring.concurso.entity.Curso;
import net.spring.concurso.entity.TipoCarrera;

@Controller
@RequestMapping(value = "/curso")
public class CursoController {
	private String URL="http://localhost:8080/WS_Servidor/curso";
	
	
	@RequestMapping(value = "/")
	public String principal(Model model) {
		//clase para llamar a un servicio 
		RestTemplate rt=new RestTemplate();
		//acceder a la anotaciòn GET del servicio usar el nombre "listAllComputadora"
		ResponseEntity<Curso[]>data= rt.getForEntity(URL+"/listAllCurso", Curso[].class);
		//obtener el JSOn que tiene data
		Curso[] lista=data.getBody();
		//crear un atrubuto
		model.addAttribute("dataCursos",lista);
		return "curso";
	}
	@RequestMapping(value = "/listaTipos")
	@ResponseBody
	public TipoCarrera[] listaTipos(Model model) {
		TipoCarrera[] lista=null;
		RestTemplate rt=new RestTemplate();
		ResponseEntity<TipoCarrera[]>data= rt.getForEntity(URL+"/listAllTipoCarrera", TipoCarrera[].class);
		lista=data.getBody();
		return lista;
	}

	@RequestMapping(value = "/buscar")
	@ResponseBody
	public Curso buscar(@RequestParam("idCurso") int idcur) {
		Curso lista=null;
		RestTemplate rt=new RestTemplate();
		ResponseEntity<Curso>data= rt.getForEntity(URL+"/findCurso/"+idcur, Curso.class);
		lista=data.getBody();
		return lista;
	}	
	
	
	@RequestMapping(value = "/save")
	public String save(@RequestParam("idCurso") int idcur,
						@RequestParam("codigo") String cod,
						@RequestParam("nombre") String nom,
						@RequestParam("estado") String est,
						@RequestParam("precio") double pre,
						@RequestParam("tipocarrera") int codTipoc,
						RedirectAttributes redirect) {
		//crear objeto de la clase Computadora
		Curso bean=new Curso();
		bean.setCodigoCurso(idcur);
		bean.setCodigo(cod);
		bean.setNombre(nom);
		bean.setEstado(est);
		bean.setPrecio(pre);
		bean.setTipocarrera(new TipoCarrera(codTipoc));
		//serializar
		Gson gson=new Gson();
		String json=gson.toJson(bean);
		//
		RestTemplate rt=new RestTemplate();
		//validar cod
		if(idcur==0) {
			//cabecera formato JSON
			HttpHeaders headers=new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			//unir json+headers
			HttpEntity<String> request=new HttpEntity<String>(json,headers);
			rt.postForObject(URL+"/saveCurso", request, String.class);
			redirect.addFlashAttribute("MENSAJE","Registro de Curso Exitoso...");
		}
		else {
			//cabecera formato JSON
			HttpHeaders headers=new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			//unir json+headers
			HttpEntity<String> request=new HttpEntity<String>(json,headers);
			rt.put(URL+"/updateCurso", request, String.class);
			redirect.addFlashAttribute("MENSAJE","Curso Actualizado Exitosamente...");			
		}
		
		return "redirect:/curso/";
	}
	
	@RequestMapping(value = "/delete/{idCurso}")
	public String delete(@PathVariable("idCurso") int idcur,
						RedirectAttributes redirect) {
		RestTemplate rt=new RestTemplate();
		try {
			rt.delete(URL+"/deleteCurso/"+idcur);
			redirect.addFlashAttribute("MENSAJE","Curso eliminado...");
		} catch (Exception e) {
			e.printStackTrace();
			redirect.addFlashAttribute("MENSAJE","Error en la eliminaciòn...");
		}
		return "redirect:/curso/";
	}
	
	
}





