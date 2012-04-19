<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="br.com.beans.Professor"%>

<%@page import="br.com.beans.*"%><%@page
	import="br.com.beans.LocalDataHora"%>
<%@page import="br.com.connection.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.connection.ProfessorNotaDao"%>
<%@page import="br.com.connection.LocaDataHoraDao"%>

<%
	// verificando se tem um atributo login na sessao
	// se tiver vai continuar e mostrar o menu
	if (!session.getAttribute("login").equals(null)) {
%>


<html>
<head>
<link rel="icon" href="imagens/simbolo_M.ico">
<link rel="stylesheet" type="text/css" href="css/default.css" />
<title>Informações da Banca</title>

</head>
<body style="background-color: ;">



	<div class="bordaBox">
		<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
		<div class="conteudo">

			<img src="imagens/logo_mack.png" /> <br /> <br />
			<h1>Informações da Banca</h1>



			<br /> <br />

			<%
				int idBanca = Integer
							.parseInt(request.getParameter("codBanca"));

					Banca banca = new BancaDao().getBanca(idBanca);

					if (!banca.equals(null)) {
			%>
			<%
				Grupo grupo = new GrupoDao().getGrupo(banca.getCodGrupo()); //pega o grupo

						List<Aluno> listaAlunos = new AlunoDao()
								.getListaAlunosGrupo(grupo.getIdCodGrupo()); //lista de alunos do Grupo

						String nomeProfessor = new ProfessorDao().getProfessor(
								grupo.getCodProf()).getNome(); //nome do professor

						List<ProfessorNota> listaNotas = new ProfessorNotaDao()
								.getProfessorNotaBanca(banca.getCodBanca());

						List<ProfessorNota> listaProfessores = new ArrayList<ProfessorNota>();

						for (ProfessorNota pf : listaNotas) {

							if (pf.getCodProfessor() != grupo.getCodProf()) {
								for (int i = 1; i <= 3; i++) {
									if (pf.getNumProfessorNota() == i) {
										listaProfessores.add(pf);
									}
								}
							}
						}

						List<ProfessorNota> listaDoGrupo = new ArrayList<ProfessorNota>(); //gambiarra

						for (int i = 1; i <= 2; i++) {
							listaDoGrupo.add(listaProfessores.get(i));
						}

						LocalDataHora data = new LocaDataHoraDao()
								.getLocalDataHora(banca.getCodHorario());

					
						String sala = "" + data.getSala();

						String data1 = data.getDataHorario()
								.substring(8, 10)
								+ data.getDataHorario().substring(
										4, 8)
								+ data.getDataHorario().substring(
										0, 4)
								+ data.getDataHorario().substring(
										10)
								+ " "
								+ " Sala:  "
								+ sala.substring(2);
						
						
						
						
						
						
			%><h2>Título do TGI</h2>
			<h2><%=grupo.getTituloGrupo()%></h2>
		
			<h3>Data </h3>
			<h3><%=data1%></h3>

			<br>
			<table border="1" width="60%">

				<tr height="1">
					<td colspan="2" style="background-color: #BCD2EE;">Professor
						Orientador</td>
				</tr>
				<tr height="1" style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#1E90FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">
					<td>Drt</td>
					<td>Nome</td>
				</tr>
				<tr height="1" style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#1E90FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">
					<td><%=grupo.getCodProf()%></td>
					<td><%=nomeProfessor%></td>
				</tr>
			</table>
			<br>

			<table border="1" width="60%">

				<tr height="1" style="background-color: #BCD2EE;">
					<td colspan="2" style="background-color: #BCD2EE;">Professores
						Examinadores</td>
				</tr>
				<tr height="1" style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#1E90FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">
					<td>Drt</td>
					<td>Nome</td>
				</tr>
				<%
					for (ProfessorNota prof : listaDoGrupo) {
				%>
				<tr height="1" style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#1E90FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">
					<td><%=prof.getCodProfessor()%></td>
					<td colspan="2"><%=new ProfessorDao().getProfessor(
								prof.getCodProfessor()).getNome()%></td>
				</tr>
				<%
					}
				%>
			</table>



			<br>

			<%
				for (Aluno alunos : listaAlunos) {
			%>
			<table border="1" width="60%">
				<tr height="1" style="background-color: #BCD2EE;">
					<td colspan="5">Alunos</td>

				</tr>
				<tr height="1" style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#1E90FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">
					<td>Tia</td>
					<td>Nome</td>
					<td colspan="3">Notas</td>
				</tr>

				<tr height="1" style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#1E90FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">
					<td><%=alunos.getIdCodAluno()%></td>
					<td><%=alunos.getNomeAluno()%></td>


					<%
						for (ProfessorNota nota : new ProfessorNotaDao()
											.getProfessorNotaBancaAluno(alunos
													.getIdCodAluno())) {
					%>
					<td><%=nota.getNota()%></td>
					<%
						}
					%>
				</tr>
			</table>
			<br>
			<%
				}
			%>




			<%
				}
			%>
			<INPUT TYPE="button" value=" Fechar " onClick="self.close()">


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