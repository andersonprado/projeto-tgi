package br.com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.connection.GrupoDao;

public class ManutencaoGrupoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		PrintWriter out = response.getWriter();

		String tituloGrupo = request.getParameter("tituloGrupo");
		int codEnfase = Integer.parseInt(request.getParameter("codEnfase"));
		int codProf = Integer.parseInt(request.getParameter("codProf"));
		int tgiGrupo = Integer.parseInt(request.getParameter("tgiGrupo"));

		// request do dropbox provisório
		int idGrupoAlterado = Integer.parseInt(request
				.getParameter("grupoAlterado"));

		GrupoDao dao = new GrupoDao();

		dao.alteraGrupo(idGrupoAlterado, tituloGrupo, codEnfase, codProf,
				tgiGrupo);

		// adiciona grupo
		// Grupo grupo = new Grupo();
		// grupo.setCodEnfase(codEnfase);
		// grupo.setCodProf(codProf);
		// grupo.setTgiGrupo(tgiGrupo);
		// grupo.setTituloGrupo(tituloGrupo);

		// dao.adicionaGrupo(grupo);

		// deleta grupo
		// dao.deletaGrupo(idGrupoAlterado);

		out.println("<html>");
		out.println("<head>");
		out.println("<link rel=\"icon\" href=\"imagens/simbolo_M.ico\">");
		out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/default.css\" />");
		out.println("</head>");
		out.println("<body>");
		out.println("<div class=\"bordaBox\">");
		out.println("<b class=\"b1\"></b><b class=\"b2\"></b><b class=\"b3\"></b><b class=\"b4\"></b><br/><br/>");
		out.println("<div class=\"conteudo\">");

		out.println("Grupo alterado com sucesso!");
		out.println("<br/><br/><a href=\"manutencao-grupo.jsp\">Voltar</a>");

		out.println("	<br /><br /> <br /> <br /> <br />  <br /> <br /></div>");
		out.println("<b class=\"b4\"></b><b class=\"b3\"></b><b class=\"b2\"></b><b class=\"b1\"></b></div>");

		out.println("</body>");
		out.println("</html>");

	}

}
