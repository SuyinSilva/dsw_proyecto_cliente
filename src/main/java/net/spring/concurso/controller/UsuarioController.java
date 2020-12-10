package net.spring.concurso.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.spring.concurso.entity.Computadora;
import net.spring.concurso.entity.Enlace;
import net.spring.concurso.entity.Usuario;

@Controller
@RequestMapping(value = "/sesion")
public class UsuarioController {
	private String URL="http://localhost:8080/WS_Servidor/session";
	
	
	@RequestMapping(value = "/")
	public String inicio() {
		return "sesion";
	}
	
	
	@RequestMapping(value = "/iniciar")
	public String iniciar(@RequestParam("login") String vLogin,
						@RequestParam("clave") String vClave,
						RedirectAttributes redirect,
						HttpServletRequest request ) {
		
		RestTemplate rt=new RestTemplate();
		Usuario bean=null;
		ResponseEntity<Usuario>data= rt.getForEntity(URL+"/iniciar/"+vLogin+"/"+vClave, 
												Usuario.class);
		//obtener el usuario que se encuentra en data y enviarlo a bean
		bean=data.getBody();
		//validar bean
		if(bean==null) {
			redirect.addFlashAttribute("MENSAJE","Error iniciar sesión...");	
			return "redirect:/sesion/";
			//return "sesion";
		}
		else {
			
			//obtener el rol del usuario actual
			int rol;
			rol=bean.getRol().getIdrol();
			ResponseEntity<Enlace[]>lista= rt.getForEntity(URL+"/privilegios/"+rol, 
																Enlace[].class);
			//obtener el JSOn que tiene data
			Enlace[] enlaces=lista.getBody();
			//crear session
			HttpSession session=request.getSession();
			session.setAttribute("dataEnlaces",enlaces);
			session.setAttribute("dataUsuario",bean);
			return "menu";
		}
	}
	
	
	
	
}
