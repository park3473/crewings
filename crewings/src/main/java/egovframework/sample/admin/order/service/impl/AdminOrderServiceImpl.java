package egovframework.sample.admin.order.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import egovframework.sample.admin.order.model.AdminOrderVo;
import egovframework.sample.admin.order.service.AdminOrderService;

@Service("adminOrderService")
@Transactional
public class AdminOrderServiceImpl implements AdminOrderService {

	@Resource(name="adminOrderMapper")
	AdminOrderMapper adminOrderMapper;

	@Override
	public ModelMap getAllList(AdminOrderVo adminOrderVo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelMap getViewData(AdminOrderVo adminOrderVo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
}
