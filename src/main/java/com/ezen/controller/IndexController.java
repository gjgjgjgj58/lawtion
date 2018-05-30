package com.ezen.controller;

import java.util.ArrayList;

import javax.servlet.ServletContext;

import lawtion.dao.ReviewBoardDAO;
import lawtion.vo.ReviewBoardVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	@Autowired
	ServletContext context;
	
	@Autowired	
	SqlSessionTemplate sqlSession;
	
	@RequestMapping(value="index.do", method=RequestMethod.GET)
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView();
		
		ReviewBoardDAO dao = sqlSession.getMapper(lawtion.dao.ReviewBoardDAO.class);
		ArrayList<ReviewBoardVO> reviewlist = dao.getIndexReviewList();
		mv.addObject("reviewlist",reviewlist);
		
		mv.setViewName("index");
		
		return mv;
	
	
	}
	
}




