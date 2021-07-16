package com.vam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vam.mapper.AdminMapper;
import com.vam.model.AttachImageVO;
import com.vam.model.BookVO;
import com.vam.model.CateVO;
import com.vam.model.Criteria;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;

	@Transactional
	@Override
	public void bookEnroll(BookVO book) throws Exception {
		adminMapper.bookEnroll(book);
		
		if(book.getImageList() == null || book.getImageList().size() <= 0) {
			return;
		}
		
		book.getImageList().forEach(attach ->{
			
			attach.setBookId(book.getBookId());
			
			try {
				adminMapper.imageEnroll(attach);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		});

	}

	@Override
	public List<CateVO> cateList() throws Exception {

		return adminMapper.cateList();
	}

	@Override
	public List<BookVO> goodsGetList(Criteria cri) throws Exception {
		
		return adminMapper.goodsGetList(cri);
	}

	@Override
	public int goodsGetTotal(Criteria cri) throws Exception {

		return adminMapper.goodsGetTotal(cri);
	}

	@Override
	public BookVO goodsGetDetail(int bookId) throws Exception {

		return adminMapper.goodsGetDetail(bookId);
	}

	@Override
	public int goodsModify(BookVO vo) throws Exception {

		return adminMapper.goodsModify(vo);
	}

	@Override
	public int goodsDelete(int bookId) throws Exception {

		return adminMapper.goodsDelete(bookId);
	}

	@Override
	public void imageEnroll(AttachImageVO vo) throws Exception {
		adminMapper.imageEnroll(vo);
		
	}

}
