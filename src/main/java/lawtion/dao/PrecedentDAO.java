package lawtion.dao;

import java.sql.*;
import java.util.ArrayList;
import lawtion.vo.PrecedentVO;




public interface PrecedentDAO {
	/*PreparedStatement pstmt;
	ResultSet rs;

	public void getPreparedStatement(String sql) {
		try {
			pstmt = DBConn.getConnection().prepareStatement(sql);
		} catch(Exception e){e.printStackTrace();}
	}*/
	
	public ArrayList<PrecedentVO> getSearchList(String search, int startCount, int endCount); /*{
		ArrayList<PrecedentVO> list = new ArrayList<PrecedentVO>();
		
		try {
			String sql = "select rno, no, title, content, result, hits "
					+ " from (select rownum as rno, no, title, content, result, hits"
					+ " from (select * from precedent_normal where title like ? or content like ?))"
					+ " where rno between ? and ?";
			getPreparedStatement(sql);
			pstmt.setString(1, search+"%");
			pstmt.setString(2, search+"%");
			pstmt.setInt(3, startCount);
			pstmt.setInt(4, endCount);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				PrecedentVO vo = new PrecedentVO();
				vo.setRno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setResult(rs.getString(5));
				vo.setHits(rs.getInt(6));
				
				list.add(vo);
			}
		} catch(Exception e){e.printStackTrace();}
		return list;
	}*/
	
	public ArrayList<PrecedentVO> getResultList(); /* {
		ArrayList<PrecedentVO> list = new ArrayList<PrecedentVO>();
		try {
			String sql = "select rownum as rno, no, title, result, hits from precedent_normal";
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				PrecedentVO vo = new PrecedentVO();
				vo.setRno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setResult(rs.getString(4));
				vo.setHits(rs.getInt(5));
				
				list.add(vo);
			}
		} catch(Exception e) {e.printStackTrace();}
		
		return list;
	}*/
	
	public ArrayList<PrecedentVO> getTreeResult(String result); /*{
		ArrayList<PrecedentVO> list = new ArrayList<PrecedentVO>();
		String str = "";
		if(result.equals("1")){
			str = "승소";
		} else {
			str = "패소";
		}
		try {
			String sql = "select rownum as rno, no , title, result, hits from precedent_normal where result=?";
			getPreparedStatement(sql);
			pstmt.setString(1, str);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				PrecedentVO vo = new PrecedentVO();
				vo.setRno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setResult(rs.getString(4));
				vo.setHits(rs.getInt(5));
				
				list.add(vo);
			}
		} catch(Exception e){e.printStackTrace();}
		
		return list;
	}*/
	
	public ArrayList<PrecedentVO> getTreeScale(String scale); /*{
		ArrayList<PrecedentVO> list = new ArrayList<PrecedentVO>();
		String str = "";
		if(scale.equals("1")){
			str = "대법원";
		} else if(scale.equals("2")) {
			str = "고등법원";
		} else {
			str = "하급심";
		}
		
		try {
			String sql = "select rownum as rno, no , title, result, hits from precedent_normal where scale=?";
			getPreparedStatement(sql);
			pstmt.setString(1, str);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				PrecedentVO vo = new PrecedentVO();
				vo.setRno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setResult(rs.getString(4));
				vo.setHits(rs.getInt(5));
				
				list.add(vo);
			}
		} catch(Exception e){e.printStackTrace();}
		
		return list;
	}*/
	
	public ArrayList<PrecedentVO> getTreeCate(String category); /*{
		ArrayList<PrecedentVO> list = new ArrayList<PrecedentVO>();
		String str = "";
		if(category.equals("1")){
			str = "민사";
		} else if(category.equals("2")) {
			str = "형사";
		} else if(category.equals("3")) {
			str = "가사";
		} else if(category.equals("4")) {
			str = "특허";
		} else if(category.equals("5")) {
			str = "세무";
		} else {
			str = "일반행정";
		}
		
		try {
			String sql = "select rownum as rno, no , title, result, hits from precedent_normal where category=?";
			getPreparedStatement(sql);
			pstmt.setString(1, str);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				PrecedentVO vo = new PrecedentVO();
				vo.setRno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setResult(rs.getString(4));
				vo.setHits(rs.getInt(5));
				
				list.add(vo);
			}
		} catch(Exception e){e.printStackTrace();}
		
		return list;
	}*/
	
	public PrecedentVO getResultVO(String no); /* {
		PrecedentVO vo = new PrecedentVO();
		
		try {
			String sql = "select title,content from precedent_normal where no=?";
			getPreparedStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()){
				vo.setTitle(rs.getString(1));
				vo.setContent(rs.getString(2));
			}
		} catch(Exception e) {e.printStackTrace();}
		
		return vo;
	}*/
	
	public void getUpdateHits(String no); /* {
		try {
			String sql = "update precedent_normal set hits = hits+1 where no=?";
			getPreparedStatement(sql);
			pstmt.setString(1, no);
			pstmt.executeUpdate();
		} catch(Exception e) {e.printStackTrace();}
	}*/
	
	public void getDeleteResult(); /* {
		try {
			String sql = "delete from precedent_search";
			getPreparedStatement(sql);
			pstmt.executeUpdate();
			
		} catch(Exception e) {e.printStackTrace();}
	}*/
	
	public int execTotalCount(); /*{
		int result =0;
		try{
			String sql = "select count(*) from precedent_normal";
			getPreparedStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);
			}
		}catch(Exception e){e.printStackTrace();}
		
		return result;
	}*/
	
	public int execTotalCount1(String search); /* {
		int result = 0;
		
		try {
			String sql = "select count(*) from precedent_normal where title like ? or content like ?";
			getPreparedStatement(sql);
			pstmt.setString(1, search+"%");
			pstmt.setString(2, search+"%");
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}
		} catch(Exception e) {e.printStackTrace();}
		
		return result;
	}*/
	public ArrayList<PrecedentVO> getResultList(int startCount, int endCount); /*{
		
		ArrayList<PrecedentVO> list = new ArrayList<PrecedentVO>();
		try{

			String sql = " select rno, no, title, content, result, hits "
						+ " from (select rownum as rno, no, title, content, result, hits "
						+ " from (select * from precedent_normal))"
						+ " where rno between ? and ?";
			
			getPreparedStatement(sql);
			pstmt.setInt(1, startCount);
			pstmt.setInt(2, endCount);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				PrecedentVO vo = new PrecedentVO();
				vo.setRno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setResult(rs.getString(5));
				vo.setHits(rs.getInt(6));
				list.add(vo);
			}
			
		}catch(Exception e){ e.printStackTrace();}
		
		return list;
	}*/
	
	/*public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(DBConn.getConnection() != null) DBConn.getConnection().close();
		} catch(Exception e) {e.printStackTrace();}
	}*/
}
