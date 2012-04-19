<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="br.com.beans.Administrador"%>
<%@page import="br.com.beans.Aluno"%>
<%@page import="br.com.beans.Professor"%>
<%
	// verificando se tem um atributo login na sessao
	// se tiver vai continuar e mostrar o menu
	if ((!session.getAttribute("login").equals(null))
			&& (session.getAttribute("login") instanceof Administrador)) {
%>




<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<link rel="stylesheet" type="text/css" href="css/default.css" />
<link type="text/css" href="js/jquery-ui-1.8.16.custom.css"
	rel="stylesheet" />

<script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>


<title>Datas Tgi</title>
</head>
<body>


	<div class="bordaBox">
		<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
		<div class="conteudo">

			<img src="imagens/logo_mack.png" /> <br /> <br />

			<h1>Inserir Datas TGI</h1>
			<br />



			<div class="demo">


				<script>
					$(function() {
						$("#datepicker").datepicker();
						$.datepicker.setDefaults({
							dateFormat : 'dd/mm/yy',
							dayNames : [ 'Domingo', 'Segunda', 'Terça',
									'Quarta', 'Quinta', 'Sexta', 'Sábado',
									'Domingo' ],
							dayNamesMin : [ 'D', 'S', 'T', 'Q', 'Q', 'S', 'S',
									'D' ],
							dayNamesShort : [ 'Dom', 'Seg', 'Ter', 'Qua',
									'Qui', 'Sex', 'Sáb', 'Dom' ],
							monthNames : [ 'Janeiro', 'Fevereiro', 'Março',
									'Abril', 'Maio', 'Junho', 'Julho',
									'Agosto', 'Setembro', 'Outubro',
									'Novembro', 'Dezembro' ],
							monthNamesShort : [ 'Jan', 'Fev', 'Mar', 'Abr',
									'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out',
									'Nov', 'Dez' ],
							nextText : 'Próximo',
							prevText : 'Anterior'
						});
				});
</script>

				<form method="post" action="dataTgi">
					<table>
						<tr>
							<td>Data</td>
							<td><input type="text" name="data" /></td>
						</tr>

						<td colspan="2"><input type="submit" value="Cadastrar" /></td>
						</tr>
					</table>

				</form>


			</div>



			<p>clique no campo >>>>> Possui alguns ERROS</p>



			<p>Incompleto</p>

			<br />
			<a href="admin.jsp">Voltar</a> <br /> <br /> <br /> <a
				href="LoginServlet?acao=logout">Logout</a>

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