package egovframework.sample.user.product.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.sample.user.product.model.UserProductVo;

@Mapper("userProductMapper")
public interface UserProductMapper {

	UserProductVo getViewData();

	List<?> getAllList(UserProductVo userProductVo);

}
