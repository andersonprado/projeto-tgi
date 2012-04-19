package br.com.beans;

import java.io.Serializable;



public class LocalDataHora implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 990075409637596661L;
	private int codHorario;
	private String dataHorario;
	private int sala;
	private String horarioOcupado;

	public int getCodHorario() {
		return codHorario;
	}

	public void setCodHorario(int codHorario) {
		this.codHorario = codHorario;
	}

	public String getDataHorario() {
		return dataHorario;
	}

	public void setDataHorario(String dataHorario) {
		this.dataHorario = dataHorario;
	}

	public int getSala() {
		return sala;
	}

	public void setSala(int sala) {
		this.sala = sala;
	}

	public String getHorarioOcupado() {
		return horarioOcupado;
	}

	public void setHorarioOcupado(String horarioOcupado) {
		this.horarioOcupado = horarioOcupado;
	}

}
