package egovframework.sample.user.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.sample.user.product.model.UserProductVo;
import egovframework.sample.user.product.service.UserProductService;

@Controller
public class UserProductController {

	@Autowired
	UserProductService userProductService;
	
	@RequestMapping(value="/user/product/list.do" , method = RequestMethod.GET)
	public ModelAndView UserProductAllList(@ModelAttribute("UserProductVo")UserProductVo UserProductVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = userProductService.getAllList(UserProductVo);
		
		model.put("before", UserProductVo);
		
		return new ModelAndView("user/product/list" , "model" , model);
		
	}
	
	@RequestMapping(value="/user/product/view.do" , method = RequestMethod.GET)
	public ModelAndView UserProductViewData(@ModelAttribute("UserProductVo")UserProductVo UserProductVo , HttpServletRequest request , HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();
		
		model = userProductService.getViewData(UserProductVo);
		
		model.put("before", UserProductVo);
		
		return new ModelAndView("user/product/view" , "model" , model);
		
	}
	
}
