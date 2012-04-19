package br.com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import br.com.connection.LocaDataHoraDao;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.beans.LocalDataHora;

public class DataTgiServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		PrintWriter out = response.getWriter();

		String data = request.getParameter("data");
		String hora = request.getParameter("hora");

		int sala = Integer.parseInt(request.getParameter("sala"));

		boolean continua = true;
		String inserido = "Data Inserida com sucesso";

		if ((data.equals("")) || (hora.equals(""))) {
			continua = false;
			inserido = "Não foi possivel inserir a data";
		}

		while (continua) {

			String tmp = data.substring(6);
			String tmp1 = data.substring(0, 2);
			String tmp2 = data.substring(2, 6);

			String dataHora = tmp + tmp2 + tmp1 + " " + hora;

			LocalDataHora horario = new LocalDataHora();

			horario.setDataHorario(dataHora);
			horario.setSala(sala);
			horario.setSala(sala);

			LocaDataHoraDao localData = new LocaDataHoraDao();
			localData.adicionaHorario(horario);
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

		out.println(inserido + " !");
		out.println("<br/><br/><a href=\"datasDeTgi.jsp\">Voltar</a><br/><br/><br/><br/><br/><br/>");

		out.println("</div>");
		out.println("<b class=\"b4\"></b><b class=\"b3\"></b><b class=\"b2\"></b><b class=\"b1\"></b></div>");

		out.println("</body>");
		out.println("</html>");

	}
}
