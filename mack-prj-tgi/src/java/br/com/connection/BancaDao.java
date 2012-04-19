package br.com.connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import br.com.beans.Banca;

public class BancaDao {

	private Connection connection;

	public BancaDao() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public boolean insereBanca(Banca banca) throws SQLException {
		String sql = "INSERT INTO BANCA (COD_BANCA, COD_HORARIO, COD_GRUPO, STATUS) values (?,?,?,?)";
		PreparedStatement stmt = connection.prepareStatement(sql);
		int valor = pegaNumeroBanca() + 1;

		stmt.setInt(1, valor);
		stmt.setInt(2, banca.getCodHorario());
		stmt.setInt(3, banca.getCodGrupo());
		stmt.setString(4, banca.getStatus());

		boolean inserido = stmt.execute();

		stmt.close();

		return inserido;
	}

	public List<Banca> getListaBanca() {
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from BANCA");
			ResultSet rs = stmt.executeQuery();

			List<Banca> bancas = new ArrayList<Banca>();

			while (rs.next()) {

				Banca banca = new Banca();

				banca.setCodBanca(rs.getInt(1));
				banca.setCodHorario(rs.getInt(2));
				banca.setCodGrupo(rs.getInt(3));
				banca.setStatus(rs.getString(4));

				bancas.add(banca);
			}

			rs.close();
			stmt.close();

			return bancas;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Banca getBanca(int id) {
		List<Banca> bancas = getListaBanca();
		Banca banca = null;
		for (Banca b : bancas) {
			if (b.getCodBanca() == id) {
				banca = b;
				break;
			}
		}
		return banca;
	}

	public Banca getBancaGrupo(int id) {
		List<Banca> bancas = getListaBanca();
		Banca banca = null;
		for (Banca b : bancas) {
			if (b.getCodGrupo() == id) {
				banca = b;
				break;
			}
		}
		return banca;
	}

	public Banca getBancaHorario(int id) {
		List<Banca> bancas = getListaBanca();
		Banca banca = null;
		for (Banca b : bancas) {
			if (b.getCodHorario() == id) {
				banca = b;
				break;
			}
		}
		return banca;
	}

	public int existeBanca(int codGrupo) {
		List<Banca> bancas = getListaBanca();
		int cont = 0;
		for (Banca b : bancas) {
			if (b.getCodGrupo() == codGrupo) {
				cont = 1;
			}
		}
		return cont;
	}

	public int pegaNumeroBanca() throws SQLException {
		PreparedStatement stmt = this.connection
				.prepareStatement("select max(COD_BANCA) from BANCA");
		int valor = 0;
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			valor = rs.getInt(1);
		}
		stmt.close();

		return valor;
	}

	public int getQuantidadeBancas() throws SQLException {
		PreparedStatement stmt = this.connection
				.prepareStatement("select COUNT(COD_BANCA) from BANCA");
		ResultSet rs = stmt.executeQuery();
		int quantidade = 0;
		while (rs.next()) {
			quantidade = rs.getInt(1);
		}

		stmt.close();
		return quantidade;
	}

}
