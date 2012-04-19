<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	// verificando se tem um atributo login na sessao
	// se tiver vai continuar e mostrar o menu
	if (session.getAttribute("login") != null) {
%>
<%@page import="br.com.beans.*"%>
<%@page import="br.com.connection.*"%>
<%@page import="java.util.List"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manutenção de Grupo</title>
<link rel="stylesheet" type="text/css" href="css/default.css" />
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
			<h1>Manutenção de Grupo:</h1>
			<br>
			<%
				Aluno aluno = (Aluno) session.getAttribute("login");

					int idAluno = aluno.getIdCodAluno();
					int codigo = new AlunoDao().getAluno(idAluno).getIdCodGrupo();

					if (codigo == 0) {
			%>
			<h2 style="color: red">Vc não possui Grupo</h2>

			<%
				} else {

						int numGrupo = aluno.getIdCodGrupo(); // numero do grupo do aluno

						String nomeGrupo = "";
						Grupo grupoDoAluno; //cria grupo

						try {

							GrupoDao grupoDao = new GrupoDao();

							grupoDoAluno = grupoDao.getGrupo(codigo);

							if (grupoDoAluno.equals(null)) {

							}

							nomeGrupo = "" + grupoDoAluno.getTituloGrupo();
							System.out.println(nomeGrupo);
			%>

			<br>
			<br>
			<form action="manutencaoGrupo" method="post">
				<table border="0">
					<tr>
						<td>Título:</td>
						<td align="left"><input type="text" name="tituloGrupo"
							value="<%=nomeGrupo%>" Size=43 /></td>
					<tr align="left">
						<td>Código da Ênfase:</td>
						<td><select name="codEnfase">
								<%
									EnfaseDao enDao = new EnfaseDao();
								%>
								<%
									List<Enfase> enfases = enDao.getListaEnfases();

												String nomeDaEnfase = "";
												int codEnfase = grupoDoAluno.getCodEnfase();

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
						<td>Código do Professor:</td>
						<td><select name="codProf">
								<%
									ProfessorDao profDao = new ProfessorDao();
								%>
								<%
									int profSize = profDao.getListaProfessores().size();
												String nomeProfessor = "";

												Professor professor = profDao.getProfessor(grupoDoAluno
														.getCodProf());

												int codProfessor = professor.getIdCodProfessor();

												List<Professor> professores = profDao
														.getListaProfessores();

												for (Professor prof : professores) {
													if (codProfessor != prof.getIdCodProfessor())
								%><option value="<%=prof.getIdCodProfessor()%>"><%=prof.getNome()%></option>

								<%
									}
												if (codProfessor != 0) {
								%>
								<option value="<%=codProfessor%>" selected><%=professor.getNome()%></option>
								<%
									}
								%>

						</select></td>
					</tr>





					<!-- Esse TGI Grupo relata se o grupo faz TGI 1 ou 2 então? Se for é isso aí -->
					<tr align="left">
						<td>TGI do Grupo:</td>
						<td><select name="tgiGrupo">
								<%
									for (int i = 1; i <= 2; i++) {
													if (grupoDoAluno.getTgiGrupo() != i) {
								%>
								<option value=<%=i%>><%=i%></option>
								<%
									}
												}
								%>

								<option value="<%=grupoDoAluno.getTgiGrupo()%>" selected><%=grupoDoAluno.getTgiGrupo()%></option>

						</select></td>
					</tr>
					<tr align="left">
						<td>Grupo do Aluno:</td>
						<td><input type="text" name="grupoAlterado"
							value="<%=grupoDoAluno.getIdCodGrupo()%>" size="2" readonly></td>
					</tr>

					<tr>
						<td colspan="2"><input type="submit" value="Alterar" /></td>
					</tr>

				</table>
			</form>

			<%
				} catch (NumberFormatException e) {
							System.out.print("Erro");
						} catch (NullPointerException e) {
							System.out.print("Erro, vc Não possui Grupo");
			%><br />
			<p>Vc não possui Grupo cadastrado!!!</p>
			<%
				}
					}
			%><br /> <br /> <br /> <br /> <br>

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