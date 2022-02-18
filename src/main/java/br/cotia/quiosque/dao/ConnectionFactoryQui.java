package br.cotia.quiosque.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactoryQui {
	private static final String USUARIO = "root";
	private static final String SENHA = "";

	public static Connection conectar() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/cadastro",USUARIO,SENHA);
			return conexao;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
