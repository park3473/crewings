package egovframework.sample.user.exam.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.sample.user.exam.model.UserExamVo;
import egovframework.sample.user.exam.service.UserExamService;

@Service("userExamService")
@Transactional
public class UserExamServiceImpl implements UserExamService {

	@Resource(name="userExamMapper")
	UserExamMapper userExamMapper;

	@Override
	public ModelMap getAllList(UserExamVo userExamVo) {
		
		ModelMap modelMap = new ModelMap();
		
		List<?> list = userExamMapper.getAllList(userExamVo);
		
		System.out.println("size : " + list.size());
		
		int itemtotalcount = userExamMapper.getAllListCnt(userExamVo);
		int itemcount = userExamVo.getITEM_COUNT();
		int itempage = userExamVo.getITEM_PAGE();
		
		PageVO pageVo = new PageVO(itemcount, itemtotalcount, itempage);
		
		if(pageVo.isItempagenext() == true){
			modelMap.put("itempagenext", "true");
		}else {
			modelMap.put("itempagenext", "false");
		}
		
		System.out.println(pageVo.getItempage());
		
		modelMap.put("page", pageVo.getItempage());
		modelMap.put("itemcount", pageVo.getItemCount());
		modelMap.put("itempagestart", pageVo.getItempagestart());
		modelMap.put("itempageend", pageVo.getItempageend());
		modelMap.put("itemtotalcount", pageVo.getItemtotalcount());
		modelMap.put("itemtotalpage", pageVo.getItemtotalpage());
		
		modelMap.put("list", list);
		
		return modelMap;
	}

	@Override
	public ModelMap getView(UserExamVo userExamVo) {
		
		ModelMap model = new ModelMap();
		
		UserExamVo view = new UserExamVo();
		
		view = userExamMapper.getExamView(userExamVo);
		
		model.put("view", view);
		
		return model;
	}
	
	
	
}
