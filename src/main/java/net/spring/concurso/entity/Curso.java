package net.spring.concurso.entity;
import java.io.Serializable;
public class Curso implements Serializable{
	private int codigoCurso;
	private String codigo;
	private String nombre;
	private String estado;
	private double precio;
	private TipoCarrera tipocarrera;
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
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	public TipoCarrera getTipocarrera() {
		return tipocarrera;
	}
	public void setTipocarrera(TipoCarrera tipocarrera) {
		this.tipocarrera = tipocarrera;
	}
	
	
}
