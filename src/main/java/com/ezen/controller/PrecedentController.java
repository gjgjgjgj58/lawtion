package com.ezen.controller;

import java.util.ArrayList;

import lawtion.dao.PrecedentDAO;
import lawtion.dao.PrecedentDAO_review;
import lawtion.dao.PrecedentDAO_search;
import lawtion.vo.PrecedentVO;
import lawtion.vo.PrecedentVO_review;
import lawtion.vo.PrecedentVO_search;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PrecedentController {
	@Autowired	
	SqlSessionTemplate sqlSession;
	
	@RequestMapping(value="precedent_normal.do", method=RequestMethod.GET)
	public ModelAndView precedent_normal(String rpage){
		ModelAndView mv = new ModelAndView();
		
		PrecedentDAO dao = sqlSession.getMapper(PrecedentDAO.class);
		PrecedentDAO_search dao1 = sqlSession.getMapper(PrecedentDAO_search.class);

		
		ArrayList<PrecedentVO_search> list1 = dao1.getResultList();
		int count = dao1.sTotalCount();
		//페이징 처리 - startCount, endCount 구하기
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

			ArrayList<PrecedentVO> list = dao.getResultList(startCount, endCount);
			
			mv.addObject("dbCount", dbCount);
		    mv.addObject("rpage", reqPage);
		    mv.addObject("list",list);
		    mv.addObject("list1", list1);
		    mv.addObject("count", count); 
		    mv.setViewName("/precedent/precedent_normal");
		
		    return mv;
	}
	
	@RequestMapping(value="precedent_review.do", method=RequestMethod.GET)
	public ModelAndView precedent_review(String rpage){
		ModelAndView mv = new ModelAndView();
		
		PrecedentDAO_review dao = sqlSession.getMapper(PrecedentDAO_review.class);
		PrecedentDAO_search dao1 = sqlSession.getMapper(PrecedentDAO_search.class);

		
		ArrayList<PrecedentVO_search> list1 = dao1.getResultList();
		int count = dao1.sTotalCount();
		
		//페이징 처리 - startCount, endCount 구하기
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

		ArrayList<PrecedentVO_review> list = dao.getResultList(startCount, endCount);
		
		mv.addObject("dbCount", dbCount);
	    mv.addObject("rpage", reqPage);
	    mv.addObject("list",list);
	    mv.addObject("list1", list1);
	    mv.addObject("count", count);
	    mv.setViewName("/precedent/precedent_review");
		
		return mv;
	}
	
	@RequestMapping(value="precedent_content.do", method=RequestMethod.GET)
	public ModelAndView precedent_content(String no, String rno){
		ModelAndView mv = new ModelAndView();
		
		PrecedentDAO dao = sqlSession.getMapper(PrecedentDAO.class);

		PrecedentVO vo = dao.getResultVO(no);
		dao.getUpdateHits(no);

		
		PrecedentDAO_search dao1 = sqlSession.getMapper(PrecedentDAO_search.class);

		int count = dao1.sTotalCount();
		
		ArrayList<PrecedentVO_search> list1 = dao1.getResultList();
					
		mv.addObject("no", no);
		mv.addObject("rno", rno);
		mv.addObject("vo", vo);
	    mv.addObject("list1", list1);
	    mv.addObject("count", count);
	    mv.setViewName("/precedent/precedent_content");
		
		return mv;
	}
	
	@RequestMapping(value="precedent_content_review.do", method=RequestMethod.GET)
	public ModelAndView precedent_content_review(String no, String rno){
		ModelAndView mv = new ModelAndView();
		
		PrecedentDAO_review dao = sqlSession.getMapper(PrecedentDAO_review.class);

		PrecedentVO_review vo = dao.getResultVO(no);
		dao.getUpdateHits(no);
			
		PrecedentDAO_search dao1 = sqlSession.getMapper(PrecedentDAO_search.class);
		int count = dao1.sTotalCount();
		
		ArrayList<PrecedentVO_search> list1 = dao1.getResultList();
		
		mv.addObject("no", no);
		mv.addObject("rno", rno);
		mv.addObject("vo", vo);
	    mv.addObject("list1", list1);
	    mv.addObject("count", count);
	    mv.setViewName("/precedent/precedent_content_review");
		
		return mv;
	}
	
	@RequestMapping(value="search_input2.do", method=RequestMethod.GET)
	public ModelAndView search_input2(String sno, String wpage, String rpage){
		ModelAndView mv = new ModelAndView();
		String keywords = "";
		
		if(wpage.equals("normal")){
			PrecedentDAO dao = sqlSession.getMapper(PrecedentDAO.class);
			PrecedentDAO_search dao1 = sqlSession.getMapper(PrecedentDAO_search.class);
			ArrayList<PrecedentVO_search> list1 = dao1.getResultList();
			keywords = dao1.getKeyword(sno);
			int count = dao1.sTotalCount();		
			//페이징 처리 - startCount, endCount 구하기
			int startCount = 0;
			int endCount = 0;
			int pageSize = 10;	//한페이지당 게시물 수
			int reqPage = 1;	//요청페이지	
			int pageCount = 1;	//전체 페이지 수
			int dbCount = dao.execTotalCount1(keywords);	//DB에서 가져온 전체 행수
			
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

			ArrayList<PrecedentVO> list = dao.getSearchList(keywords, startCount, endCount);

			mv.addObject("dbCount", dbCount);
		    mv.addObject("rpage", reqPage);
			mv.addObject("list", list);
			mv.addObject("list1", list1);
			mv.addObject("count", count);
			mv.setViewName("/precedent/precedent_normal");
		
		} else if(wpage.equals("review")){
			PrecedentDAO_review dao = sqlSession.getMapper(PrecedentDAO_review.class);
			PrecedentDAO_search dao1 = sqlSession.getMapper(PrecedentDAO_search.class);
			ArrayList<PrecedentVO_search> list1 = dao1.getResultList();
			keywords = dao1.getKeyword(sno);
			//페이징 처리 - startCount, endCount 구하기
			int startCount = 0;
			int endCount = 0;
			int pageSize = 10;	//한페이지당 게시물 수
			int reqPage = 1;	//요청페이지	
			int pageCount = 1;	//전체 페이지 수
			int dbCount = dao.execTotalCount1(keywords);	//DB에서 가져온 전체 행수
			
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

			ArrayList<PrecedentVO_review> list = dao.getSearchList(keywords, startCount, endCount);
			int count = dao1.sTotalCount();

			mv.addObject("dbCount", dbCount);
		    mv.addObject("rpage", reqPage);
			mv.addObject("list", list);
			mv.addObject("list1", list1);
			mv.addObject("count", count);
			mv.setViewName("/precedent/precedent_review");
		}
		
		return mv;
	}
	@RequestMapping(value="search_input.do", method=RequestMethod.POST)
	public ModelAndView search_input(String search1, String search2, String search1_c, String search2_c, String rpage){
		ModelAndView mv = new ModelAndView();
		
		if (search1 != null) {
			PrecedentDAO_search dao1 = sqlSession.getMapper(PrecedentDAO_search.class);
			int result = dao1.getInsertResult(search1);
				if (result==1){
					PrecedentDAO dao = sqlSession.getMapper(PrecedentDAO.class);
					//페이징 처리 - startCount, endCount 구하기
					int startCount = 0;
					int endCount = 0;
					int pageSize = 10;	//한페이지당 게시물 수
					int reqPage = 1;	//요청페이지	
					int pageCount = 1;	//전체 페이지 수
					int dbCount = dao.execTotalCount1(search1);	//DB에서 가져온 전체 행수
					System.out.println(dbCount);
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

					ArrayList<PrecedentVO> list = dao.getSearchList(search1, startCount, endCount);
					ArrayList<PrecedentVO_search> list1 = dao1.getResultList();
					int count = dao1.sTotalCount();

					mv.addObject("dbCount", dbCount);
				    mv.addObject("rpage", reqPage);
					mv.addObject("list", list);
					mv.addObject("list1", list1);
					mv.addObject("count", count);
					mv.setViewName("/precedent/precedent_normal");
				}
			}
			
			if (search2 != null) {
				PrecedentDAO_search dao1 = sqlSession.getMapper(PrecedentDAO_search.class);
				int result = dao1.getInsertResult(search2);
				
					if (result==1){
						PrecedentDAO_review dao = sqlSession.getMapper(PrecedentDAO_review.class);
						//페이징 처리 - startCount, endCount 구하기
						int startCount = 0;
						int endCount = 0;
						int pageSize = 10;	//한페이지당 게시물 수
						int reqPage = 1;	//요청페이지	
						int pageCount = 1;	//전체 페이지 수
						int dbCount = dao.execTotalCount1(search2);	//DB에서 가져온 전체 행수
						
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

						ArrayList<PrecedentVO_review> list = dao.getSearchList(search2, startCount, endCount);
						ArrayList<PrecedentVO_search> list1 = dao1.getResultList();
						int count = dao1.sTotalCount();

						mv.addObject("dbCount", dbCount);
					    mv.addObject("rpage", reqPage);
						mv.addObject("list", list);
						mv.addObject("list1", list1);
						mv.addObject("count", count);
						mv.setViewName("/precedent/precedent_review");
					}
			}
			
			if (search1_c != null) {
				PrecedentDAO_search dao1 = sqlSession.getMapper(PrecedentDAO_search.class);
				int result = dao1.getInsertResult(search1_c);
			
					if (result==1){
						PrecedentDAO dao = sqlSession.getMapper(PrecedentDAO.class);
						//페이징 처리 - startCount, endCount 구하기
						int startCount = 0;
						int endCount = 0;
						int pageSize = 10;	//한페이지당 게시물 수
						int reqPage = 1;	//요청페이지	
						int pageCount = 1;	//전체 페이지 수
						int dbCount = dao.execTotalCount1(search1_c);	//DB에서 가져온 전체 행수
						
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

						ArrayList<PrecedentVO> list = dao.getSearchList(search1_c, startCount, endCount);
						ArrayList<PrecedentVO_search> list1 = dao1.getResultList();
						int count = dao1.sTotalCount();
						
						mv.addObject("dbCount", dbCount);
					    mv.addObject("rpage", reqPage);
						mv.addObject("list", list);
						mv.addObject("list1", list1);
						mv.addObject("count", count);
						mv.setViewName("/precedent/precedent_normal");
				}
			}
			
			if (search2_c != null) {
				PrecedentDAO_search dao1 = sqlSession.getMapper(PrecedentDAO_search.class);
				int result = dao1.getInsertResult(search2_c);

					if (result==1){
						PrecedentDAO_review dao = sqlSession.getMapper(PrecedentDAO_review.class);
						//페이징 처리 - startCount, endCount 구하기
						int startCount = 0;
						int endCount = 0;
						int pageSize = 10;	//한페이지당 게시물 수
						int reqPage = 1;	//요청페이지	
						int pageCount = 1;	//전체 페이지 수
						int dbCount = dao.execTotalCount1(search2_c);	//DB에서 가져온 전체 행수
						
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

						ArrayList<PrecedentVO_review> list = dao.getSearchList(search2_c, startCount, endCount);
						ArrayList<PrecedentVO_search> list1 = dao1.getResultList();
						int count = dao1.sTotalCount();

						mv.addObject("dbCount", dbCount);
					    mv.addObject("rpage", reqPage);
						mv.addObject("list", list);
						mv.addObject("list1", list1);
						mv.addObject("count", count);
						mv.setViewName("/precedent/precedent_review");
				}
			}
			return mv;	
	}
	
	@RequestMapping(value="search_delete.do", method=RequestMethod.GET)
	public String search_delete(String no, String rno, String wpage){
		String page = "";
		
		PrecedentDAO_review dao = sqlSession.getMapper(PrecedentDAO_review.class);
		dao.getDeleteResult();
		
		if(wpage.equals("normal")){
			page = "redirect:/precedent_normal.do";
		} else if (wpage.equals("review")) {
			page = "redirect:/precedent_review.do";	
		} else if (wpage.equals("n_content")) {
			page = "redirect:/precedent_content.do";
		} else if (wpage.equals("r_content")) {
			page = "redirect:/precedent_content_review.do";
		}
		
		return page;
	}
	
	@RequestMapping(value="tree_result.do", method=RequestMethod.GET)
	public ModelAndView tree_result(String result, String wpage){
		ModelAndView mv = new ModelAndView();
		
		String str = "";
		if(result.equals("1")){
			str = "승소";
		} else {
			str = "패소";
		}
		
		if(wpage.equals("normal")){
			PrecedentDAO dao = sqlSession.getMapper(PrecedentDAO.class);
			ArrayList<PrecedentVO> list = dao.getTreeResult(str);

			mv.addObject("list", list);
			mv.setViewName("/precedent/precedent_normal");
		} else {
			PrecedentDAO_review dao = sqlSession.getMapper(PrecedentDAO_review.class);
			ArrayList<PrecedentVO_review> list = dao.getTreeResult(str);

			mv.addObject("list", list);
			mv.setViewName("/precedent/precedent_review");
		}
		
		return mv;
	}
	
	@RequestMapping(value="tree_scale.do", method=RequestMethod.GET)
	public ModelAndView tree_scale(String scale, String wpage){
		ModelAndView mv = new ModelAndView();
		
		String str = "";
		if(scale.equals("1")){
			str = "대법원";
		} else if(scale.equals("2")) {
			str = "고등법원";
		} else {
			str = "하급심";
		}
		
		if(wpage.equals("normal")){
			PrecedentDAO dao = sqlSession.getMapper(PrecedentDAO.class);
			ArrayList<PrecedentVO> list = dao.getTreeScale(str);

			mv.addObject("list", list);
			mv.setViewName("/precedent/precedent_normal");
		} else {
			PrecedentDAO_review dao = sqlSession.getMapper(PrecedentDAO_review.class);
			ArrayList<PrecedentVO_review> list = dao.getTreeScale(str);

			mv.addObject("list", list);
			mv.setViewName("/precedent/precedent_review");
		}
		
		return mv;
	}
	
	@RequestMapping(value="tree_cate.do", method=RequestMethod.GET)
	public ModelAndView tree_cate(String category, String wpage){
		ModelAndView mv = new ModelAndView();
		
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
		
		if(wpage.equals("normal")){
			PrecedentDAO dao = sqlSession.getMapper(PrecedentDAO.class);
			ArrayList<PrecedentVO> list = dao.getTreeCate(str);

			mv.addObject("list", list);
			mv.setViewName("/precedent/precedent_normal");
		} else {
			PrecedentDAO_review dao = sqlSession.getMapper(PrecedentDAO_review.class);
			ArrayList<PrecedentVO_review> list = dao.getTreeCate(str);

			mv.addObject("list", list);
			mv.setViewName("/precedent/precedent_review");
		}
		
		return mv;
	}
}
