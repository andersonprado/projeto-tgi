package br.com.connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.com.beans.Login;

public class LoginDao {
	private Connection connection;

	public LoginDao() {
		this.connection = new ConnectionFactory().getConnection();

	}

	public boolean insereLogin(Login login) throws SQLException {
		String sql = "INSERT INTO Login (cod, senha, tipo) values (?,?,?)";
		PreparedStatement stmt = connection.prepareStatement(sql);

		stmt.setInt(1, login.getIdCod());
		stmt.setString(2, (String) login.getSenha());
		stmt.setInt(3, login.getTipo());

		boolean inserido = stmt.execute();

		stmt.close();
		
		return inserido;
	}

	public int existeUsuario(Login login) throws SQLException {
		String saida = "";
		int tipo = 0;

		String sql = "SELECT * FROM LOGIN WHERE COD = ? AND SENHA = ?";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setInt(1, login.getIdCod());
		stmt.setString(2, login.getSenha());
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			saida = "" + rs.getInt(1);
		}
		System.out.println(saida);
		if (saida.equals("")) {
			stmt.close();
	
			rs.close();
			return tipo; // Se não houver Usuario, fecha conexa e retorna tipo =
							// 0
		}

		// Como existe pegar o tipo de Usuario
		rs = stmt.executeQuery();

		System.out.println("Fazendo procura");
		while (rs.next()) {
			System.out.println("Procurando");
			tipo = rs.getInt("TIPO");
			System.out.println(rs.getInt("TIPO"));
		}
		// fecha conexão
		stmt.close();
		
		rs.close();

		return tipo;
	}

	public String getStringLogin() {
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from Login");
			ResultSet rs = stmt.executeQuery();
			String lista = "";

			while (rs.next()) {
				lista = "INSERT INTO PROFESSOR (COD, SENHA, TIPO) VALUES ( "

						+ rs.getInt("COD")
						+ ", "
						+ rs.getString("SENHA")
						+ ", "
						+ rs.getInt("TIPO") + " ) \n";

			}
			rs.close();
			stmt.close();
			return lista;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
