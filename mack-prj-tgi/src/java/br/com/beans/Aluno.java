package br.com.beans;

import java.io.Serializable;

public class Aluno implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idCodAluno;
	private String nomeAluno;
	private int idCodEnfase;
	private int idCodGrupo;
	private double notaAluno;
	private int tgiAluno;

	public int getIdCodAluno() {
		return idCodAluno;
	}

	public void setIdCodAluno(int idCodAluno) {
		this.idCodAluno = idCodAluno;
	}

	public String getNomeAluno() {
		return nomeAluno;
	}

	public void setNomeAluno(String nomeAluno) {
		this.nomeAluno = nomeAluno;
	}

	public int getIdCodEnfase() {
		return idCodEnfase;
	}

	public void setIdCodEnfase(int idCodEnfase) {
		this.idCodEnfase = idCodEnfase;
	}

	public int getIdCodGrupo() {
		return idCodGrupo;
	}

	public void setIdCodGrupo(int idCodGrupo) {
		this.idCodGrupo = idCodGrupo;
	}

	public double getNotaAluno() {
		return notaAluno;
	}

	public void setNotaAluno(double notaAluno) {
		this.notaAluno = notaAluno;
	}

	public int getTgiAluno() {
		return tgiAluno;
	}

	public void setTgiAluno(int tgiAluno) {
		this.tgiAluno = tgiAluno;
	}

	@Override
	public String toString() {
		return "Aluno: " + nomeAluno + " " + idCodAluno;
	}

}
