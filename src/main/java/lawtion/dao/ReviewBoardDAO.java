package lawtion.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import lawtion.vo.ReviewBoardVO;
import lawtion.vo.ReviewReplyVO;
import lawtion.vo.TalkBoardVO;

public interface ReviewBoardDAO {
	/*
	PreparedStatement pstmt;
	ResultSet rs;
	
	//Constructor
	public ReviewBoardDAO(){
		
	}
	
	//Method
	public void getPreparedStatement (String sql){
		try{
			
			pstmt = DBConn.getConnection().prepareStatement(sql);
			
		}catch(Exception e){ e.printStackTrace();}
	}
	*/
	public int getReviewInsertResult(ReviewBoardVO vo);/*{
		int result = 0;
		try{

			String sql="insert into lawtion_review_board values(sequ_lawtion_review_board.nextval,?,?,sysdate,0,?,?,?,?)";
			System.out.println(sql);
			getPreparedStatement(sql);
			
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getCategory());
			pstmt.setString(3, vo.getLawyer());
			pstmt.setString(4, vo.getLawsuit());
			pstmt.setString(5, vo.getContent());
			pstmt.setString(6, vo.getFname());


			
			result = pstmt.executeUpdate();
			
		}catch(Exception e){e.printStackTrace();}
		return result;
	}*/
	
	public ArrayList<ReviewBoardVO> getAllResultList(int startCount, int endCount);/*{
		ArrayList<ReviewBoardVO> alllist = new ArrayList<ReviewBoardVO>();
			
		try{
			String sql = "select rownum as rno, no, title, rdate, hits"
					+ " from (select rownum as rno, no, title, to_char(rdate,'yyyy-mm-dd') as rdate, hits"
					+ " from (select * from lawtion_review_board order by rdate desc)) "
					+ " WHERE RNO BETWEEN ? AND ?";
			getPreparedStatement(sql);
			pstmt.setInt(1, startCount);
			pstmt.setInt(2, endCount);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ReviewBoardVO vo = new ReviewBoardVO();
				vo.setRno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setRdate(rs.getString(4));
				vo.setHits(rs.getInt(5));
				alllist.add(vo);
			}	
		}catch(Exception e){e.printStackTrace();}
		
		return alllist;
	}*/
	
	/* best5 ? „ì²? ë¦¬ìŠ¤?Š¸ ì¶œë ¥ ==> ? „ì²´ê? ë¶™ìœ¼ë©? Array ?˜¸ì¶? */
	public ArrayList<ReviewBoardVO> getAllBestResultList();/*{
		ArrayList<ReviewBoardVO> allbestlist = new ArrayList<ReviewBoardVO>();
			
		try{
			String sql = "select rownum as rno, no, title, to_char(rdate,'yyyy-mm-dd'), hits"
					+ " from (select * from lawtion_review_board order by hits desc) where rownum<=5";
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ReviewBoardVO vo = new ReviewBoardVO();
				vo.setRno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setRdate(rs.getString(4));
				vo.setHits(rs.getInt(5));
				allbestlist.add(vo);
			}	
		}catch(Exception e){e.printStackTrace();}
		
		return allbestlist;
	}*/
	
	//?—­ê²½ë§¤ ? „ì²? ë¦¬ìŠ¤?Š¸ ì¶œë ¥ 
	public ArrayList<ReviewBoardVO> getActionResultList(int startCount, int endCount);/*{
		ArrayList<ReviewBoardVO> actionlist = new ArrayList<ReviewBoardVO>();
			
		try{
			String sql = "select rownum as rno, no, title, rdate, hits"
					+ " from (select rownum as rno, no, title, to_char(rdate, 'yyyy-mm-dd')as rdate, hits "
					+ " from(select * from lawtion_review_board where category='¿ª°æ¸Å ÈÄ±â') order by rdate desc) "
					+ " WHERE RNO BETWEEN ? AND ?";
			getPreparedStatement(sql);
			pstmt.setInt(1, startCount);
			pstmt.setInt(2, endCount);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ReviewBoardVO vo = new ReviewBoardVO();
				vo.setRno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setRdate(rs.getString(4));
				vo.setHits(rs.getInt(5));
				actionlist.add(vo);
			}	
		}catch(Exception e){e.printStackTrace();}
		
		return actionlist;
	}*/
	
