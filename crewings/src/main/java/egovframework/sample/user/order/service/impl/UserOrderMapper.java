package egovframework.sample.user.order.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.sample.user.order.model.UserOrderVo;

@Mapper("userOrderMapper")
public interface UserOrderMapper {

	List<?> getAllList(UserOrderVo userOrderVo);

	
	
}
