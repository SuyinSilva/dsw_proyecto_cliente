package net.spring.concurso.entity;
import java.io.Serializable;
public class Libro implements Serializable{
	private int codigoLibro;
	private String codigo;
	private String titulo;
	private String estado;
	private String tipo;
	private TipoLibro tipolibro;
	
	
	
	
	public int getCodigoLibro() {
		return codigoLibro;
	}
	public void setCodigoLibro(int codigoLibro) {
		this.codigoLibro = codigoLibro;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public TipoLibro getTipolibro() {
		return tipolibro;
	}
	public void setTipolibro(TipoLibro tipolibro) {
		this.tipolibro = tipolibro;
	}
	
	
	
	

	
}
