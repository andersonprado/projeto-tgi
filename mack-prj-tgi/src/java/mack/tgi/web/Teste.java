package mack.tgi.web;

import java.sql.SQLException;
import java.util.List;

import br.com.beans.*;
import br.com.beans.ProfessorNota;
import br.com.connection.*;

import br.com.connection.ProfessorNotaDao;

public class Teste {

	public static void main(String[] args) throws SQLException {

		// GrupoDao grupo1 = new GrupoDao();// adicionando Grupo

		// System.out.println(new GrupoDao().getListaGruposString());
		// System.out.println(new GrupoDao().getQuantGrupo(1234561));

		List<ProfessorNota> lista = new ProfessorNotaDao().getProfessorNotaBancaAluno(31087999);
		
		for (ProfessorNota pr : lista) {
			System.out.println(pr.getCodAluno());
		
		}
	}
}
