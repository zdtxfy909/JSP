package com.mystudy.ajax.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.ajax.vo.MemberVO;
import com.mystudy.mybatis.DBService;

public class MemberDAO {
	//작업할 때 필요한 기능 추가
	
	//전체데이터 조회
	public static List<MemberVO> getList() {
		List<MemberVO> list = null;
		SqlSession ss = null;
		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("members.all"); //namespace.id
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return list;
	} 
	
	//
	public static List<MemberVO> getListNameLike(String name){
		List<MemberVO> list = null;
		
		try (SqlSession ss = DBService.getFactory().openSession()) {
			list = ss.selectList("members.searchName", name);
			
		} catch (Exception e) {

		} 
		
		
		return list;
	}
	
}
