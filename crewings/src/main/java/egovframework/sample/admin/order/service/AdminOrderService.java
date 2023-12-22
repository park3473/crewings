package egovframework.sample.admin.order.service;

import org.springframework.ui.ModelMap;

import egovframework.sample.admin.order.model.AdminOrderVo;

public interface AdminOrderService {

	ModelMap getAllList(AdminOrderVo adminOrderVo);

	ModelMap getViewData(AdminOrderVo adminOrderVo);

	void setOrderData(AdminOrderVo adminOrderVo, String string);

}
