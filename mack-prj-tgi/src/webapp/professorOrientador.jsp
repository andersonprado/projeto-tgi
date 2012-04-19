<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="br.com.beans.Professor"%>
<%@page import="br.com.beans.*"%>
<%@page import="br.com.connection.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.*"%>


<%
	// verificando se tem um atributo login na sessao
	// se tiver vai continuar e mostrar o menu
	if ((!session.getAttribute("login").equals(null))
			&& (session.getAttribute("login") instanceof Administrador)) {
%>


<html>
<head>
<link rel="icon" href="imagens/simbolo_M.ico">
<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen, projection" />

<script type="text/javascript" language="javascript"
	src="js/jquery.dropdownPlain.js"></script>
<title>Professores no Sistema de TGI</title>

</head>
<body style="background-color: lime;">

	<div class="bordaBox">
		<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
		<div class="conteudo">
			<img src="imagens/logo_mack.png" /> <br> <br> <br />
			<h1>Professor Orientador do Grupo</h1>



			<%
				int codGrupo = Integer.parseInt(request
							.getParameter("codGrupo"));
			%>



			<%
				if (codGrupo != 0) {

						Grupo grupo = new GrupoDao().getGrupo(codGrupo);

						if (!grupo.equals(null)) {
			%>




			<br /> <br /> <br />

			<!-- TABELA DE EXIBIÇÃO DOS ALUNOS CADASTRADOS -->
			<table border="1" width="80%">
				<tr style="background-color: ;">
					<td>DRT</td>
					<td>Nome</td>
					<td>Titularidade</td>

				</tr>
				<%
					Professor professor = new ProfessorDao()
										.getProfessor(grupo.getCodProf());
				%>
				<tr style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#CCE6FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">
					<td><%=professor.getIdCodProfessor()%></td>
					<td><%=professor.getNome()%></td>
					<td><%=professor.getTitularidadeProfessor()%></td>

				</tr>

			</table>
			<!-- FIM DA TABELA DE EXIBIÇÃO DOS ALUNOS CADASTRADOS -->

			<%
				} else {
			%>
			<h2 style="color: red">Não possue Professor Orientador</h2>

			<%
				}
			%>
			<%
				} else {
			%>
			<h2 style="color: red">Não possue Professor Orientador</h2>
			<%
				}
			%>
			<br> <br> <INPUT TYPE="button" value=" Fechar "
				onClick="self.close()"> <br> <br /> <br /> <br /> <br />
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