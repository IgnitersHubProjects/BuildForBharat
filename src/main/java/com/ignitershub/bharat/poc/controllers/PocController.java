package com.ignitershub.bharat.poc.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.ignitershub.bharat.poc.constants.Constants;

@Controller
public class PocController {

	@GetMapping(Constants.URL.ROOT)
	public String getlogin(HttpServletRequest request, HttpServletResponse response) {
		return Constants.Page.INVENTORY;
	}
	
}
