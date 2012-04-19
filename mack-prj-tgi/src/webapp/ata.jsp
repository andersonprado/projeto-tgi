<%@page import="br.com.beans.ProfessorNota"%>
<%@page import="br.com.connection.*"%>
<%@page import="br.com.beans.Grupo"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<% AtaDAO ata = new AtaDAO();%>

<%
String grupoescolhido = request.getParameter("grupo");
int idGrupo = Integer.parseInt(grupoescolhido);
ata.setCodGrupo(grupoescolhido);
ata.setData();
ata.setTias();
ata.setNomeAlunos();
ata.setNotasAluno01();
ata.setNotasAluno02();
ata.setNotasAluno03();
ata.setNotasAluno04();

ata.setListaNotas(); 

ata.setEnfases();
ata.setPredio();
ata.setSala();
ata.setAvaliador2();
ata.setAvaliador3();
ata.setTituloTrabalho();
ata.setNomeOrientador();
ata.setCoordenadorTgi();


ata.setNotasAluno1();
ata.setNotasAluno2();
ata.setNotasAluno3();
ata.setNotasAluno4();


ata.setNotasRelatorioAlunos();
ata.setNotasFinaisAlunos();
String tmp;


String nomeCurso = "Sistemas de informação";
GrupoDao gp = new GrupoDao();
EnfaseDao ef = new EnfaseDao();
int codEnf = gp.getGrupo(idGrupo).getCodEnfase();
String enfase = ef.getEnfase(codEnf).getNomeFase();




if (enfase.equals("Ciência da Computação") ){
	nomeCurso = "Ciência da Computação";
}




%>

