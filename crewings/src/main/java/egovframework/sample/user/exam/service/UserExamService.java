package egovframework.sample.user.exam.service;

import org.springframework.ui.ModelMap;

import egovframework.sample.user.exam.model.UserExamVo;

public interface UserExamService {

	ModelMap getAllList(UserExamVo userExamVo);

	ModelMap getView(UserExamVo userExamVo);

}
