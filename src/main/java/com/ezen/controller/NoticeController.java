package com.ezen.controller;


import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lawtion.dao.*;
import lawtion.vo.*;

@Controller
public class NoticeController {
	
	@RequestMapping(value="/notice.do", method=RequestMethod.GET)
	public String notice(){
		return "/notice/notice";
	}
	
	@RequestMapping(value="/news.do", method=RequestMethod.GET)
	public String news(){
		return "/notice/news";
	}
	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.GET)
	public String noticeWrite(){
		return "/notice/noticeNewsWrite";
	}
}