<html>
	<link rel="stylesheet" href="ata.css" type="text/css"> 
	<link rel="Shortcut Icon" href="imagens/simbolo_M.ico">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
			<link rel="icon" href="imagens/simbolo_M.ico">
			<title>ATA</title>
		</head>
	<body>
		<font size=2>
			<table width="708" border="0">
  				<tr>
					<td width="449" valign="top">
						
						<table width="708" height="26" border="0">
      						<tr>
        						<td width="121"><img src="imagens/mack01.png"  align="middle" width="70%" alt="Mackenzie Logo"/></td>
        						<td width="425">
		        					<center>
		        						UNIVERSIDADE PRESBITERIANA MACKENZIE </br>
      			  						FACULDADE DE COMPUTAÇÃO E INFORMÁTICA </br>
      			  					</br>
									<U>	
										Termo de Julgamento de Trabalho de Graduação Interdisciplinar
									</U>
									</br>
									</br>
										<%=nomeCurso %>
        							</center>
        						</td>
        						<td width="140" align="right"><img src="imagens/mack02.png"  align="left" width="50%" alt="Mackenzie Logo"/></td>
      						</tr>
    					</table>
      					
      					<table width="708" border="0" cellspacing="0" cellpadding="0">
        					<tr>
          						<td><div align="justify">
            						<p><%tmp = ata.getMostrarData();%><%=tmp%> no prédio <%tmp = ata.getPredio();%><%=tmp%>, sala <%tmp = ata.getSala();%><%=tmp%> da Universidade Presbiteriana Mackenzie, presente a Comissão Julgadora integrada pelos senhores Professores abaixo mencionados, iniciou-se a apresentação do Trabalho de Graduação Interdisciplinar do grupo formado pelos alunos a seguir relacionados. Concluída a argüição, procedeu-se ao julgamento na forma regulamentar, tendo a Comissão Julgadora atribuída as seguintes notas aos candidatos
              						</br>
              						</p>
            						<p>Título do Trabalho: <%tmp = ata.getTituloTrabalho();%><%=tmp%></p>
          						</div></td>
        					</tr>
      					</table>
      
						<table width="708" height="124" border="1" cellspacing="0" cellpadding="0">
  							<tr>
							    <td height="22" colspan="2"><div align="center">Aluno</div></td>
    							<td width="101"><div align="center">Matrícula</div></td>
  							    <td width="220"><div align="center">Ênfase</div></td>
  							</tr>
  							<tr>
   								<td width="18" height="22"><div align="center">1</div></td>
    							<td width="327"><%tmp = ata.getAluno01();%><%=tmp%></td>
    							<td><div align="center"><%tmp = ata.getTia01();%><%=tmp%></div></td>
    							<td><%tmp = ata.getEnfase01();%><%=tmp%></td>
  							</tr>
  							<tr>
    							<td height="22"><div align="center">2</div></td>
    							<td><%tmp = ata.getAluno02();%><%=tmp%></td>
    							<td><div align="center"><%tmp = ata.getTia02();%><%=tmp%></div></td>
    							<td><%tmp = ata.getEnfase02();%><%=tmp%></td>
  							</tr>
  							<tr>
    							<td height="22"><div align="center">3</div></td>
    							<td><%tmp = ata.getAluno03();%><%=tmp%></td>
    							<td><div align="center"><%tmp = ata.getTia03();%><%=tmp%></div></td>
    							<td><%tmp = ata.getEnfase03();%><%=tmp%></td>
  							</tr>
  							<tr>
   	 							<td height="22"><div align="center">4</div></td>
    							<td><%tmp = ata.getAluno04();%><%=tmp%></td>
    							<td><div align="center"><%tmp = ata.getTia04();%><%=tmp%></div></td>
    							<td><%tmp = ata.getEnfase04();%><%=tmp%></td>
  							</tr>
	  					</table>
						</br>
    					<table width="708" border="1" cellspacing="0" cellpadding="0">
      						<tr>
						        <td width="50"><div align="center"></div></td>
						        <td colspan="8"><div align="center">Relatórios</div></td>
						       <!-- <td colspan="5"><div align="center"></div></td>-->
        					</tr>
      						<tr>
        						<td><div align="center">Alunos</div></td>
        						<td width="72"><p align="center">R1 </br> (10%)</p></td>
        						<td width="72"><p align="center">R2 </br> (20%)</p></td>
        						<td width="72"><p align="center">R3 </br> (30%)</p></td>
        						<td width="72"><p align="center">Apres. </br> (40%)</p></td>
        						<td width="100"><p align="center">Média </br> Orientador</p></td>
        						<td width="82"><p align="center">Examinador </br> 1</p></td>
        						<td width="82"><p align="center">Examinador </br> 2</p></td>
        						<td width="86"><p align="center">Média </br> Final</div></td>
      						</tr>
      						<tr>
        						<td><div align="center">1</div></td>
        						<td><div align="center"><%tmp = ata.getAluno1R1();%><%=tmp%></div></td>
        						<td><div align="center"><%tmp = ata.getAluno1R2();%><%=tmp%></div></td>
        						<td><div align="center"><%tmp = ata.getAluno1R3();%><%=tmp%></div></td>
        						<td><div align="center"><%=ata.getAluno1N1()%></div></td>
        						<td><div align="center"><%=ata.getAluno1R4()%></div></td>
        						<td><div align="center"><%=ata.getAluno1N2()%></div></td>
        						<td><div align="center"><%=ata.getAluno1N3()%></div></td>
        						<td><div align="center"><%=ata.getAluno1N4()%></div></td>
      						</tr>
      						<tr>
        						<td><div align="center">2</div></td>
        						<td><div align="center"><%tmp = ata.getAluno2R1();%><%=tmp%></div></td>
        						<td><div align="center"><%tmp = ata.getAluno2R2();%><%=tmp%></div></td>
        						<td><div align="center"><%tmp = ata.getAluno2R3();%><%=tmp%></div></td>
        						<td><div align="center"><%=ata.getAluno2N1()%></div></td>
        						<td><div align="center"><%=ata.getAluno2R4()%></div></td>
        						<td><div align="center"><%=ata.getAluno2N2()%></div></td>
        						<td><div align="center"><%=ata.getAluno2N3()%></div></td>
        						<td><div align="center"><%=ata.getAluno2N4()%></div></td>
      						</tr>
      						<tr>
								<td><div align="center">3</div></td>
   						     	<td><div align="center"><%tmp = ata.getAluno3R1();%><%=tmp%></div></td>
        						<td><div align="center"><%tmp = ata.getAluno3R2();%><%=tmp%></div></td>
        						<td><div align="center"><%tmp = ata.getAluno3R3();%><%=tmp%></div></td>
   						     	<td><div align="center"><%=ata.getAluno3N1()%></div></td>
        						<td><div align="center"><%=ata.getAluno3R4()%></div></td>
        						<td><div align="center"><%=ata.getAluno3N2()%></div></td>
        						<td><div align="center"><%=ata.getAluno3N3()%></div></td>
        						<td><div align="center"><%=ata.getAluno3N4()%></div></td>
      						</tr>
      						<tr>
        						<td><div align="center">4</div></td>
        						<td><div align="center"><%tmp = ata.getAluno4R1();%><%=tmp%></div></td>
        						<td><div align="center"><%tmp = ata.getAluno4R2();%><%=tmp%></div></td>
        						<td><div align="center"><%tmp = ata.getAluno4R3();%><%=tmp%></div></td>
        						<td><div align="center"></div><%=ata.getAluno4N1()%></td>
        						<td><div align="center"><%=ata.getAluno4R4()%></div></td>
        						<td><div align="center"></div><%=ata.getAluno4N2()%></td>
        						<td><div align="center"></div><%=ata.getAluno4N3()%></td>
        						<td><div align="center"></div><%=ata.getAluno4N4()%></td>
      						</tr>
    					</table>
    					<table width="708" border="0" cellspacing="0" cellpadding="0">
      						<tr>
      						  <td></br>
          						<p>Para constar, é lavrado o presente termo que vai assinado pela Comissão Julgadora e pelo Coordenador de TGI.</p>
          						<p>
          							<script type="text/javascript" language="JavaScript">
        								data = new Date();
      	  								dia = data.getDate();
        								mes = data.getMonth();						
        								ano = data.getFullYear();
        								meses = new Array(12);
        								meses[0] = "Janeiro";
        								meses[1] = "Fevereiro";
        								meses[2] = "Março";
        								meses[3] = "Abril";
        								meses[4] = "Maio";
        								meses[5] = "Junho";
          								meses[6] = "Julho";
        								meses[7] = "Agosto";
        								meses[8] = "Setembro";
        								meses[9] = "Outubro";
        								meses[10] = "Novembro";
        								meses[11] = "Dezembro";
        								document.write ("São Paulo, " + dia + " de " + meses[mes] + " de " + ano);
        							</script>
		  						</p>
          						<p><b>Comissão Julgadora</b></p> </br>       
          						_____________________________________________________________________________________________________</br>
          						Orientador: <b><%tmp = ata.getNomeOrientador();%><%=tmp%></b></br><br></br>
          						</br>
          
       						   	_____________________________________________________________________________________________________</br>
          						Examinador 1: <b><%tmp = ata.getAvaliador01();%><%=tmp%></b></br><br></br>
          						</br>
          
          						_____________________________________________________________________________________________________</br>
          						Examinador 2: <b><%tmp = ata.getAvaliador02();%><%=tmp%></b></br></br></br>
          
				            	<b>Coordenador de TGI</b>
          						</br>
          						</br>
          						</br>
          						</br>
          						_____________________________________________________________________________________________________</br>
          						<b><%tmp = ata.getCoordenadorTgi();%><%=tmp%></b></br></br>
         						 <center>
						          	____________________________________________________________
          							</br>
          					
          							<font size=1>
          								<b>Campus São Paulo:</b> Rua da Consolação, 896, Consolação, São Paulo - SP . CEP 01301-907
          							</font>
          						</center>
          </td>
      </tr>
    </table>
    </td>
  </tr>
</table>
		</font>
		
		
	</body>
</html>