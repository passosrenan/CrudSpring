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
	h1{
		text-align: center;
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
	

</style>
</head>
<body>
	<<table>
		<tr>
		<th>ID</th>
		<th>Nome</th>
		<th>Endereço</th>
		<th>nascimento</th>
		<th>telefone</th>
		<th>Email</th>
		
		</tr>
	<c:forEach items="${clientes }" var="c">
			<tr>
				<td>${c.id }</td>
				<td>${c.nome }</td>
				<td>${c.endereco}</td>
				<td><fmt:formatDate  pattern="dd/MM/yyyy"  value="${c.nascimento.time }"/></td>
				<td>${c.telefone}</td>
				<td>${c.email }</td>
				<td><a href="excluirCliente?idCliente=${c.id }"onclick="return confirm('Deseja realmente excluir?')">Excluir</td></a>
				<td><a href="alterarCliente?idCliente=${c.id }">Alterar</a></td>
			</tr>
	</c:forEach>
	</table>
</body>
</html>