package lawtion.dao;

import java.util.ArrayList;

import lawtion.vo.TalkBoardVO;
import lawtion.vo.TalkReplyVO;

import org.apache.ibatis.annotations.Param;

public interface TalkBoardDAO {
	/*
	PreparedStatement pstmt;
	ResultSet rs;
	
	public TalkBoardDAO(){
		
	}
	
	public void getPreparedStatement(String sql){
		try{
			
			pstmt = DBConn.getConnection().prepareStatement(sql);
			
		}catch(Exception e){e.printStackTrace();}
	}
	*/
	
	public int getTalkInsertResult(TalkBoardVO vo);/*{
		int result = 0;
		
		try{
			
			String sql = "INSERT INTO LAWTION_TALK_BOARD VALUES(SEQU_LAWTION_TALK_BOARD.NEXTVAL,?,SYSDATE,0,?,?)";
			getPreparedStatement(sql);
			
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getFname());
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e){e.printStackTrace();}
		return result;
	}*/
	
	/*하소연 전체 리스트 출력*/
	public ArrayList<TalkBoardVO> getAllResultList(int startCount, int endCount);/*{
		ArrayList<TalkBoardVO> alllist = new ArrayList<TalkBoardVO>();
			
		try{
			String sql = "select rownum as rno, no, title, tdate, hits"
					+ " from (select rownum as rno, no, title, to_char(tdate,'yyyy-mm-dd') as tdate, hits"
					+ " from (select * from lawtion_talk_board order by tdate desc))"
					+ " where rownum between ? and ?";
			getPreparedStatement(sql);
			pstmt.setInt(1, startCount);
			pstmt.setInt(2, endCount);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				TalkBoardVO vo = new TalkBoardVO();
				vo.setRno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setTdate(rs.getString(4));
				vo.setHits(rs.getInt(5));
				alllist.add(vo);
			}	
		}catch(Exception e){e.printStackTrace();}
		
		return alllist;
	}*/
	
	/*하소연 Best5 리스트 출력*/
	public ArrayList<TalkBoardVO> getAllBestResultList();/*{
		ArrayList<TalkBoardVO> allbestlist = new ArrayList<TalkBoardVO>();
			
		try{
			String sql = "select rownum as rno, no, title, to_char(tdate,'yyyy-mm-dd'), hits"
					+ " from (select * from lawtion_talk_board order by hits desc) where rownum<=5";
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				TalkBoardVO vo = new TalkBoardVO();
				vo.setRno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setTdate(rs.getString(4));
				vo.setHits(rs.getInt(5));
				allbestlist.add(vo);
			}	
		}catch(Exception e){e.printStackTrace();}
		
		return allbestlist;
	}*/
	
	/* 하나의 row불러오기 */
	public TalkBoardVO getResultVO(String no);/*{
		TalkBoardVO vo = new TalkBoardVO();
		
		try{
			
			String sql = "SELECT NO,TITLE, CONTENT, FNAME, TO_CHAR(TDATE,'YYYY-MM-DD'),HITS FROM LAWTION_TALK_BOARD WHERE NO=?";
			getPreparedStatement(sql);
			
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()){
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setContent(rs.getString(3));	
				vo.setFname(rs.getString(4));
				vo.setTdate(rs.getString(5));
				vo.setHits(rs.getInt(6));
				
			}
			
		} catch(Exception e){e.printStackTrace();}
		
		return vo;
		
	}*/
	
	/* 하소연 조회수 업데이트  */
	public void getUpdateHits(String no);/*{
		try{
			
			String sql = "UPDATE LAWTION_TALK_BOARD SET HITS = HITS+1 WHERE NO=?";
			getPreparedStatement(sql);
			pstmt.setString(1, no);
			pstmt.executeUpdate();
			
		} catch(Exception e){e.printStackTrace();}
	}*/
	
	/* 하소연 글 수정하기 */
	public int getUpdateResult(TalkBoardVO vo);/*{
		int result = 0;
		try{
			
			String sql = "UPDATE LAWTION_TALK_BOARD SET TITLE=?,CONTENT=?,FNAME=? WHERE NO=?";
			getPreparedStatement(sql);
			
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getFname());
			pstmt.setInt(4, vo.getNo());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e){e.printStackTrace();}
		
		return result;
	}*/
	
	/* 하소연 글 삭제하기 */
	public int getDeleteResult(String no);/*{
		int result = 0;
		try{
			String sql = "DELETE FROM LAWTION_TALK_BOARD WHERE NO=?";
			getPreparedStatement(sql);
			pstmt.setString(1, no);
			result=pstmt.executeUpdate();
	      }catch(Exception e){e.printStackTrace();}
	      return result;
	   }*/
	
	public int execTotalCount();/*{
		int result=0;
		try{
			
			String sql = "SELECT COUNT(*) FROM LAWTION_TALK_BOARD";
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
	
	//댓글 insert 
		public int getTalkReplyInsert(@Param("replyer") String replyer,@Param ("content")String content, @Param("no")String no);/*{
			int result = 0;
			
			try{
				String sql = "
				getPreparedStatement(sql);
				pstmt.setString(1, replyer);
				pstmt.setString(2, content);
				pstmt.setString(3, no);
				
				result = pstmt.executeUpdate();	
				
			}catch(Exception e){e.printStackTrace();}
			
			return result;
		}*/
		
