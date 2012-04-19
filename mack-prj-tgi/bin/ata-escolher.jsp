<%@page import="br.com.beans.Professor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@page import="br.com.beans.Professor"%>
<%@page import="br.com.beans.Grupo"%>
<%@page import="br.com.connection.*"%>
<%@page import="br.com.connection.ProfessorDao"%>
<%@page import="java.util.List"%>
<%
	// verificando se tem um atributo login na sessao
	// se tiver vai continuar e mostrar o menu
	if (session.getAttribute("login") != null) {
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/default.css" />



<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen, projection" />
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" language="javascript"
	src="js/jquery.dropdownPlain.js"></script>



<title>Imprimir ATA</title>
<link rel="icon" href="imagens/simbolo_M.ico">
</head>
<body>
	<div class="bordaBox">
		<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
		<div class="conteudo">
			<img src="imagens/logo_mack.png" />
		
			<ul class="dropdown">
				<li><a href="principal.jsp">Principal</a></li>
				<li><a href="banca.jsp">Agendar Banca</a></li>
				<li><a href="listaAlunosBancaDoProfessor.jsp">Inserir Nota
						aos Orientandos</a></li>
			
				<li><a href="relatorio-professor.jsp">Relatorios</a></li>
				<li><a href="ata-escolher.jsp">Imprimir Ata de TGI</a></li>
				<li><a href="LoginServlet?acao=logout">Logout</a></li>
			</ul>


			<br> <br> <br> <br>
			<h1>Impress�o de ATA de TGI</h1>
			<br />
			<%
				Professor professor = (Professor) session.getAttribute("login");

					int quantGrupos = new GrupoDao().getQuantGrupo(professor
							.getIdCodProfessor());
			%>

			<%
				if (quantGrupos == 0) {
			%>

			<h1 style="color: red">Vc n�o est� orientando nenhum Grupo</h1>
			<%
				} else {
			%>


			<form action="ata.jsp" method="post" target="_blank">
				<select name="grupo">
					<%
						GrupoDao gruDao = new GrupoDao();
					%>
					<%
						List<Grupo> grupo = gruDao.getListaGrupos();
					%>
					<%
						for (Grupo gr : grupo) {
									if (!gr.equals(null))
										if ((gr.getCodProf() == professor
												.getIdCodProfessor())
												&& (gr.getTgiGrupo() == 2))
					%><option value="<%=gr.getIdCodGrupo()%>"><%=gr.getTituloGrupo()%></option>
					<%
						}
					%>

				</select> <input type="submit" value="Imprimir" />
			</form>

			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br> <br> <br> <br> <br>
			<br>
		</div>
		<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
		<%
			}
		%>
		<br> <br> <br> <br> <br> <br> <br>
		<br>
	</div>
</body>
</html>


<%
	// se n�o existir um login na sessao, 
		// vai enviar para a p�gina de login novamente
	} else {
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
	}
%>