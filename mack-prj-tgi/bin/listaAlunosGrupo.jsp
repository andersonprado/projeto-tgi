

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="br.com.beans.Enfase"%>
<%@page import="br.com.beans.*"%>
<%@page import="br.com.connection.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.beans.Administrador"%>
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

<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen, projection" />
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" language="javascript"
	src="js/jquery.dropdownPlain.js"></script>


<title>Alunos do Grupo</title>
</head>
<body>



	<div class="bordaBox">
		<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
		<div class="conteudo">
			<img src="imagens/logo_mack.png" />
		
			<br> <br> 
			<h1>Alunos do Grupo</h1>




			<br /> <br />



			<%
				int codGrupo = Integer.parseInt(request
							.getParameter("codGrupo"));
			%>



			<%
				if (codGrupo != 0) {
						List<Aluno> alunos = new AlunoDao()
								.getListaAlunosGrupo(codGrupo);
			%>
			<%
				String nome = new GrupoDao().getGrupo(codGrupo)
								.getTituloGrupo();
			%>


			<h3><%=nome%></h3>

			<!-- TABELA DE EXIBIÇÃO DOS ALUNOS CADASTRADOS -->
			<br /> <br />
			<h3>Integrantes do Grupo</h3>
			<br />


<br> <br> 



			<table border="1" width="80%">
				<tr style="background-color: ;" height="1">
					<td>Tia</td>
					<td>Nome</td>
					<td>Codigo da Enfase</td>

				</tr>

				<%
					for (Aluno aluno1 : alunos) {
								Enfase enfase = new EnfaseDao().getEnfase(aluno1
										.getIdCodEnfase());
				%>




				<tr style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#EDEDED'"
					onMouseOut="javascript:this.style.backgroundColor=''">
					<td><%=aluno1.getIdCodAluno()%></td>
					<td><%=aluno1.getNomeAluno()%></td>
					<td><%=enfase.getNomeFase()%></td>

				</tr>
				<%
					}
						}
				%>

			</table>
			<!-- FIM DA TABELA DE EXIBIÇÃO DOS ALUNOS CADASTRADOS -->
			<br> <br><INPUT TYPE="button" value= " Fechar " onClick="self.close()"> <br> <br /> <br /> <br /> <br /> <br />
			<br />
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
<jsp:forward page="../index.jsp"></jsp:forward>
<%
	}
%>