package br.com.connection;

import java.sql.*;


import java.util.List;
import br.com.beans.*;

public class AtaDAO {
	private String data, mostrarData, hora, dia, mes, ano;
	private String salaPredio, sala, predio;
	private String codGrupo = "1";
	private String tituloTrabalho = "";
	private String aluno01 = "";
	private String aluno02 = "";
	private String aluno03 = "";
	private String aluno04 = "";
	private String tia01 = "";
	private String tia02 = "";
	private String tia03 = "";
	private String tia04 = "";
	private String enfase01 = "";
	private String enfase02 = "";
	private String enfase03 = "";
	private String enfase04 = "";
	private String aluno1R1 = "";
	private String aluno1R2 = "";
	private String aluno1R3 = "";
	private String aluno2R1 = "";
	private String aluno2R2 = "";
	private String aluno2R3 = "";
	private String aluno3R1 = "";
	private String aluno3R2 = "";
	private String aluno3R3 = "";
	private String aluno4R1 = "";
	private String aluno4R2 = "";
	private String aluno4R3 = "";

	private String aluno1R4 = "";
	private String aluno2R4 = "";
	private String aluno3R4 = "";
	private String aluno4R4 = "";

	private String aluno1N1 = "";
	private String aluno1N2 = "";
	private String aluno1N3 = "";

	private String aluno1N4 = "";

	private String aluno2N1 = "";
	private String aluno2N2 = "";
	private String aluno2N3 = "";

	private String aluno2N4 = "";

	private String aluno3N1 = "";
	private String aluno3N2 = "";
	private String aluno3N3 = "";

	private String aluno3N4 = "";

	private String aluno4N1 = "";
	private String aluno4N2 = "";
	private String aluno4N3 = "";

	private String aluno4N4 = "";

	private List<ProfessorNota> listaNotasTgi;

	private String nomeOrientador = "";
	private String avaliador01 = "";
	private String avaliador02 = "";
	private String coordenadorTgi = "";
	private Connection connection;

	public AtaDAO() throws Exception {
		connection = new ConnectionFactory().getConnection();

		// mudar depois getConexao();
	}

	public void setSala() throws SQLException {

		String sala = "SELECT  sala "
				+ "FROM LOCAL_DATA_HORA ldh, BANCA ba, GRUPO gr "
				+ "WHERE ldh.cod_horario = ba.cod_horario "
				+ "AND ba.cod_grupo = gr.cod_grupo " + "AND gr.cod_grupo = "
				+ getCodGrupo() + ";";
		Statement statement = null;
		ResultSet rs = null;
		try {
			statement = connection.createStatement();

			rs = statement.executeQuery(sala);

			if (rs.next()) {
				salaPredio = rs.getString("Sala");
				sala = salaPredio.substring(2, 5);

			} else {
				sala = " ";
			}
			this.sala = sala;

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			if (rs != null)
				rs.close();
			if (statement != null)
				statement.close();

		}
	}

	public String getSala() {
		return sala;
	}

	public String getSalaPredio() {
		return salaPredio;
	}

	public void setSalaPredio(String salaPredio) {
		this.salaPredio = salaPredio;
	}

