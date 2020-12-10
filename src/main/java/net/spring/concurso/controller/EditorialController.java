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
import net.spring.concurso.entity.Editorial;
import net.spring.concurso.entity.Pais;

@Controller
@RequestMapping(value = "/editorial")
public class EditorialController {
	private String URL="http://localhost:8080/WS_Servidor/editorial";
	
	@RequestMapping(value = "/")
	public String principal(Model model) {
		//clase para llamar a un servicio 
		RestTemplate rt=new RestTemplate();
		//acceder a la anotaciòn GET del servicio usar el nombre "listAllComputadora"
		ResponseEntity<Editorial[]>data= rt.getForEntity(URL+"/listAllEditorial", Editorial[].class);
		//obtener el JSOn que tiene data
		Editorial[] lista=data.getBody();
		//crear un atrubuto
		model.addAttribute("dataEditoriales",lista);
		return "editorial";
	}
	@RequestMapping(value = "/listaPaises")
	@ResponseBody
	public Pais[] listaPaises(Model model) {
		Pais[] lista=null;
		RestTemplate rt=new RestTemplate();
		ResponseEntity<Pais[]>data= rt.getForEntity(URL+"/listAllPais", Pais[].class);
		lista=data.getBody();
		return lista;
	}

	@RequestMapping(value = "/buscar")
	@ResponseBody
	public Editorial buscar(@RequestParam("codigo") int cod) {
		Editorial lista=null;
		RestTemplate rt=new RestTemplate();
		ResponseEntity<Editorial>data= rt.getForEntity(URL+"/findEditorial/"+cod, Editorial.class);
		lista=data.getBody();
		return lista;
	}	
	
	
	@RequestMapping(value = "/save")
	public String save(@RequestParam("codigo") int cod,
						@RequestParam("nombre") String nom,
						@RequestParam("direccion") String dir,
						@RequestParam("telefono") String tel,
						@RequestParam("correo") String cor,
						@RequestParam("pais") int idPais,
						RedirectAttributes redirect) {
		//crear objeto de la clase Computadora
		Editorial bean=new Editorial();
		bean.setIdEditorial(cod);
		bean.setNombre(nom);
		bean.setDireccion(dir);
		bean.setTelefono(tel);
		bean.setCorreo(cor);
		bean.setPais(new Pais(idPais));
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
			redirect.addFlashAttribute("MENSAJE","Registro actualizado...");			
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





