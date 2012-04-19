<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%
	String tia = request.getParameter("aluno");
	String num = request.getParameter("num");
	String nota = request.getParameter("nota");
	nota = nota.replace(",", ".");
	RelatorioDao rd = new RelatorioDao();
	System.out.println(tia + num + nota);
	rd.inserirNota(tia, num, nota);
%>
</head>
<body>

	<script type="text/javascript" language="JavaScript">
		window.close();
	</script>

</body>
</html>