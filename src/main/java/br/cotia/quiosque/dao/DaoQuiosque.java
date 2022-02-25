package br.cotia.quiosque.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
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
		String sql = "insert into tb_cadastro" + "(nome, endereco, nascimento, telefone, email, dataCadastro, genero)" + "values (?,?,?,?,?,?,?)";

		PreparedStatement preparador;
		try {
		
			// guardando os dados imputados no bd
			preparador = conexao.prepareStatement(sql);
			preparador.setString(1, cliente.getNome());
			preparador.setString(2, cliente.getEndereco());
			Calendar hoje = Calendar.getInstance();
			
				preparador.setDate(3, new Date(cliente.getNascimento().getTimeInMillis()));
		
			preparador.setString(4, cliente.getTelefone());
			preparador.setString(5, cliente.getEmail());
			Calendar gc = Calendar.getInstance();
			cliente.setDataCadastro(gc);
			preparador.setTimestamp(6, new Timestamp(cliente.getDataCadastro().getTimeInMillis()));
			preparador.setString(7, cliente.getGenero());
			
			preparador.execute();
			preparador.close();
			conexao.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);

		}

	}
	// atualizar

	public void atualizar(Cliente cliente) {
		String sql = "update tb_cadastro set nome = ?, endereco = ?, nascimento = ?, telefone = ?, email = ?, genero = ? where id = ?";
		// preparando o comando
		PreparedStatement preparador;
		try {
			preparador = conexao.prepareStatement(sql);
			preparador.setString(1, cliente.getNome());
			preparador.setString(2, cliente.getEndereco());
			preparador.setDate(3, new Date(cliente.getNascimento().getTimeInMillis()));
			preparador.setString(4, cliente.getTelefone());
			preparador.setString(5, cliente.getEmail());
			preparador.setString(6, cliente.getGenero());
			preparador.setLong(7,cliente.getId());
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
			inserir.setLong(1, idCliente);
			ResultSet rs = inserir.executeQuery();
			if (rs.next()) {
				c = new Cliente();
				c.setId(rs.getLong("id"));
				c.setNome(rs.getString("nome"));
				c.setEndereco(rs.getString("endereco"));
				
				
				
				Calendar conversorDate = Calendar.getInstance();
				// extraindo o date do resultset
				Date dataBd = rs.getDate("nascimento");
				// setar a data do calendar pela data no Date
				conversorDate.setTimeInMillis(dataBd.getTime());
				// setando validade do produto
				c.setNascimento(conversorDate);
				c.setTelefone(rs.getString("telefone"));
				c.setEmail(rs.getString("email"));
				
				Calendar conversor = Calendar.getInstance();
				Date dataCad = rs.getDate("dataCadastro");
				conversor.setTimeInMillis(dataCad.getTime());
				c.setDataCadastro(conversor);
				c.setGenero(rs.getString("genero"));

				

			}
			rs.close();
			inserir.close();
			conexao.close();

			

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
		return c;
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
				Calendar conversorDate = Calendar.getInstance();
				// extraindo o date do resultset
				Date dataBd = rs.getDate("nascimento");
				// setar a data do calendar pela data no Date
				
				conversorDate.setTimeInMillis(dataBd.getTime());
				// setando validade do produto
				c.setNascimento(conversorDate);
				
				c.setEndereco(rs.getString("endereco"));
				c.setEmail(rs.getString("email"));
				c.setTelefone(rs.getString("telefone"));
				
				Calendar conversor = Calendar.getInstance();
				Timestamp dataCad = rs.getTimestamp("dataCadastro");
				conversor.setTimeInMillis(dataCad.getTime());
				c.setDataCadastro(conversor);
				
				
				c.setGenero(rs.getString("genero"));

				
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
