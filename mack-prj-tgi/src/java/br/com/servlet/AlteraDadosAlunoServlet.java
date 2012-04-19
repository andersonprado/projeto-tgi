package br.com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import br.com.beans.*;
import br.com.connection.AlunoDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AlteraDadosAlunoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8674040516528883176L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		PrintWriter out = response.getWriter();

		String nome = request.getParameter("nome");

		int enfase = Integer.parseInt(request.getParameter("enfase"));

		int tia = Integer.parseInt(request.getParameter("tia"));

		System.out.println(tia);
		System.out.println(nome);
		System.out.println(enfase);

		if ((nome.equals(null)) || (nome.equals("")))
			nome = "NI";

		Aluno aluno = new Aluno();

		aluno.setIdCodAluno(tia);
		aluno.setNomeAluno(nome);
		aluno.setIdCodEnfase(enfase);

		System.out.println("codigo=" + aluno.getIdCodAluno());
		System.out.println("nome=" + aluno.getNomeAluno());
		System.out.println("enfase =" + aluno.getIdCodEnfase());

		AlunoDao alunoDao = new AlunoDao();
		alunoDao.alterarAluno(aluno);

		String mensagem = "";

		mensagem = "Dados alterados";

		out.println("<html>");
		out.println("<head>");
		out.println("<link rel=\"icon\" href=\"imagens/simbolo_M.ico\">");
		out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/default.css\" />");
		out.println("</head>");
		out.println("<body>");
		out.println("<div class=\"bordaBox\">");
		out.println("<b class=\"b1\"></b><b class=\"b2\"></b><b class=\"b3\"></b><b class=\"b4\"></b>");
		out.println("<div class=\"conteudo\"><br /> <br /> <br /><br /> <br /> <br />");

		out.println(" " + mensagem);
		out.println("<br/><br/><a href=\"principal.jsp\">Voltar</a><br /> <br /> <br /><br /> <br /> <br />");

		out.println("</div>");
		out.println("<b class=\"b4\"></b><b class=\"b3\"></b><b class=\"b2\"></b><b class=\"b1\"></b></div>");

		out.println("</body>");
		out.println("</html>");
	}
}
