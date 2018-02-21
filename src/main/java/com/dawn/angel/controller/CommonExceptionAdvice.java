package com.dawn.angel.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class CommonExceptionAdvice {
	
	@ExceptionHandler(Exception.class)
	private ModelAndView error(Exception ex) {
		System.out.println("error : " + ex.getMessage());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("error/error");
		modelAndView.addObject("exception", ex);
		return modelAndView;
	}
}
