package br.cotia.quiosque.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.cotia.quiosque.dao.DaoQuiosque;
import br.cotia.quiosque.model.Cliente;

@Controller
public class ClienteController {
	@RequestMapping("formCliente")
	public String form(Model modelo) {
		return "form";
	}
	@RequestMapping("cadastrarCliente")
	public String cadastrarCliente(Cliente cliente) {
		System.out.println(cliente.getNome());
		System.out.println(cliente.getEmail());
		System.out.println(cliente.getEndereco());
		System.out.println(cliente.getTelefone());
		System.out.println(cliente.getProduto());
		System.out.println(cliente.getNascimento());
		
		DaoQuiosque dao = new DaoQuiosque();
		dao.cadastro(cliente);
		return "redirect:listaClientes";
	}
	@RequestMapping("listaClientes")
	public String listarClientes(Model model) {
		DaoQuiosque dao = new DaoQuiosque();
		model.addAttribute("clientes", dao.listar());
		
		return"listaClientes";
		
		
	}
	@RequestMapping("excluirCliente")
	public String excluir(long idCliente) {
		DaoQuiosque dao = new DaoQuiosque();
		dao.excluir(idCliente);

		return "redirect:listaClientes";
	}
	
	@RequestMapping("alterarCliente")
	public String alterar(long idCliente, Model model) {
		DaoQuiosque dao = new DaoQuiosque();
		model.addAttribute("clientes",dao.buscar(idCliente));
		return "forward:form";
	}
}
