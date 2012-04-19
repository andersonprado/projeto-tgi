<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="br.com.beans.Professor"%>
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
		
		
		String titulo = request.getParameter("titulo");
		String valor1 = request.getParameter("valor1");
		String valor2 = request.getParameter("valor2");
		String valor3 = request.getParameter("valor3");
		String valor4 = request.getParameter("valor4");
		
		
		int valor31 = Integer.parseInt(valor3);
		int valor41 = Integer.parseInt(valor4);
%>


<html>
<head>
<link rel="icon" href="imagens/simbolo_M.ico">
<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen, projection" />

<script type="text/javascript" language="javascript"
	src="js/jquery.dropdownPlain.js"></script>
<title>Gráfico</title>








<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
    
     
      google.load('visualization', '1.0', {'packages':['corechart']});
      
   
      google.setOnLoadCallback(drawChart);
      
   
      function drawChart() {
<%int a = 5;%>



      
      
      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Topping');
      data.addColumn('number', 'Slices');
      data.addRows([
        ['<%=valor1%>', <%=valor31%>],
        ['<%=valor2%>', <%=valor41%>],
      
      ]);

      
      

      var options = {'title':'<%=titulo%>',
                     'width':500,
                     'height':400};

      
      var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    }
    </script>


</head>
<body style="background-color: lime;">



	<div class="bordaBox">
		<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
		<div class="conteudo">

			<img src="imagens/logo_mack.png" />








			<div id="chart_div"></div>






<INPUT TYPE="button" value= " Fechar " onClick="self.close()">

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


