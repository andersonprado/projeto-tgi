package br.com.connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.beans.LocalDataHora;

public class LocaDataHoraDao {
	private Connection connection;

	public LocaDataHoraDao() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public void adicionaHorario(LocalDataHora dataHora) {
		String sql = "INSERT INTO LOCAL_DATA_HORA (COD_HORARIO, DATA_HORARIO, SALA, HORARIO_OCUPADO) values (?,?,?,?)";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			int quantidade = getMaxHorarios() + 1;
			String ocupado = "N";

			stmt.setInt(1, quantidade);
			stmt.setString(2, dataHora.getDataHorario());
			stmt.setInt(3, dataHora.getSala());
			stmt.setString(4, ocupado);
			System.out.println("Data inserida");
			System.out.println(quantidade + "   " + dataHora.getDataHorario());

			stmt.execute();
			stmt.close();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<LocalDataHora> getListaLocalDataHora() {
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from LOCAL_DATA_HORA");
			ResultSet rs = stmt.executeQuery();
			List<LocalDataHora> localData = new ArrayList<LocalDataHora>();

			// formatar data e hora

			while (rs.next()) {
				LocalDataHora hora = new LocalDataHora();
				hora.setCodHorario(rs.getInt(1));
				hora.setDataHorario(rs.getString(2));
				hora.setSala(rs.getInt(3));
				hora.setHorarioOcupado(rs.getString(4));
				localData.add(hora);

			}

			rs.close();
			stmt.close();
			
			return localData;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public LocalDataHora getLocalDataHora(int cod) {
		List<LocalDataHora> listaLocal = getListaLocalDataHora();
		LocalDataHora localData = null;

		for (LocalDataHora local : listaLocal) {
			if (local.getCodHorario() == cod) {
				localData = local;
				break;
			}
		}

		return localData;
	}

	public void alteraLocalDataHora(int id, String ocupado) {
		String sql = "update LOCAL_DATA_HORA set HORARIO_OCUPADO=? where COD_HORARIO=?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setString(1, ocupado);
			stmt.setInt(2, id);

			stmt.execute();
			stmt.close();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public int getMaxHorarios() throws SQLException {
		PreparedStatement stmt = this.connection
				.prepareStatement("select max(COD_HORARIO) from LOCAL_DATA_HORA");
		ResultSet rs = stmt.executeQuery();
		int quantidade = 0;
		while (rs.next()) {
			quantidade = rs.getInt(1);
		}
		stmt.close();
		rs.close();
		
		return quantidade;
	}

	public int existeHorarios() throws SQLException {
		PreparedStatement stmt = this.connection
				.prepareStatement("select * from LOCAL_DATA_HORA order by DATA_HORARIO");
		ResultSet rs = stmt.executeQuery();
		int quantidade = 0;
		while (rs.next()) {
			quantidade++;
		}
		rs.close();
		stmt.close();
		
		return quantidade;
	}

}
