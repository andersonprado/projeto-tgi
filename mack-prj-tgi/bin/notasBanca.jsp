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
	if (!session.getAttribute("login").equals(null)) {
%>


<html>
<head>
<link rel="icon" href="imagens/simbolo_M.ico">
<link rel="stylesheet" type="text/css" href="css/default.css" />
<title>Insere Notas por Grupo</title>

</head>
<body style="background-color: lime;">



	<div class="bordaBox">
		<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
		<div class="conteudo">

			<img src="imagens/logo_mack.png" /> <br /> <br />
			<h1>Insere Notas por Grupo</h1>

			<%
				if (!(new AlunoDao().getListaAlunos().equals(null))) {
			%>

			<br /> <br />

			<%
				int idGrupo = Integer.parseInt(request
								.getParameter("codGrupo"));
			%>




		<h2>Título do TGI</h2>
			
			<h2>
				<%=new GrupoDao().getGrupo(idGrupo).getTituloGrupo()%>
			</h2><br>


	<%
				List<Aluno> alunos = new AlunoDao()
								.getListaAlunosGrupo(idGrupo);

						for (Aluno aluno : alunos) {
			%>

<div style="background-color:#999; width: 60%; height: 270px; padding-top: 20px; margin-top: 20px">
	
	

<h3>Aluno</h3>

<h3><%=aluno.getIdCodAluno()%></h3>
<h2><%=aluno.getNomeAluno()%></h2>

			<form action="InsereNotas" method="post">
				<table border="0" width="40%">
					<tr>
						<td colspan="3"><input type="text" value="<%=aluno.getIdCodAluno()%>"
							name="codigo" style="display: none"
							 SIZE=11 readonly />
						<input type="text" value="<%=aluno.getNomeAluno()%>"
							style="display: none" SIZE=40 readonly /></td></tr><tr>
						<td><select name="nota1" size="1" name="nota1">
								<option value="0" selected="selected">0</option>
								<%
									for (double i = 0.5; i <= 10; i += 0.5) {
								%>
								<option value="<%=i%>"><%=i%></option>
								<%
									}
								%>

						</select></td>
						<td><select name="nota2" size="1" name="nota2">
								<option value="0" selected="selected">0</option>
								<%
									for (double i = 0.5; i <= 10; i += 0.5) {
								%>
								<option value="<%=i%>"><%=i%></option>
								<%
									}
								%>
						</select></td>
						<td><select name="nota3" size="1" name="nota3">
								<option value="0" selected="selected">0</option>
								<%
									for (double i = 0.5; i <= 10; i += 0.5) {
								%>
								<option value="<%=i%>"><%=i%></option>
								<%
									}
								%>

						</select></td>
					</tr>
					<tr>
						<td colspan="3"><input type="submit" value="Insere" /></td>
					</tr>
				</table>
			</form>

</div>

<br><br>

			<%
				}
			%>

			<!-- FIM DA TABELA DE EXIBIÇÃO DOS ALUNOS CADASTRADOS -->

			<%
				} else {
			%>
			<h2>Não possuem Professores Cadastrados</h2>
			<%
				}
			%>
			<INPUT TYPE="button" value=" Fechar " onClick="self.close()">
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