package net.spring.concurso.entity;

import java.io.Serializable;

public class Enlace implements Serializable {

	private int idenlace;
	private String descripcion;
	private String ruta;
	

	public int getIdenlace() {
		return this.idenlace;
	}

	public void setIdenlace(int idenlace) {
		this.idenlace = idenlace;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getRuta() {
		return this.ruta;
	}

	public void setRuta(String ruta) {
		this.ruta = ruta;
	}

}