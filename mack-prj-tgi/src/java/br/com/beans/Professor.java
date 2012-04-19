package br.com.beans;

import java.io.Serializable;

public class Professor  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4361179501076589440L;
	private int idCodProfessor;
	private String nome;
	private String titularidadeProfessor;

	public int getIdCodProfessor() {
		return idCodProfessor;
	}

	public void setIdCodProfessor(int codProfessor) {
		this.idCodProfessor = codProfessor;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTitularidadeProfessor() {
		return titularidadeProfessor;
	}

	public void setTitularidadeProfessor(String titularidadeProfessor) {
		this.titularidadeProfessor = titularidadeProfessor;
	}@Override
	public String toString() {
		return "Professor: " + nome + " " + idCodProfessor;
	}

}
