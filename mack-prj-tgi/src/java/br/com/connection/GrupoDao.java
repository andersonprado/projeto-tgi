package br.com.connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.beans.Grupo;

public class GrupoDao {

	private Connection connection;

	public GrupoDao() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public void adicionaGrupo(Grupo grupo) {
		String sql = "INSERT INTO GRUPO (COD_GRUPO, TITULO_GRUPO, COD_ENFASE, COD_PROFESSOR, TGI_GRUPO) values (?,?,?,?,?)";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			int cod = new GrupoDao().getMaxGrupo();
			cod += 1;

			stmt.setInt(1, cod);
			stmt.setString(2, grupo.getTituloGrupo());

			stmt.setInt(3, grupo.getCodEnfase());

			stmt.setInt(4, grupo.getCodProf());

			stmt.setInt(5, grupo.getTgiGrupo());

			stmt.execute();
			stmt.close();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void alteraGrupo(int id, String titulo, int codEnfase, int codProf,
			int tgiGrupo) {
		String sql = "update GRUPO set TITULO_GRUPO=?, COD_ENFASE=?, COD_PROFESSOR=?, TGI_GRUPO=? where COD_GRUPO=?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setString(1, titulo);
			stmt.setInt(2, codEnfase);
			stmt.setInt(3, codProf);
			stmt.setInt(4, tgiGrupo);
			stmt.setInt(5, id);

			stmt.execute();
			stmt.close();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public void deletaGrupo(int id) {
		String sql = "DELETE FROM GRUPO WHERE COD_GRUPO = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setInt(1, id);

			stmt.execute();
			stmt.close();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Grupo> getListaGrupos() {
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from GRUPO order by TGI_GRUPO asc");
			ResultSet rs = stmt.executeQuery();
			List<Grupo> grupos = new ArrayList<Grupo>();

			while (rs.next()) {

				Grupo grupo = new Grupo();

				grupo.setIdCodGrupo(rs.getInt("COD_GRUPO"));
				grupo.setTituloGrupo(rs.getString("TITULO_GRUPO"));
				grupo.setCodEnfase(rs.getInt("COD_ENFASE"));
				grupo.setCodProf(rs.getInt("COD_PROFESSOR"));
				grupo.setTgiGrupo(rs.getInt("TGI_GRUPO"));
				grupo.setIdCodGrupo(rs.getInt("COD_GRUPO"));

				grupos.add(grupo);
			}
			rs.close();
			stmt.close();
			
			return grupos;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public String getListaGruposString() {
		String lista = "";
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from GRUPO");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				lista += "Insert Into Grupo (TITULO_GRUPO, COD_ENFASE, COD_PROFESSOR, TGI_GRUPO) ( '"
						+ rs.getString("TITULO_GRUPO")
						+ "', "
						+ rs.getInt("COD_ENFASE")
						+ ", "
						+ rs.getInt("COD_PROFESSOR")
						+ ", "
						+ rs.getInt("TGI_GRUPO")
						+ ""
						+ rs.getInt("COD_GRUPO")
						+ "); \n";

			}

			rs.close();
			stmt.close();
			
			return lista;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Grupo getGrupo(int id) {
		List<Grupo> grupos = getListaGrupos();
		Grupo grupo = null;
		for (Grupo g : grupos) {
			if (g.getIdCodGrupo() == id) {
				grupo = g;
				break;
			}
		}

		return grupo;
	}

	public Grupo getGrupo(String nome) {
		List<Grupo> grupos = getListaGrupos();
		Grupo grupo = null;
		for (Grupo g : grupos) {
			if (g.getTituloGrupo().equals(nome)) {
				grupo = g;
				break;
			}
		}
		return grupo;
	}

	public int getQuantGrupo(int codProf) {
		List<Grupo> grupos = getListaGrupos();
		int cont = 0;
		for (Grupo g : grupos) {
			if (g.getCodProf() == codProf) {
				cont++;

			}
		}
		return cont;
	}

	public int getMaxGrupo() throws SQLException {
		PreparedStatement stmt = this.connection
				.prepareStatement("select max(cod_grupo) from GRUPO");
		ResultSet rs = stmt.executeQuery();
		int quantidade = 0;
		while (rs.next()) {
			quantidade = rs.getInt(1);
		}
		
		stmt.close();
		return quantidade;
	}
	
	public int getQuantidadeGrupos() throws SQLException {
		PreparedStatement stmt = this.connection
				.prepareStatement("select COUNT(cod_grupo) from GRUPO");
		ResultSet rs = stmt.executeQuery();
		int quantidade = 0;
		while (rs.next()) {
			quantidade = rs.getInt(1);
		}
		
		stmt.close();
		return quantidade;
	}

}
