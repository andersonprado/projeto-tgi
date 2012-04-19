package br.com.beans;

import java.io.Serializable;

public class Login implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5023264136380551693L;
	private int idCod;
	private String senha;
	private int tipo;

	public int getIdCod() {
		return idCod;
	}

	public void setIdCod(int idCod) {
		this.idCod = idCod;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public int getTipo() {
		return tipo;
	}

	public void setTipo(int tipo) {
		this.tipo = tipo;
	}

}