	/* best5?—­ê²½ë§¤ ë¦¬ìŠ¤?Š¸ ì¶œë ¥ ==> ? „ì²´ê? ë¶™ìœ¼ë©? Array ?˜¸ì¶? */
	public ArrayList<ReviewBoardVO> getActionBestResultList();/*{
		ArrayList<ReviewBoardVO> actionbestlist = new ArrayList<ReviewBoardVO>();
			
		try{
			String sql = "select rownum as rno, no, title, to_char(rdate,'yyyy-mm-dd'), hits"
					+ " from (select * from(select * from lawtion_review_board where category='¿ª°æ¸Å ÈÄ±â') order by hits desc) where rownum<=5";
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ReviewBoardVO vo = new ReviewBoardVO();
				vo.setRno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setRdate(rs.getString(4));
				vo.setHits(rs.getInt(5));
				actionbestlist.add(vo);
			}	
		}catch(Exception e){e.printStackTrace();}
		
		return actionbestlist;
	}*/
	
	//Lawtion ? „ì²? ë¦¬ìŠ¤?Š¸ ì¶œë ¥ 
		public ArrayList<ReviewBoardVO> getLawtionResultList(int startCount, int endCount);/*{
			ArrayList<ReviewBoardVO> lawtionlist = new ArrayList<ReviewBoardVO>();
				
			try{
				String sql = "select rownum as rno, no, title, rdate, hits"
						+ " from (select rownum as rno, no, title, to_char(rdate, 'yyyy-mm-dd')as rdate, hits "
						+ " from(select * from lawtion_review_board where category='Lawtion ÈÄ±â') order by rdate desc) "
						+ " WHERE RNO BETWEEN ? AND ?";
				getPreparedStatement(sql);
				pstmt.setInt(1, startCount);
				pstmt.setInt(2, endCount);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					ReviewBoardVO vo = new ReviewBoardVO();
					vo.setRno(rs.getInt(1));
					vo.setNo(rs.getInt(2));
					vo.setTitle(rs.getString(3));
					vo.setRdate(rs.getString(4));
					vo.setHits(rs.getInt(5));
					lawtionlist.add(vo);
				}	
			}catch(Exception e){e.printStackTrace();}
			
			return lawtionlist;
		}*/
		
		/* best5Lawtion ë¦¬ìŠ¤?Š¸ ì¶œë ¥ ==> ? „ì²´ê? ë¶™ìœ¼ë©? Array ?˜¸ì¶? */
		public ArrayList<ReviewBoardVO> getLawtionBestResultList();/*{
			ArrayList<ReviewBoardVO> lawtionbestlist = new ArrayList<ReviewBoardVO>();
				
			try{
				String sql = "select rownum as rno, no, title, to_char(rdate,'yyyy-mm-dd'), hits"
						+ " from (select * from(select * from lawtion_review_board where category='Lawtion ÈÄ±â') order by hits desc) where rownum<=5";
				getPreparedStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					ReviewBoardVO vo = new ReviewBoardVO();
					vo.setRno(rs.getInt(1));
					vo.setNo(rs.getInt(2));
					vo.setTitle(rs.getString(3));
					vo.setRdate(rs.getString(4));
					vo.setHits(rs.getInt(5));
					lawtionbestlist.add(vo);
				}	
			}catch(Exception e){e.printStackTrace();}
			
			return lawtionbestlist;
		}	*/
		
	
	/* ?•œê°œì˜ row ê°?? ¸?˜¤ê¸? */
	public ReviewBoardVO getResultVO(String no);/*{
		ReviewBoardVO vo = new ReviewBoardVO();
		
		try{
			
			String sql = "SELECT NO,TITLE, CONTENT, FNAME, CATEGORY, LAWYER, LAWSUIT,TO_CHAR(RDATE,'YYYY-MM-DD'),HITS FROM LAWTION_REVIEW_BOARD WHERE NO=?";
			getPreparedStatement(sql);
			
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()){
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setContent(rs.getString(3));
				vo.setFname(rs.getString(4));
				vo.setCategory(rs.getString(5));
				vo.setLawyer(rs.getString(6));
				vo.setLawsuit(rs.getString(7));
				vo.setRdate(rs.getString(8));
				vo.setHits(rs.getInt(9));
				
			}
			
		} catch(Exception e){e.printStackTrace();}
		
		return vo;
		
	}*/
	
