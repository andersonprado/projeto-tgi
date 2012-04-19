package br.com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import br.com.beans.*;
import br.com.connection.AlunoDao;
import br.com.connection.LoginDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManutencaoAlunoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8674040516528883176L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		PrintWriter out = response.getWriter();

		String nomeAluno = request.getParameter("nome");

		int tiAluno = Integer.parseInt(request.getParameter("tia"));

		String senha = request.getParameter("senha");

		Login login = new Login();

		login.setIdCod(tiAluno);
		login.setSenha(senha);
		login.setTipo(1); // Como é aluno tipo 1 de login

		Aluno aluno = new Aluno();

		aluno.setNomeAluno(nomeAluno);
		aluno.setTgiAluno(1);
		aluno.setIdCodAluno(tiAluno);
		aluno.setIdCodEnfase(1);

		LoginDao loginDao = new LoginDao();
		AlunoDao alunoDao = new AlunoDao();
		String inserido = "Inserido com sucesso!";

		try {
			loginDao.insereLogin(login);
			alunoDao.insereAluno(aluno);
		} catch (SQLException e) {
			inserido = "não foi inserido!";
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
		out.println("<div class=\"conteudo\"><br/><br/><br/><br/>");

		out.println(" Aluno e Login de " + nomeAluno + " " + inserido);
		out.println("<br/><br/><a href=\"../tgi/alunos.jsp\">Voltar</a><br/><br/><br/><br/><br/><br/><br/>");

		out.println("</div>");
		out.println("<b class=\"b4\"></b><b class=\"b3\"></b><b class=\"b2\"></b><b class=\"b1\"></b></div>");

		out.println("</body>");
		out.println("</html>");
	}
}
