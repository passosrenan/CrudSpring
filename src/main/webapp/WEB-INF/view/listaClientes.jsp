<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
                <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

	body{
		font-family: Mukta, sans-serif;
		height: 100vh;
		align-items:center;
		justify-content: center;
	}
	
	table{
		margin: auto;
	}
	
	th{
		padding: 10px;
	}
	td{
		padding: 10px;
		text-align: center;
	}
	.top{ 
		background-color:#87CEEB;	 
	}
	tr{
		background-color: #F0F8FF;	
	}
	
	table {
	  	border: 2px solid #4F4F4F;
  		border-radius: 10px;
  		margin-top: 5vh;	
	}
	.bt{
    color: white;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
    display: inline-block;
	}
	
	
	a{
		text-decoration: none;
		color: black;
	}
	
        *{
            margin: 0;
            padding: 0;
        }
        header{
            background-color:#E0FFFF	; 
            height: 8vh;   
            
        }
        nav{
            font-family:Verdana, Geneva, Tahoma, sans-serif;
            float: right;
            margin-top: 2.5vh;
            margin-right: 4%;
            
        }
        nav p{
            display: inline;
            margin-left: 20px;
        }
    
	
</style>
</head>
<body>
	<header>
        <nav>
            <p><a href="formCliente">Formulário</a></p>
            <p><a href="listaClientes">Lista de Clientes</a></p>
            <p><a href="Estatistica">Estatisticas</a></p>
        </nav>
    </header>
	<table>
		<tr class="top">
		<th>ID</th>
		<th>Nome</th>
		<th>Endereço</th>
		<th>nascimento</th>
		<th>telefone</th>
		<th>Email</th>
		<th>Data Cadastro</th>
		<th>Genero</th>
		
		</tr>
	<c:forEach items="${clientes }" var="c">
			<tr>
				<td>${c.id }</td>
				<td>${c.nome }</td>
				<td>${c.endereco}</td>
				<td><fmt:formatDate  pattern="dd/MM/yyyy"  value="${c.nascimento.time }"/></td>
				<td>${c.telefone}</td>
				<td>${c.email }</td>
				<td><fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${c.dataCadastro.time }"/></td>
				<td>${c.genero }</td>
				<td><button class="btE"><a href="excluirCliente?idCliente=${c.id }">Excluir</td></a></button>
				<td><button class="bt"><a href="alterarCliente?idCliente=${c.id }">Alterar</a></button></td>
				
				
			</tr>
	</c:forEach>
	</table>
</body>
</html>