package egovframework.sample.user.exam.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.sample.user.exam.model.UserExamResultVo;
import egovframework.sample.user.exam.model.UserExamVo;
import egovframework.sample.user.exam.service.UserExamService;
import egovframework.sample.user.member.model.UserMemberVo;
import egovframework.sample.user.question.service.impl.UserQuestionMapper;

@Service("userExamService")
@Transactional
public class UserExamServiceImpl implements UserExamService {

	@Resource(name="userExamMapper")
	UserExamMapper userExamMapper;
	
	@Resource(name="userQuestionMapper")
	UserQuestionMapper userQuestionMapper;

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
		
		//해당 exam 의 시험 관련 내용 가져오기
		model.put("view", view);
		
		//해당 exam 의 문제 가져오기
		List<?> questionlist = userExamMapper.getQuestionList(userExamVo);
		
		model.put("questionlist", questionlist);
		
		return model;
	}

	@Override
	public void setExamResultData(UserExamResultVo userExamResultVo) {
		// TODO Auto-generated method stub
		
		userExamMapper.setExamResultData(userExamResultVo);
		
		
	}

	@Override
	public List<?> getResultListView(UserMemberVo userMemberVo) {
		
		List<?> list = userExamMapper.getResultListView(userMemberVo);
		
		return list;
	}
	
	
	
}
