package egovframework.sample.user.exam.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.sample.user.exam.model.UserExamResultVo;
import egovframework.sample.user.exam.model.UserExamVo;

@Mapper("userExamMapper")
public interface UserExamMapper {

	List<?> getAllList(UserExamVo userExamVo);

	int getAllListCnt(UserExamVo userExamVo);
	
	UserExamVo getExamView(UserExamVo userExamVo);

	List<?> getQuestionList(UserExamVo userExamVo);

	void setExamResultData(UserExamResultVo userExamResultVo);

	
}
