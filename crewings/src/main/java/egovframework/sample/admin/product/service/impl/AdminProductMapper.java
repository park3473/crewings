package egovframework.sample.admin.product.service.impl;

import java.util.List;

import egovframework.sample.admin.product.model.AdminProductVo;

public interface AdminProductMapper {

	List<?> getAllList(AdminProductVo adminProductVo);

	int getAllListCnt(AdminProductVo adminProductVo);

}
