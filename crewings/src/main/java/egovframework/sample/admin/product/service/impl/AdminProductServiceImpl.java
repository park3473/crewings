package egovframework.sample.admin.product.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.sample.admin.product.service.AdminProductService;

@Service("adminProductService")
@Transactional
public class AdminProductServiceImpl implements AdminProductService {

	@Resource(name="adminProductMapper")
	AdminProductMapper adminProductMapper;
	
}
