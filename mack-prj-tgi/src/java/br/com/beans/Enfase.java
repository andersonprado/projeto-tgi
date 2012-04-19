package br.com.beans;

import java.io.Serializable;

public class Enfase  implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4790841949258744085L;
	private int idCodEnfase;
	private String nomeFase;
	private int coordenadorFase;
	
	public int getIdCodEnfase() {
		return idCodEnfase;
	}
	
	public void setIdCodEnfase(int idCodEnfase) {
		this.idCodEnfase = idCodEnfase;
	}
	
	public String getNomeFase() {
		return nomeFase;
	}
	
	public void setNomeFase(String nomeFase) {
		this.nomeFase = nomeFase;
	}
	
	public int getCoordenadorFase() {
		return coordenadorFase;
	}
	
	public void setCoordenadorFase(int coordenadorFase) {
		this.coordenadorFase = coordenadorFase;
	}
	
}
