<%@page import="javax.swing.JOptionPane"%>
<%@page import="br.cotia.quiosque.model.Cliente"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>

        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style type="text/css">

	#form{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background: #d01c1f;
    border-radius: 10px;
    padding: 60px;
    width: min-content;
    align-items: center;
    color: #fff;

}
.titulo{
    font-size: 1.5em ;
    margin-bottom: 10%;
}
.input{
    min-width: 280px;
    border-radius: 22px;
    border: 2px solid #fff;
    padding: 5px;
    margin: 0px 0px 12px -5px;
}
 .input input{
    width: 90%;
    border:none;
    outline: none;
}
#bt{
    margin-top: 10%;
    width: 100%;
    text-align: center;
    
}
#bt button{
    font-family: 'Poppins', sans-serif;
    background: #0062be;
    width: 100%;
    height: 40px;
    border: none;
    font-size: 1.2em;
    color: #fff;
    border-radius:20px ;
    cursor: pointer;    
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="form">
	
        <form action="cadastrarCliente" >
        <input type="hidden" name="id" value="${cliente.id }">
            <h2 class="titulo">Cadastrar</h2>
            <label for="">Nome</label>
            <div class="input">
                <input type="text" name="nome" placeholder="Nome"  required="required" value="${cliente.nome }">
            </div>
            <label for="">Endereco</label>
            <div class="input">
                <input type="text" name="endereco" placeholder="endereço" required="required" value="${cliente.endereco }">
            </div>
            <label for="">Telefone</label>
            <div class="input">
                <input type="number" name="telefone" placeholder="telefone" required="required" value="${cliente.telefone }">
            </div>
            <label for="">Email</label>
            <div class="input">
                <input type="text" name="email" placeholder="Email" required="required" value="${cliente.email }">
            </div>
            <label for="">Genero</label>
            <div class="">
                <select name="genero" required="required"   >
               
                	<option value="Masculino" <c:if test="${cliente.genero.equals('Masculino') }">selected</c:if>>Masculino</option>
                	<option   value="Feminino"  <c:if test="${cliente.genero.equals('Feminino') }">selected</c:if>>Feminino</option>
                    
                </select>
            </div>
            <label for="">Data de Nascimento</label>
            <div class="input">
            
                <input  type="date" name="nascimento" id="valida" required="required" placeholder="data de nascimento" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${cliente.nascimento.time}"/>">
             
            </div>
            <label for="">Produto de Interesse</label>
            <div class="input">
                <input type="text" name="produto" placeholder="Produto de Interesse" required="required" value="${cliente.produto }">
            </div>
            <div id="bt">
                <button type="submit">Enviar</button>
            </div>
           
        </form>
        
    </div>
</body>
</html>