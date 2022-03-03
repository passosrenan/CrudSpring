<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
	font-family: Mukta, sans-serif;
	height: 100vh;
	align-items: center;
	justify-content: center;
}

table {
	margin: auto;
}

th {
	padding: 10px;
}

td {
	padding: 10px;
	text-align: center;
}

.top {
	background-color: #87CEEB;
}

tr {
	background-color: #F0F8FF;
}

table {
	border: 2px solid #4F4F4F;
	border-radius: 10px;
	margin-top: 5vh;
}

* {
	margin: 0;
	padding: 0;
}

header {
	background-color: #E0FFFF;
	height: 8vh;
}

nav {
	font-family: Verdana, Geneva, Tahoma, sans-serif;
	float: right;
	margin-top: 2.5vh;
	margin-right: 4%;
}

nav p {
	display: inline;
	margin-left: 20px;
	text-decoration: none;
	cursor: pointer;
}


</style>
</head>
<body>
	<header>
		<nav>
			<p>
				<a href="formCliente">Formulário</a>
			</p>
			<p>
				<a href="listaClientes">Lista de Clientes</a>
			</p>
			<p>
				<a href="Estatistica">Estatisticas</a>
			</p>
		</nav>
	</header>

	<table>
		<tr class="top">
			<th>Clientes Masculino</th>
			<th>Clientes Feminos</th>
			<th>Clientes Jovens</th>
			<th>Clientes Adultos</th>
			<th>Clientes Idosos</th>
			<th>Cadastrado Segunda-Feira</th>
			<th>Cadastrado Terça-Feira</th>
			<th>Cadastrado Quarta-Feira</th>
			<th>Cadastrado Quinta-Feira</th>
			<th>Cadastrado Sexta-Feira</th>
			<th>Cadastrado Sábado</th>
			<th>Cadastrado Domingo</th>
			<th>Cadastrado Período da Manhã</th>
			<th>Cadastrado Período da Tarde</th>
			<th>Cadastrado Período da Noite</th>
		</tr>
		<td>${masculino }</td>
		<td>${feminino }</td>
		<td>${jovem }</td>
		<td>${Adulto }</td>
		<td>${idoso }</td>
		<td>${segunda }</td>
		<td>${terca }</td>
		<td>${quarta }</td>
		<td>${quinta }</td>
		<td>${sexta }</td>
		<td>${sabado }</td>
		<td>${domingo }</td>
		<td>${Manha }</td>
		<td>${Tarde }</td>
		<td>${Noite }</td>
	</table>




</body>
</html>