<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
            <h2 class="titulo">Cadastrar</h2>
            <label for="">Nome</label>
            <div class="input">
                <input type="text" name="nome" placeholder="Nome" ${cliente.nome }>
            </div>
            <label for="">Endereco</label>
            <div class="input">
                <input type="text" name="endereco" placeholder="endereço"${cliente.endereco }>
            </div>
            <label for="">Telefone</label>
            <div class="input">
                <input type="number" name="telefone" placeholder="telefone"${cliente.telefone }>
            </div>
            <label for="">Email</label>
            <div class="input">
                <input type="text" name="email" placeholder="Email">
            </div>
            <label for="">Genero</label>
            <div class="">
                <select name="sexo" id="" >
                    <option value="M" ${cliente.genero }>Masculino</option>
                    <option value="F" ${cliente.genero }>Feminino</option>
                </select>
            </div>
            <label for="">Data de Nascimento</label>
            <div class="input">
                <input type="date" name="nascimento" placeholder="data de nascimento"${cliente.nascimento }>
            </div>
            <label for="">Produto de Interesse</label>
            <div class="input">
                <input type="text" name="produto" placeholder="Produto de Interesse" ${cliente.produto }>
            </div>
            <div id="bt">
                <button type="submit">Enviar</button>
            </div>
        </form>
    </div>
</body>
</html>