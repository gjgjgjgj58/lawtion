package com.ezen.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lawtion.dao.TalkBoardDAO;
import lawtion.vo.FileUploadVO;
import lawtion.vo.TalkBoardVO;
import lawtion.vo.TalkReplyVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TalkBoardController {
		@Autowired
		ServletContext context;
		
		
		@Autowired	
		SqlSessionTemplate sqlSession;

		
		@RequestMapping(value="/talk_board.do",method=RequestMethod.GET)
		public ModelAndView TalkBoard(String rpage){
			
			ModelAndView mv = new ModelAndView();
			
			TalkBoardDAO dao = sqlSession.getMapper(lawtion.dao.TalkBoardDAO.class);
			
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
				endCount = 10;
			}

			ArrayList<TalkBoardVO> alllist = dao.getAllResultList(startCount, endCount);
			ArrayList<TalkBoardVO> allbestlist = dao.getAllBestResultList();
			
			mv.addObject("alllist",alllist);
			mv.addObject("allbestlist",allbestlist);
			mv.addObject("dbCount",dbCount);
			mv.addObject("rpage",rpage);
			mv.setViewName("/talk_board/talk_board_list");
			
			return mv;
		}
		
		@RequestMapping(value="/talk_write.do",method=RequestMethod.GET)
		public ModelAndView talk_board_write(){
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/talk_board/talk_write");
			return mv;
			
		}
		
		@RequestMapping(value ="/talk_board_check.do",method=RequestMethod.POST)
		public String talk_board_check(TalkBoardVO vo) throws Exception{
			
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
			
			
			TalkBoardDAO dao = sqlSession.getMapper(lawtion.dao.TalkBoardDAO.class);
			int result = dao.getTalkInsertResult(vo);
			
			if(result==1){
				page = "redirect:/talk_board.do";
			}
			
			return page;
		}
		
		
		
		@RequestMapping(value="/talk_board_content.do",method=RequestMethod.GET)
		public ModelAndView talk_board_content(String no, String rno){
			ModelAndView mv = new ModelAndView();
			
			TalkBoardDAO dao = sqlSession.getMapper(lawtion.dao.TalkBoardDAO.class);
			TalkBoardVO vo = dao.getResultVO(no);
			dao.getUpdateHits(no);
			
			mv.addObject("rno",rno);
			mv.addObject("vo",vo);

			mv.setViewName("/talk_board/talk_board_content");
			
			return mv;
		}
		
		@RequestMapping(value="/talk_board_content_pre.do",method=RequestMethod.GET)
		public ModelAndView talk_board_content_pre(String no, String rno){
			ModelAndView mv = new ModelAndView();
			
			TalkBoardDAO dao = sqlSession.getMapper(lawtion.dao.TalkBoardDAO.class);
			TalkBoardVO vo = dao.getNextPage(no);
			dao.getUpdateHits(no);
			
			mv.addObject("rno",rno);
			mv.addObject("vo",vo);

			mv.setViewName("/talk_board/talk_board_content");
			
			return mv;
		}
		
		@RequestMapping(value="/talk_board_content_next.do",method=RequestMethod.GET)
		public ModelAndView talk_board_content_previous(String no, String rno){
			ModelAndView mv = new ModelAndView();
			
			TalkBoardDAO dao = sqlSession.getMapper(lawtion.dao.TalkBoardDAO.class);
			TalkBoardVO vo = dao.getPrePage(no);
			dao.getUpdateHits(no);
			
			mv.addObject("rno",rno);
			mv.addObject("vo",vo);

			mv.setViewName("/talk_board/talk_board_content");
			
			return mv;
		}
		
		
		@RequestMapping(value="/talk_update.do") //get방식잉라 생략
		public ModelAndView talk_board_update(String no, String rno){
			ModelAndView mv = new ModelAndView();
			
			   TalkBoardDAO dao = sqlSession.getMapper(lawtion.dao.TalkBoardDAO.class);
			   TalkBoardVO vo = dao.getResultVO(no);
			
			   mv.addObject("rno",rno);
			   mv.addObject("vo",vo);
			   
			   mv.setViewName("/talk_board/talk_update");
			   
			   return mv;
		}
		
		
		@RequestMapping(value ="/talk_update_check.do",method=RequestMethod.POST)
		public ModelAndView talk_update_check(TalkBoardVO vo) throws Exception{
			ModelAndView mv = new ModelAndView();
			
			TalkBoardDAO dao = sqlSession.getMapper(lawtion.dao.TalkBoardDAO.class);
			//수정할 때 파일이름이 변경되었으면 else실행
			
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
				mv.setViewName("redirect:/talk_board.do");
			}
			return mv;
		}
		
		
		@RequestMapping(value="/talk_delete_check.do",method=RequestMethod.GET)
		public String talk_delete_check(String no){
			
			String page =""; //작업 후 전체 리스트 페이지를 호출하기 위한 코드
			
			
			//ModelAndView mv = new ModelAndView();
				
			TalkBoardDAO dao = sqlSession.getMapper(lawtion.dao.TalkBoardDAO.class);
			String rfname = dao.getRfnameResult(no);
			int result = dao.getDeleteResult(no);
			String path = context.getRealPath("/upload/"+rfname);
			if(result==1){
				File file = new File(path);
				if(file.exists()){
					file.delete();
				}
				page = "redirect:/talk_board.do";
		   }
			return page;
		}
		
		//reply_write_check.do
		/* 게시판 댓글 등록 */
		@RequestMapping(value="/talk_reply_write_check.do", method=RequestMethod.GET)
		@ResponseBody
		public String talk_reply_write_check(String replyer, String content, String no){
			//System.out.println("content=" + content);
			//System.out.println("no=" + no);
			
			//댓글 추가작업 : _BOARD_REPLY		
			TalkBoardDAO dao = sqlSession.getMapper(lawtion.dao.TalkBoardDAO.class);
			int result = dao.getTalkReplyInsert(replyer, content, no);
			
			return String.valueOf(result);
		}
		
		
		/* 게시판 댓글 가져오기 */
		@RequestMapping(value="/talk_reply_list.do", method=RequestMethod.GET)
		@ResponseBody
		public JSONArray talk_reply_list(String no){
			System.out.println("no=" + no);
			
			JSONArray jarray = new JSONArray();		
			//댓글가져오기 - ArrayList<BoardReplyVO>	
			TalkBoardDAO dao = sqlSession.getMapper(TalkBoardDAO.class);
			ArrayList<TalkReplyVO> list = dao.getReplyList(no);
			
			//ArrayList<BoardReplyVO> 타입 데이터를 JSON 형태로 바꾸어서 전송
			for(TalkReplyVO vo:list){
				JSONObject obj = new JSONObject();
				obj.put("rid", vo.getRid());
				obj.put("replyer", vo.getReplyer());
				obj.put("content", vo.getContent());
				obj.put("rdate", vo.getRdate());
				obj.put("tid", vo.getTid());
				jarray.add(obj);
			}	
			
			return jarray;
		}
		/*
		//댓글 삭제
		@RequestMapping(value="/talk_reply_delete.do",method=RequestMethod.GET)
		public String talk_reply_delete(String no, String replyer, String content, String rid){
			
			String page =""; //작업 후 전체 리스트 페이지를 호출하기 위한 코드
			
			
			//ModelAndView mv = new ModelAndView();
				
			TalkBoardDAO dao = sqlSession.getMapper(TalkBoardDAO.class);
			int result = dao.getReplyDeleteResult(no, replyer, content, rid);
			
			if(result==1){
				page = "redirect:/talk_reply_list.do";
		    
		   }
			return page;
		}*/
		
		/* 게시판 댓글 삭제 */
	@RequestMapping(value="/talk_reply_delete.do", method=RequestMethod.GET)
	@ResponseBody
	public String talk_reply_delete(String rid,String no){
		//System.out.println("content=" + content);
		//System.out.println("no=" + no);
		System.out.println(rid);
		String page="";
		//댓글 추가작업 : _BOARD_REPLY		
		TalkBoardDAO dao = sqlSession.getMapper(lawtion.dao.TalkBoardDAO.class);
		int result = dao.getTalkReplyDelete(rid);
		System.out.println("성공");
		
		
		return String.valueOf(result);
	}
	
	 @RequestMapping(value = "/fileUpload.do")
	    public String fileUpload(@ModelAttribute("fileUploadVO") FileUploadVO fileUploadVO , HttpServletRequest request , Model model){
	        HttpSession session = request.getSession();
	        String rootPath = session.getServletContext().getRealPath("/");
	        String attachPath = "upload/";
	 
	        MultipartFile upload = fileUploadVO.getUpload();
	        String filename = "";
	        String CKEditorFuncNum = "";
	         
	        if(upload != null){
	            filename = upload.getOriginalFilename();
	            fileUploadVO.setFilename(filename);
	            CKEditorFuncNum = fileUploadVO.getCKEditorFuncNum();
	            try{
	                File file = new File(rootPath + attachPath + filename);
	                upload.transferTo(file);
	            }catch(IOException e){
	                e.printStackTrace();
	            }  
	        }
	            model.addAttribute("filePath",attachPath + filename);          //결과값을
	            model.addAttribute("CKEditorFuncNum",CKEditorFuncNum);//jsp ckeditor 콜백함수로 보내줘야함
	        return "talk_board/fileUploadComplete";
	    }

		
}

