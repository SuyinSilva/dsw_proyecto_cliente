package net.spring.concurso.entity;

import java.io.Serializable;

public class TipoEmpleado implements Serializable{

	private int codigoTipoEmpleado;
	private String nombreTipoEmpleado;
	
	
	public int getCodigoTipoEmpleado() {
		return codigoTipoEmpleado;
	}

	public void setCodigoTipoEmpleado(int codigoTipoEmpleado) {
		this.codigoTipoEmpleado = codigoTipoEmpleado;
	}

	public String getNombreTipoEmpleado() {
		return nombreTipoEmpleado;
	}

	public void setNombreTipoEmpleado(String nombreTipoEmpleado) {
		this.nombreTipoEmpleado = nombreTipoEmpleado;
	}

	public TipoEmpleado(int cod) {
		codigoTipoEmpleado=cod;
	}
	public TipoEmpleado() {
	
	}
	
	
}




