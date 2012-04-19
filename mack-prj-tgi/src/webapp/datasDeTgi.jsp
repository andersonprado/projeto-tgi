<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="br.com.connection.LocaDataHoraDao"%>
<%@page import="br.com.beans.Administrador"%>
<%@page import="br.com.beans.Aluno"%>
<%@page import="br.com.beans.Professor"%>
<%@page import="br.com.beans.LocalDataHora"%>
<%@page import="java.util.List"%>
<%
	// verificando se tem um atributo login na sessao
	// se tiver vai continuar e mostrar o menu
	if ((!session.getAttribute("login").equals(null))
			&& (session.getAttribute("login") instanceof Administrador)) {
%>




<html>
<head>

<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="icon" href="imagens/simbolo_M.ico">

<link rel="stylesheet" type=text/css href="js/timePicker.css" />


<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen, projection" />

<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>

<script type="text/javascript" language="javascript"
	src="js/jquery.dropdownPlain.js"></script>



<title>Datas de Tgi</title>
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
				<li><a href="informacoes.jsp">Informa��es e Gr�ficos</a></li>
				<li><a href="LoginServlet?acao=logout">Logout</a></li>
			</ul>


			<br /> <br /> <br /> <br />

			<h1>Datas de TGI</h1>


			<br /> <br />



			<%
				int valida = new LocaDataHoraDao().existeHorarios();

					if ((valida != 0) || (valida != 1)) {
			%>
			<table border="1" width="80%">
				<tr height="1">
					<td>Data</td>
					<td>Pr�dio</td>
					<td>Sala</td>
					<td>Reservado</td>
				</tr>

				<%
					List<LocalDataHora> listaHoras = new LocaDataHoraDao()
									.getListaLocalDataHora();

							for (LocalDataHora local : listaHoras) {

								String sala = "" + local.getSala();
								String data = local.getDataHorario().substring(8, 10)
										+ local.getDataHorario().substring(4, 8)
										+ local.getDataHorario().substring(0, 4)
										+ local.getDataHorario().substring(10);
				%>

				<tr style="cursor: default"
					onMouseOver="javascript:this.style.backgroundColor='#CCE6FF'"
					onMouseOut="javascript:this.style.backgroundColor=''">
					<td><%=data%></td>
					<td><%=sala.substring(0, 2)%></td>
					<td><%=sala.substring(2)%></td>
					<td><%=local.getHorarioOcupado()%></td>
				</tr>



				<%
					}
				%>
			</table>
			<%
				} else {
			%>
			<h2 style="color: red">N�o existem Horarios cadastrados</h2>

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
	// se n�o existir um login na sessao, 
		// vai enviar para a p�gina de login novamente
	} else {
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
	}
%>