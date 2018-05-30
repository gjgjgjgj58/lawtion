package com.ezen.controller;

import java.util.ArrayList;

import javax.servlet.ServletContext;

import lawtion.dao.*;
import lawtion.deadline.AuctionBoardDeadLine;
import lawtion.vo.AuctionBoardVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuctionBoardController {
	@Autowired
	ServletContext context;

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping(value="/auction_board.do", method=RequestMethod.GET)
	public ModelAndView auction_board(String rpage, String input, String category, String area) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		AuctionBoardDAO dao = sqlSession.getMapper(AuctionBoardDAO.class);
		
		//����¡ ó�� - startCount, endCount ���ϱ�
				int startCount = 0;
				int endCount = 0;
				int pageSize = 10;	//���������� �Խù� ��
				int reqPage = 1;	//��û������	
				int pageCount = 1;	//��ü ������ ��
				int dbCount = 0;	//DB���� ������ ��ü ���
				
				if((category=="" && area=="" && input=="") || input==null){
					
					//System.out.println(input);
					dbCount=dao.execTotalCount();
					
					//�� ������ �� ���
					if(dbCount % pageSize == 0){
						pageCount = dbCount/pageSize;
					}else{
						pageCount = dbCount/pageSize+1;
					}

					//��û ������ ���
					if(rpage != null){				
						reqPage = Integer.parseInt(rpage); 
						startCount = (reqPage-1) * pageSize+1;	
						endCount = reqPage * pageSize; 
					}else{
						startCount = 1;
						endCount = 10;
					}
					
					ArrayList<AuctionBoardVO> list = dao.getResultList(startCount, endCount);
			
					for(AuctionBoardVO vo:list){
				
						vo.setBtotal(dao.execTotalBiddingCount(Integer.toString(vo.getNo())));
						vo.setE();
				
					}
					//dao.closed();
			
					mv.addObject("list",list);
					mv.addObject("dbCount", dbCount);
					mv.addObject("rpage", reqPage);
					mv.setViewName("/auction_board/auction_board_list");
			
					return mv;
					
				}else{
					
					//System.out.println(input);
					//System.out.println(category);
					//System.out.println(area);
					dbCount=dao.execTotalSearchCount(input, category, area);
					
					//�� ������ �� ���
					if(dbCount % pageSize == 0){
						pageCount = dbCount/pageSize;
					}else{
						pageCount = dbCount/pageSize+1;
					}

					//��û ������ ���
					if(rpage != null){				
						reqPage = Integer.parseInt(rpage); 
						startCount = (reqPage-1) * pageSize+1;	
						endCount = reqPage * pageSize; 
					}else{
						startCount = 1;
						endCount = 10;
					}
					
					ArrayList<AuctionBoardVO> list = dao.getResultSearchList(startCount, endCount, input, category, area);
			
					for(AuctionBoardVO vo:list){
				
						vo.setBtotal(dao.execTotalBiddingCount(Integer.toString(vo.getNo())));
						vo.setE();
				
					}
			
					mv.addObject("list",list);
					mv.addObject("dbCount", dbCount);
					mv.addObject("rpage", reqPage);
					mv.setViewName("/auction_board/auction_board_list");
			
					return mv;
					
				}
				
	}
	
	@RequestMapping(value="/auction_board_content.do", method=RequestMethod.GET)
	public ModelAndView auction_board_content(String no, String rno, int rpage){
		ModelAndView mv = new ModelAndView();
		
		AuctionBoardDAO dao = sqlSession.getMapper(AuctionBoardDAO.class);
		AuctionBoardVO vo = dao.getResultVO(no);
		dao.getUpdateHits(no);
		
		mv.addObject("vo",vo);
		mv.addObject("rno",rno);
		mv.addObject("rpage",rpage);
		mv.setViewName("/auction_board/auction_board_content");
		
		return mv;
	}
	
	@RequestMapping(value="/auction_board_write.do", method=RequestMethod.GET)
	public ModelAndView auction_board_write(){
		ModelAndView mv = new ModelAndView();
		
		AuctionBoardDeadLine dl = new AuctionBoardDeadLine();
		dl.deadlineDate();
		
		mv.addObject("dl",dl);
		mv.setViewName("/auction_board/auction_board_write");
		
		return mv;
	}

	@RequestMapping(value="/auction_board_check.do", method=RequestMethod.POST)
	public String auction_board_check(AuctionBoardVO vo){
		String page="";
		
		if(vo.getAgree() == null){
			vo.setAgree("off");
		}
		
		AuctionBoardDAO dao = sqlSession.getMapper(AuctionBoardDAO.class);
		int result = dao.getInsertResult(vo);
		//dao.closed();
		
		if(result==1){
			page = "redirect:/auction_board.do";
		}
		
		
		return page;
	}
	
	@RequestMapping(value="/auction_board_bidding.do", method=RequestMethod.GET)
	public ModelAndView auction_board_bidding(@RequestParam("no") String no){
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("no",no);
		mv.setViewName("/auction_board/auction_board_bidding");
		return mv;
	}
	
	@RequestMapping(value="/auction_win.do", method=RequestMethod.GET)
	public String auction_win(){
		return "/auction_board/auction_win";
	}
	
	/*@RequestMapping(value="/auction_board_content_check.do", method=RequestMethod.GET)
	public String auction_board_content_check(){
		return "redirect:/auction_board_content.do";
	}*/

}
