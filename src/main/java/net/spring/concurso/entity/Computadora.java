package net.spring.concurso.entity;
import java.io.Serializable;
public class Computadora implements Serializable{
	private int codigoComputadora;
	private String descripcion;
	private int cantidad;
	private double precio;
	private String fecha;
	private Marca marca;
	
	public int getCodigoComputadora() {
		return codigoComputadora;
	}
	public void setCodigoComputadora(int codigoComputadora) {
		this.codigoComputadora = codigoComputadora;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public Marca getMarca() {
		return marca;
	}
	public void setMarca(Marca marca) {
		this.marca = marca;
	}
	
}
