package egovframework.sample.admin.exam.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.sample.admin.exam.model.AdminExamVo;
import egovframework.sample.admin.question.model.AdminQuestionListVo;

@Mapper("adminExamMapper")
public interface AdminExamMapper {

	public List<?> getAllList(AdminExamVo adminExamVo);

	public int getAllListCnt(AdminExamVo adminExamVo);

	public void setAdminExamDataInsert(AdminExamVo adminExamVo);

	public void setAdminExamDataUpdate(AdminExamVo adminExamVo);

	public void setAdminExamDataDelete(AdminExamVo adminExamVo);

	public AdminExamVo getExamView(AdminExamVo adminExamVo);

	public List<?> getQuestionList(AdminQuestionListVo adminQuestionListVo);

	public void setAdminExamQuestionListInsert(AdminQuestionListVo adminQuestionListVo);

	public void setAdminExamQuestionListUpdate(AdminQuestionListVo adminQuestionListVo);

	public void setAdminExamQuestionListDelete(AdminQuestionListVo adminQuestionListVo);

	public List<?> getExamTypeAllList();

	public List<?> getExamCategoryList(AdminExamVo vo);

	public List<?> getStatusQuestionList(AdminExamVo adminExamVo);

	public List<?> getExamResultMemberAll(AdminExamVo adminExamVo);

	public void setAdminExamQuestionListComent(AdminQuestionListVo adminQuestionListVo);

	public void setAdminExamQuestionSort(AdminQuestionListVo adminQuestionListVo);

	public List<?> getResultAllList(AdminExamVo adminExamVo);

	public int getResultAllListCnt(AdminExamVo adminExamVo);

	public List<?> getResultDataAllList(AdminExamVo adminExamVo);
	
}
