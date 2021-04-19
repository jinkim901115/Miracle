package com.miracle.fts;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
	

	@RequestMapping(value = "/index")
	public String index(Model model) {
		return "index";
	}
	
	@RequestMapping("/about")
	public String about(Model model) {
		return "about";
	}
	
	@RequestMapping("/listmain")
	public String list(Model model) {
		return "/list/listmain";
	}
	
	@RequestMapping("/notice")
	public String notice(Model model) {
		return "/notice/notice";
	}
	
	@RequestMapping("/faq")
	public String faq(Model model) {
		return "/faq/faq";
	}
	
	@RequestMapping("/qna")
	public String qna(Model model) {
		return "/qna/qna";
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
