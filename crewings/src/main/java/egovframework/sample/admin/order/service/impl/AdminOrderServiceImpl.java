package egovframework.sample.admin.order.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.sample.admin.order.model.AdminOrderVo;
import egovframework.sample.admin.order.service.AdminOrderService;

@Service("adminOrderService")
@Transactional
public class AdminOrderServiceImpl implements AdminOrderService {

	@Resource(name="adminOrderMapper")
	AdminOrderMapper adminOrderMapper;

	@Override
	public ModelMap getAllList(AdminOrderVo adminOrderVo) {
		
		ModelMap modelMap = new ModelMap();
		
		List<?> list  = adminOrderMapper.getAllList(adminOrderVo);
		
		System.out.println("size : " + list.size());
		
		int itemtotalcount = adminOrderMapper.getAllListCnt(adminOrderVo);
		int itemcount = adminOrderVo.getITEM_COUNT();
		int itempage = adminOrderVo.getITEM_PAGE();
		
		PageVO pageVo = new PageVO(itemcount, itemtotalcount, itempage);
		
		if(pageVo.isItempagenext() == true) {
			
			modelMap.put("itempagenext", "true");
			
		}else {
			
			modelMap.put("itempagenext", "false");
			
		}
		
		System.out.println(pageVo.getItempage());
		
		modelMap.put("page", pageVo.getItempage());
		modelMap.put("itemcount", pageVo.getItemCount());
		modelMap.put("itempagestart", pageVo.getItempagestart());
		modelMap.put("itempageend", pageVo.getItempageend());
		modelMap.put("itemtotalcount", pageVo.getItemtotalcount());
		modelMap.put("itemtotalpage", pageVo.getItemtotalpage());
		
		modelMap.put("list", list);
		
		
		return modelMap;
	}

	@Override
	public ModelMap getViewData(AdminOrderVo adminOrderVo) {

		ModelMap model = new ModelMap();
		
		AdminOrderVo view = new AdminOrderVo();
		
		view = adminOrderMapper.getViewData(adminOrderVo);
		
		model.put("view", view);
		
		return model;
	}

	@Override
	public void setOrderData(AdminOrderVo adminOrderVo, String type) {
		
		switch (type) {
		case "insert":
			adminOrderMapper.setOrderDataInsert(adminOrderVo);
			break;
		case "update":
			adminOrderMapper.setOrderDataUpdate(adminOrderVo);
			break;
		default:
			
			System.out.println("type오류");
			
			break;
		}
		
	}
	
	
	
	
}
