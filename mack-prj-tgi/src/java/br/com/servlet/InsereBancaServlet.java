package br.com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.beans.*;
import br.com.connection.AlunoDao;
import br.com.connection.BancaDao;
import br.com.connection.GrupoDao;
import br.com.connection.LocaDataHoraDao;
import br.com.connection.ProfessorNotaDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsereBancaServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8674040516528883176L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		PrintWriter out = response.getWriter();

		String nomeGrupo = request.getParameter("nome");

		int codData = Integer.parseInt(request.getParameter("codData"));

		Grupo grupo = new GrupoDao().getGrupo(nomeGrupo);

		int codGrupo = grupo.getIdCodGrupo(); // codigo do grupo

		int codProfOri = grupo.getCodProf(); // codigo do professor orientador

		int codProf2 = Integer.parseInt(request.getParameter("codProf")); // professor
																			// banca
		// 1

		int codProf3 = Integer.parseInt(request.getParameter("codProf2")); // professor
																			// banca

		// 2
		boolean continua = true;
		if ((codProf2 == codProf3) || (codProf2 == codProfOri)
				|| (codProf3 == codProfOri))
			continua = false;

		String inserido = "A Banca não foi Inserida !";

		while (continua) {

			Banca banca = new Banca();

			banca.setCodGrupo(codGrupo);
			banca.setCodHorario(codData);
			banca.setStatus("Ativa");

			BancaDao bancaDao = new BancaDao();
			List<Aluno> listAluno = new AlunoDao()
					.getListaAlunosGrupo(codGrupo); // lista

			try {

				bancaDao.insereBanca(banca); // insere com ocupado o horario na

			} catch (SQLException e) {
				inserido = "Banca não foi inserida!";
				e.printStackTrace();
			}

			LocaDataHoraDao horaDao = new LocaDataHoraDao();
			horaDao.alteraLocalDataHora(banca.getCodHorario(), "S");

			int codBanca = new BancaDao().getBancaGrupo(codGrupo).getCodBanca();

			// metodo de inserção em Lista de Professores Nota

			List<ProfessorNota> listaProfNota = new ArrayList<ProfessorNota>();

			int[] codprof = { codProfOri, codProf2, codProf3 };

		
			
			for (int i = 0; i < codprof.length; i++) {
				for (Aluno aluno : listAluno) {

					ProfessorNota pf = new ProfessorNota();

					pf.setCodAluno(aluno.getIdCodAluno());
					pf.setCodProfessor(codprof[i]);
					pf.setNumProfessorNota(i + 1);
					pf.setNota(0);
					pf.setCodBanca(codBanca);

					listaProfNota.add(pf);

				}

			}

			for (ProfessorNota tabelaProf : listaProfNota) {
				try {
					new ProfessorNotaDao().insereProfessorNota(tabelaProf);
				} catch (SQLException e) {

					e.printStackTrace();
				}

				System.out.println("");
			}
			inserido = "A Banca foi Inserida!";
			continua = false;
		}
		
		out.println("<html>");
		out.println("<head>");
		out.println("<link rel=\"icon\" href=\"imagens/simbolo_M.ico\">");
		out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/default.css\" />");
		out.println("</head>");
		out.println("<body>");
		out.println("<div class=\"bordaBox\">");
		out.println("<b class=\"b1\"></b><b class=\"b2\"></b><b class=\"b3\"></b><b class=\"b4\"></b>");
		out.println("<div class=\"conteudo\"><br/><br/><br/><br/>");

		out.println(inserido);
		out.println("<br/><br/><br/><a href=\"../tgi/principal.jsp\">Voltar</a>");

		out.println("<br/><br/><br/><br/></div>");
		out.println("<b class=\"b4\"></b><b class=\"b3\"></b><b class=\"b2\"></b><b class=\"b1\"></b></div>");

		out.println("</body>");
		out.println("</html>");
	}
}
