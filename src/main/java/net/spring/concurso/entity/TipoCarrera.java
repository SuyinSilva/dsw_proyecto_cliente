package net.spring.concurso.entity;
import java.io.Serializable;
public class TipoCarrera implements Serializable{
	private int tipCarrera;
	private String nombreTipoc;
	public int getTipCarrera() {
		return tipCarrera;
	}
	public void setTipCarrera(int tipCarrera) {
		this.tipCarrera = tipCarrera;
	}
	public String getNombreTipoc() {
		return nombreTipoc;
	}
	public void setNombreTipoc(String nombreTipoc) {
		this.nombreTipoc = nombreTipoc;
	}
	
	public TipoCarrera(int cod) {
		tipCarrera=cod;
	}
	public TipoCarrera() {
	
	}
	
	
	
	
}
