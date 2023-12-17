package egovframework.sample.user.exam.contorller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.registry.infomodel.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.sample.admin.exam.model.AdminExamVo;
import egovframework.sample.user.exam.model.UserExamVo;
import egovframework.sample.user.exam.service.UserExamService;

@Controller
public class UserExamContorller {

	@Autowired
	UserExamService userExamService;
	
	//EXAM
	@RequestMapping(value="/user/exam/list.do" , method = RequestMethod.GET)
	public ModelAndView UserExamListGet(@ModelAttribute("UserExamVo")UserExamVo UserExamVo , HttpServletRequest request , HttpServletResponse response) {
		
		System.out.println(("PAGE : " + UserExamVo.getPAGE()));
		System.out.println("ITEM_COUNT : " + UserExamVo.getITEM_PAGE());
		
		String PAGE = request.getParameter("PAGE") != null ? request.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request.getParameter("ITEM_COUNT") : "10";
		
		UserExamVo.setPAGE(Integer.parseInt(PAGE));
		UserExamVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		int pagelimit = UserExamVo.getPAGE() * UserExamVo.getITEM_COUNT();
		
		UserExamVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		UserExamVo.setOFFSET(pagelimit);
		
		ModelMap model = new ModelMap();
		
		model = userExamService.getAllList(UserExamVo);
		
		model.put("beforeData", UserExamVo);
		
		return new ModelAndView("user/exam/list" , "model" , model);
		
	}
	
	@RequestMapping(value="/user/exam/view.do" , method = RequestMethod.GET)
	public ModelAndView UserExamViewGet(@ModelAttribute("UserExamVo")UserExamVo UserExamVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = userExamService.getView(UserExamVo);
		
		model.put("beforeData", UserExamVo);
		
		return new ModelAndView("user/exam/view" , "model" , model);
		
	}
	
}
