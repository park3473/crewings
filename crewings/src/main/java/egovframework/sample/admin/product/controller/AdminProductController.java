package egovframework.sample.admin.product.controller;

import javax.enterprise.inject.Model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.system.util.SUtil;

import egovframework.sample.admin.product.model.AdminProductVo;
import egovframework.sample.admin.product.service.AdminProductService;
import egovframework.sample.file.model.FileVo;

@Controller
public class AdminProductController {

	@Autowired
	AdminProductService adminProductService;
	
	@RequestMapping(value="/admin/product/list.do" ,  method = RequestMethod .GET)
	public ModelAndView AdminProductListGet(@ModelAttribute("AdminProductVo")AdminProductVo AdminProductVo , HttpServletRequest request , HttpServletResponse response) {
		
		System.out.println("PAGE : " + AdminProductVo.getPAGE());
		System.out.println("ITEM_COUNT : " + AdminProductVo.getITEM_COUNT());
		
		String PAGE = request.getParameter("PAGE") != null ? request.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request.getParameter("ITEM_COUNT") : "0";
		
		AdminProductVo.setPAGE(Integer.parseInt(PAGE));
		AdminProductVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		int pagelimit = AdminProductVo.getPAGE() * AdminProductVo.getITEM_COUNT();
		
		AdminProductVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		AdminProductVo.setOFFSET(pagelimit);
		
		ModelMap model = new ModelMap();
		
		model = adminProductService.getAllList(AdminProductVo);
		
		model.put("before", AdminProductVo);
		
		return new ModelAndView("admin/product/list" , "model" , model);
		
	}
	
	
	@RequestMapping(value="/admin/product/insert.do" , method = RequestMethod.GET)
	public String AdminProductInsertGet(@ModelAttribute("AdminProductVo")AdminProductVo AdminProductVo , HttpServletRequest request , HttpServletResponse response) {
		
		return "admin/product/insert";
		
	}
	
	@RequestMapping(value="/admin/product/insert.do" , method  = RequestMethod.POST)
	public void AdminProductInsertPost(@ModelAttribute("AdminProductVo")AdminProductVo AdminProductVo , MultipartHttpServletRequest request , HttpServletResponse response) {
		
		//파일 등록
		String drv = request.getRealPath("");
		drv = drv.substring(0 , drv.length()) + "./resources/" + ((HttpServletRequest) request).getContextPath() + "/upload/product/image/";
		
		String filename = SUtil.setFileUpload(request, drv);
		
		AdminProductVo.setImage(filename);
		
		adminProductService.setProductData(AdminProductVo , "insert");
		
	}
	
	@RequestMapping(value="/admin/product/view.do" ,  method = RequestMethod.GET)
	public ModelAndView AdminProductViewData(@ModelAttribute("AdminProductVo")AdminProductVo AdminProductVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminProductService.getViewData(AdminProductVo);
		
		model.put("before", AdminProductVo);
		
		return new ModelAndView("admin/product/view" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/product/delete.do" , method = RequestMethod.POST)
	public void AdminProductDeletePost(@ModelAttribute("AdminProductVo")AdminProductVo AdminProductVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminProductService.setProductData(AdminProductVo, "delete");
		
	}
	
	@RequestMapping(value="/admin/product/update.do" , method = RequestMethod.POST)
	public void AdminProductUpdatePost(@ModelAttribute("AdminProductVo")AdminProductVo AdminProductVo , MultipartHttpServletRequest request , HttpServletResponse response) {
		
		adminProductService.setProductData(AdminProductVo, "update");
		
	}
	
}
