<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="br.com.beans.Aluno"%>
<%@page import="br.com.beans.Enfase"%>
<%@page import="br.com.connection.*"%>
<%@page import="br.com.beans.Grupo"%>
<%@page import="java.util.List"%>

<%
	// verificando se tem um atributo login na sessao
	// se tiver vai continuar e mostrar o menu
	if (!session.getAttribute("login").equals(null)) {
%>


<%
	Aluno aluno = (Aluno) session.getAttribute("login");
%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/default.css" />

<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen, projection" />
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" language="javascript"
	src="js/jquery.dropdownPlain.js"></script>



<title>Alterar Dados de Aluno</title>
<link rel="icon" href="imagens/simbolo_M.ico">


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


			<br />
			<br> <br>
			<h1>Alterar dados do Aluno</h1>

			<%
				Aluno alunoMudar = new AlunoDao().getAluno(aluno
							.getIdCodAluno());
			%>

			<%
				int tgiDoAluno = new AlunoDao().getAluno(
							alunoMudar.getIdCodAluno()).getTgiAluno();
			%>
			<br />
			<br />
			<br />

			<!-- FORMULARIO PARA CADASTRO DO ALUNO -->
			<form name="alunos" method="post" action="AlteraDadosAluno">
				<table border="0">
					<tr>
						<td>Tia:</td>
						<td align="left"><input type="text" name="tia"
							value="<%=aluno.getIdCodAluno()%>" readonly /></td>
					</tr>

					<tr>
						<td>Nome:</td>
						<td align="left"><input type="text" name="nome"
							value="<%=alunoMudar.getNomeAluno()%>" /></td>
					</tr>


					<tr align="left">
						<td>Código da Ênfase:</td>
						<td><select name="enfase">
								<%
									EnfaseDao enDao = new EnfaseDao();
								%>
								<%
									List<Enfase> enfases = enDao.getListaEnfases();

										String nomeDaEnfase = "";
										int codEnfase = alunoMudar.getIdCodEnfase();

										for (Enfase enf : enfases) {
											if (codEnfase == enf.getIdCodEnfase())
												nomeDaEnfase = enf.getNomeFase();
											if (!enf.equals(null))
								%><option value="<%=enf.getIdCodEnfase()%>"><%=enf.getNomeFase()%></option>
								<%
									}
								%>

								<option value="<%=codEnfase%>" selected><%=nomeDaEnfase%></option>

						</select></td>
					</tr>
					<tr align="left">
						<td>TGI do Aluno:</td>
						<td><select name="tgi">
								<%
									for (int i = 1; i <= 2; i++) {
											if (tgiDoAluno != i) {
								%>
								<option value=<%=i%>><%=i%></option>
								<%
									}
										}
								%>

								<option value="<%=tgiDoAluno%>" selected><%=tgiDoAluno%></option>

						</select></td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="Alterar" /></td>
					</tr>
				</table>
			</form>
			<!-- FIM DO FORMULARIO PARA CADASTRO DO ALUNO -->
			<br /> <br /> <br /> <br /> <br />




		</div>
		<b class="b4"></b> <b class="b3"></b> <b class="b2"></b> <b class="b1"></b>

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