package br.com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.beans.Aluno;
import br.com.beans.Grupo;
import br.com.connection.AlunoDao;

import br.com.connection.GrupoDao;

public class InsereGrupoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		PrintWriter out = response.getWriter();

		String titulo = request.getParameter("titulo");

		int tia;

	
		String adicionado = "O grupo não foi adicionado com sucesso";

		try {
			tia = Integer.parseInt(request.getParameter("tia"));

			Aluno aluno = new AlunoDao().getAluno(tia);

			Grupo grupo = new Grupo();

			grupo.setTituloGrupo(titulo);
			grupo.setCodEnfase(aluno.getIdCodEnfase());
			grupo.setTgiGrupo(1);
			grupo.setCodProf(1);

			GrupoDao grupo1 = new GrupoDao();// adicionando Grupo
			grupo1.adicionaGrupo(grupo);

			aluno.setIdCodGrupo(new GrupoDao().getGrupo(titulo).getIdCodGrupo());

			System.out.println("Codigo do aluno" + aluno.getIdCodGrupo());

			AlunoDao alunoDao = new AlunoDao(); // alterando aluno
			alunoDao.alteraAluno(aluno);

			adicionado = "O grupo foi adicionado com sucesso";

		} catch (NumberFormatException ex) {
			System.out.println("Erro de formato de numero");

		} catch (SQLException e) {
			System.out.println("Erro SQL");
			adicionado = "O grupo não foi adicionado com sucesso";
			e.printStackTrace();
		}

		out.println("<html>");
		out.println("<head>");
		out.println("<link rel=\"icon\" href=\"imagens/simbolo_M.ico\">");
		out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/default.css\" />");
		out.println("</head>");
		out.println("<body>");
		out.println("<div class=\"bordaBox\">");
		out.println("<b class=\"b1\"></b><b class=\"b2\"></b><b class=\"b3\"></b><b class=\"b4\"></b>");
		out.println("<div class=\"conteudo\"><br /> <br /> <br /><br /> <br /> <br />");

		out.println("" + titulo);
		out.println("<br/><br/><br/><br/><a href=\"../tgi/principal.jsp\">Voltar</a><br/><br/><br/><br/><br/><br/><br/>");

		out.println("</div>");
		out.println("<b class=\"b4\"></b><b class=\"b3\"></b><b class=\"b2\"></b><b class=\"b1\"></b></div>");

		out.println("</body>");
		out.println("</html>");
	}
}
