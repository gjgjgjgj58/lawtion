package lawtion.dao;

import java.util.ArrayList;

//import lawtion.deadline.AuctionBoardDeadLine;
import lawtion.vo.AuctionBoardVO;
import lawtion.vo.AuctionCommentVO;

public interface AuctionBoardDAO {
	/*PreparedStatement pstmt;
	ResultSet rs;
	
	public AuctionBoardDAO(){
		
	}
	
	public void getPreparedStatement(String sql){
		try{
			pstmt=DBConn.getConnection().prepareStatement(sql);
		}catch(Exception e){
			e.printStackTrace();
		}
	}*/
	
	public int execTotalCount();
	public int execTotalCommentCount(String no);
	public int execTotalBiddingCount(String no);
	public int execTotalSearchCount(String input, String category, String area);
	public ArrayList<AuctionBoardVO> getResultSearchList(int startCount, int endCount, String input, String category, String area);
	
	/*insert*/
	public int getInsertResult(AuctionBoardVO vo);
	/*{
		int result=0;
		try{
			String sql="insert into lawtion_auction_board values(sequ_lawtion_auction_board.nextval,?,?,?,sysdate,0,?,?,?,?)";
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getFname());
			pstmt.setString(4, vo.getCategory());
			pstmt.setString(5, vo.getEdate());
			pstmt.setString(6, vo.getArea());
			pstmt.setString(7, vo.getAgree());
			
			result=pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}*/
	
	/* 전체 리스트 출력 */
	public ArrayList<AuctionBoardVO> getResultList(int startCount, int endCount);
	/*{
		ArrayList<AuctionBoardVO> list = new ArrayList<AuctionBoardVO>();
		
		try{
			String sql="select * from (select rownum as rno, no, title, to_char(adate, 'yyyy-mm-dd hh24:mi'), hits, edate, category, area "
					+ " from (select * from lawtion_auction_board order by adate desc)) where sysdate<edate";
			getPreparedStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				AuctionBoardVO vo = new AuctionBoardVO();
				//AuctionBoardDeadLine adl = new AuctionBoardDeadLine();
				vo.setRno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setAdate(rs.getString(4));
				vo.setHits(rs.getInt(5));
				vo.setEdate(rs.getString(6));
				vo.setCategory(rs.getString(7));
				vo.setArea(rs.getString(8));
				
				Calendar cal1 = Calendar.getInstance();
				cal1.setTime(new Date());
				SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
				String today = date.format(cal1.getTime());
				
				Date begin = date.parse(today);
				Date end = date.parse(vo.getEdate());
				
				long diff = end.getTime() - begin.getTime();
		        long diffDays = diff / (24 * 60 * 60 * 1000);
				
				vo.setE(diffDays);
				list.add(vo);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
		
	}*/
	
	/*한 개의 로우 갖고오기*/
	public AuctionBoardVO getResultVO(String no);
	/*{
		AuctionBoardVO vo = new AuctionBoardVO();
		
		try{
			String sql="select no,title,content,fname,to_char(adate,'yyyy-mm-dd hh24:mi'),hits,edate,area,category" 
					+ " from lawtion_auction_board where no=?";
			getPreparedStatement(sql);
			pstmt.setString(1,no);
			rs = pstmt.executeQuery();
			if(rs.next()){
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setContent(rs.getString(3));
				vo.setFname(rs.getString(4));
				vo.setAdate(rs.getString(5));
				vo.setHits(rs.getInt(6));
				vo.setEdate(rs.getString(7));
				vo.setArea(rs.getString(8));
				vo.setCategory(rs.getString(9));
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return vo;
	}*/
	
	/*조회수 업데이트*/
	public void getUpdateHits(String no);
	/*{
		try{
			String sql = "update lawtion_auction_board set hits = hits+1 where no=?";
			getPreparedStatement(sql);
			pstmt.setString(1,no);	
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();}
	}*/
	
	/*comment insert*/ 
	public int getReplyInsertResult(AuctionCommentVO vo);
	/*{
		int result = 0;
				
		try{
			String sql = "insert into lawtion_auction_comment "
						+ " values(sequ_lawtion_auction_comment.nextval,?,sysdate,?)";
			getPreparedStatement(sql);
			pstmt.setString(1, content);
			pstmt.setString(2, no);
					
			result = pstmt.executeUpdate();	
					
		}catch(Exception e){e.printStackTrace();}
			
		return result;
		
	}*/
			
	/*댓글 출력*/
	public ArrayList<AuctionCommentVO> getReplyList(String no);
	/*{
		ArrayList<AuctionCommentVO> list = new ArrayList<AuctionCommentVO>();
				
		try{
			String sql = "select comment_number,comment_content,comment_date,article_number from lawtion_auction_comment "
						+ " where article_number=? order by comment_number";
			getPreparedStatement(sql);					
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			while(rs.next()){
				AuctionCommentVO vo = new AuctionCommentVO();
						
				vo.setAno(rs.getInt(1));
				vo.setContent(rs.getString(2));
				vo.setCdate(rs.getString(3));
				vo.setCno(rs.getInt(4));
						
				list.add(vo);
			}			
					
		}catch(Exception e){e.printStackTrace();}
				
		return list;
	}*/
	
	/*comment insert*/
	/*public int getInsertResult(AuctionCommentVO vo){
		int result=0;
		try{
			String sql="insert into lawtion_auction_comment values(sequ_lawtion_auction_comment.nextval, ?, sysdate, ?)";
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getContent());
			pstmt.setInt(2, vo.getAno());
		
			result=pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}*/
	
	/*public void closed(){
		try{
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(DBConn.getConnection()!=null) DBConn.getConnection().close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}*/

}
