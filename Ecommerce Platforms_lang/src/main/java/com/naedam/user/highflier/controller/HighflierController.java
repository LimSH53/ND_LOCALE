package com.naedam.user.highflier.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RestController
@RequestMapping("/user/highflier/*")
public class HighflierController {

	/**
	 * 채용
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="qualifiedEmployee")
	public ModelAndView qualifiedEmployee(Model model) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/highflier/qualifiedEmployee");
		return mv;
	}
	
	/**
	 * 파트너 => 파트너 조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="hrDepartment")
	public ModelAndView hrDepartment(Model model) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/highflier/hrDepartment");
		return mv;
	}
	
}
