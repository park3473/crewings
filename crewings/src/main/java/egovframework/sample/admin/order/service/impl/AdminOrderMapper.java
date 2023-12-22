package egovframework.sample.admin.order.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.sample.admin.order.model.AdminOrderVo;

@Mapper("adminOrderMapper")
public interface AdminOrderMapper {

	List<?> getAllList(AdminOrderVo adminOrderVo);

	int getAllListCnt(AdminOrderVo adminOrderVo);
	
	AdminOrderVo getViewData(AdminOrderVo adminOrderVo);

	void setOrderDataInsert(AdminOrderVo adminOrderVo);

	void setOrderDataUpdate(AdminOrderVo adminOrderVo);

}