		//댓글 출력
		public ArrayList<TalkReplyVO> getReplyList(String no);/*{
			ArrayList<TalkReplyVO> list = new ArrayList<TalkReplyVO>();
			
			try{
				String sql = "select rid,replyer,content, TO_CHAR(RDATE,'YYYY-MM-DD') as RDATE,tid from lawtion_talk_reply "
							+ " where tid=?";
				getPreparedStatement(sql);
				pstmt.setString(1, no);
				rs = pstmt.executeQuery();
				while(rs.next()){
					TalkReplyVO vo = new TalkReplyVO();
					vo.setRid(rs.getInt(1));
					vo.setReplyer(rs.getString(2));
					vo.setContent(rs.getString(3));
					vo.setRdate(rs.getString(4));
					vo.setTid(rs.getInt(5));
					list.add(vo);
				}			
				
			}catch(Exception e){e.printStackTrace();}
			
			return list;
		}*/
		
		//댓글 delete 
		public int getTalkReplyDelete(@Param("rid") String rid);
		
		/*이전글 출력*/
		public TalkBoardVO getPrePage(String no);/*{
			TalkBoardVO vo = new TalkBoardVO();
			
			try{
				
				String sql = "SELECT * FROM (SELECT NO,TITLE,TDATE ,HITS,CONTENT,FNAME"
						+ " ,LAG(NO,1,0) OVER (ORDER BY NO) AS PRE_SEQ"
						+ " ,LAG(TITLE,1,'이전글없음') OVER (ORDER BY NO) AS PRE_TITLE"
						+ " ,LAG(TO_CHAR(TDATE,'YYYY-MM-DD')) OVER (ORDER BY NO) AS PRE_TDATE"
						+ " ,LAG(HITS,1,0) OVER (ORDER BY NO) AS PRE_HITS"
						+ " ,LAG(CONTENT,1,'이전글없음') OVER (ORDER BY NO) AS PRE_CONTENT"
						+ " ,LAG(FNAME,1,'이전글없음') OVER (ORDER BY NO) AS PRE_FNAME"
						+ " FROM LAWTION_TALK_BOARD)"
						+ " WHERE NO = ?";				
				getPreparedStatement(sql);
				pstmt.setString(1, no);
				rs = pstmt.executeQuery();
				if(rs.next()){
					vo.setNo(rs.getInt(7));
					vo.setTitle(rs.getString(8));
					vo.setTdate(rs.getString(9));
					vo.setHits(rs.getInt(10));
					vo.setContent(rs.getString(11));	
					vo.setFname(rs.getString(12));
				}
				
			} catch(Exception e){e.printStackTrace();}
			
			return vo;
			
		}*/
		
		/*다음글출력*/
		
		public TalkBoardVO getNextPage(String no);/*{
			TalkBoardVO vo = new TalkBoardVO();
			
			try{
				
				String sql = "SELECT * FROM (SELECT NO,TITLE,TDATE ,HITS,CONTENT,FNAME"
						+ " ,LEAD(NO,1,0) OVER (ORDER BY NO) AS NEXT_SEQ"
						+ " ,LEAD(TITLE,1,'이후글없음') OVER (ORDER BY NO) AS NEXT_TITLE"
						+ ",LAG(TO_CHAR(TDATE,'YYYY-MM-DD')) OVER (ORDER BY NO) AS NEXT_TDATE"
						+ " ,LEAD(HITS,1,0) OVER (ORDER BY NO) AS NEXT_HITS"
						+ " ,LEAD(CONTENT,1,'이후글없음') OVER (ORDER BY NO) AS NEXT_CONTENT"
						+ " ,LEAD(FNAME,1,'이후글없음') OVER (ORDER BY NO) AS NEXT_FNAME"
						+ " FROM LAWTION_TALK_BOARD)"
						+ " WHERE NO = ?";				
				getPreparedStatement(sql);
				pstmt.setString(1, no);
				rs = pstmt.executeQuery();
				if(rs.next()){
					vo.setNo(rs.getInt(7));
					vo.setTitle(rs.getString(8));
					vo.setTdate(rs.getString(9));
					vo.setHits(rs.getInt(10));
					vo.setContent(rs.getString(11));	
					vo.setFname(rs.getString(12));
				}
				
			} catch(Exception e){e.printStackTrace();}
			
			return vo;
			
		}*/
		
		/*public int getReplyDeleteResult(String no, String replyer, String content,String rid);{
			int result = 0;
			try{
				String sql = "DELETE FROM (SELECT * FROM LAWTION_TALK_REPLY WHERE TID=?) WHERE REPLYER=? AND CONTENT=?";
				getPreparedStatement(sql);
				pstmt.setString(1, no);
				pstmt.setString(2, replyer);
				pstmt.setString(3, content);
				result=pstmt.executeUpdate();
		      }catch(Exception e){e.printStackTrace();}
		      return result;
		   }*/
		
		public String getRfnameResult(String no);
		
		/*공지사항 수정 - title, content만 수정*/
		public int getUpdateResultNoFile(TalkBoardVO vo);
		
}
