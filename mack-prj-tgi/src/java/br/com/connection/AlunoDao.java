package br.com.connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.beans.Aluno;

public class AlunoDao {
	private Connection connection;

	public AlunoDao() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public Aluno getAluno(int cod) throws SQLException {
		Aluno aluno = new Aluno();

		String sql = "SELECT * FROM ALUNO WHERE COD_ALUNO = ?";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setInt(1, cod);
		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			aluno.setIdCodAluno(rs.getInt("COD_ALUNO"));
			aluno.setNomeAluno(rs.getString("NOME_ALUNO"));
			aluno.setIdCodEnfase(rs.getInt("COD_ENFASE"));
			aluno.setIdCodGrupo(rs.getInt("COD_GRUPO"));
			aluno.setNotaAluno(rs.getDouble("NOTA_ALUNO"));
			aluno.setTgiAluno(rs.getInt("TGI_ALUNO"));

		}
		
		stmt.close();
		rs.close();

		return aluno;
	}

	public boolean insereAluno(Aluno aluno) throws SQLException {
		String sql = "INSERT INTO ALUNO (COD_ALUNO, NOME_ALUNO, COD_ENFASE, COD_GRUPO, NOTA_ALUNO, TGI_ALUNO) values (?,?,?,?,?,?)";
		PreparedStatement stmt = connection.prepareStatement(sql);

		stmt.setInt(1, aluno.getIdCodAluno());
		stmt.setString(2, aluno.getNomeAluno());
		stmt.setInt(3, aluno.getIdCodEnfase());
		stmt.setInt(4, aluno.getIdCodGrupo());
		stmt.setDouble(5, aluno.getNotaAluno());
		stmt.setInt(6, aluno.getTgiAluno());

		boolean inserido = stmt.execute();
		stmt.close();
		connection.close();
		return inserido;
	}

	public List<Aluno> getListaAlunos() {
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from Aluno");
			ResultSet rs = stmt.executeQuery();
			List<Aluno> alunos = new ArrayList<Aluno>();

			while (rs.next()) {

				Aluno aluno = new Aluno();

				aluno.setIdCodAluno(rs.getInt("COD_ALUNO"));
				aluno.setNomeAluno(rs.getString("NOME_ALUNO"));
				aluno.setIdCodEnfase(rs.getInt("COD_ENFASE"));
				aluno.setIdCodGrupo(rs.getInt("COD_GRUPO"));
				aluno.setNotaAluno(rs.getDouble("NOTA_ALUNO"));
				aluno.setTgiAluno(rs.getInt("TGI_ALUNO"));

				alunos.add(aluno);
			}

			connection.close();
			rs.close();
			stmt.close();

			return alunos;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void alteraAluno(Aluno aluno) {
		String sql = "update ALUNO set COD_GRUPO=? where COD_ALUNO=?";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setInt(1, aluno.getIdCodGrupo());
			stmt.setInt(2, aluno.getIdCodAluno());

			stmt.execute();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public void alterarAluno(Aluno aluno) {
		String sql = "update ALUNO set NOME_ALUNO=?, COD_ENFASE=? where COD_ALUNO=?";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setString(1, aluno.getNomeAluno());
			stmt.setInt(2, aluno.getIdCodEnfase());
			stmt.setInt(3, aluno.getIdCodAluno());

			System.out.println(aluno.getNomeAluno());
			System.out.println(aluno.getIdCodAluno());
			System.out.println(aluno.getIdCodEnfase());

			stmt.execute();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public List<Aluno> getListaAlunosGrupo(int codGrupo) {
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from Aluno where COD_GRUPO = ?");
			stmt.setInt(1, codGrupo);
			ResultSet rs = stmt.executeQuery();
			List<Aluno> alunos = new ArrayList<Aluno>();

			while (rs.next()) {

				Aluno aluno = new Aluno();

				aluno.setIdCodAluno(rs.getInt("COD_ALUNO"));
				aluno.setNomeAluno(rs.getString("NOME_ALUNO"));
				aluno.setIdCodEnfase(rs.getInt("COD_ENFASE"));
				aluno.setIdCodGrupo(rs.getInt("COD_GRUPO"));
				aluno.setNotaAluno(rs.getDouble("NOTA_ALUNO"));
				aluno.setTgiAluno(rs.getInt("TGI_ALUNO"));

				alunos.add(aluno);
			}

			rs.close();
			stmt.close();
			connection.close();
			return alunos;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public int getQuantidadeAlunos() throws SQLException {
		PreparedStatement stmt = this.connection
				.prepareStatement("select COUNT(COD_ALUNO) from Aluno");
		ResultSet rs = stmt.executeQuery();
		int quantidade = 0;
		while (rs.next()) {
			quantidade = rs.getInt(1);
		}
		
		stmt.close();
		return quantidade;
	}

}
