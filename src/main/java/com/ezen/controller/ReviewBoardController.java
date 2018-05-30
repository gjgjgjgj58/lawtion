package com.ezen.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletContext;

import lawtion.dao.SearchDAO;
import lawtion.dao.ReviewBoardDAO;
import lawtion.dao.TalkBoardDAO;
import lawtion.vo.SearchVO;
import lawtion.vo.ReviewBoardVO;
import lawtion.vo.ReviewReplyVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewBoardController {
	@Autowired
	ServletContext context;
	
	@Autowired	
	SqlSessionTemplate sqlSession;
	
	@RequestMapping(value="/review_board.do",method=RequestMethod.GET)
	public ModelAndView ReviewBoard(String rpage){
		
		ModelAndView mv = new ModelAndView();
		
		ReviewBoardDAO dao = sqlSession.getMapper(lawtion.dao.ReviewBoardDAO.class);
		
		int startCount = 0;
		int endCount = 0;
		int pageSize = 10;	//한페이지당 게시물 수
		int reqPage = 1;	//요청페이지	
		int pageCount = 1;	//전체 페이지 수
		int dbCount = dao.execTotalCount();	//DB에서 가져온 전체 행수
		
		
		
		//총 페이지 수 계산
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

		//요청 페이지 계산
		if(rpage != null){ 
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1; 
			endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = 5;
		}

		ArrayList<ReviewBoardVO> alllist = dao.getAllResultList(startCount, endCount);
		ArrayList<ReviewBoardVO> allbestlist = dao.getAllBestResultList();
		
		mv.addObject("alllist",alllist);
		mv.addObject("allbestlist",allbestlist);
		mv.addObject("dbCount",dbCount);
		mv.addObject("rpage",rpage);
		mv.setViewName("/review_board/review_board_list");
		
		return mv;
	}
	
	@RequestMapping(value="/review_board_action.do",method=RequestMethod.GET)
	public ModelAndView review_board_action(String rpage){
		ModelAndView mv = new ModelAndView();
		
		ReviewBoardDAO dao = sqlSession.getMapper(lawtion.dao.ReviewBoardDAO.class);
		
		int startCount = 0;
		int endCount = 0;
		int pageSize = 10;	//한페이지당 게시물 수
		int reqPage = 1;	//요청페이지	
		int pageCount = 1;	//전체 페이지 수
		int dbCount = dao.execTotalCount();	//DB에서 가져온 전체 행수
		
		
		
		//총 페이지 수 계산
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

		//요청 페이지 계산
		if(rpage != null){ 
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1; 
			endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = 5;
		}

		ArrayList<ReviewBoardVO> actionlist = dao.getActionResultList(startCount,endCount);
		ArrayList<ReviewBoardVO> actionbestlist = dao.getActionBestResultList();
		
		mv.addObject("actionlist",actionlist);
		mv.addObject("actionbestlist",actionbestlist);
		mv.addObject("dbCount",dbCount);
		mv.addObject("rpage",rpage);
		
		mv.setViewName("/review_board/review_board_list_action");
		return mv;
		
	}
	
	@RequestMapping(value="/review_board_lawtion.do",method=RequestMethod.GET)
	public ModelAndView review_board_lawtion(String rpage){
		ModelAndView mv = new ModelAndView();
		
		ReviewBoardDAO dao = sqlSession.getMapper(lawtion.dao.ReviewBoardDAO.class);
		
		int startCount = 0;
		int endCount = 0;
		int pageSize = 10;	//한페이지당 게시물 수
		int reqPage = 1;	//요청페이지	
		int pageCount = 1;	//전체 페이지 수
		int dbCount = dao.execTotalCount();	//DB에서 가져온 전체 행수
		
		
		
		//총 페이지 수 계산
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

		//요청 페이지 계산
		if(rpage != null){ 
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1; 
			endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = 5;
		}

		ArrayList<ReviewBoardVO> lawtionlist = dao.getLawtionResultList(startCount,endCount);
		ArrayList<ReviewBoardVO> lawtionbestlist = dao.getLawtionBestResultList();
		
		mv.addObject("lawtionlist",lawtionlist);
		mv.addObject("lawtionbestlist",lawtionbestlist);
		mv.addObject("dbCount",dbCount);
		mv.addObject("rpage",rpage);
		
		mv.setViewName("/review_board/review_board_list_lawtion");
		return mv;
		
	}
	
	@RequestMapping(value="/review_write.do",method=RequestMethod.GET)
	public ModelAndView review_board_write(String name){
		ModelAndView mv = new ModelAndView();
		mv.addObject("lawyer",name);
		mv.setViewName("/review_board/review_write");
		return mv;
		
	}
	
	@RequestMapping(value ="/review_board_check.do",method=RequestMethod.POST)
	public String review_board_check(ReviewBoardVO vo) throws Exception{
		
		String fname = vo.getFile().getOriginalFilename();
		
		if(!fname.equals("")){
			//파일업로드 시작
			UUID uuid = UUID.randomUUID();
			
			
			String rfname = uuid.toString()+"-"+fname;
			String path = context.getRealPath("/upload/" + rfname);
			
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(vo.getFile().getBytes());
			fos.close();
				
			vo.setFname(fname);				
			vo.setRfname(rfname); 
		}else{
			
			vo.setFname("");
			vo.setRfname("");
		}
		
		
		String page ="";
		
		
		ReviewBoardDAO dao = sqlSession.getMapper(lawtion.dao.ReviewBoardDAO.class);
		int result = dao.getReviewInsertResult(vo);
		
		if(result==1){
			page = "redirect:/review_board.do";
		}
		
		return page;
	}
	
	@RequestMapping(value="/review_board_content.do",method=RequestMethod.GET)
	public ModelAndView review_board_content(String no, String rno){
		ModelAndView mv = new ModelAndView();
		
		ReviewBoardDAO dao = sqlSession.getMapper(lawtion.dao.ReviewBoardDAO.class);
		ReviewBoardVO vo = dao.getResultVO(no);
		dao.getUpdateHits(no);
		
		mv.addObject("rno",rno);
		mv.addObject("vo",vo);

		mv.setViewName("/review_board/review_board_content");
		
		return mv;
	}
	
	@RequestMapping(value="/review_update.do") //get방식잉라 생략
	public ModelAndView review_board_update(String no, String name){
		ModelAndView mv = new ModelAndView();
		
		ReviewBoardDAO dao = sqlSession.getMapper(lawtion.dao.ReviewBoardDAO.class);
		ReviewBoardVO vo = dao.getResultVO(no);
		
		   mv.addObject("vo",vo);
		   mv.addObject("lawyer",name);
		   mv.setViewName("/review_board/review_update");
		   
		   return mv;
	}
	
	
	@RequestMapping(value ="/review_update_check.do",method=RequestMethod.POST)
	public ModelAndView review_update_check(ReviewBoardVO vo) throws Exception{
		ModelAndView mv = new ModelAndView();	
		
		ReviewBoardDAO dao = sqlSession.getMapper(lawtion.dao.ReviewBoardDAO.class);
		int result=0;
		
		if(vo.getCode().equals("exist")){
			//제목, 내용 만 update
			result = dao.getUpdateResultNoFile(vo);
			
		}else{
		//파일업로드 시작
			UUID uuid = UUID.randomUUID();
			
			String fname = vo.getFile().getOriginalFilename();
			String rfname = uuid.toString()+"-"+fname;
			String path = context.getRealPath("/upload/" + rfname);
			System.out.println("path="+path);
			
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(vo.getFile().getBytes());
			fos.close();
			
				
			vo.setFname(fname);				
			vo.setRfname(rfname); 
			
			result = dao.getUpdateResult(vo);
		}
			if(result==1){
				mv.setViewName("redirect:/review_board.do");
			}
			return mv;
	}
	
	
	@RequestMapping(value="/review_delete_check.do",method=RequestMethod.GET)
	public String review_delete_check(String no){
		
		String page =""; //작업 후 전체 리스트 페이지를 호출하기 위한 코드
		
		
		//ModelAndView mv = new ModelAndView();
			
		ReviewBoardDAO dao = sqlSession.getMapper(lawtion.dao.ReviewBoardDAO.class);
		String rfname = dao.getRfnameResult(no);
		int result = dao.getDeleteResult(no);  
		
		String path = context.getRealPath("/upload/"+rfname);
		if(result==1){
			File file = new File(path);
			if(file.exists()){
				file.delete();
			}
			page="redirect:/review_board.do";
	   }
		return page;
	}
	
	//reply_write_check.do
	/* 게시판 댓글 등록 */
	@RequestMapping(value="/review_reply_write_check.do", method=RequestMethod.GET)
	@ResponseBody
	public String review_reply_write_check(String replyer, String content, String no){
		//System.out.println("content=" + content);
		//System.out.println("no=" + no);
		
		//댓글 추가작업 : _BOARD_REPLY		
		ReviewBoardDAO dao = sqlSession.getMapper(lawtion.dao.ReviewBoardDAO.class);
		int result = dao.getReveiwReplyInsert(replyer, content, no);
		
		return String.valueOf(result);
	}
	
	
	/* 게시판 댓글 가져오기 */
	@RequestMapping(value="/review_reply_list.do", method=RequestMethod.GET)
	@ResponseBody
	public JSONArray review_reply_list(String no){
		System.out.println("no=" + no);
		
		JSONArray jarray = new JSONArray();		
		//댓글가져오기 - ArrayList<BoardReplyVO>	
		ReviewBoardDAO dao = sqlSession.getMapper(lawtion.dao.ReviewBoardDAO.class);
		ArrayList<ReviewReplyVO> list = dao.getReplyList(no);
		
		//ArrayList<BoardReplyVO> 타입 데이터를 JSON 형태로 바꾸어서 전송
		for(ReviewReplyVO vo:list){
			JSONObject obj = new JSONObject();
			obj.put("replyer", vo.getReplyer());
			obj.put("content", vo.getContent());
			obj.put("rdate", vo.getRdate());
			obj.put("reviewid", vo.getReviewid());
			jarray.add(obj);
		}	
		
		return jarray;
	}
	
	@RequestMapping(value="/lawyer_search.do",method=RequestMethod.GET)
	public ModelAndView lawyer_search(String rpage){
		ModelAndView mv = new ModelAndView();
		
		SearchDAO dao = sqlSession.getMapper(lawtion.dao.SearchDAO.class);
		
		int startCount = 0;
		int endCount = 0;
		int pageSize = 3;	//한페이지당 게시물 수
		int reqPage = 1;	//요청페이지	
		int pageCount = 1;	//전체 페이지 수
		int dbCount = dao.execTotalCount();	//DB에서 가져온 전체 행수
		
		
		
		//총 페이지 수 계산
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

		//요청 페이지 계산
		if(rpage != null){ 
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1; 
			endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = 10;
		}

		ArrayList<SearchVO> list = dao.getResultAllList(startCount, endCount);
		mv.addObject("list",list);
		mv.addObject("dbCount",dbCount);
		mv.addObject("rpage",rpage);
		mv.setViewName("review_board/lawyer_search");
		return mv;
		
	}
	
	@RequestMapping(value="/lawyer_search_check.do",method=RequestMethod.POST)
	public ModelAndView lawyer_search_check(String keyword,String rpage){
		ModelAndView mv = new ModelAndView();
		
		SearchDAO dao = sqlSession.getMapper(lawtion.dao.SearchDAO.class);
		
		int startCount = 0;
		int endCount = 0;
		int pageSize = 3;	//한페이지당 게시물 수
		int reqPage = 1;	//요청페이지	
		int pageCount = 1;	//전체 페이지 수
		int dbCount = dao.execTotalCount();	//DB에서 가져온 전체 행수
		
		
		
		//총 페이지 수 계산
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

		//요청 페이지 계산
		if(rpage != null){ 
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1; 
			endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = 10;
		}
		
		System.out.println(keyword);
		ArrayList<SearchVO> list = dao.getResultList(keyword,startCount, endCount);
		mv.addObject("list",list);
		System.out.println(list);
		mv.addObject("dbCount",dbCount);
		mv.addObject("rpage",rpage);

		return mv;
		
	}
	
	
	@RequestMapping(value="/lawyer_search_select.do", method=RequestMethod.POST)
	public ModelAndView lawyer_search_select(String no){
		System.out.println("11111111\n");
		ModelAndView mv = new ModelAndView();
		SearchDAO dao = sqlSession.getMapper(lawtion.dao.SearchDAO.class);
		String name = dao.getLawyerList(no);
		mv.addObject("name",name);
		
		mv.setViewName("redirect:/review_write.do");
		return mv;
	}
	
	
	/* 게시판 댓글 삭제 */
	@RequestMapping(value="/review_reply_delete.do", method=RequestMethod.GET)
	@ResponseBody
	public String review_reply_delete(String rid,String no){
		//System.out.println("content=" + content);
		//System.out.println("no=" + no);
		System.out.println(rid);
		String page="";
		//댓글 추가작업 : _BOARD_REPLY		
		ReviewBoardDAO dao = sqlSession.getMapper(lawtion.dao.ReviewBoardDAO.class);
		int result = dao.getReviewReplyDelete(rid);
		System.out.println("성공");
		
		
		return String.valueOf(result);
	}
}
