package net.spring.concurso.entity;
import java.io.Serializable;
public class SistemaEvaluacion implements Serializable{
	private int sisEvaluacion;
	private String nombreSistemae;
	
	
	
	public int getSisEvaluacion() {
		return sisEvaluacion;
	}
	public void setSisEvaluacion(int sisEvaluacion) {
		this.sisEvaluacion = sisEvaluacion;
	}
	public String getNombreSistemae() {
		return nombreSistemae;
	}
	public void setNombreSistemae(String nombreSistemae) {
		this.nombreSistemae = nombreSistemae;
	}
	
	
	public SistemaEvaluacion(int cod) {
		sisEvaluacion=cod;
	}
	public SistemaEvaluacion() {
	
	}

	
}
