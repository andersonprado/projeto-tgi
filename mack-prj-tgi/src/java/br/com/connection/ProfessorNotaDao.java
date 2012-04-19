package br.com.connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.beans.ProfessorNota;

public class ProfessorNotaDao {

	private Connection connection;

	public ProfessorNotaDao() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public ProfessorNota getProfessorNota(int cod) throws SQLException {
		ProfessorNota professorNota = new ProfessorNota();

		String sql = "SELECT * FROM PROFESSOR_NOTA WHERE NUM_PROFESSOR = ?";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setInt(1, cod);
		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			professorNota.setNumProfessorNota(rs.getInt("NUM_PROFESSOR"));
			professorNota.setCodAluno(rs.getInt("COD_ALUNO"));
			professorNota.setCodProfessor(rs.getInt("COD_PROFESSOR"));
			professorNota.setNota(rs.getDouble("NOTA"));
		}

		stmt.close();
		rs.close();

		return professorNota;
	}

	public boolean insereProfessorNota(ProfessorNota professorNota)
			throws SQLException {
		String sql = "INSERT INTO PROFESSOR_NOTA (COD_ALUNO, NUM_PROFESSOR, COD_PROFESSOR, NOTA, COD_BANCA) VALUES (?,?,?,?,?)";
		PreparedStatement stmt = connection.prepareStatement(sql);

		stmt.setInt(1, professorNota.getCodAluno());
		stmt.setInt(2, professorNota.getNumProfessorNota());
		stmt.setInt(3, professorNota.getCodProfessor());
		stmt.setDouble(4, professorNota.getNota());
		stmt.setInt(5, professorNota.getCodBanca());

		boolean inserido = stmt.execute();

		stmt.close();
		connection.close();
		return inserido;
	}

	public void alteraNotas(ProfessorNota nota) {
		String sql = "update PROFESSOR_NOTA set NOTA =? where COD_ALUNO =? AND NUM_PROFESSOR =?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setDouble(1, nota.getNota());

			stmt.setInt(2, nota.getCodAluno());
			stmt.setInt(3, nota.getNumProfessorNota());

			for (int i = 0; i <= 65000; i++) {
				for (int j = 0; j < 10000; j++) {

				}
			}

			System.out.println("Nota dentro metodo " + nota.getNota()
					+ " numero professor" + nota.getNumProfessorNota()
					+ "metodo update");
			stmt.execute();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public List<ProfessorNota> getListaProfessorNota() {
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from PROFESSOR_NOTA order by cod_aluno");
			ResultSet rs = stmt.executeQuery();
			List<ProfessorNota> profNotas = new ArrayList<ProfessorNota>();

			while (rs.next()) {

				ProfessorNota pNota = new ProfessorNota();

				System.out.println(pNota.getNota());

				pNota.setCodAluno(rs.getInt("COD_ALUNO"));
				pNota.setNumProfessorNota(rs.getInt("NUM_PROFESSOR"));
				pNota.setCodProfessor(rs.getInt("COD_PROFESSOR"));
				pNota.setNota(rs.getDouble("NOTA"));
				pNota.setCodBanca(rs.getInt("COD_BANCA"));

				profNotas.add(pNota);
			}
			rs.close();
			stmt.close();

			return profNotas;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<ProfessorNota> getProfessorNotaBanca(int codBanca) {
		List<ProfessorNota> notas = new ArrayList<ProfessorNota>();

		for (ProfessorNota pr : getListaProfessorNota()) {
			if (pr.getCodBanca() == codBanca) {
				notas.add(pr);
			
			}
		}
		return notas;
	}

	public List<ProfessorNota> getProfessorNotaBancaAluno(int codAluno) {
		List<ProfessorNota> notas = new ArrayList<ProfessorNota>();

		for (ProfessorNota pr : getListaProfessorNota()) {
			if (pr.getCodAluno() == codAluno) {
				System.out.println("dentro do dao 2");
				notas.add(pr);

			}
		}
		return notas;
	}


}
