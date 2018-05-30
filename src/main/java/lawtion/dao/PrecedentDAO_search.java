package lawtion.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import lawtion.vo.PrecedentVO_search;

public interface PrecedentDAO_search {
	/*PreparedStatement pstmt;
	ResultSet rs;

	public void getPreparedStatement(String sql) {
		try {
			pstmt = DBConn.getConnection().prepareStatement(sql);
		} catch(Exception e){e.printStackTrace();}
	}*/
	
	public String getKeyword(String sno); /* {
		String keywords="";
		
		try{
			String sql = "select keyword from precedent_search where sno = ?";
			getPreparedStatement(sql);
			pstmt.setString(1, sno);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				keywords = rs.getString(1);
			
			}
		} catch(Exception e) {e.printStackTrace();}
		System.out.println("keywords="+keywords);
		return keywords;
	}*/
	
	public int getInsertResult(String search); /* {
		int result = 0;
		try {
			String sql = "insert into precedent_search values(sequ_precedent_search.nextval,?,sysdate)";
			getPreparedStatement(sql);
			pstmt.setString(1, search);
			result = pstmt.executeUpdate();
		} catch(Exception e) {e.printStackTrace();}
		
		return result;
	}*/
	
	public int sTotalCount();/*{
		int result =0;
		try{
			String sql = "select count(*) from precedent_search";
			getPreparedStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);
			}
		}catch(Exception e){e.printStackTrace();}
		
		return result;
	}*/
	
	public ArrayList<PrecedentVO_search> getResultList(); /* {
		ArrayList<PrecedentVO_search> list = new ArrayList<PrecedentVO_search>();
		try {
			String sql = "select sno,keyword from (select * from precedent_search order by sdate)";
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				PrecedentVO_search vo = new PrecedentVO_search();
				vo.setSno(rs.getInt(1));
				vo.setKeyword(rs.getString(2));
				
				list.add(vo);
			}
		} catch(Exception e) {e.printStackTrace();}
		
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
