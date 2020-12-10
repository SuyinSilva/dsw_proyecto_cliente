package net.spring.concurso.entity;

import java.io.Serializable;

public class Rol implements Serializable {
	
	private int idrol;

	private String descripcion;

	
	public Rol() {
	}

	public Rol(int cod) {
		idrol=cod;
	}
	public int getIdrol() {
		return this.idrol;
	}

	public void setIdrol(int idrol) {
		this.idrol = idrol;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	

}