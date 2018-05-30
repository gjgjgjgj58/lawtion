package lawtion.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



import org.apache.ibatis.annotations.Param;

import lawtion.vo.SearchVO;

public interface SearchDAO {
	/*
	PreparedStatement pstmt;
	ResultSet rs;
	
	public MemberDAO(){
			
		}
	
	public void getPreparedStatement (String sql){
		try{
			
			pstmt = DBConn.getConnection().prepareStatement(sql);
			
		}catch(Exception e){ e.printStackTrace();}
	}
	
	*/
	public ArrayList<SearchVO> getResultAllList(int startCount, int endCount);
	
	public ArrayList<SearchVO> getResultList(String keyword,int startCount, int endCount);/*{ //검색하기
        ArrayList<MemberVO> list = new ArrayList<MemberVO> ();
	        try{
	            String sql = "select rownum as rno, no, name, dname, part, address"
	            		+ " from (select * from(select * from lawtion_introduce where name=? or dname=?)"
	            		+ " order by name desc) where rno between ? and ?";
	             System.out.println( sql );
	          	  getPreparedStatement(sql);
	          	  pstmt.setString(1, name);
	          	  pstmt.setString(2, dname);
	              rs=pstmt.executeQuery();
	              
	              while( rs.next()){
	            	MemberVO vo = new MemberVO();
	                vo.setRno(rs.getInt(1));
	                vo.setNo(rs.getInt(2));
	                vo.setName(rs.getString(3));
	                vo.setDname(rs.getString(4));
	                vo.setPart(rs.getString(5));
	                vo.setAddress(rs.getString(6));
	              }
	            }catch( Exception e){ e.printStackTrace();}
            return list;
	}*/
	
	public String getLawyerList(String no);
	
	public int execTotalCount();/*{
		int result=0;
		try{
			
			String sql = "SELECT COUNT(*) FROM LAWTION_INTRODUCE";
			getPreparedStatement(sql);
			
			rs= pstmt.executeQuery();
			if(rs.next()){
				result=rs.getInt(1);
			}
			
		}catch(Exception e){e.printStackTrace();}
	
		return result;
	}*/
	
	public void closed();/*{
		try{
			if(DBConn.getConnection()!=null) DBConn.getConnection().close();
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
			
		}catch(Exception e){e.printStackTrace();}
	}*/
}
