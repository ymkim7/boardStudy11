package com.vam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.AuthorMapper;
import com.vam.model.AuthorVO;
import com.vam.model.Criteria;

@Service
public class AuthorServiceImpl implements AuthorService {
	
	@Autowired
	private AuthorMapper authormapper;

	@Override
	public void authorEnroll(AuthorVO author) throws Exception {
		authormapper.authorEnroll(author);

	}

	@Override
	public List<AuthorVO> authorGetList(Criteria cri) throws Exception {
		
		return  authormapper.authorGetList(cri);
	}

	@Override
	public int authorGetTotal(Criteria cri) throws Exception {
		
		return authormapper.authorGetTotal(cri);
	}

	@Override
	public AuthorVO authorGetDetail(int authorId) throws Exception {

		return authormapper.authorGetDetail(authorId);
	}

	@Override
	public int authorModify(AuthorVO author) throws Exception {

		return authormapper.authorModify(author);
	}

	@Override
	public int authorDelete(int authorId) throws Exception {

		return authormapper.authorDelete(authorId);
	}

}
