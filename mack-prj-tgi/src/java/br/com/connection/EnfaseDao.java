package br.com.connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.beans.Enfase;

// dao criado apenas para listagem em drop box. Não possui todos os métodos CRUD
public class EnfaseDao {

	private Connection connection;

	public EnfaseDao() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public void adicionaEnfase(Enfase enfase) {
		String sql = "INSERT INTO ENFASE (COD_ENFASE, NOME_ENFASE, COORDENADOR_ENFASE) values (?,?,?)";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setInt(1, enfase.getIdCodEnfase());
			stmt.setString(2, enfase.getNomeFase());
			stmt.setInt(3, enfase.getCoordenadorFase());

			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Enfase> getListaEnfases() {
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from ENFASE");
			ResultSet rs = stmt.executeQuery();
			List<Enfase> enfases = new ArrayList<Enfase>();

			while (rs.next()) {

				Enfase enfase = new Enfase();
				enfase.setIdCodEnfase(rs.getInt("COD_ENFASE"));
				enfase.setNomeFase(rs.getString("NOME_ENFASE"));
				enfase.setCoordenadorFase(rs.getInt("COORDENADOR_ENFASE"));

				enfases.add(enfase);
			}
		
			rs.close();
			stmt.close();

			return enfases;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Enfase getEnfase(int id) {
		List<Enfase> enfases = getListaEnfases();
		Enfase enfase = null;
		for (Enfase enf : enfases) {
			if (enf.getIdCodEnfase() == id) {
				enfase = enf;
				break;
			}
		}

		return enfase;
	}

	public String getStringEnfases() {
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from ENFASE");
			ResultSet rs = stmt.executeQuery();
			String lista = "";

			while (rs.next()) {

				lista += "INSERT INTO ENFASE (COD_ENFASE, NOME_ENFASE, COORDENADOR_ENFASE) values ( "
						+ rs.getInt("COD_ENFASE")
						+ ", "
						+ rs.getString("NOME_ENFASE")
						+ ", "
						+ rs.getInt("COORDENADOR_ENFASE") + ")\n";

			}
			rs.close();
			stmt.close();
	
			return lista;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
