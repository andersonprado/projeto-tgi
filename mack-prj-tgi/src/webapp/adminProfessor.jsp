<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="br.com.beans.Administrador"%>
<%@page import="br.com.beans.*"%>
<html>


<%
	// verificando se tem um atributo login na sessao
	// se tiver vai continuar e mostrar o menu
	if (!session.getAttribute("login").equals(null)) {
%>



<head>
<link rel="stylesheet" type="text/css" href="css/default.css" />
<title>Administração Professor</title>
<link rel="icon" href="imagens/simbolo_M.ico">
</head>

<body>



	<%
		String fci = "Faculdade de Computação de Informática";
			String tgi = "Sistema de TGI";
			Calendar data = Calendar.getInstance();
	%>


	<div class="bordaBox">
		<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
		<div class="conteudo">
			<img src="imagens/logo_mack.png" />
			<h1><%=fci%></h1>
			<h2><%=tgi%></h2>
			<h3><%=data.get(Calendar.DAY_OF_MONTH) + "/"
						+ (data.get(Calendar.MONTH) + 1) + "/"
						+ data.get(Calendar.YEAR)%></h3>
			<br /> <br />


			</h3>
			Links:
			</h3>
			<br /> <a href="alunos.jsp">Alunos no Sistema</a> <br /> <br />
			<%
				//formatação temporaria
			%>
			<a href="professores.jsp">Professores no Sistema</a><br /> <br /> <a
				href="enfase.jsp">Enfases no Sistema</a><br /> <br /> <br /> <a
				href="principal.jsp">Voltar</a> <br /> <a
				href="LoginServlet?acao=logout">Logout</a> <br />


		</div>
		<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>

	</div>

</body>
</html>



<%
	// se não existir um login na sessao, 
		// vai enviar para a página de login novamente
	} else {
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
	}
%>