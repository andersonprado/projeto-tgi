package br.com.beans;

import java.io.Serializable;

public class Grupo  implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2731285762221958479L;
	private int idCodGrupo;
	private String tituloGrupo;
	private int codEnfase;
	private int codProf;
	private int tgiGrupo;
	
	public void setIdCodGrupo(int id) {
		this.idCodGrupo = id;
	}
	
	public int getIdCodGrupo() {
		return idCodGrupo;
	}
	
	public String getTituloGrupo() {
		return tituloGrupo;
	}
	
	public void setTituloGrupo(String tituloGrupo) {
		this.tituloGrupo = tituloGrupo;
	}
	
	public int getCodEnfase() {
		return codEnfase;
	}
	
	public void setCodEnfase(int codEnfase) {
		this.codEnfase = codEnfase;
	}
	
	public int getCodProf() {
		return codProf;
	}
	
	public void setCodProf(int codProf) {
		this.codProf = codProf;
	}
	
	public int getTgiGrupo() {
		return tgiGrupo;
	}
	
	public void setTgiGrupo(int tgiGrupo) {
		this.tgiGrupo = tgiGrupo;
	}
	
}
