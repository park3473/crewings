package egovframework.sample.user.exam.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.sample.user.exam.model.UserExamResultVo;
import egovframework.sample.user.exam.model.UserExamVo;
import egovframework.sample.user.member.model.UserMemberVo;

public interface UserExamService {

	ModelMap getAllList(UserExamVo userExamVo);

	ModelMap getView(UserExamVo userExamVo);

	void setExamResultData(UserExamResultVo userExamResultVo);

	List<?> getResultListView(UserMemberVo userMemberVo);

	ModelMap getResultDataView(UserExamResultVo userExamResultVo);


}