	public void setData() throws SQLException {
		Statement statement = null;
		ResultSet rs = null;
		try {
			statement = connection.createStatement();

			rs = statement.executeQuery("" + "SELECT data_horario "
					+ "FROM LOCAL_DATA_HORA ldh, BANCA ba, GRUPO gr "
					+ "WHERE ldh.cod_horario = ba.cod_horario "
					+ "AND ba.cod_grupo = gr.cod_grupo "
					+ "AND gr.cod_grupo = " + getCodGrupo() + ";");

			while (rs.next()) {
				data = rs.getString(1);
			}

			setAno(data.substring(0, 4));

			setMes(data.substring(5, 6));
			int tmp;

			tmp = Integer.parseInt(mes);

			switch (tmp) {
			case 1:
				setMes("Janeiro");
				break;
			case 2:
				setMes("Fevereiro");
				break;
			case 3:
				setMes("Março");
				break;
			case 4:
				setMes("Abril");
				break;
			case 5:
				setMes("Maio");
				break;
			case 6:
				setMes("Junho");
				break;
			case 7:
				setMes("Julho");
				break;
			case 8:
				setMes("Agosto");
				break;
			case 9:
				setMes("Setembro");
				break;
			case 10:
				setMes("Outrubro");
				break;
			case 11:
				setMes("Novembro");
				break;
			case 12:
				setMes("Dezembro");
				break;
			}

			setDia(data.substring(8, 10));

			setHora(data.substring(11, 16));

			setMostrarData("Aos " + dia + " dias do mês de " + mes + " de "
					+ ano + ", às " + hora + ", ");

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
			System.out.print("Erro em formato de data");
		} finally {
			if (rs != null)
				rs.close();
			if (statement != null)
				statement.close();

		}
	}

	public String getData() {
		return data;
	}

	public String getDia() {
		return dia;
	}

	public void setDia(String dia) {
		this.dia = dia;
	}

	public String getMes() {
		return mes;
	}

	public void setMes(String mes) {
		this.mes = mes;
	}

	public String getAno() {
		return ano;
	}

	public void setAno(String ano) {
		this.ano = ano;
	}

	public void setHora(String hora) {
		this.hora = hora;

	}

	public String getHora() {
		return hora;
	}

	public String getMostrarData() {
		return mostrarData;
	}

	public void setMostrarData(String mostrarData) {
		this.mostrarData = mostrarData;
	}

