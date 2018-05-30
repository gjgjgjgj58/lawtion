package com.ezen.controller;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletContext;

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
public class JoinController {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	ServletContext context;
	
	@RequestMapping(value="/join_select.do", method=RequestMethod.GET)
	public String join_select(){
		return "/join/join_select";
	}
	
	@RequestMapping(value="/join_access.do", method=RequestMethod.GET)
	public String join_access(){
		return "/join/join_access";
	}
	
	@RequestMapping(value="/join_access2.do", method=RequestMethod.GET)
	public String join_access2(){
		return "/join/join_access2";
	}
	
	@RequestMapping(value="/join_normal.do", method=RequestMethod.GET)
	public String join_normal(){
		return "/join/join_normal";
	}
	
	@RequestMapping(value="/join_check.do", method=RequestMethod.POST)
	public ModelAndView join_check(joinNormalVO vo){
		ModelAndView mv = new ModelAndView();
		
		joinNormalDAO dao = sqlSession.getMapper(joinNormalDAO.class);
		int result = dao.getResult(vo);
		
		if(result == 1){
			mv.setViewName("/join/join_success");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/join_layer.do", method=RequestMethod.GET)
	public String join_layer(){
		return "/join/join_layer";
	}
	
	@RequestMapping(value="/join_layer_check.do", method=RequestMethod.POST)
	public ModelAndView join_layer_check(joinLayerVO vo) throws Exception{
		String fname1 = vo.getFileBusiness().getOriginalFilename();
		String fname2 = vo.getFileLicense().getOriginalFilename();
	
		if(!fname1.equals("")){
		UUID uuid = UUID.randomUUID();
		String rfname1 = uuid.toString() + "_" + fname1;
		String path1 = context.getRealPath("/businessUpload/" + rfname1);
		
		FileOutputStream fos = new FileOutputStream(path1);
		fos.write(vo.getFileBusiness().getBytes());
		fos.close();
		
		vo.setBusiness(fname1);
		vo.setRbusiness(rfname1);
		}else{
			vo.setBusiness("");
			vo.setRbusiness("");
		}
		
		if(!fname2.equals("")){
			UUID uuid = UUID.randomUUID();
			String rfname2 = uuid.toString()+ "_" +fname2;
			String path2 = context.getRealPath("/licenseUpload/" + rfname2);
			
			FileOutputStream fos = new FileOutputStream(path2);
			fos.write(vo.getFileLicense().getBytes());
			fos.close();
			
			vo.setLicense(fname2);
			vo.setRlicense(rfname2);
		}else{
			vo.setLicense("");
			vo.setRlicense("");
		}
		
		ModelAndView mv = new ModelAndView();
		joinLayerDAO dao = sqlSession.getMapper(joinLayerDAO.class);
		int result = dao.getInsertResult(vo);

		if(result == 1){
			mv.setViewName("/join/join_success");
		}
		
		return mv;
		
	}
		
	@RequestMapping(value="/join_success.do", method=RequestMethod.GET)
	public String join_success(){
		return "join/join_success";
	}
		
		
}

