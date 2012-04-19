package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.beans.Administrador;
import br.com.beans.Login;
import br.com.beans.Aluno;
import br.com.beans.Professor;
import br.com.connection.*;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException, NullPointerException {
		try {
			processRequest(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException, NullPointerException {
		try {
			processRequest(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * Vai processar a validação do usuário e senha
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @throws SQLException
	 */
	private void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,
			SQLException {
		// por defaulté chamada o index
		String pagina = "index.jsp?erro=1";

		
		

		if (request.getParameter("acao").equals("login")) {
			String recebeCod;
			int idCod = 0;
			try {
				recebeCod = request.getParameter("login");
				idCod = Integer.parseInt(recebeCod);
			} catch (NumberFormatException ex) {
				HttpSession sessao = request.getSession();
				sessao.invalidate();
				System.out.print(ex);
			}
			String recebeSenha = request.getParameter("senha");

			Login login = new Login();
			login.setIdCod(idCod);
			login.setSenha(recebeSenha);

			LoginDao loginDao = new LoginDao();
			int tipo = loginDao.existeUsuario(login); // verifica se
														// existe usuario no
														// Logar
			HttpSession sessao = request.getSession();
			switch (tipo) {
			case 1:
				AlunoDao alunoDao = new AlunoDao();
				Aluno aluno = alunoDao.getAluno(idCod);

				// setando um atributo da sessao

				sessao.setAttribute("login", aluno);
			//  sucesso entra a página principal
				pagina = "principal.jsp";

				break;
			case 2:
				ProfessorDao professorDao = new ProfessorDao();
				Professor professor = professorDao.getProfessor(idCod);

				// setando um atributo da sessao

				sessao.setAttribute("login", professor);
			//  sucesso entra a página principal
				pagina = "principal.jsp";
				//
				break;
			case 3:

			
				Administrador admin = new Administrador();
				admin.setCodAdministrador(idCod);
				
				sessao.setAttribute("login", admin);
				//  sucesso entra a página principal
				pagina = "principal.jsp";

				break;

			default:
				break;
			}

		} else if (request.getParameter("acao").equals("logout")) {
			// no logout invalido a sessao
			HttpSession sessao = request.getSession();
			sessao.invalidate();
			
			// index
			// mostrara o formulario para o usuário logar
			pagina = "principal.jsp";
		}

		response.sendRedirect(pagina);

	}
}
