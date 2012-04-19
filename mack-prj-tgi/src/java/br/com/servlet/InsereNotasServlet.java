package br.com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.connection.ProfessorNotaDao;
import br.com.beans.ProfessorNota;
import java.util.*;

public class InsereNotasServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		PrintWriter out = response.getWriter();

		String codigo = request.getParameter("codigo");
		String n1 = request.getParameter("nota1");
		String n2 = request.getParameter("nota2");
		String n3 = request.getParameter("nota3");

		String ok = "Notas inseridas";

		double nota1 = 0;
		double nota2 = 0;
		double nota3 = 0;

		int codAluno = Integer.parseInt(codigo);
		try {

			nota1 = Double.parseDouble(n1);
			nota2 = Double.parseDouble(n2);
			nota3 = Double.parseDouble(n3);

		} catch (NumberFormatException ex) {
			System.out.println("Erro em try numeros em nota");
			ok = "Notas não inseridas";
		}

		List<ProfessorNota> lista = new ProfessorNotaDao()
				.getProfessorNotaBancaAluno(codAluno);

	
		for (ProfessorNota pr : lista) {
			if (pr.getCodAluno() == codAluno) {

				if (pr.getNumProfessorNota() == 1)
					pr.setNota(nota1);

				if (pr.getNumProfessorNota() == 2)
					pr.setNota(nota2);

				if (pr.getNumProfessorNota() == 3)
					pr.setNota(nota3);

			}

		}

		for (ProfessorNota pr1 : lista) {
			new ProfessorNotaDao().alteraNotas(pr1);
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

		out.println(ok);
		out.println("<br/><br/><br/><br/><a href=\"javascript:window.close();\">Fechar</a>  <br/><br/><br/><br/><br/><br/><br/>");

		out.println("</div>");
		out.println("<b class=\"b4\"></b><b class=\"b3\"></b><b class=\"b2\"></b><b class=\"b1\"></b></div>");

		out.println("</body>");
		out.println("</html>");
	}
}
