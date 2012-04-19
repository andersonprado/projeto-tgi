<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="br.com.beans.Aluno"%>
<%@page import="br.com.beans.Grupo"%>
<%@page import="br.com.connection.AlunoDao"%>
<%@page import="br.com.connection.GrupoDao"%>
<%
	// verificando se tem um atributo login na sessao
	// se tiver vai continuar e mostrar o menu
	if (session.getAttribute("login") != null) {
%>




<html>
<head>

<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="icon" href="imagens/simbolo_M.ico">
<title>Adicionar Aluno Grupo</title>


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
				<li><a href="alteraAluno.jsp">Mudar dados do Aluno</a></li>

				<li><a href="#">Grupo</a>
					<ul class="sub_menu">
						<li><a href="adicionaEmgrupo.jsp">Adicionar Aluno</a></li>
						<li><a href="manutencao-grupo.jsp">Mudar dados do Grupo</a></li>
						<li><a href="inserirGrupo.jsp">Criar Grupo</a></li>


					</ul></li>
				
				<li><a href="relatorio-aluno.jsp">Postar Relatório</a></li>	
				<li><a href="LoginServlet?acao=logout">Logout</a></li>
			</ul>

			<br /> <br> <br>

			<%
				Aluno aluno = (Aluno) session.getAttribute("login");

					int codigoDoAluno = aluno.getIdCodAluno();
					int codigoDoGrupo = new AlunoDao().getAluno(codigoDoAluno)
							.getIdCodGrupo();

					if (codigoDoGrupo != 0) {
						Grupo grupo = new GrupoDao().getGrupo(codigoDoGrupo);

						int codAluno = new AlunoDao().getAluno(codigoDoAluno)
								.getIdCodGrupo();
			%>

			<h1>Adicionar aluno</h1>
			<br>
			<h2>
				Título do TGI:
				<%=grupo.getTituloGrupo()%></h2>
			<br> <br> <br>


			<%
				if (new AlunoDao().getListaAlunosGrupo(
								aluno.getIdCodGrupo()).size() < 4) {
			%>
			<form method="post" action="AdicionaEmGrupo">
				<table border="0">
					<tr>
						<td>Codigo do grupo</td>
						<td><input type="text" name="codGrupo"
							value="<%=codigoDoGrupo%>" style="text-align: center" SIZE=10
							readonly /></td>
					</tr>
					<tr>
						<td>Tia</td>
						<td><input type="text" name="tia" /></td>
					</tr>
					<tr>
						<td>Senha</td>
						<td><input type="password" name="senha" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="Entrar" /></td>
					</tr>
				</table>

			</form>



			<%
				} else {
			%>
			<h2 style="color: red">O grupo está com o máximo de alunos
				Permitido</h2>
			<%
				}
			%>


			<%
				} else {
			%><br /> <br />
			<h2 style="color: red">Vc não possui Grupo</h2>
			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
			<%
				}
			%>
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