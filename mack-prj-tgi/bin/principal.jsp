

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date"%>
<%@page import="br.com.beans.*"%>
<%@page import="br.com.beans.Enfase"%>
<%@page import="br.com.connection.*"%>
<%@page import="java.util.*"%>
<%@page import="br.com.beans.Grupo"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	//verificando se tem um atributo login na sessao
	// se tiver vai continuar e mostrar o menu
	if (session.getAttribute("login") != null) {
%>

<html>

<head>
<link rel="Shortcut Icon" href="imagens/simbolo_M.ico">
<link rel="stylesheet" type="text/css" href="css/default.css" />


<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen, projection" />
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" language="javascript"
	src="js/jquery.dropdownPlain.js"></script>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Principal</title>
</head>

<body>
	<div class="bordaBox">
		<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
		<div class="conteudo">
			<img src="imagens/logo_mack.png" />
			<%
				if (session.getAttribute("login") instanceof Aluno) {
						Aluno aluno = (Aluno) session.getAttribute("login");
			%>



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




			<br> <br> <br>

			<h2>
				Bem vindo
				<%
				out.print(session.getAttribute("login"));
			%>
			</h2>

			<%
				//pegar novamente o aluno caso haja alguma modificação no grupo
						int codAluno = aluno.getIdCodAluno();

						int codGrupo = new AlunoDao().getAluno(codAluno)
								.getIdCodGrupo();
			%>

			<%
				if (codGrupo != 0) {
							Grupo grupo = new GrupoDao().getGrupo(codGrupo);
			%>

			<br> <br />

			<h2 style="font-style: italic;"><%=grupo.getTituloGrupo()%></h2>


			<%
				}
			%>



			<%
				if (codGrupo != 0) {
							List<Aluno> alunos = new AlunoDao()
									.getListaAlunosGrupo(codGrupo);
			%>





			<!-- TABELA DE EXIBIÇÃO DOS ALUNOS CADASTRADOS -->
			<br /> <br />
			<h3>Integrantes do Grupo</h3>
			<br />

			<table border="1" width="80%">
				<tr style="background-color: ;" height="1">
					<td>Tia</td>
					<td>Nome</td>
					<td>Codigo da Enfase</td>
					<td>Codigo do Grupo</td>
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
					<td><%=aluno1.getIdCodGrupo()%></td>
				</tr>
				<%
					}
							}
				%>

			</table>
			<!-- FIM DA TABELA DE EXIBIÇÃO DOS ALUNOS CADASTRADOS -->
			<br> <br> <br>




			<%
				Aluno alunoValida = new AlunoDao().getAluno(aluno
								.getIdCodAluno());
						if ((alunoValida.getNomeAluno().equals(null))
								|| (alunoValida.getIdCodGrupo() == 0)
								|| (alunoValida.getIdCodEnfase() == 0)) {
			%><br /> <br />
			<p style="color: red">Complete seus dados cadastrais</p>
			<%
				if (aluno.getNomeAluno().equals(null)) {
			%>
			<p style="color: red">Complete o seu nome</p>
			<%
				}
							if (alunoValida.getIdCodGrupo() == 0) {
			%><p style="color: red">Crie um Grupo ou entre em um existente
				atraves de outro Aluno</p>
			<%
				}
							if (alunoValida.getIdCodEnfase() == 0) {
			%><p style="color: red">Adicione uma enfase nos seus dados do
				Aluno</p>
			<%
				}
						}
			%>
			<%
				}
			%>









			<%
				if (session.getAttribute("login") instanceof Administrador) {
			%>



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


			<br> <br> <br> <br> <br>
			<h2>Administração do Sistema</h2>
			<br>
			<h3>Escolha um dos menus</h3>




			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
			<br /> <br /> <br /> <br />
			<%
				}
			%>















			<%
				if (session.getAttribute("login") instanceof Professor) {
			%>


				<ul class="dropdown">
				<li><a href="principal.jsp">Principal</a></li>
				<li><a href="banca.jsp">Agendar Banca</a></li>
				<li><a href="listaAlunosBancaDoProfessor.jsp">Inserir Nota
						aos Orientandos</a></li>
			
				<li><a href="relatorio-professor.jsp">Relatorios</a></li>
				<li><a href="ata-escolher.jsp">Imprimir Ata de TGI</a></li>
				<li><a href="LoginServlet?acao=logout">Logout</a></li>
			</ul>

			<br> <br> <br>
			<h1>
				Bem vindo
				<%
				out.print(session.getAttribute("login"));
			%>
			</h1>
			<br>
			<h2>Grupo de Orientandos</h2>

			<%
				Professor professor = (Professor) session
								.getAttribute("login");

						int codprof = professor.getIdCodProfessor();

						List<Grupo> listaGruposProf = new GrupoDao()
								.getListaGrupos();

						int cont = 0;
						for (Grupo g : listaGruposProf) {
							if (g.getCodProf() == codprof)
								cont++;
						}
						;
						if (cont != 0) {
			%>
			<br> <br>
			<table border="1" width="80%">
				<tr style="background-color: ;">
					<td>Codigo do Grupo</td>
					<td>Titulo</td>
					<td>TGI</td>
					<td>Codigo da Enfase</td>
					<td></td>
				</tr>


				<%
					}
							;

							for (Grupo grupo : listaGruposProf) {
								if (grupo.getCodProf() == codprof) {
				%>
				<!-- TABELA DE EXIBIÇÃO DOS ALUNOS CADASTRADOS -->


				<tr style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#CCE6FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">
					<td><%=grupo.getIdCodGrupo()%></td>
					<td><%=grupo.getTituloGrupo()%></td>
					<td><%=grupo.getTgiGrupo()%></td>
					<td><%=grupo.getCodEnfase()%></td>
					<td><form action="listaAlunosGrupo.jsp" method="post"
							target="_blank">
							<input type="text" name="codGrupo" style="display: none"
								value="<%=grupo.getIdCodGrupo()%>" SIZE=1 readonly /><input
								type="submit" value="Alunos" />
						</form></td>
				</tr>
				<%
					}

							}
				%>
			</table>
			<br> <br> <br> <br> <br> <br> <br>
			<br> <br>

			<%
				}
			%>

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