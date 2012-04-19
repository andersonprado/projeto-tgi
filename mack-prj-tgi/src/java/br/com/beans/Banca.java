package br.com.beans;

import java.io.Serializable;

public class Banca  implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8416317249668808988L;
	private int codBanca;
	private int codHorario;
	private int codGrupo;
	private String status;

	public int getCodBanca() {
		return codBanca;
	}

	public void setCodBanca(int codBanca) {
		this.codBanca = codBanca;
	}

	public int getCodHorario() {
		return codHorario;
	}

	public void setCodHorario(int codHorario) {
		this.codHorario = codHorario;
	}

	public int getCodGrupo() {
		return codGrupo;
	}

	public void setCodGrupo(int codGrupo) {
		this.codGrupo = codGrupo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
