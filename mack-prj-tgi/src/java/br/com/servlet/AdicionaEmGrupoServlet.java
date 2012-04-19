package br.com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.beans.Aluno;

import br.com.beans.Login;
import br.com.connection.AlunoDao;
import br.com.connection.LoginDao;

public class AdicionaEmGrupoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		// Variaveis
		PrintWriter out = response.getWriter();
		String senha = request.getParameter("senha");
		int codGrupo = Integer.parseInt(request.getParameter("codGrupo"));
		int tia = 0;
		boolean continua = true;
		String adicionado = "";
		String existeUsuario = "";

		try {

			tia = Integer.parseInt(request.getParameter("tia"));

			Aluno aluno = new AlunoDao().getAluno(tia);

			// Verifica login
			Login login = new Login();
			login.setIdCod(tia);
			login.setSenha(senha);

			LoginDao loginDao = new LoginDao();
			int existe = loginDao.existeUsuario(login);

			if (existe == 0)
				existeUsuario = "Senha invalida!! ";

			System.out.println(" existe " + existe + " tia " + tia + " senha "
					+ senha + " grupoaluno " + aluno.getIdCodGrupo());

			if ((aluno.getIdCodGrupo() != 0) || (existe == 0)) { // VALIDA
																	// INSERÇÃO
																	// EM GRUPO
				continua = false;
				adicionado = "O Aluno não foi adicionado com sucesso";

			}

			while (continua == true) {

				aluno.setIdCodGrupo(codGrupo);

				new AlunoDao().alteraAluno(aluno);

				adicionado = "O Aluno foi adicionado ao Grupo com sucesso";

				continua = false;
			}

		} catch (NumberFormatException ex) {
			System.out.println("Erro de formato de numero");

		} catch (SQLException e) {
			System.out.println("Erro SQL");
			adicionado = "O Aluno não foi adicionado com sucesso";
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
		out.println("" + existeUsuario + adicionado);
		out.println("<br/><br/><a href=\"../tgi/principal.jsp\">Voltar</a>");
		out.println("<br /> <br /> <br /><br /> <br /> <br /><br /> <br /> <br /></div>");
		out.println("<b class=\"b4\"></b><b class=\"b3\"></b><b class=\"b2\"></b><b class=\"b1\"></b></div>");

		out.println("</body>");
		out.println("</html>");

	}
}
