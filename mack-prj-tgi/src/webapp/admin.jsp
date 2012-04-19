<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="java.util.Calendar"%>

<%@page import="br.com.beans.Administrador"%>
<%@page import="br.com.beans.*"%>
<html>


<%
	// verificando se tem um atributo login na sessao
	// se tiver vai continuar e mostrar o menu
	if ((!session.getAttribute("login").equals(null))
			& (session.getAttribute("login") instanceof Administrador)) {
%>



<head>
<link rel="stylesheet" type="text/css" href="css/default.css" />
<title>Administração do Sistema</title>
<link rel="icon" href="imagens/simbolo_M.ico">
</head>

<body>






<div class="bordaBox"><b class="b1"></b><b class="b2"></b><b
	class="b3"></b><b class="b4"></b>
<div class="conteudo"><img src="imagens/logo_mack.png" />



<br />
<a href="alunos.jsp">Alunos no Sistema</a> <br />
<br />
<%
	//formatação temporaria
%> <a href="professores.jsp">Professores no Sistema</a><br />

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