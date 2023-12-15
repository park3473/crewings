package egovframework.sample.user.question.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.sample.user.question.service.UserQuestionService;

@Service
@Transactional
public class UserQuestionServiceImpl implements UserQuestionService {
	
	@Resource(name="userQuestionMapper")
	private UserQuestionMapper userQuestionMapper;

}
