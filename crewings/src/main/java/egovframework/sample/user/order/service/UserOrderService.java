package egovframework.sample.user.order.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.sample.user.order.model.UserOrderVo;

public interface UserOrderService {

	ModelMap getAllList(UserOrderVo userOrderVo);

	void setOrderData(UserOrderVo userOrderVo, String string);

}
