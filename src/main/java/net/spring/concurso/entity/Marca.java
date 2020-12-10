package net.spring.concurso.entity;
import java.io.Serializable;
public class Marca implements Serializable{
	private int codigoMarca;
	private String nombreMarca;
	
	public int getCodigoMarca() {
		return codigoMarca;
	}
	public void setCodigoMarca(int codigoMarca) {
		this.codigoMarca = codigoMarca;
	}
	public String getNombreMarca() {
		return nombreMarca;
	}
	public void setNombreMarca(String nombreMarca) {
		this.nombreMarca = nombreMarca;
	}
	public Marca(int cod) {
		codigoMarca=cod;
	}
	public Marca() {
	
	}
}
