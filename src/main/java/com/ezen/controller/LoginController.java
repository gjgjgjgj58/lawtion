package com.ezen.controller;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lawtion.dao.*;
import lawtion.vo.*;

@Controller
public class LoginController {
	
	@Autowired	
	SqlSessionTemplate sqlSession;
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login(){
		return "/login/login";
	}
	
	@RequestMapping(value="/login_check.do", method=RequestMethod.POST)
	public ModelAndView login_check(joinNormalVO vo1, HttpSession session, joinLayerVO vo2){
		
		int result1 = login_check(vo2, session);
		ModelAndView mv = new ModelAndView();
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		int result2 = dao.LoginResult(vo1);

		
		if((result2 == 1 && result1 == 0) || (result2 == 0 && result1 == 1)){
			if(result2==1){
			session.setAttribute("sid", vo1.getId());
			}else{
			session.setAttribute("sid", vo2.getId());
			}
			
			mv.setViewName("/jsp/index");
		}else{
			mv.setViewName("/login/login");
		}
		return mv;
	}
	
	
	
	public int login_check(joinLayerVO vo, HttpSession session){
		
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		int result = dao.LoginLayerResult(vo);
		
		return result;
	}
}
