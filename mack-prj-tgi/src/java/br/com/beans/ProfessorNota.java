package br.com.beans;

import java.io.Serializable;

public class ProfessorNota  implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7609770537475243569L;
	private int num_professorNota;
	private int codAluno;
	private int codProfessor;
	private double nota;
	private int codBanca;

	public int getCodAluno() {
		return codAluno;
	}

	public void setCodAluno(int codAluno) {
		this.codAluno = codAluno;
	}

	public int getCodProfessor() {
		return codProfessor;
	}

	public void setCodProfessor(int codProfessor) {
		this.codProfessor = codProfessor;
	}

	public double getNota() {
		return nota;
	}

	public void setNota(double nota) {
		this.nota = nota;
	}

	public int getCodBanca() {
		return codBanca;
	}

	public void setCodBanca(int codBanca) {
		this.codBanca = codBanca;
	}

	public int getNumProfessorNota() {
		return num_professorNota;
	}

	public void setNumProfessorNota(int num_professorNota) {
		this.num_professorNota = num_professorNota;
	}

}
