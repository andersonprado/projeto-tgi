package br.com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.beans.Enfase;
import br.com.connection.EnfaseDao;

public class InsereEnfaseServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		PrintWriter out = response.getWriter();
		String nome = request.getParameter("nome");
		int codigo = 0;
		int coord;
		try {
			codigo = Integer.parseInt(request.getParameter("codigo"));

			coord = Integer.parseInt(request.getParameter("coodenador"));

			Enfase enfase = new Enfase();
			enfase.setNomeFase(nome);
			enfase.setIdCodEnfase(codigo);
			enfase.setCoordenadorFase(coord);

			EnfaseDao enfaseDao = new EnfaseDao();
			enfaseDao.adicionaEnfase(enfase);

		} catch (NumberFormatException ex) {
			System.out.println("Erro de formato de numero");

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

		out.println("Enfase " + codigo);
		out.println("<br/><br/><a href=\"../tgi/enfase.jsp\">Voltar</a><br/><br/><br/><br/>");

		out.println("</div>");
		out.println("<b class=\"b4\"></b><b class=\"b3\"></b><b class=\"b2\"></b><b class=\"b1\"></b></div>");

		out.println("</body>");
		out.println("</html>");

	}
}
