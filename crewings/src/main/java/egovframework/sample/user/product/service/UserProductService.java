package egovframework.sample.user.product.service;

import org.springframework.ui.ModelMap;

import egovframework.sample.user.product.model.UserProductVo;

public interface UserProductService {

	ModelMap getAllList(UserProductVo userProductVo);

	ModelMap getViewData(UserProductVo userProductVo);

}
