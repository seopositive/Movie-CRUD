package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import vo.GhblListVO;

public class GhblRentDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	// 커넥션 풀을 이용한 데이터베이스 연결
	public void dbConn() {
		try {
			Context initctx = new InitialContext();
			System.out.println("1.Context생성");
			Context envctx = (Context) initctx.lookup("java:comp/env");
			System.out.println("2.환경설정");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			System.out.println("3.DataSource");
			con = ds.getConnection();
			System.out.println("4.DB접속완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 세션을 이용한 로그인 메서드
	public int getMember(String id, String pass) {
		// 결괏값이 0이면 회원없음
		int result = 0;
		dbConn();
		try {
			String sql = "select count(*) from member where id=? and pass1=?";
			pstmt = con.prepareStatement(sql);
			// ??
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			// 결과 리턴
			rs = pstmt.executeQuery();
			
			// 만약 결괏값이 있으면
			if(rs.next()) {
				// 0 또는 1이 저장됨, 위의 rs에 리턴의 첫번째값만 있음. count때문에 0또는1만 옴
				result = rs.getInt(1); 
			}
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;	
	}
	
	
	GhblListVO bean = new GhblListVO();
	public ArrayList<GhblListVO> getAllMovie(){
		GhblListVO bean = null;
		ArrayList<GhblListVO> v = new ArrayList<>();
		
		dbConn();
		
		try {
			String sql = "select * from movierent";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bean = new GhblListVO();
				
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
						
				v.add(bean);
				
			}
			
			rs.close();
			con.close();
			pstmt.close();
		
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
		
		
	}
	
	// 하나의 영화 정보 가져오기
	public GhblListVO getOneMovie(int no) {
		
		GhblListVO bean = new GhblListVO();
		
		dbConn();
		
		try {
			String sql = "select * from movierent where no = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				bean = new GhblListVO();
				
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
			}
			
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return bean;
	}
	
	   // 키워드 검색 메서드
	   public ArrayList<GhblListVO> getSearchMovie(String searchField, String searchText) {
	      ArrayList<GhblListVO> list = new ArrayList<>();
	      // db접속
	      dbConn();
	      try {
	         String sql = "select * from movierent where "+searchField.trim();
	         if(searchText != null && !searchText.equals("")) {
	            sql += " like '%"+searchText.trim()+"%' order by no desc";
	         }
	         pstmt = con.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            GhblListVO bean = new GhblListVO();
	            bean.setNo(rs.getInt(1));
	            bean.setName(rs.getString(2));
	            bean.setCategory(rs.getInt(3));
	            bean.setPrice(rs.getInt(4));
	            bean.setUsepeople(rs.getInt(5));
	            bean.setCompany(rs.getString(6));
	            bean.setImg(rs.getString(7));
	            bean.setInfo(rs.getString(8));
	            // 배열객체에 빈클래스 저장
	            list.add(bean);   
	         }
	         rs.close();
	         pstmt.close();
	         con.close();
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return list;
	   }
	
	
	
}
