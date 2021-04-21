package com.miracle.fts;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.miracle.fts.DTO.ListDTO;
import com.miracle.fts.service.ListService;


@Controller
public class MainController {
	private ListService listService;
	
	@Autowired
	public void setListService(ListService listService) {
		this.listService = listService;
	}

	public MainController() {
		super();
	}

	@RequestMapping(value = "/index")
	public String index(Model model) {
		return "index";
	}
	
	@RequestMapping("/about")
	public String about(Model model) {
		return "about";
	}
	
	@RequestMapping("/listmain")
	public String list(ListDTO dto, Model model) {
		model.addAttribute("list", listService.list());
		System.out.println(dto.getSearch());
//		model.addAttribute("result", listService.listCnt(dto));
		return "/list/listmain";
	}
	
	
	@RequestMapping("/favorite")
	public String favorite(Model model) {
		return "/favorite/favo";
	}
	
	@RequestMapping("/login")
	public String login(Model model) {
		return "/login/login";
	}


	
	
	
}
