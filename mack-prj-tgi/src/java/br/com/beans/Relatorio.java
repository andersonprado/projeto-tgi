package br.com.beans;

import java.io.Serializable;

public class Relatorio implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7723354793380261896L;
	private String codAluno;
	private double notaRelatorio;
	private String numRelatorio;
	private String conteudoRelatorio;
	private String comentarioRelatorio;

	public String getCodAluno() {
		return codAluno;
	}

	public void setCodAluno(String codAluno) {
		this.codAluno = codAluno;
	}

	public double getNotaRelatorio() {
		return notaRelatorio;
	}

	public void setNotaRelatorio(double notaRelatorio) {
		this.notaRelatorio = notaRelatorio;
	}

	public String getNumRelatorio() {
		return numRelatorio;
	}

	public void setNumRelatorio(String numRelatorio) {
		this.numRelatorio = numRelatorio;
	}

	public String getConteudoRelatorio() {
		return conteudoRelatorio;
	}

	public void setConteudoRelatorio(String conteudoRelatorio) {
		this.conteudoRelatorio = conteudoRelatorio;
	}

	public String getComentarioRelatorio() {
		return comentarioRelatorio;
	}

	public void setComentarioRelatorio(String comentarioRelatorio) {
		this.comentarioRelatorio = comentarioRelatorio;
	}

}
