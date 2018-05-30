package com.ezen.controller;

import java.util.ArrayList;

import lawtion.dao.IntroduceDAO;
import lawtion.vo.IntroduceVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IntroController {

	@Autowired	
	 SqlSessionTemplate sqlSession;
	
	@RequestMapping(value="/introduce_list.do", method=RequestMethod.GET)
	public ModelAndView introduce_list(String rpage){
		
		ModelAndView mv = new ModelAndView();
		IntroduceDAO dao = sqlSession.getMapper(lawtion.dao.IntroduceDAO.class);
		//IntroduceDAO dao = new IntroduceDAO();
		//����¡ ó�� - startCount, endCount ���ϱ�
		int startCount = 0;
		int endCount = 0;
		int pageSize = 8;	//���������� �Խù� ��
		int reqPage = 1;	//��û������	
		int pageCount = 1;	//��ü ������ ��
		int dbCount = dao.execTotalCount();	//DB���� ������ ��ü ���

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
			endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = 8;
		}
		
		ArrayList<IntroduceVO> list = dao.getResultList(startCount, endCount);
		//dao.closed();
		
		mv.addObject("list", list);
		mv.addObject("dbCount",dbCount);
		mv.addObject("rpage",reqPage);
		mv.setViewName("/introduce/introduce_list");
		return mv;
		
	}
	
	
	
	@RequestMapping(value="/introduce_lawer2.do",method=RequestMethod.GET)
	public ModelAndView introduce_lawer2(String no){
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("no",no);
		mv.setViewName("/introduce/introduce_lawer2");
		
		return mv;
	}
	
	
	@RequestMapping(value="/introduce_calender.do", method=RequestMethod.GET)
	public ModelAndView introduce_calender(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/introduce/introduce_calender");
		return mv;
	}
	
	@RequestMapping(value="/NewFile.do", method=RequestMethod.GET)
	public ModelAndView NewFile(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/introduce/NewFile");
		return mv;
	}
	
	
	@RequestMapping(value="/introduce_right.do",method=RequestMethod.GET)
	public ModelAndView introduce_right(String no){
		
		ModelAndView mv = new ModelAndView();
		IntroduceDAO dao = sqlSession.getMapper(lawtion.dao.IntroduceDAO.class);
		//IntroduceDAO dao = new IntroduceDAO();
		IntroduceVO vo = dao.getResultVO(no);
		//dao.closed();
		
	
		
		
		mv.addObject("vo",vo);
		mv.addObject("no",no);
		mv.setViewName("/introduce/introduce_right");
		return mv;
	}
	
	
	/* iframe ������   */
	@RequestMapping(value="/introduce_left.do",method=RequestMethod.GET)
	public ModelAndView introduce_left(String rpage){
		ModelAndView mv = new ModelAndView();
		//IntroduceDAO dao = new IntroduceDAO();
		IntroduceDAO dao = sqlSession.getMapper(lawtion.dao.IntroduceDAO.class);

		//����¡ ó�� - startCount, endCount ���ϱ�
		int startCount = 0;
		int endCount = 0;
		int pageSize = 8;	//���������� �Խù� ��
		int reqPage = 1;	//��û������	
		int pageCount = 1;	//��ü ������ ��
		int dbCount = dao.execTotalCount();	//DB���� ������ ��ü ���

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
			endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = 8;
		}


		ArrayList<IntroduceVO> list = dao.getResultList(startCount, endCount);
		
		//dao.closed();
		
		mv.addObject("list", list);
		mv.addObject("dbCount",dbCount);
		mv.addObject("rpage",rpage);
		mv.setViewName("/introduce/introduce_left");
		return mv;
	
	}

}
