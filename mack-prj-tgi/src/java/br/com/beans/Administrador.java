package br.com.beans;

import java.io.Serializable;

public class Administrador implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1382322589891954412L;
	private int codAdministrador;

	public int getCodAdministrador() {
		return codAdministrador;
	}

	public void setCodAdministrador(int codAdministrador) {
		this.codAdministrador = codAdministrador;
	}

	public String toString() {
		return "Administrador " + codAdministrador;
	}

}
