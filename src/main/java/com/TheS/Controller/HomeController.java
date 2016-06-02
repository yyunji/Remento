package com.TheS.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.TheS.Service.TestService;

@Controller
public class HomeController {
	@Autowired
	TestService testService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		
		List<Map<String, Object>> test = testService.test();
//		int test = 0;
		
		ModelAndView mav = new ModelAndView("/main");
		mav.addObject("test", test);
		return mav;
	}
	
}
