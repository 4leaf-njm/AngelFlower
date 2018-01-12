package com.dawn.angel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/commons")
public class CommonController {
	
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
		return "commons/join";
	}
}
