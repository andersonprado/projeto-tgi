<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="br.com.beans.Professor"%>
<%@page import="br.com.beans.*"%>
<%@page import="br.com.connection.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>



<%
	// verificando se tem um atributo login na sessao
	// se tiver vai continuar e mostrar o menu
	if (!session.getAttribute("login").equals(null)) {
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



<title>Professores no Sistema de TGI</title>

</head>
<body style="background-color: ;">



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
			<br> <br> <br> <br />
			<h1>Inserir Notas</h1><br />
			<h1>Informações das Bancas do Professor</h1>
			
			<br />
		
			<%
				if (!(new BancaDao().getListaBanca().equals(null))) {
			%>

			<br /> <br />

			<!-- TABELA DE EXIBIÇÃO DOS ALUNOS CADASTRADOS -->
			<table border="1" width="80%">
				<tr>
					<td>Codigo da Banca</td>
					<td>Codigo do Grupo</td>
					<td>Notas</td>
					<td>Detalhes</td>
				</tr>


				<%
					Professor professor = (Professor) session
									.getAttribute("login");
							int codProfessor = professor.getIdCodProfessor();

							List<Banca> bancas = new BancaDao().getListaBanca();

							for (Banca banca : bancas) {
								if ((new GrupoDao().getGrupo(banca.getCodGrupo())
										.getCodProf()) == codProfessor) {
				%>
				<tr style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#EDEDED'"
					onMouseOut="javascript:this.style.backgroundColor=''">
					<td><%=banca.getCodBanca()%></td>
					<td><%=banca.getCodGrupo()%></td>
					<td><form action="notasBanca.jsp" method="post"
							target="_blank">
							<input type="text" name="codGrupo" style="display: none"
								value="<%=banca.getCodGrupo()%>" SIZE=1 readonly /><input
								type="submit" value="Alunos" />
						</form></td>
					<td><form action="informacoesBanca.jsp" method="post"
							target="_blank">
							<input type="text" name="codBanca" style="display: none"
								value="<%=banca.getCodBanca()%>" SIZE=1 readonly /><input
								type="submit" value="informações" />
						</form></td>
				</tr>
				<%
					}
							}
				%>
			</table>
			<!-- FIM DA TABELA DE EXIBIÇÃO DOS ALUNOS CADASTRADOS -->

			<%
				} else {
			%>
			<h2>Não existe Banca</h2>
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