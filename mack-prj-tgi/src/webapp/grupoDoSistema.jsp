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
<title>Grupos Cadastrados</title>
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


			<br /> <br /> <br /> <br /> <br />

			<h1>Grupos Cadastrados</h1>
			<br /> <br />
			<%
				List<Grupo> listaGrupos = new GrupoDao().getListaGrupos();
			%>


			<%
				if (!listaGrupos.equals(null)) {
			%>



			<h3>Grupos de TGI 2</h3>
			<br>
			<table border="1" width="80%">
				<tr style="background-color: #CFCFCF;">
					<td>Codigo do Grupo</td>
					<td>Titulo</td>

					<td>Codigo da Enfase</td>
					<td></td>
					<td></td>
				</tr>

				<%
					for (Grupo grupo : listaGrupos) {
								if (grupo.getTgiGrupo() == 2) {
				%>


				<tr style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#CCE6FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">
					<td><%=grupo.getIdCodGrupo()%></td>
					<td><%=grupo.getTituloGrupo()%></td>

					<td><%=grupo.getCodEnfase()%></td>
					<td><form action="listaAlunosGrupo.jsp" method="post"
							target="_blank">
							<input type="text" name="codGrupo" style="display: none"
								value="<%=grupo.getIdCodGrupo()%>" SIZE=1 readonly /><input
								type="submit" value="Alunos" />
						</form></td>
					<td><form action="professorOrientador.jsp" method="post"
							target="_blank">
							<input type="text" name="codGrupo" style="display: none"
								value="<%=grupo.getIdCodGrupo()%>" SIZE=1 readonly /><input
								type="submit" value="Orientador" />
						</form></td>
				</tr>
				<%
					}
							}
				%>

			</table>
			<br> <br> <br> <br>
			<h3>Grupos de TGI 1</h3>
			<br>
			<table border="1" width="80%">
				<tr style="background-color: #CFCFCF;">
					<td>Codigo do Grupo TGi 1</td>
					<td>Titulo</td>

					<td>Codigo da Enfase</td>
					<td></td>
					<td></td>
				</tr>
				<%
					for (Grupo grupo : listaGrupos) {
								if (grupo.getTgiGrupo() == 1) {
				%>



				<tr style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#CCE6FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">
					<td><%=grupo.getIdCodGrupo()%></td>
					<td><%=grupo.getTituloGrupo()%></td>

					<td><%=grupo.getCodEnfase()%></td>
					<td><form action="listaAlunosGrupo.jsp" method="post"
							target="_blank">
							<input type="text" name="codGrupo" style="display: none"
								value="<%=grupo.getIdCodGrupo()%>" SIZE=1 readonly /><input
								type="submit" value="Alunos" />
						</form></td>
					<td><form action="professorOrientador.jsp" method="post"
							target="_blank">
							<input type="text" name="codGrupo" style="display: none"
								value="<%=grupo.getIdCodGrupo()%>" SIZE=1 readonly /><input
								type="submit" value="Orientador" />
						</form></td>
				</tr>
				<%
					}
							}
				%>
			</table>






			<%
				} else {
			%>
			<h2 style="color: red;">Não existem Grupos cadastrados</h2>

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