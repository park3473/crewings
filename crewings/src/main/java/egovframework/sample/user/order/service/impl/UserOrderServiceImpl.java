package egovframework.sample.user.order.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import egovframework.sample.user.order.model.UserOrderVo;
import egovframework.sample.user.order.service.UserOrderService;

@Service("userOrderService")
@Transactional
public class UserOrderServiceImpl implements UserOrderService {

	@Resource(name="userOrderMapper")
	UserOrderMapper userOrderMapper;

	@Override
	public ModelMap getAllList(UserOrderVo userOrderVo) {
		
		ModelMap modelMap = new ModelMap();
		
		List<?> list = userOrderMapper.getAllList(userOrderVo);
		
		modelMap.put("list", list);
		
		return modelMap;
		
	}

	@Override
	public void setOrderData(UserOrderVo userOrderVo, String type) {
		
		switch (type) {
		case "insert":
			userOrderMapper.setOrderDataInsert(userOrderVo);
			break;
		case "update":
			userOrderMapper.setOrderDataUpdate(userOrderVo);
					break;
		case "delete":
			userOrderMapper.setOrderDataDelete(userOrderVo);
			break;
		default:
			break;
		}
		
	}
	
	
}
