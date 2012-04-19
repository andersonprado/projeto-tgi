package br.com.connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.beans.Professor;

// dao criado apenas para listagem em drop box. Não possui todos os métodos CRUD
public class ProfessorDao {

	private Connection connection;

	public ProfessorDao() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public List<Professor> getListaProfessores() {
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from PROFESSOR");
			ResultSet rs = stmt.executeQuery();
			List<Professor> professores = new ArrayList<Professor>();

			while (rs.next()) {

				Professor professor = new Professor();
				professor.setIdCodProfessor(rs.getInt("COD_PROFESSOR"));
				professor.setNome(rs.getString("NOME"));
				professor.setTitularidadeProfessor(rs
						.getString("TITULARIDADE_PROFESSOR"));

				professores.add(professor);

			}
			rs.close();
			stmt.close();

			return professores;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Professor getProfessor(int id) {
		List<Professor> professores = getListaProfessores();
		Professor professor = null;
		for (Professor prof : professores) {
			if (prof.getIdCodProfessor() == id) {
				professor = prof;
				break;
			}
		}

		return professor;
	}

	public String getStringProfessores() {
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from PROFESSOR");
			ResultSet rs = stmt.executeQuery();
			String lista = "";

			while (rs.next()) {
				lista = "INSERT INTO PROFESSOR (COD_PROFESSOR, NOME, TITULARIDADE) VALUES ( "

						+ rs.getInt("COD_PROFESSOR")
						+ ", "
						+ rs.getString("NOME")
						+ ", "
						+ rs.getString("TITULARIDADE_PROFESSOR") + " ) \n";

			}

			rs.close();
			stmt.close();
			return lista;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public int getProfessoresDistinct() {
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select DISTINCT P.COD_PROFESSOR from professor P, professor_nota PN WHERE P.COD_PROFESSOR = PN.COD_PROFESSOR ");
			ResultSet rs = stmt.executeQuery();
			int total = 0;

			while (rs.next()) {
				total ++;

			}
			rs.close();
			stmt.close();

			return total;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
