<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>


<html>
<head>
<link rel="icon" href="imagens/simbolo_M.ico">
<link rel="stylesheet" type="text/css" href="css/default.css" />
<title>Sistema TGI - Login</title>
</head>
<body>

	<%
		String fci = "Faculdade de Computação de Informática";
		String tgi = "Sistema de TGI";
		Calendar data = Calendar.getInstance();
	%>


	<div class="bordaBox">
		<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
		<div class="conteudo">
			<img src="imagens/logo_mack.png" />
			<h1><%=fci%></h1>
			<h2><%=tgi%></h2>
			<h3><%=data.get(Calendar.DAY_OF_MONTH) + "/"
					+ (data.get(Calendar.MONTH) + 1) + "/"
					+ data.get(Calendar.YEAR)%></h3>


			<h3>Login</h3>
			<form method="post" action="LoginServlet">
				<table  border="0">
					<tr>
						<td>Tia:</td>
						<td><input type="text" name="login" /></td>
					</tr>
					<tr>
						<td>Senha:</td>
						<td><input type="password" name="senha" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="Entrar" /></td>
					</tr>
				</table>
				<input type="hidden" name="acao" value="login" />

				


				<%
					if (request.getParameter("erro") != null) {
				%>
				<h2>
					<font color="red"> Login Inválido!!! </font>
				</h2>
				<h3>Tente novamente.</h3>
				<%
					}
				%>
			</form>


			<br /> <br /><br /><br /><br />


		</div>
		<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>

	</div>
	
	
</body>
</html>