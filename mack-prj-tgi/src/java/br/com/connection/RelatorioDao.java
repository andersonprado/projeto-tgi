package br.com.connection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import br.com.beans.Relatorio;

public class RelatorioDao {

	String codAluno;
	String numRelat;
	private Connection connection;

	public RelatorioDao() {

	}

	public Relatorio getRelatorio(String codAluno) throws SQLException {

		try {
			this.connection = new ConnectionFactory().getConnection();
			Statement stm = connection.createStatement();
			String sql;
			sql = "SELECT * FROM RELATORIO WHERE COD_ALUNO = " + codAluno
					+ " AND RELATORIO_NUM = " + numRelat + ";";
			ResultSet rs = stm.executeQuery(sql);
			System.out.println(rs.next());

			/*
			 * if (!rs.next()) { return null; }
			 */
			// rs.last();
			Relatorio rl = new Relatorio();
			rl.setCodAluno(rs.getString("COD_ALUNO"));
			rl.setConteudoRelatorio(rs.getString("CONTEUDO_RELATORIO"));
			rl.setNumRelatorio(rs.getString("RELATORIO_NUM"));
			rs.close();
			stm.close();
			connection.close();
			return rl;
		} catch (SQLException e) {
			return null;
		}

	}

	public void postarRelatorio(String caminho, String tia, String num)
			throws Exception {
		Connection connection = new ConnectionFactory().getConnection();
		System.out.println("aluno inserido: " + tia);

		String sql = "INSERT INTO RELATORIO (COD_ALUNO, CONTEUDO_RELATORIO, RELATORIO_NUM) VALUES "
				+ "(" + tia + ", '" + caminho + "', " + num + ")";
		Statement stm = connection.createStatement();
		stm.executeUpdate(sql);
		stm.close();
		connection.close();

	}

	public void postarComentario(String caminho, String tia, String num)
			throws Exception {
		Connection connection = new ConnectionFactory().getConnection();
		System.out.println("aluno inserido: " + tia);

		String sql = "INSERT INTO RELATORIO (COD_ALUNO, COMENTARIO_RELATORIO, RELATORIO_NUM) VALUES "
				+ "(" + tia + ", '" + caminho + "', " + num + ")";
		Statement stm = connection.createStatement();
		stm.executeUpdate(sql);
		stm.close();
		connection.close();

	}

	public void atualizarRelatorio(String caminho) throws Exception {
		Connection connection = new ConnectionFactory().getConnection();

		String sql = "update relatorio set conteudo_relatorio = '" + caminho
				+ "'" + "where cod_aluno = " + getCodAluno()
				+ " and RELATORIO_NUM = " + getNumRelat() + ";";

		Statement stm = connection.createStatement();
		stm.executeUpdate(sql);
		stm.close();
		connection.close();

	}

	public void inserirNota(String tia, String num, String nota)
			throws Exception {
		try {
			Connection connection = new ConnectionFactory().getConnection();

			String sql = "update relatorio set relatorio_nota = '" + nota + "'"
					+ "where cod_aluno = " + tia + " and RELATORIO_NUM = "
					+ num + ";";

			Statement stm = connection.createStatement();
			stm.executeUpdate(sql);
			stm.close();
			connection.close();
		} catch (Exception e) {

		}

	}

	public void atualizarComentario(String caminho) throws Exception {
		Connection connection = new ConnectionFactory().getConnection();

		String sql = "update relatorio set comentario_relatorio = '" + caminho
				+ "'" + "where cod_aluno = " + getCodAluno()
				+ " and RELATORIO_NUM = " + getNumRelat() + ";";

		Statement stm = connection.createStatement();
		stm.executeUpdate(sql);
		stm.close();
		connection.close();

	}

	public String[] buscarAlunos(String prof) {
		try {
			this.connection = new ConnectionFactory().getConnection();
			Statement stm = connection.createStatement();
			String sql;
			sql = "select a.cod_aluno, p.nome from aluno a, grupo g, professor p"
					+ " where (a.cod_grupo = g.cod_grupo)"
					+ " and (g.cod_professor = p.cod_professor)"
					+ " and p.cod_professor = " + prof + ";";
			ResultSet rs = stm.executeQuery(sql);

			int i = 0;
			String[] src = new String[60];
			while (rs.next()) {
				src[i] = rs.getString(1);
				i++;
			}
			rs.close();
			stm.close();
			connection.close();
			return src;

		} catch (SQLException e) {
			return null;
		}

	}

	public void setCodAluno(String cod) {
		codAluno = cod;
	}

	public void setNumRelat(String num) {
		numRelat = num;
	}

	public String getCodAluno() {
		return codAluno;
	}

	public String getNumRelat() {
		return numRelat;
	}

}
