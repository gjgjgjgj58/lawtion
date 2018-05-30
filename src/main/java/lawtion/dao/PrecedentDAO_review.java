package lawtion.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import lawtion.vo.PrecedentVO;
import lawtion.vo.PrecedentVO_review;

public interface PrecedentDAO_review {
	/*PreparedStatement pstmt;
	ResultSet rs;

	public void getPreparedStatement(String sql) {
		try {
			pstmt = DBConn.getConnection().prepareStatement(sql);
		} catch(Exception e){e.printStackTrace();}
	}*/
	
	public ArrayList<PrecedentVO_review> getSearchList(String search, int startCount, int endCount); /* {
		ArrayList<PrecedentVO_review> list = new ArrayList<PrecedentVO_review>();
		
		try {
			String sql = "select rno, no, title, content, result, lname, hits "
					+ " from (select rownum as rno, no, title, content, result, lname, hits"
					+ " from (select * from precedent_review where title like ? or content like ? or lname like ?))"
					+ " where rno between ? and ?";
			getPreparedStatement(sql);
			pstmt.setString(1, search+"%");
			pstmt.setString(2, search+"%");
			pstmt.setString(3, search+"%");
			pstmt.setInt(4, startCount);
			pstmt.setInt(5, endCount);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				PrecedentVO_review vo = new PrecedentVO_review();
				vo.setRno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setResult(rs.getString(5));
				vo.setLname(rs.getString(6));
				vo.setHits(rs.getInt(7));
				
				list.add(vo);
			}
		} catch(Exception e){e.printStackTrace();}
		
		return list;
	}*/
	
	public ArrayList<PrecedentVO_review> getResultList(); /* {
		ArrayList<PrecedentVO_review> list = new ArrayList<PrecedentVO_review>();
		try {
			String sql = "select rownum as rno, no, title, result, lname, hits from precedent_review";
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				PrecedentVO_review vo = new PrecedentVO_review();
				vo.setRno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setResult(rs.getString(4));
				vo.setLname(rs.getString(5));
				vo.setHits(rs.getInt(6));
				
				list.add(vo);
			}
		} catch(Exception e) {e.printStackTrace();}
		
		return list;
	}*/
	
	public ArrayList<PrecedentVO_review> getTreeResult(String result); /*{
		ArrayList<PrecedentVO_review> list = new ArrayList<PrecedentVO_review>();
		String str = "";
		if(result.equals("1")){
			str = "승소";
		} else {
			str = "패소";
		}
		try {
			String sql = "select rownum as rno, no, title, result, lname, hits from precedent_review where result=?";
			getPreparedStatement(sql);
			pstmt.setString(1, str);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				PrecedentVO_review vo = new PrecedentVO_review();
				vo.setRno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setResult(rs.getString(4));
				vo.setLname(rs.getString(5));
				vo.setHits(rs.getInt(6));
				
				list.add(vo);
			}
		} catch(Exception e){e.printStackTrace();}
		
		return list;
	}*/
	
	public ArrayList<PrecedentVO_review> getTreeScale(String scale); /*{
		ArrayList<PrecedentVO_review> list = new ArrayList<PrecedentVO_review>();
		String str = "";
		if(scale.equals("1")){
			str = "대법원";
		} else if(scale.equals("2")) {
			str = "고등법원";
		} else {
			str = "하급심";
		}
		
		try {
			String sql = "select rownum as rno, no, title, result, lname, hits from precedent_review where scale=?";
			getPreparedStatement(sql);
			pstmt.setString(1, str);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				PrecedentVO_review vo = new PrecedentVO_review();
				vo.setRno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setResult(rs.getString(4));
				vo.setLname(rs.getString(5));
				vo.setHits(rs.getInt(6));
				
				list.add(vo);
			}
		} catch(Exception e){e.printStackTrace();}
		
		return list;
	}*/
	
	public ArrayList<PrecedentVO_review> getTreeCate(String category); /*{
		ArrayList<PrecedentVO_review> list = new ArrayList<PrecedentVO_review>();
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
			String sql = "select rownum as rno, no, title, result, lname, hits from precedent_review where category=?";
			getPreparedStatement(sql);
			pstmt.setString(1, str);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				PrecedentVO_review vo = new PrecedentVO_review();
				vo.setRno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setResult(rs.getString(4));
				vo.setLname(rs.getString(5));
				vo.setHits(rs.getInt(6));
				
				list.add(vo);
			}
		} catch(Exception e){e.printStackTrace();}
		
		return list;
	}*/
	
	public PrecedentVO_review getResultVO(String no); /* {
		PrecedentVO_review vo = new PrecedentVO_review();
		
		try {
			String sql = "select title,content from precedent_review where no=?";
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
			String sql = "update precedent_review set hits = hits+1 where no=?";
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
			String sql = "select count(*) from precedent_review";
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
			String sql = "select count(*) from precedent_review where title like ? or content like ? or lname like ?";
			getPreparedStatement(sql);
			pstmt.setString(1, search+"%");
			pstmt.setString(2, search+"%");
			pstmt.setString(3, search+"%");
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}
		} catch(Exception e) {e.printStackTrace();}
		
		return result;
	}*/
	
	public ArrayList<PrecedentVO_review> getResultList(int startCount, int endCount); /*{
		
		ArrayList<PrecedentVO_review> list = new ArrayList<PrecedentVO_review>();
		try{

			String sql = " select rno, no, title, content, result, lname, hits "
						+ " from (select rownum as rno, no, title, content, result, lname, hits "
						+ " from (select * from precedent_review))"
						+ " where rno between ? and ?";
			
			getPreparedStatement(sql);
			pstmt.setInt(1, startCount);
			pstmt.setInt(2, endCount);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				PrecedentVO_review vo = new PrecedentVO_review();
				vo.setRno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setResult(rs.getString(5));
				vo.setLname(rs.getString(6));
				vo.setHits(rs.getInt(7));
				list.add(vo);
			}
			
		}catch(Exception e){ e.printStackTrace();}
		return list;
	}
	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(DBConn.getConnection() != null) DBConn.getConnection().close();
		} catch(Exception e) {e.printStackTrace();}
	}*/
}
