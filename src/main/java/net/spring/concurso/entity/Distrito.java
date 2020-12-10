package net.spring.concurso.entity;
import java.io.Serializable;
import java.util.List;

public class Distrito implements Serializable{

	private int idDistrito;
	private String nombreDistrito;
	
	
	public int getIdDistrito() {
		return idDistrito;
	}
	public void setIdDistrito(int idDistrito) {
		this.idDistrito = idDistrito;
	}
	public String getNombreDistrito() {
		return nombreDistrito;
	}
	public void setNombreDistrito(String nombreDistrito) {
		this.nombreDistrito = nombreDistrito;
	}
	public Distrito(int cod) {
		idDistrito=cod;
	}
	public Distrito() {
	
	}
	

	
}
