package lawtion.dao;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lawtion.vo.IntroduceVO;

public interface IntroduceDAO {


	
	/*public void getStatement();{
		try{
			stmt=DBConn.getConnection().createStatement();
		}catch(Exception e){e.printStackTrace();}
	}
	
	public void getPreparedStatement(String sql){
		try{
			pstmt=DBConn.getConnection().prepareStatement(sql);
		}catch(Exception e){e.printStackTrace();}
	}*/
	
	
	/*전체 리스트 가져오기*/
	public ArrayList<IntroduceVO> getResultList(int startCount, int endCount);/*{
		ArrayList<IntroduceVO> list = new ArrayList<IntroduceVO>();
		try{
			String sql = "select * from (select rownum as rno,no,name,dname,"
					+ "part from (select no,name,dname,part "
					+ "from lawtion_introduce order by no))"
					+ " where rno between ? and ?";
			//String sql="select rownum as rno,name,dname,part "
			//		+ "from lawtion_introduce";
			getPreparedStatement(sql);
			pstmt.setInt(1,startCount);
			pstmt.setInt(2, endCount);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				IntroduceVO vo = new IntroduceVO();
				vo.setRno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setName(rs.getString(3));
				vo.setDname(rs.getString(4));
				vo.setPart(rs.getString(5));
				
				list.add(vo);
			}
			
		}catch(Exception e){e.printStackTrace();}
		return list;
	}
	
	*/
	
	
	
	
	/*전체 카운트 가져오기*/
	public int execTotalCount();/*{
		int result =0;
		try{
			String sql = "select count(*) from lawtion_introduce";
			getPreparedStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);
			}
		}catch(Exception e){e.printStackTrace();}
		
		return result;
	}*/
	

	/* 변호사별 경력사항 출력 */
	public IntroduceVO getResultVO(String no);/*{
		IntroduceVO vo = new IntroduceVO();
		try{
			String sql = "select l.no,name,dname,part,carrer,trial,win,lose "
					+ "from lawtion_introduce l, introduce_member m"
					+ " where l.no=m.no and l.no=?";
	
			getPreparedStatement(sql);
			pstmt.setString(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()){
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setDname(rs.getString(3));
				vo.setPart(rs.getString(4));
				vo.setCarrer(rs.getString(5));
				vo.setTrial(rs.getInt(6));
				vo.setWin(rs.getInt(7));
				vo.setLose(rs.getInt(8));
				
			}
		}catch(Exception e){e.printStackTrace();}
		return vo;
		
	}
	*/
	

}
