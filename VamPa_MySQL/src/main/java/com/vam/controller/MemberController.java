package com.vam.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vam.model.MemberVO;
import com.vam.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	@Autowired
	private MemberService memberservice;
	
	@Autowired
    private BCryptPasswordEncoder pwEncoder;
	
	//회원가입 페이지 이동
	@GetMapping(value = "join")
	public void joinGET() {
		
		logger.info("회원가입 페이지 진입");
				
	}
	
	//로그인 페이지 이동
	@GetMapping(value = "login")
	public void loginGET() {
		
		logger.info("로그인 페이지 진입");
		
	}
	
	//회원가입
	@PostMapping(value="/join")
	public String joinPOST(MemberVO member) throws Exception{
		
		logger.info("join 진입");
		
		String rawPw = "";
		String encodePw = "";
		
		rawPw = member.getMemberPw();
		encodePw = pwEncoder.encode(rawPw);
		
		member.setMemberPw(encodePw);
		
		memberservice.memberJoin(member);
		
		return "redirect:/main";
		
	}
	
	// 아이디 중복 검사
	@PostMapping(value = "/memberIdChk")
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception{
		
		logger.info("memberIdChk 진입");
		
		int result = memberservice.idCheck(memberId);
		
		logger.info("결과값 = " + result);
		
		if(result != 0) {
			return "fail";	// 중복 아이디가 존재
		} else {
			return "success";	// 중복 아이디 x
		}
		
	} // memberIdChkPOST() 종료
	
	//로그인
	@PostMapping(value="login.do")
	public String loginPOST(HttpServletRequest request, RedirectAttributes rttr, MemberVO member) throws Exception {
		
		HttpSession session = request.getSession();

		String rawPw = "";
		String encodePw = "";
		
		MemberVO lvo = memberservice.memberLogin(member);
		
		if(lvo != null) {
			rawPw = member.getMemberPw();
			encodePw = lvo.getMemberPw();
			
			if(true == pwEncoder.matches(rawPw, encodePw)) {
				lvo.setMemberPw("");
				session.setAttribute("member", lvo);
				return "redirect:/main";
			} else {
				rttr.addFlashAttribute("result", 0);
				return "redirect:/member/login";
			}
			
		} else {
			rttr.addFlashAttribute("result", 0);
			return "redirect:/member/login";
		}
	}
	
	//로그아웃
	@PostMapping(value="logout.do")
	@ResponseBody
	public void logoutPOST(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		session.invalidate();
	}

}
