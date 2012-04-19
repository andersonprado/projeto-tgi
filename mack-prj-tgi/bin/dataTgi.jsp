<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="br.com.beans.Administrador"%>
<%@page import="br.com.beans.Aluno"%>
<%@page import="br.com.beans.Professor"%>
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
<link rel="stylesheet" type="text/css"
	href="js/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>


<script type="text/javascript" src="js/jquery.timePicker.js"></script>
<script type="text/javascript" src="js/jquery.timePicker.min.js"></script>

<link rel="stylesheet" type=text/css href="js/timePicker.css" />



<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen, projection" />

<script type="text/javascript" language="javascript"
	src="js/jquery.dropdownPlain.js"></script>



<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="datas"%>


<script type="text/javascript">
	$(function() {
		$("#date").datepicker();
		$.datepicker.setDefaults({
			dateFormat : 'dd-mm-yy',
			dayNames : [ 'Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta',
					'Sexta', 'Sábado', 'Domingo' ],
			dayNamesMin : [ 'D', 'S', 'T', 'Q', 'Q', 'S', 'S', 'D' ],
			dayNamesShort : [ 'Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb',
					'Dom' ],
			monthNames : [ 'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio',
					'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro',
					'Novembro', 'Dezembro' ],
			monthNamesShort : [ 'Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun',
					'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez' ],
			nextText : 'Próximo',
			prevText : 'Anterior'
		});

	});
</script>


<script type="text/javascript">
	$(function() {
		$("#time1").timePicker();
	});
</script>

<script type="text/javascript">
$(function() {
	$("#time2").timePicker({
		startTime : "02.00", // Using string. Can take string or Date object.
		endTime : new Date(0, 0, 0, 15, 30, 0), // Using Date object here.
		show24Hours : false,
		separator : '.',
		step : 15
	});
</script>


<title>Inserir Datas de Tgi</title>
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

			<br /> <br /> <br /> <br />


			<h1>Inserir Datas TGI</h1>


			<br /> <br />



			<form method="post" action="dataTgi">
				<table border="0">
					<tr align="left">
						<td>Data</td>
						<td><input type="text" id="date" name="data" size="15" /></td>

					</tr>
					<tr align="left">
						<td>Hora</td>
						<td><input type="text" id="time1" name="hora" size="15" /></td>
					</tr>

					<tr align="left">
						<td>Predio/Sala</td>
						<td><select name="sala" size="1" name="sala">
								<option value="13101" selected="selected">13/101</option>
								<option value="13201">13/202</option>
								<option value="13301">13/203</option>
								<option value="14101">14/101</option>

						</select></td>

					</tr>
					<tr>
						<td><br></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="Cadastrar" /></td>
					</tr>
				</table>

			</form>












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