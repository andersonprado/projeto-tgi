<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="br.com.beans.Aluno"%>
<%@page import="br.com.connection.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.connection.*"%>
<%@page import="br.com.beans.Enfase"%>
<%@page import="br.com.beans.Grupo"%>
<%@page import="br.com.beans.Administrador"%>
<%
	// verificando se tem um atributo login na sessao
	// se tiver vai continuar e mostrar o menu
	if ((!session.getAttribute("login").equals(null))
			&& (session.getAttribute("login") instanceof Administrador)) {
%>
<html>
<head>

<link rel="stylesheet" type="text/css" href="css/default.css" />
<title>Inserir Alunos</title>
<link rel="icon" href="imagens/simbolo_M.ico">
<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen, projection" />
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" language="javascript"
	src="js/jquery.dropdownPlain.js"></script>
</head>
<body>
	<div class="bordaBox">
		<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
		<div class="conteudo">

			<img src="imagens/logo_mack.png" />


			<ul class="dropdown">
				<li><a href="principal.jsp">Principal</a></li>


				<li><a href="#">Aluno</a>
					<ul class="sub_menu">
						<li><a href="alunos.jsp">Alunos no Sistema</a></li>
						<li><a href="insere_alunos.jsp">Inserir alunos no Sistema</a></li>


					</ul></li>
				<li><a href="grupoDoSistema.jsp">Grupos no Sistema</a></li>
				<li><a href="professores.jsp">Professores no Sistema</a></li>
				<li><a href="#">Datas</a>
					<ul class="sub_menu">
						<li><a href="datasDeTgi.jsp">Datas de TGI</a></li>
						<li><a href="dataTgi.jsp">Inserir Datas de TGI</a></li>

					</ul></li>
				<li><a href="#">Enfase</a>
					<ul class="sub_menu">
						<li><a href="enfase.jsp">Enfases no Sistema</a></li>
						<li><a href="insereEnfase.jsp">Inserir enfase no Sistema</a></li>

					</ul></li>
				<li><a href="ata-escolher-Admin.jsp">Imprimir Ata de TGI</a></li>
				<li><a href="listaBancaAdministrador.jsp">Bancas - geral</a></li>
				<li><a href="informacoes.jsp">Informações e Gráficos</a></li>
				<li><a href="LoginServlet?acao=logout">Logout</a></li>
			</ul>


			<br /> <br /> <br /> <br />

			<h1>Inserir Alunos</h1>
			<br /> <br />

			<h2>Inserir Aluno no Sistema</h2>
			<br /> <br />
			<form method="post" action="manutencaoAluno">
				<table border="0">
					<tr>
						<td>Tia</td>
						<td><input type="text" name="tia" /></td>
					</tr>
					<tr>
						<td>Nome</td>
						<td><input type="text" name="nome" /></td>
					</tr>

					<tr>
						<td>Senha</td>
						<td><input type="text" name="senha" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="Cadastrar" /></td>
					</tr>
				</table>

			</form>
			<br />

			<!-- FIM DA TABELA DE EXIBIÇÃO DOS ALUNOS CADASTRADOS -->
			<br /> <br /> <br /> <br />
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