	/* ì¡°íšŒ?ˆ˜ ?—…?°?´?Š¸ */
	public void getUpdateHits(String no);/*{
		try{
			
			String sql = "UPDATE LAWTION_REVIEW_BOARD SET HITS = HITS+1 WHERE NO=?";
			getPreparedStatement(sql);
			pstmt.setString(1, no);
			pstmt.executeUpdate();
			
		} catch(Exception e){e.printStackTrace();}
	}*/
	
	/* ê¸? ?ˆ˜? •?•˜ê¸? */
	public int getUpdateResult(ReviewBoardVO vo);/*{
		int result = 0;
		try{
			
			String sql = "UPDATE LAWTION_REVIEW_BOARD SET TITLE=?,CATEGORY=?,LAWYER=?,LAWSUIT=?,CONTENT=?,FNAME=? WHERE NO=?";
			getPreparedStatement(sql);
			
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getCategory());
			pstmt.setString(3, vo.getLawyer());
			pstmt.setString(4, vo.getLawsuit());
			pstmt.setString(5, vo.getContent());
			pstmt.setString(6, vo.getFname());
			pstmt.setInt(7, vo.getNo());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e){e.printStackTrace();}
		
		return result;
	}*/
	
	
	/* ê¸? ?‚­? œ?•˜ê¸?  */
	public int getDeleteResult(String no);/*{
		int result = 0;
		try{
			String sql = "DELETE FROM LAWTION_REVIEW_BOARD WHERE NO=?";
			getPreparedStatement(sql);
			pstmt.setString(1, no);
			result=pstmt.executeUpdate();
	      }catch(Exception e){e.printStackTrace();}
	      return result;
	   }*/
	
	public int execTotalCount();/*{
		int result=0;
		try{
			
			String sql = "SELECT COUNT(*) FROM LAWTION_REVIEW_BOARD";
			getPreparedStatement(sql);
			
			rs= pstmt.executeQuery();
			if(rs.next()){
				result=rs.getInt(1);
			}
			
		}catch(Exception e){e.printStackTrace();}
	
		return result;
	}*/
	
	
	
	
	/*closed*/
	public void closed();/*{
		try{
			if(DBConn.getConnection()!=null) DBConn.getConnection().close();
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
			
		}catch(Exception e){e.printStackTrace();}
	}*/
	
	//´ñ±Û insert 
		public int getReveiwReplyInsert(@Param("replyer") String replyer,@Param ("content")String content, @Param("no")String no);/*{
			int result = 0;
			
			try{
				String sql = "insert into LAWTION_REVIEW_REPLY "
						+ " values(SEQU_LAWTION_REVIEW_REPLY.nextval,?,?,sysdate,?)";
				getPreparedStatement(sql);
				pstmt.setString(1, replyer);
				pstmt.setString(2, content);
				pstmt.setString(3, no);
				
				result = pstmt.executeUpdate();	
				
			}catch(Exception e){e.printStackTrace();}
			
			return result;
		}*/
		
		//´ñ±Û delete 
				public int getReviewReplyDelete(@Param("rid") String rid);
		
		//´ñ±Û Ãâ·Â
		public ArrayList<ReviewReplyVO> getReplyList(String no);/*{
			ArrayList<ReviewReplyVO> list = new ArrayList<ReviewReplyVO>();
			
			try{
				String sql = "select rid,replyer,content, TO_CHAR(RDATE,'YYYY-MM-DD') as RDATE,reviewid from lawtion_review_reply "
							+ " where reviewid=?";
				getPreparedStatement(sql);
				pstmt.setString(1, no);
				rs = pstmt.executeQuery();
				while(rs.next()){
					ReviewReplyVO vo = new ReviewReplyVO();
					vo.setRid(rs.getInt(1));
					vo.setReplyer(rs.getString(2));
					vo.setContent(rs.getString(3));
					vo.setRdate(rs.getString(4));
					vo.setReviewid(rs.getInt(5));
					list.add(vo);
				}			
				
			}catch(Exception e){e.printStackTrace();}
			
			return list;
		}*/
	/*°øÁö»çÇ× ¼öÁ¤ - title, content¸¸ ¼öÁ¤*/
	public int getUpdateResultNoFile(ReviewBoardVO vo);
	
	public String getRfnameResult(String no);
	
	public ReviewBoardVO getNextPage(String no);
	
	public ReviewBoardVO getPrePage(String no);
	
	public ArrayList<ReviewBoardVO> getIndexReviewList();
}