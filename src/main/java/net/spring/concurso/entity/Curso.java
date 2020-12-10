package net.spring.concurso.entity;
import java.io.Serializable;
public class Curso implements Serializable{
	private int codigoCurso;
	private String codigo;
	private String nombre;
	private String estado;
	private SistemaEvaluacion sistemaevaluacion;
	
	
	
	public int getCodigoCurso() {
		return codigoCurso;
	}
	public void setCodigoCurso(int codigoCurso) {
		this.codigoCurso = codigoCurso;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public SistemaEvaluacion getSistemaevaluacion() {
		return sistemaevaluacion;
	}
	public void setSistemaevaluacion(SistemaEvaluacion sistemaevaluacion) {
		this.sistemaevaluacion = sistemaevaluacion;
	}
	
	
}
