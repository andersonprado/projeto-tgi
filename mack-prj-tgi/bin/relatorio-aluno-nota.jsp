<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.RandomAccessFile"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="br.com.connection.*"%>
<%@page import="br.com.beans.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<html>
<head><link rel="icon" href="imagens/simbolo_M.ico">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Relatórios</title>
<link rel="stylesheet" type="text/css" href="css/default.css" />
<%
	int codGrupo = Integer.parseInt(request.getParameter("grupo"));
	GrupoDao gdao = new GrupoDao();
	Grupo gr = gdao.getGrupo(codGrupo);
	String tituloGrupo = gr.getTituloGrupo();
	System.out.println("Grupo : " + gr.getIdCodGrupo());
	AlunoDao adao = new AlunoDao();
	List<Aluno> alunos = adao.getListaAlunosGrupo(codGrupo);

	RelatorioDao rdao = new RelatorioDao();
%>

</head>

<body>
	<div class="bordaBox">
		<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
		<div class="conteudo">

			<img src="imagens/logo_mack.png" />
			<div id="links">
				<ul>
					<li><a href="principal.jsp">Principal</a></li>
					<li><a href="banca.jsp">Criar Banca</a></li>
					<li><a href="ata-escolher.jsp">Imprimir Ata de TGI</a></li>
					<li><a href="LoginServlet?acao=logout">Logout</a></li>

				</ul>
			</div>
			<h1>
				Envio de relatórios Grupo "
				<%=tituloGrupo%>"
			</h1>

			<br />
			<%
				for (Aluno aluno : alunos) {

					rdao.setCodAluno("" + aluno.getIdCodAluno());
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

			<h2>

				<i><%=aluno.getNomeAluno()%></i>
			</h2>
			<h2>Relatório 1</h2>

			<h3><%=msg1%></h3>

			<p>
				<a href="<%=link%>" target="_blank">Visualizar relatório</a> <br />

			</p>
			<form action="nota.jsp" method="post" target="_blank">
				Atribuir nota: <input type="text" name="nota" /> <input type="text"
					name="num" value="1" style="display: none" /> <input type="text"
					style="display: none" value="<%=aluno.getIdCodAluno()%>"
					name="aluno" /> <input type="submit" value="Inserir" size="3pt" />


			</form>


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


			<h3><%=msg2%></h3>

			<p>
				<a href="<%=link2%>" target="_blank">Visualizar relatório</a> <br />

			</p>
			<form action="nota.jsp" method="post" target="_blank">
				Atribuir nota: <input type="text" name="nota" /> <input type="text"
					name="num" value="2" style="display: none" /> <input type="text"
					style="display: none" value="<%=aluno.getIdCodAluno()%>"
					name="aluno" /> <input type="submit" value="Inserir" size="3pt" />


			</form>


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


			<h3><%=msg3%></h3>

			<p>
				<a href="<%=link3%>" target="_blank">Visualizar relatório</a><br />

			</p>
			<form action="nota.jsp" method="post" target="_blank">
				Atribuir nota: <input type="text" name="nota" /> <input type="text"
					name="num" value="3" style="display: none" /> <input type="text"
					style="display: none" value="<%=aluno.getIdCodAluno()%>"
					name="aluno" /> <input type="submit" value="Inserir" size="3pt" />


			</form>

			<br /> <br />
			<%
				}
			%>

		</div>
		<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>

	</div>
</body>