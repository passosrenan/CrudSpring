package br.cotia.quiosque.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.cotia.quiosque.model.Cliente;

public class DaoQuiosque {
	private Connection conexao;

	public DaoQuiosque() {
		conexao = ConnectionFactoryQui.conectar();
	}

	public void cadastro(Cliente cliente) {
		String sql = "insert into tb_cadastro" + "(nome, endereco, nascimento, telefone, email)" + "values (?,?,?,?,?)";

		PreparedStatement preparador;
		try {
			// guardando os dados imputados no bd
			preparador = conexao.prepareStatement(sql);
			preparador.setString(1, cliente.getNome());
			preparador.setString(2, cliente.getEndereco());
			preparador.setDate(3, new Date(cliente.getNascimento().getTimeInMillis()));
			preparador.setString(4, cliente.getTelefone());
			preparador.setString(5, cliente.getEmail());
			preparador.execute();
			preparador.close();
			conexao.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);

		}

	}
	// atualizar

	public void atualizar(Cliente cliente) {
		String sql = "update tb_cadastro set nome = ?, endereco = ?,"
				+ "nascimento = ?, telefone = ?, email = ? where id = ?";
		// preparando o comando
		PreparedStatement preparador;
		try {
			preparador = conexao.prepareStatement(sql);
			preparador.setString(1, cliente.getNome());
			preparador.setString(2, cliente.getEndereco());
			preparador.setDate(3, new Date(cliente.getNascimento().getTimeInMillis()));
			preparador.setString(4, cliente.getTelefone());
			preparador.setString(5, cliente.getEmail());
			preparador.setLong(6,cliente.getId());
			preparador.execute();
			preparador.close();
			conexao.close();


		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// excluindo cliente
	public void excluir(long id) {
		String sql = "delete from tb_cadastro where id = ?";
		PreparedStatement preparador;

		try {
			preparador = conexao.prepareStatement(sql);
			preparador.setLong(1, id);
			preparador.execute();
			preparador.close();
			conexao.close();
		} catch (Exception e) {

		}

	}

	// consulta de cliente
	public Cliente buscar(long idCliente) {
		String sql = "select * from tb_cadastro where id =?";
		Cliente c = null;
		PreparedStatement inserir;
		try {
			inserir = conexao.prepareStatement(sql);
			ResultSet rs = inserir.executeQuery();
			inserir.setLong(1, idCliente);
			if (rs.next()) {
				c = new Cliente();
				c.setId(rs.getLong("id"));
				c.setNome(rs.getString("nome"));
				c.setEmail(rs.getString("email"));
				c.setEndereco(rs.getString("endereco"));
				c.setTelefone(rs.getString("telefone"));

				Calendar conversorDate = Calendar.getInstance();
				// extraindo o date do resultset
				Date dataBd = rs.getDate("nascimento");
				// setar a data do calendar pela data no Date
				conversorDate.setTimeInMillis(dataBd.getTime());
				// setando validade do produto
				c.setNascimento(conversorDate);

			}
			rs.close();
			inserir.close();
			conexao.close();

			return c;

		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}

	// listando
	public List<Cliente> listar() {
		String sql = "select * from tb_cadastro order by nome asc";
		List<Cliente> list = new ArrayList<Cliente>();
		PreparedStatement inserir;
		try {
			inserir = conexao.prepareStatement(sql);
			ResultSet rs = inserir.executeQuery();
			while (rs.next()) {
				Cliente c = new Cliente();
				c.setId(rs.getLong("id"));
				c.setNome(rs.getString("nome"));
				c.setEndereco(rs.getString("endereco"));
				c.setEmail(rs.getString("email"));
				c.setTelefone(rs.getString("telefone"));

				Calendar conversorDate = Calendar.getInstance();
				// extraindo o date do resultset
				Date dataBd = rs.getDate("nascimento");
				// setar a data do calendar pela data no Date
				conversorDate.setTimeInMillis(dataBd.getTime());
				// setando validade do produto
				c.setNascimento(conversorDate);
				list.add(c);

			}
			rs.close();
			inserir.close();
			conexao.close();
			return list;

		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}
}
