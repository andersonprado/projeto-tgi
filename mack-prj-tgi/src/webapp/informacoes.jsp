<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


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

			<h1>Informações do Sistema</h1>

			<%
				if (!(new AlunoDao().getListaAlunos().equals(null))) {
			%>

			<br /> <br /> <br />
			<%
				int quantidadeGrupos = new GrupoDao().getQuantidadeGrupos();

						int quantidadeAlunos = new AlunoDao().getQuantidadeAlunos();

						List<Grupo> listaGrupo = new GrupoDao().getListaGrupos();

						int grupoTgi1 = 0;
						int grupoTgi2 = 0;

						for (Grupo grupo1 : listaGrupo) {
							if (grupo1.getTgiGrupo() == 1)
								grupoTgi1++;
							if (grupo1.getTgiGrupo() == 2)
								grupoTgi2++;

						}
						int alunoTgi1 = 0;
						int alunoTgi2 = 0;
						int totalAlunos = 0;

						List<Aluno> listaAluno = new AlunoDao().getListaAlunos();
						for (Aluno aluno1 : listaAluno) {
							if (aluno1.getTgiAluno() == 1)
								alunoTgi1++;
							if (aluno1.getTgiAluno() == 2)
								alunoTgi2++;
							totalAlunos++;
						}

						int quantidadeBancas = new BancaDao().getQuantidadeBancas();

						List<Professor> listaProf = new ProfessorDao()
								.getListaProfessores();

						int totalProfessores = 0;
						for (Professor prof : listaProf) { //total professores
							totalProfessores++;
						}

						int professoresBanca = new ProfessorDao()
								.getProfessoresDistinct();

						int profSemBanca = totalProfessores - professoresBanca;
			%>





			<h3>Quantidade de Grupos</h3>
			<br>

			<table border="1" width="50%">

				<tr style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#CCE6FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">

					<td>TGI 1</td>
					<td><%=grupoTgi1%></td>


				</tr>
				<tr style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#CCE6FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">

					<td>TGI 2</td>
					<td><%=grupoTgi2%></td>


				</tr>
				<tr style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#CCE6FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">

					<td>Total</td>
					<td><%=quantidadeGrupos%></td>


				</tr>

				<tr style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#CCE6FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">
					<td></td>
					<td colspan="3"><form action="testeGrafico.jsp" method="post"
							target="_blank">
							<input type="text" name="titulo" style="display: none"
								value="Grupos por TGI" SIZE=1 readonly /> <input type="text"
								name="valor1" style="display: none" value="TGI 1" SIZE=1
								readonly /> <input type="text" name="valor2"
								style="display: none" value="TGI 2" SIZE=1 readonly /> <input
								type="text" name="valor3" style="display: none"
								value="<%=grupoTgi1%>" SIZE=1 readonly /> <input type="text"
								name="valor4" style="display: none" value="<%=grupoTgi2%>"
								SIZE=1 readonly /> <input type="submit"
								value="  Montar Gráfico " />
						</form></td>


				</tr>

			</table>
			<br> <br>

			<h3>Quantidade de Alunos</h3>
			<br>

			<table border="1" width="50%">

				<tr style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#CCE6FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">

					<td>TGI 1</td>
					<td><%=alunoTgi1%></td>


				</tr>
				<tr style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#CCE6FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">

					<td>TGI 2</td>
					<td><%=alunoTgi2%></td>


				</tr>
				<tr style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#CCE6FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">

					<td>Total</td>
					<td><%=totalAlunos%></td>


				</tr>

				<tr style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#CCE6FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">
					<td></td>
					<td colspan="3"><form action="testeGrafico.jsp" method="post"
							target="_blank">
							<input type="text" name="titulo" style="display: none"
								value="Alunos por TGI" SIZE=1 readonly /> <input type="text"
								name="valor1" style="display: none" value="Alunos de TGI 1"
								SIZE=1 readonly /> <input type="text" name="valor2"
								style="display: none" value="Alunos de TGI 2" SIZE=1 readonly />
							<input type="text" name="valor3" style="display: none"
								value="<%=alunoTgi1%>" SIZE=1 readonly /> <input type="text"
								name="valor4" style="display: none" value="<%=alunoTgi2%>"
								SIZE=1 readonly /> <input type="submit"
								value="  Montar Gráfico " />
						</form></td>


				</tr>

			</table>
			<br> <br>
			<h3>Quantidade de Professores</h3>
			<br>
			<table border="1" width="50%">

				<tr style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#CCE6FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">

					<td>Total</td>


				</tr>
				<tr style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#CCE6FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">

					<td><%=totalProfessores%></td>


				</tr>

			</table>
			<br /> <br>
			<h3>Quantidade de Professores em bancas</h3>
			<br>
			<table border="1" width="50%">

				<tr style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#CCE6FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">

					<td>Total</td>


				</tr>
				<tr style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#CCE6FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">

					<td><%=professoresBanca%></td>


				</tr>
				<tr style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#CCE6FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">

					<td>
						<form action="testeGrafico.jsp" method="post" target="_blank">
							<input type="text" name="titulo" style="display: none"
								value="Professores em Bancas" SIZE=1 readonly /> <input
								type="text" name="valor1" style="display: none"
								value="com banca" SIZE=1 readonly /> <input type="text"
								name="valor2" style="display: none" value="sem" SIZE=1 readonly />
							<input type="text" name="valor3" style="display: none"
								value="<%=professoresBanca%>" SIZE=1 readonly /> <input
								type="text" name="valor4" style="display: none"
								value="<%=profSemBanca%>" SIZE=1 readonly /> <input
								type="submit" value="  Montar Gráfico " />
						</form>
					</td>
				</tr>
			</table>
			<br />


			<h3>Quantidade de Bancas</h3>
			<br>
			<table border="1" width="50%">

				<tr style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#CCE6FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">

					<td>Bancas Agendadas</td>


				</tr>
				<tr style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#CCE6FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">

					<td><%=quantidadeBancas%></td>

				</tr>

			</table>




			<%
				} else {
			%>

			<%
				}
			%>

			<br /> <br /> <br /> <br />
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