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
	if (session.getAttribute("login") != null) {
%>
<html>
<head>
<link rel="icon" href="imagens/simbolo_M.ico">
<link rel="stylesheet" type="text/css" href="css/default.css" />

<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen, projection" />
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" language="javascript"
	src="js/jquery.dropdownPlain.js"></script>



<title>Criar Grupo</title>
</head>
<body>

	<%
		Aluno aluno = (Aluno) session.getAttribute("login");
	%>



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
			<h1>Criar Grupo</h1>
			<br>
			<%
				int codAluno = aluno.getIdCodAluno();
					int codGrupo = new AlunoDao().getAluno(codAluno)
							.getIdCodGrupo();

					if (codGrupo != 0) {
			%><br /><br />
			<h2 style="color: red">Vc já possui Grupo</h2>


			<br /> <br /> <br /> <br />

			<%
				} else {
						Enfase enfase = new EnfaseDao().getEnfase(aluno
								.getIdCodEnfase());
			%>


			<form method="post" action="InsereGrupo">
				<table border="0">
					<tr>
						<td colspan="4">Título</td>
					</tr>

					<tr>
						<td colspan="4"><input type="text" name="titulo"
							style="text-align: center" SIZE=60 /></td>
					</tr>

					<tr>
						<td colspan="4">Ênfase</td>
					</tr>
					<tr>
						<td colspan="4"><input type="text" name="nome"
							style="text-align: center" value="<%=enfase.getNomeFase()%>"
							SIZE=60 readonly /></td>
					</tr>



					<tr>
						<td>TGI</td>
						<td><input type="text" name="tgi" style="text-align: center"
							value="<%=aluno.getTgiAluno()%>" SIZE=5 readonly /></td>
						<td>Tia</td>
						<td><input type="text" name="tia"
							value="<%=aluno.getIdCodAluno()%>" SIZE=10 readonly /></td>
					</tr>
					<tr>
						<td colspan="4"><input type="submit" value="Cadastrar" /></td>
					</tr>
				</table>

			</form>
			<br />
			<!-- FIM DA TABELA DE EXIBIÇÃO DOS ALUNOS CADASTRADOS -->
			<%
				}
			%>
			<br /> <br /> <br /> <br /> <br />
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