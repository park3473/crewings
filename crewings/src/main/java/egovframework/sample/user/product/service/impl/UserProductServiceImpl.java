package egovframework.sample.user.product.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import egovframework.sample.user.product.model.UserProductVo;
import egovframework.sample.user.product.service.UserProductService;

@Service("userProductService")
@Transactional
public class UserProductServiceImpl implements UserProductService {

	
	@Resource(name="userProductMapper")
	UserProductMapper userProductMapper;
	
	@Override
	public ModelMap getAllList(UserProductVo userProductVo) {
		
		ModelMap model = new ModelMap();
		
		List<?> list = userProductMapper.getAllList(userProductVo);
		
		model.put("list", list);
		
		return model;
	}

	@Override
	public ModelMap getViewData(UserProductVo userProductVo) {
		
		ModelMap model = new ModelMap();
		
		UserProductVo view = new UserProductVo();
		
		view = userProductMapper.getViewData();
		
		model.put("view", view);
		
		return model;
	}

}
