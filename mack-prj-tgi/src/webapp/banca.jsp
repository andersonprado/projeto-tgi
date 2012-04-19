

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


<title>Sistema - Agendamento de Banca</title>
</head>
<body>



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
			<h1>Agendamento de Banca</h1>
			<br />
			<h2>Grupos de TGI 2</h2>




			<br /> <br />

			<%
				Professor professor = (Professor) session.getAttribute("login");
					int codProf = professor.getIdCodProfessor();

					List<Grupo> ListaDeGrupos = new GrupoDao().getListaGrupos();

					int quant = new GrupoDao().getQuantGrupo(codProf);
					if (codProf != 0) {

						for (Grupo grupo : ListaDeGrupos) {
							if ((grupo.getCodProf() == codProf)
									&& (grupo.getTgiGrupo() == 2)
									&& (new BancaDao().existeBanca(grupo
											.getIdCodGrupo()) == 0)) {
			%>


			<%
				// Colocar validação que se tiver banca não mostrar
			%>



			<%
				List<LocalDataHora> listaHoras = new LocaDataHoraDao()
										.getListaLocalDataHora();
			%>



			<form method="post" action="InsereBanca">

				<table border="0">
					<tr>
						<td>Título do TGI</td>
						<td><input type="text" name="nome"
							value="<%=grupo.getTituloGrupo()%>" style="text-align: center"
							Size=44 readonly /></td>
					</tr>
					<tr>
						<td>Professor Orientador</td>
						<td><input type="text" name="nome"
							value="<%=professor.getNome()%>" style="text-align: center"
							Size=44 readonly /></td>
					</tr>
					<tr>
						<td>Examinador 1</td>
						<td><select name="codProf">
								<%
									ProfessorDao profDao = new ProfessorDao();
								%>
								<%
									int profSize = profDao.getListaProfessores().size();
													String nomeProfessor = "";

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
					<tr>
						<td>Examinador 2</td>
						<td><select name="codProf2">
								<%
									ProfessorDao profDao1 = new ProfessorDao();
								%>
								<%
									int profSize1 = profDao.getListaProfessores()
															.size();
													String nomeProfessor1 = "";

													int codProfessor1 = professor.getIdCodProfessor();

													List<Professor> professores1 = profDao
															.getListaProfessores();

													for (Professor prof : professores) {
														if (codProfessor1 != prof.getIdCodProfessor())
								%><option value="<%=prof.getIdCodProfessor()%>"><%=prof.getNome()%></option>

								<%
									}
													if (codProfessor1 != 0) {
								%>
								<option value="<%=codProfessor1%>" selected><%=professor.getNome()%></option>
								<%
									}
								%>

						</select></td>
					</tr>
					<tr>
						<td>Data</td>
						<td align="left"><select name="codData">
								<%
									for (LocalDataHora local : listaHoras) {
														if (!local.getHorarioOcupado()
																.equalsIgnoreCase("S")) {

															String sala = "" + local.getSala();

															String data = local.getDataHorario()
																	.substring(8, 10)
																	+ local.getDataHorario().substring(
																			4, 8)
																	+ local.getDataHorario().substring(
																			0, 4)
																	+ local.getDataHorario().substring(
																			10)
																	+ " "
																	+ " Sala:  "
																	+ sala.substring(2);
								%>

								<option value="<%=local.getCodHorario()%>"><%=data%></option>
								<%
									}
													}
								%>
						</select></td>
					</tr>
					<tr>
						<td colspan="2"><br></td>
					</tr>

					<tr>
						<td colspan="2"><input type="submit" value="Inserir" /></td>
					</tr>

				</table>
			</form>

			<br /> <br />
			<%
				}
						}
					}
			%>
			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
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