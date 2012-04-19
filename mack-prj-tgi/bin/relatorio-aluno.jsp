<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.RandomAccessFile"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="br.com.connection.*"%>
<%@page import="br.com.beans.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>

<html>
<head>
<link rel="icon" href="imagens/simbolo_M.ico">
<link rel="stylesheet" type="text/css" href="css/default.css" />

<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen, projection" />
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" language="javascript"
	src="js/jquery.dropdownPlain.js"></script>

<title>Relatórios</title>

<%
	Aluno aluno = (Aluno) session.getAttribute("login");
	RelatorioDao rdao = new RelatorioDao();
	rdao.setCodAluno("" + aluno.getIdCodAluno());
%>

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

			
			<br> <br> <br> <br />
			<h1>Envio de relatórios</h1>

			<br />
			<%
				String msg1 = "Envio pendente!";
				String link = "";
				String coment1 = "";

				rdao.setNumRelat("1");
				Relatorio rel = new Relatorio();

				rel = rdao.getRelatorio(rdao.getCodAluno());
				//System.out.println("testes: : " + rel);

				if (rel != null) {

					msg1 = "Relatório já enviado!";
					link = rel.getConteudoRelatorio();
					coment1 = rel.getComentarioRelatorio();
					if (coment1 == null)
						coment1 = "";

				}
			%>

			<h2>Relatório 1</h2>

			<form action="upload.jsp" method="post" enctype="multipart/form-data">

				<h3><%=msg1%></h3>
				<br /> Selecione o arquivo: <input type="file" name="file1">
				<input type="submit" value="Upload" />
			</form>

			<p>
				<a href="<%=link%>" target="_blank">Download</a> <br /> 
			</p>

			<br />

			<%
				String msg2 = "Envio pendente!";
				rdao.setNumRelat("2");
				String link2 = "";
				String coment2 = "";

				rel = rdao.getRelatorio(rdao.getCodAluno());
				//System.out.println("testes: : " + rel);

				if (rel != null) {

					msg2 = "Relatório já enviado!";
					link2 = rel.getConteudoRelatorio();
					coment2 = rel.getComentarioRelatorio();
					if (coment2 == null)
						coment2 = "";

				}
			%>

			<h2>Relatório 2</h2>


			<form action="upload2.jsp" method="post"
				enctype="multipart/form-data">


				<h3><%=msg2%></h3>
				<br /> Selecione o arquivo: <input type="file" name="file1">
				<input type="submit" value="Upload" />
			</form>

			<p>
				<a href="<%=link2%>" target="_blank">Download</a> <br /> 
			</p>

			<br />

			<%
				String msg3 = "Envio pendente!";
				rdao.setNumRelat("3");
				String link3 = "";
				String coment3 = "";

				rel = rdao.getRelatorio(rdao.getCodAluno());
				//System.out.println("testes: : " + rel);

				if (rel != null) {

					msg3 = "Relatório já enviado!";
					link3 = rel.getConteudoRelatorio();
					coment3 = rel.getComentarioRelatorio();
					if (coment3 == null)
						coment3 = "";

				}
			%>


			<h2>Relatório 3</h2>


			<form action="upload3.jsp" method="post"
				enctype="multipart/form-data">
				<h3><%=msg3%></h3>

				<br /> Selecione o arquivo: <input type="file" name="file1">
				<input type="submit" value="Upload" />
			</form>

			<p>
				<a href="<%=link3%>" target="_blank">Download</a><br /> 
			</p>

		</div>
		<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>

	</div>
</body>