	public void setPredio() throws SQLException {

		String predio = "SELECT  sala "
				+ "FROM LOCAL_DATA_HORA ldh, BANCA ba, GRUPO gr "
				+ "WHERE ldh.cod_horario = ba.cod_horario "
				+ "AND ba.cod_grupo = gr.cod_grupo " + "AND gr.cod_grupo = "
				+ getCodGrupo() + ";";
		Statement statement = null;
		ResultSet rs = null;
		try {
			statement = connection.createStatement();

			rs = statement.executeQuery(predio);

			if (rs.next()) {
				this.salaPredio = rs.getString("Sala");
				this.predio = salaPredio.substring(0, 2);

			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			if (rs != null)
				rs.close();
			if (statement != null)
				statement.close();

		}
	}

	public String getPredio() {
		return predio;
	}

	public void setTituloTrabalho() throws SQLException {
		Statement statement = null;
		ResultSet rs = null;
		try {
			statement = connection.createStatement();

			rs = statement.executeQuery("" + "SELECT titulo_grupo "
					+ "FROM GRUPO " + "WHERE cod_grupo = " + getCodGrupo()
					+ ";");

			if (rs.next()) {
				this.tituloTrabalho = rs.getString(1);

			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			if (rs != null)
				rs.close();
			if (statement != null)
				statement.close();

		}
	}

	public String getTituloTrabalho() {
		return tituloTrabalho;
	}

	public void setAvaliador2() throws SQLException {
		Statement statement = null;
		ResultSet rs = null;
		try {
			statement = connection.createStatement();

			rs = statement
					.executeQuery("SELECT DISTINCT p.nome FROM "
							+ "PROFESSOR p, PROFESSOR_NOTA np "
							+ "WHERE "
							+ "(np.COD_BANCA = (SELECT cod_banca "
							+ "from banca  where cod_grupo = "
							+ getCodGrupo()
							+ "))"
							+ " AND (p.COD_PROFESSOR = np.COD_PROFESSOR) AND (`NUM_PROFESSOR` = 2);");

			while (rs.next()) {
				String tmp = rs.getString(1);
				// System.out.println(rs.getString(1));

				setAvaliador01(tmp);

			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			if (rs != null)
				rs.close();
			if (statement != null)
				statement.close();

		}
	}

	public void setAvaliador3() throws SQLException {
		Statement statement = null;
		ResultSet rs = null;
		try {
			statement = connection.createStatement();

			rs = statement
					.executeQuery("SELECT DISTINCT p.nome FROM "
							+ "PROFESSOR p, PROFESSOR_NOTA np "
							+ "WHERE "
							+ "(np.COD_BANCA = (SELECT cod_banca "
							+ "from banca  where cod_grupo = "
							+ getCodGrupo()
							+ "))"
							+ " AND (p.COD_PROFESSOR = np.COD_PROFESSOR) AND (`NUM_PROFESSOR` = 3);");

			while (rs.next()) {
				String tmp = rs.getString(1);
				// System.out.println(rs.getString(1));
				setAvaliador02(tmp);

			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			if (rs != null)
				rs.close();
			if (statement != null)
				statement.close();

		}
	}

	public void setAvaliador01(String avaliador01) {
		this.avaliador01 = avaliador01;
	}

	public String getAvaliador01() {
		return avaliador01;
	}

	public void setAvaliador02(String avaliador02) {
		this.avaliador02 = avaliador02;
	}

	public String getAvaliador02() {
		return avaliador02;
	}

	public void setNomeOrientador() throws SQLException {
		Statement statement = null;
		ResultSet rs = null;
		try {

			statement = connection.createStatement();

			rs = statement
					.executeQuery("SELECT DISTINCT p.nome FROM "
							+ "PROFESSOR p, PROFESSOR_NOTA np "
							+ "WHERE "
							+ "(np.COD_BANCA = (SELECT cod_banca "
							+ "from banca  where cod_grupo = "
							+ getCodGrupo()
							+ "))"
							+ " AND (p.COD_PROFESSOR = np.COD_PROFESSOR) AND (`NUM_PROFESSOR` = 1);");

			if (rs.next()) {
				this.nomeOrientador = rs.getString(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			if (rs != null)
				rs.close();
			if (statement != null)
				statement.close();

		}
	}

	public String getNomeOrientador() {
		return nomeOrientador;
	}

	public void setNomeAlunos() throws SQLException {
		Statement statement = null;
		ResultSet rs = null;
		try {
			statement = connection.createStatement();

			rs = statement.executeQuery("" + "SELECT al.nome_aluno "
					+ "FROM GRUPO gr, ALUNO al "
					+ "WHERE gr.cod_grupo  = al.cod_grupo"
					+ " AND gr.cod_grupo = " + getCodGrupo() + ";");

			for (int i = 0; rs.next(); i++) {
				String tmp = rs.getString(1);
				switch (i) {
				case 0:
					setAluno01(tmp);
					break;
				case 1:
					setAluno02(tmp);
					break;
				case 2:
					setAluno03(tmp);
					break;
				case 3:
					setAluno04(tmp);
					break;
				}
			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			if (rs != null)
				rs.close();
			if (statement != null)
				statement.close();

		}

	}

	public void setAluno01(String aluno01) {
		this.aluno01 = aluno01;
	}

	public void setAluno02(String aluno02) {
		this.aluno02 = aluno02;
	}

	public void setAluno03(String aluno03) {
		this.aluno03 = aluno03;
	}

	public void setAluno04(String aluno04) {
		this.aluno04 = aluno04;
	}

	public String getAluno01() {
		return aluno01;
	}

	public String getAluno02() {
		return aluno02;
	}

	public String getAluno03() {
		return aluno03;
	}

	public String getAluno04() {
		return aluno04;
	}

	public void setTias() throws SQLException {
		Statement statement = null;
		ResultSet rs = null;
		try {
			statement = connection.createStatement();

			rs = statement.executeQuery("SELECT al.cod_aluno "
					+ "FROM GRUPO gr, ALUNO al "
					+ "WHERE gr.cod_grupo  = al.cod_grupo "
					+ "AND gr.cod_grupo = " + getCodGrupo() + ";");

			for (int i = 0; rs.next(); i++) {
				String tmp = rs.getString(1);
				switch (i) {
				case 0:
					setTia01(tmp);
					break;
				case 1:
					setTia02(tmp);
					break;
				case 2:
					setTia03(tmp);
					break;
				case 3:
					setTia04(tmp);
					break;
				}
			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			if (rs != null)
				rs.close();
			if (statement != null)
				statement.close();

		}

	}

	public void setTia01(String tia01) {
		this.tia01 = tia01;
	}

	public void setTia02(String tia02) {
		this.tia02 = tia02;
	}

	public void setTia03(String tia03) {
		this.tia03 = tia03;
	}

	public void setTia04(String tia04) {
		this.tia04 = tia04;
	}

	public String getTia01() {
		return tia01;
	}

	public String getTia02() {
		return tia02;
	}

	public String getTia03() {
		return tia03;
	}

	public String getTia04() {
		return tia04;
	}

	public void setEnfases() throws SQLException {
		Statement statement = null;
		ResultSet rs = null;
		try {
			statement = connection.createStatement();

			rs = statement.executeQuery("" + "SELECT ef.nome_enfase "
					+ "FROM ENFASE ef, ALUNO al, GRUPO gr "
					+ "WHERE al.cod_grupo =  gr.cod_grupo "
					+ "AND al.cod_enfase = ef.cod_enfase "
					+ "AND gr.cod_grupo = " + getCodGrupo() + ";");

			for (int i = 0; rs.next(); i++) {
				String tmp = rs.getString(1);
				switch (i) {
				case 0:
					setEnfase01(tmp);
					break;
				case 1:
					setEnfase02(tmp);
					break;
				case 2:
					setEnfase03(tmp);
					break;
				case 3:
					setEnfase04(tmp);
					break;
				}
			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			if (rs != null)
				rs.close();
			if (statement != null)
				statement.close();

		}

	}

	public void setEnfase01(String enfase01) {
		this.enfase01 = enfase01;
	}

	public void setEnfase02(String enfase02) {
		this.enfase02 = enfase02;
	}

	public void setEnfase03(String enfase03) {
		this.enfase03 = enfase03;
	}

	public void setEnfase04(String enfase04) {
		this.enfase04 = enfase04;
	}

	public String getEnfase01() {
		return enfase01;
	}

	public String getEnfase02() {
		return enfase02;
	}

	public String getEnfase03() {
		return enfase03;
	}

	public String getEnfase04() {
		return enfase04;
	}

	public void setNotasAluno01() throws SQLException {
		Statement statement = null;
		ResultSet rs = null;
		try {

			String tia01 = getTia01();
			if (!tia01.equals("")) {
				statement = (Statement) connection.createStatement();
				rs = statement.executeQuery("SELECT rl.relatorio_nota "
						+ "FROM ALUNO al, RELATORIO rl "
						+ "WHERE (rl.cod_aluno = al.cod_aluno) "
						+ " AND al.cod_aluno = " + tia01 + ";");

				for (int i = 0; rs.next(); i++) {
					String tmp = rs.getString(1);
					setAlunoR(1, i, tmp);
				}
			}
		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			if (rs != null)
				rs.close();
			if (statement != null)
				statement.close();

		}

	}

	public void setAlunoR(int numAluno, int numRel, String alunoR) {
		switch (numRel) {
		case 0:
			setAlunoR1(numAluno, alunoR);
			break;
		case 1:
			setAlunoR2(numAluno, alunoR);
			break;
		case 2:
			setAlunoR3(numAluno, alunoR);
			break;

		}

	}

	public void setAlunoR1(int num, String alunoR1) {
		switch (num) {
		case 1:
			this.aluno1R1 = alunoR1;
			break;
		case 2:
			this.aluno2R1 = alunoR1;
			break;
		case 3:
			this.aluno3R1 = alunoR1;
			break;
		case 4:
			this.aluno4R1 = alunoR1;
			break;

		}

	}

	public void setAlunoR2(int num, String alunoR2) {
		switch (num) {
		case 1:
			this.aluno1R2 = alunoR2;
			break;
		case 2:
			this.aluno2R2 = alunoR2;
			break;
		case 3:
			this.aluno3R2 = alunoR2;
			break;
		case 4:
			this.aluno4R2 = alunoR2;
			break;

		}

	}

	public void setAlunoR3(int num, String alunoR3) {
		switch (num) {
		case 1:
			this.aluno1R3 = alunoR3;
			break;
		case 2:
			this.aluno2R3 = alunoR3;
			break;
		case 3:
			this.aluno3R3 = alunoR3;
			break;
		case 4:
			this.aluno4R3 = alunoR3;
			break;

		}

	}

	/*
	 * public void setAluno1R1(String aluno1R1) { this.aluno1R1 = aluno1R1; }
	 * 
	 * public void setAluno1R2(String aluno1R2) { this.aluno1R2 = aluno1R2; }
	 * 
	 * public void setAluno1R3(String aluno1R3) { this.aluno1R3 = aluno1R3; }
	 */
	public String getAluno1R1() {
		return aluno1R1;
	}

	public String getAluno1R2() {
		return aluno1R2;
	}

	public String getAluno1R3() {
		return aluno1R3;
	}

	public void setNotasAluno02() throws SQLException {
		Statement statement = null;
		ResultSet rs = null;
		try {

			String tia02 = getTia02();
			if (!tia02.equals("")) {
				statement = connection.createStatement();
				rs = statement.executeQuery("SELECT rl.relatorio_nota "
						+ "FROM ALUNO al, RELATORIO rl "
						+ "WHERE (rl.cod_aluno = al.cod_aluno) "
						+ " AND al.cod_aluno = " + tia02 + ";");

				for (int i = 0; rs.next(); i++) {
					String tmp = rs.getString(1);
					setAlunoR(2, i, tmp);
				}
			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			if (rs != null)
				rs.close();
			if (statement != null)
				statement.close();

		}
	}

	public void setAluno2R1(String aluno2R1) {
		this.aluno2R1 = aluno2R1;
	}

	public void setAluno2R2(String aluno2R2) {
		this.aluno2R2 = aluno2R2;
	}

	public void setAluno2R3(String aluno2R3) {
		this.aluno2R3 = aluno2R3;
	}

	public String getAluno2R1() {
		return aluno2R1;
	}

	public String getAluno2R2() {
		return aluno2R2;
	}

	public String getAluno2R3() {
		return aluno2R3;
	}

	public void setNotasAluno03() throws SQLException {
		Statement statement = null;
		ResultSet rs = null;
		try {

			String tia03 = getTia03();
			if (!tia03.equals("")) {
				statement = connection.createStatement();
				rs = statement.executeQuery("SELECT rl.relatorio_nota "
						+ "FROM ALUNO al, RELATORIO rl "
						+ "WHERE (rl.cod_aluno = al.cod_aluno) "
						+ " AND al.cod_aluno = " + tia03 + ";");

				for (int i = 0; rs.next(); i++) {
					String tmp = rs.getString(1);
					setAlunoR(3, i, tmp);
				}
			}
		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			if (rs != null)
				rs.close();
			if (statement != null)
				statement.close();

		}

	}

	public void setAluno3R1(String aluno3R1) {
		this.aluno3R1 = aluno3R1;
	}

	public void setAluno3R2(String aluno3R2) {
		this.aluno3R2 = aluno3R2;
	}

	public void setAluno3R3(String aluno3R3) {
		this.aluno3R3 = aluno3R3;
	}

	public String getAluno3R1() {
		return aluno3R1;
	}

	public String getAluno3R2() {
		return aluno3R2;
	}

	public String getAluno3R3() {
		return aluno3R3;
	}

	public void setNotasAluno04() throws SQLException {
		Statement statement = null;
		ResultSet rs = null;
		try {

			String tia4 = getTia04();

			if (!tia4.equals("")) {
				statement = connection.createStatement();
				rs = statement.executeQuery("SELECT rl.relatorio_nota "
						+ "FROM ALUNO al, RELATORIO rl "
						+ "WHERE (rl.cod_aluno = al.cod_aluno) "
						+ " AND al.cod_aluno = " + tia4 + ";");

				for (int i = 0; rs.next(); i++) {
					String tmp = rs.getString(1);
					setAlunoR(4, i, tmp);
				}
			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			if (rs != null)
				rs.close();
			if (statement != null)
				statement.close();

		}

	}

	public void setAluno4R1(String aluno4R1) {
		this.aluno4R1 = aluno4R1;
	}

	public void setAluno4R2(String aluno4R2) {
		this.aluno4R2 = aluno4R2;
	}

	public void setAluno4R3(String aluno4R3) {
		this.aluno4R3 = aluno4R3;
	}

	public String getAluno4R1() {
		return aluno4R1;
	}

	public String getAluno4R2() {
		return aluno4R2;
	}

	public String getAluno4R3() {
		return aluno4R3;
	}

	public void setCoordenadorTgi() throws SQLException {
		Statement statement = null;
		ResultSet rs = null;
		try {
			statement = connection.createStatement();

			rs = statement.executeQuery("" + "SELECT pr.nome "
					+ "FROM PROFESSOR pr, GRUPO gr, ENFASE e "
					+ "WHERE gr.cod_enfase = e.cod_enfase "
					+ "AND e.coordenador_enfase = pr.cod_professor "
					+ "AND gr.cod_grupo = " + getCodGrupo() + ";");

			if (rs.next()) {
				this.coordenadorTgi = rs.getString(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			if (rs != null)
				rs.close();
			if (statement != null)
				statement.close();

		}

	}

	public void setListaNotas() {

		List<ProfessorNota> listaTodasNotas = new ProfessorNotaDao()
				.getListaProfessorNota();

		this.listaNotasTgi = listaTodasNotas;

	}

	public List<ProfessorNota> getListaNotasTgi() {
		return listaNotasTgi;
	}

	public void setNotasAluno1() {

		if ((!getListaNotasTgi().equals(null)) && (!getTia01().equals(""))) {
			int tia01 = Integer.parseInt(getTia01());
			int cont = 0;
			for (ProfessorNota pfr : getListaNotasTgi()) {
				if (tia01 == pfr.getCodAluno()) {
					switch (cont) {
					case 0:
						this.aluno1N1 = "" + pfr.getNota();
						System.out.println(pfr.getNota());
						break;
					case 1:
						this.aluno1N2 = "" + pfr.getNota();
						System.out.println(pfr.getNota());
						break;
					case 2:
						this.aluno1N3 = "" + pfr.getNota();
						System.out.println(pfr.getNota());
						break;

					}
					cont++;
				}
			}

		}

	}

	public void setNotasAluno2() {

		if ((!getListaNotasTgi().equals(null)) && (!getTia02().equals(""))) {
			int tia02 = Integer.parseInt(getTia02());
			int cont = 0;
			for (ProfessorNota pfr : getListaNotasTgi()) {
				if (tia02 == pfr.getCodAluno()) {
					switch (cont) {
					case 0:
						this.aluno2N1 = "" + pfr.getNota();
						System.out.println(pfr.getNota());
						break;
					case 1:
						this.aluno2N2 = "" + pfr.getNota();
						System.out.println(pfr.getNota());
						break;
					case 2:
						this.aluno2N3 = "" + pfr.getNota();
						System.out.println(pfr.getNota());
						break;

					}
					cont++;

				}
			}

		}

	}

	public void setNotasAluno3() {

		if ((!getListaNotasTgi().equals(null)) && (!getTia03().equals(""))) {
			int tia03 = Integer.parseInt(getTia03());
			int cont = 0;
			for (ProfessorNota pfr : getListaNotasTgi()) {
				if (tia03 == pfr.getCodAluno()) {
					switch (cont) {
					case 0:
						this.aluno3N1 = "" + pfr.getNota();
						System.out.println(pfr.getNota());

						break;
					case 1:
						this.aluno3N2 = "" + pfr.getNota();
						System.out.println(pfr.getNota());

						break;
					case 2:
						aluno3N3 = "" + pfr.getNota();
						System.out.println(pfr.getNota());

						break;

					}
					cont++;

				}
			}

		}

	}

	public void setNotasAluno4() {

		if ((!getListaNotasTgi().equals(null)) && (!getTia04().equals(""))) {
			int tia01 = Integer.parseInt(getTia04());
			int cont = 0;
			for (ProfessorNota pfr : getListaNotasTgi()) {
				if (tia01 == pfr.getCodAluno()) {
					switch (cont) {
					case 0:
						aluno4N1 = "" + pfr.getNota();
						break;
					case 1:
						aluno4N2 = "" + pfr.getNota();
						break;
					case 2:
						aluno4N3 = "" + pfr.getNota();
						break;

					}
					cont++;
				}
			}

		}

	}

	public void setNotasRelatorioAlunos() {

		if (!tia01.equals("")) {
			double nota11 = 0, nota12 = 0, nota13 = 0, nota14 = 0;
			double resultado;
			if (!aluno1R1.equals(""))
				nota11 = Double.parseDouble(aluno1R1);
			if (!aluno1R2.equals(""))
				nota12 = Double.parseDouble(aluno1R2);
			if (!aluno1R3.equals(""))
				nota13 = Double.parseDouble(aluno1R3);
			if (!aluno1N1.equals(""))
				nota14 = Double.parseDouble(aluno1N1);
			resultado = (nota11 * 0.1) + (nota12 * 0.2) + (nota13 * 0.3)
					+ (nota14 * 0.4);
			this.aluno1R4 = "" + resultado;
		}

		if (!tia02.equals("")) {
			double nota21 = 0, nota22 = 0, nota23 = 0, nota24 = 0;
			double resultado;
			if (!aluno2R1.equals(""))
				nota21 = Double.parseDouble(aluno2R1);
			if (!aluno2R2.equals(""))
				nota22 = Double.parseDouble(aluno2R2);
			if (!aluno2R3.equals(""))
				nota23 = Double.parseDouble(aluno2R3);
			if (!aluno2N1.equals(""))
				nota24 = Double.parseDouble(aluno2N1);
			resultado = (nota21 * 0.1) + (nota22 * 0.2) + (nota23 * 0.3)
					+ (nota24 * 0.4);
			this.aluno2R4 = "" + resultado;
		}

		if (!tia03.equals("")) {
			double nota31 = 0, nota32 = 0, nota33 = 0, nota34 = 0;
			double resultado;
			if (!aluno3R1.equals(""))
				nota31 = Double.parseDouble(aluno3R1);
			if (!aluno3R2.equals(""))
				nota32 = Double.parseDouble(aluno3R2);
			if (!aluno3R3.equals(""))
				nota33 = Double.parseDouble(aluno3R3);
			if (!aluno3N1.equals(""))
				nota34 = Double.parseDouble(aluno3N1);
			resultado = (nota31 * 0.1) + (nota32 * 0.2) + (nota33 * 0.3)
					+ (nota34 * 0.4);
			this.aluno3R4 = "" + resultado;
		}

		if (!tia04.equals("")) {
			double nota41 = 0, nota42 = 0, nota43 = 0, nota44 = 0;
			double resultado;
			if (!aluno4R1.equals(""))
				nota41 = Double.parseDouble(aluno4R1);
			if (!aluno4R2.equals(""))
				nota42 = Double.parseDouble(aluno4R2);
			if (!aluno4R3.equals(""))
				nota43 = Double.parseDouble(aluno4R3);
			if (!aluno4N1.equals(""))
				nota44 = Double.parseDouble(aluno4N1);
			resultado = (nota41 * 0.1) + (nota42 * 0.2) + (nota43 * 0.3)
					+ (nota44 * 0.4);
			this.aluno4R4 = "" + resultado;
		}

	}

	public void setNotasFinaisAlunos() {

		if (!tia01.equals("")) {
			double nota11 = 0, nota12 = 0, nota13 = 0;
			double resultado;
			if (!aluno1R4.equals(""))
				nota11 = Double.parseDouble(aluno1R4);
			if (!aluno1N2.equals(""))
				nota12 = Double.parseDouble(aluno1N2);
			if (!aluno1N3.equals(""))
				nota13 = Double.parseDouble(aluno1N3);

			resultado = ((nota11) + (nota12) + (nota13)) / 3;
			this.aluno1N4 = "" + resultado;
		}

		if (!tia02.equals("")) {
			double nota21 = 0, nota22 = 0, nota23 = 0;
			double resultado;
			if (!aluno2R4.equals(""))
				nota21 = Double.parseDouble(aluno2R4);
			if (!aluno2N2.equals(""))
				nota22 = Double.parseDouble(aluno2N2);
			if (!aluno2N3.equals(""))
				nota23 = Double.parseDouble(aluno2N3);

			resultado = ((nota21) + (nota22) + (nota23)) / 3;

			this.aluno2N4 = "" + resultado;
		}

		if (!tia03.equals("")) {
			double nota31 = 0, nota32 = 0, nota33 = 0;
			double resultado;
			if (!aluno3R4.equals(""))
				nota31 = Double.parseDouble(aluno3R4);
			if (!aluno3N2.equals(""))
				nota32 = Double.parseDouble(aluno3N2);
			if (!aluno3N3.equals(""))
				nota33 = Double.parseDouble(aluno3N3);

			resultado = ((nota31) + (nota32) + (nota33)) / 3;
			aluno3N4 = "" + resultado;
		}
		if (!tia04.equals("")) {
			double nota41 = 0, nota42 = 0, nota43 = 0;
			double resultado;
			if (!aluno4R4.equals(""))
				nota41 = Double.parseDouble(aluno4R4);
			if (!aluno1N2.equals(""))
				nota42 = Double.parseDouble(aluno4N2);
			if (!aluno4N3.equals(""))
				nota43 = Double.parseDouble(aluno4N3);

			resultado = ((nota41) + (nota42) + (nota43)) / 3;
			this.aluno4N4 = "" + resultado;
		}
	}

	public String getCoordenadorTgi() {
		return coordenadorTgi;
	}

	public void setCodGrupo(String codGrupo) {
		this.codGrupo = codGrupo;
	}

	public String getCodGrupo() {
		return codGrupo;
	}

	public String getAluno1N1() {
		return aluno1N1;
	}

	public String getAluno1N2() {
		return aluno1N2;
	}

	public String getAluno1N3() {
		return aluno1N3;
	}

	public String getAluno2N1() {
		return aluno2N1;
	}

	public String getAluno2N2() {
		return aluno2N2;
	}

	public String getAluno2N3() {
		return aluno2N3;
	}

	public String getAluno3N1() {
		return aluno3N1;
	}

	public String getAluno3N2() {
		return aluno3N2;
	}

	public String getAluno3N3() {
		return aluno3N3;
	}

	public String getAluno4N1() {
		return aluno4N1;
	}

	public String getAluno4N2() {
		return aluno4N2;
	}

	public String getAluno4N3() {
		return aluno4N3;
	}

	public void setAluno1R1(String aluno1r1) {
		aluno1R1 = aluno1r1;
	}

	public void setAluno1R2(String aluno1r2) {
		aluno1R2 = aluno1r2;
	}

	@SuppressWarnings("unused")
	private static Connection getConexao() throws Exception {

		return null; // ConexaoDB.conexaoMySQL();
	}

	public String getAluno1R4() {
		return aluno1R4;
	}

	public String getAluno2R4() {
		return aluno2R4;
	}

	public String getAluno3R4() {
		return aluno3R4;
	}

	public String getAluno4R4() {
		return aluno4R4;
	}

	public String getAluno1N4() {
		return aluno1N4;
	}

	public String getAluno2N4() {
		return aluno2N4;
	}

	public String getAluno3N4() {
		return aluno3N4;
	}

	public String getAluno4N4() {
		return aluno4N4;
	}

}
