package egovframework.sample.user.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.sample.user.order.model.UserOrderVo;
import egovframework.sample.user.order.service.UserOrderService;

@Controller
public class UserOrderController {

	@Autowired
	UserOrderService userOrderService;
	
	@RequestMapping(value="/user/order/list.do" , method = RequestMethod.GET)
	public ModelAndView UserOrderAllList(@ModelAttribute("UserOrderVo")UserOrderVo UserOrderVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = userOrderService.getAllList(UserOrderVo);
		
		return new ModelAndView("user/order/list" , "model" , model);
		
	}
	
	@RequestMapping(value="/user/order/insert.do" , method = RequestMethod.POST)
	public void UserOrderDataInsert(@ModelAttribute("UserOrderVo")UserOrderVo UserOrderVo , HttpServletRequest request , HttpServletResponse response) {
		
		userOrderService.setOrderData(UserOrderVo ,"insert");
		
	}
	
	@RequestMapping(value="/user/order/update.do" , method = RequestMethod.POST)
	public void UserOrderDataUpdate(@ModelAttribute("UserOrderVo")UserOrderVo UserOrderVo , HttpServletRequest request , HttpServletResponse response) {
		
		userOrderService.setOrderData(UserOrderVo ,"update");
		
	}
	
	
}
