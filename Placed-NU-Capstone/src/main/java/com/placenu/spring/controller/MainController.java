package com.placenu.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/")
public class MainController {
	@RequestMapping(value="Placed@NU",method = RequestMethod.GET)
	public String showHomePage() {
		return "index";
	}


}
