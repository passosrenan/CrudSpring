package br.cotia.quiosque.controller;

import java.util.Calendar;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.cotia.quiosque.dao.DaoQuiosque;
import br.cotia.quiosque.model.Cliente;

@Controller
public class IndexController {
	@RequestMapping("index")
	public String index() {
		return "index";
	}

	
	
	@RequestMapping("Estatistica")
	public String Contar(Model model,DaoQuiosque dao) {
		Calendar gc = Calendar.getInstance();
		int anoHj = gc.get(Calendar.YEAR);
		
		int contadorIdoso=0;
		int contadorJovem=0;
		int contadorAdulto=0;
		int horaManha = 0;
		int horaDia=0;
		int horaTarde=0;
		int horaNoite=0;
		int domingo=0;
		int segunda=0;
		int terca=0;
		int quarta=0;
		int quinta=0;
		int sexta=0;
		int sabado=0;
		int contMasculino=0;
		int contFeminino=0;
		
		
		for (Cliente c:dao.listar()) {
			int anoCliente = c.getNascimento().get(Calendar.YEAR);
			int idade = anoHj - anoCliente;
		//contador idade
		if(idade <20) {
			contadorJovem++;
		
		}else if(idade <59 ) {
			contadorAdulto++;
		}else {
			contadorIdoso++;
			
		}
		
		//contador hora do dia
		
		
		
		horaDia = c.getDataCadastro().get(Calendar.HOUR_OF_DAY);
		
		if(horaDia <12) {
			horaManha++;
			
		}else if(horaDia <18) {
			horaTarde++;
			
			
		}else {
			
			horaNoite++;
		}
		
		//dia da semana
		
		
		
		switch (c.getDataCadastro().get(Calendar.DAY_OF_WEEK)) {
		case Calendar.SUNDAY:
			domingo++;
			
			break;
		case Calendar.MONDAY:
			segunda++;
			
			break;
		case Calendar.TUESDAY:
			terca++;
			
			break;
		case Calendar.WEDNESDAY:
			
			quarta++;
			break;
		case Calendar.THURSDAY:
			
			quinta++;
			break;
		case Calendar.FRIDAY:
			sexta++;
			
		case Calendar.SATURDAY:
			sabado++;
			
			break;		
		default: 
			break;
		}
		
		//genero
		
		switch (c.getGenero()) {
		case "Masculino":
			contMasculino++;
			break;	   
		case "Feminino":
			contFeminino++;
			break;

		default:
			break;
		}
		
		
		
		
		}
		model.addAttribute("quarta",quarta);
		model.addAttribute("quinta", quinta);
		model.addAttribute("sexta", sexta);
		model.addAttribute("sabado", sabado);
		model.addAttribute("terca", terca);
		model.addAttribute("segunda", segunda);
		model.addAttribute("domingo", domingo);
		model.addAttribute("Noite", horaNoite);
		model.addAttribute("Tarde", horaTarde);
		model.addAttribute("jovem", contadorJovem);
		model.addAttribute("Adulto", contadorAdulto);
		model.addAttribute("idoso", contadorIdoso);
		model.addAttribute("Manhã", horaManha);
		model.addAttribute("masculino", contMasculino);
		model.addAttribute("feminino", contFeminino);
		
		return "estatisticas";
		
	
		
		
		
		
	}
}
