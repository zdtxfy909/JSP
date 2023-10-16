package com.mystudy.bbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.bbs.mybatis.DBService;
import com.mystudy.bbs.vo.BbsVO;
import com.mystudy.bbs.vo.CommentVO;

public class BbsDAO {
	
	//게시글(BBS) 전체 건수 조회
	public static int getTotalCount() {
		int totalCount = 0;
		
		SqlSession ss = DBService.getFactory().openSession();
		try {
			totalCount = ss.selectOne("BBS.totalCount"); //namespace.id
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return totalCount;
	}
	
	//페이지에 해당하는 글목록(게시글) 가져오기(조회)
	public static List<BbsVO> getList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		List<BbsVO> list = null;
		SqlSession ss = DBService.getFactory().openSession();
		try {
			list = ss.selectList("BBS.list", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return list;
	}
	
	//게시글 조회
	public static BbsVO selectOne(int bbsIdx) {
		SqlSession ss = DBService.getFactory().openSession();
		BbsVO vo = ss.selectOne("BBS.one", bbsIdx);
		ss.close();
		return vo;
	}
	
	//게시글 입력처리
	public static int insert(BbsVO bvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("BBS.insert", bvo);
		ss.close();
		return result;
	}
	
	//========== 댓글 ============
	//게시글에 딸린 댓글 목록
	public static List<CommentVO> getCommList(int bbsIdx) {
		List<CommentVO> list = null;
		SqlSession ss = DBService.getFactory().openSession();
		try {
			list = ss.selectList("BBS.commList", bbsIdx);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return list;
	}
	
	
}
