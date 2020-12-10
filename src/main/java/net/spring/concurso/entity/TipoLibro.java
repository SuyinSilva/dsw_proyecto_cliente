package net.spring.concurso.entity;
import java.io.Serializable;
public class TipoLibro implements Serializable{
	private int tipLibro;
	private String nombreTipol;
		
	
	
	public int getTipLibro() {
		return tipLibro;
	}
	public void setTipLibro(int tipLibro) {
		this.tipLibro = tipLibro;
	}
	public String getNombreTipol() {
		return nombreTipol;
	}
	public void setNombreTipol(String nombreTipol) {
		this.nombreTipol = nombreTipol;
	}
	public TipoLibro(int cod) {
		tipLibro=cod;
	}
	public TipoLibro() {
	
	}
}
