package com.naedam.user.user.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naedam.admin.member.model.vo.Address;
import com.naedam.admin.member.model.vo.AddressBook;
import com.naedam.admin.member.model.vo.Authorities;
import com.naedam.user.user.model.service.UserService;
import com.naedam.user.user.model.vo.User;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/user/user")
@Slf4j
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	// 회원가입
	@GetMapping("/userEnroll.do")
	public String userEnroll() {
		log.debug("{}", "userEnroll.do 실행!");
//		return "user/user/userEnroll";
		return "admin/userDashBoard";
	}
	
	// id 중복 검사
	@ResponseBody
	@GetMapping("/checkIdDuplicate.do")
	public Map<String, Object> checkIdDuplicate(@RequestParam Map<String, Object> param) {
		log.debug("{}", "checkIdDuplicate.do 실행!");
		Map<String, Object> map = new HashMap<>();
		User user = userService.selectOneUserById(param);
		map.put("available", user == null);
		return map;
	}
	
	
	// 회원가입
	@PostMapping("/userEnroll.do")
	public String userEnroll(User user, RedirectAttributes redirectAttribute,
							 @RequestParam String mobile1, 
							 @RequestParam String mobile2,
							 @RequestParam String mobile3,
							 Address address,
							 AddressBook addressBook) {
		log.debug("{}", "userEnroll.do 실행!");
		log.debug("user = {}", user);
		
		try {
			String phone = mobile1 + mobile2 + mobile3;
			
			// 0. 비밀번호 암호화 처리
			String rawPassword = user.getPassword();
			log.debug("rawPassword = {}", rawPassword);
			String encryptedPassword = passwordEncoder.encode(rawPassword);
			log.debug("encryptedPassword = {}", encryptedPassword);
			user.setPassword(encryptedPassword);
			
			// 1. 회원 등록
			User paramUser = new User();
			paramUser.setFirstName(user.getFirstName());
			paramUser.setLastName(user.getLastName());
			paramUser.setEmail(user.getEmail());
			paramUser.setPhone(phone);
			paramUser.setId(user.getId());
			paramUser.setPassword(user.getPassword());
			int resultUserEnroll = userService.UserEnroll(paramUser);
			log.debug("resultUserEnroll = {}", resultUserEnroll);
			
			// 2. 주소 등록
			int resultUserAddressEnroll = userService.userAddressEnroll(address);
			log.debug("resultUserAddressEnroll = {}", resultUserAddressEnroll);
			
			// 3. 주소록 등록
			AddressBook paramAddressBook = new AddressBook();
			paramAddressBook.setAddressNo(address.getAddressNo());
			paramAddressBook.setMemberNo(paramUser.getMemberNo());
			int resultUserAddressBookEnroll = userService.userAddressBookEnroll(paramAddressBook);
			log.debug("resultUserAddressBookEnroll = {}", resultUserAddressBookEnroll);
			
			// 4. 권한 등록
			Authorities paramAuthorities = new Authorities();
			paramAuthorities.setMemberNo(paramUser.getMemberNo());
			int resultUserAuthorities = userService.userAuthoritiesEnroll(paramAuthorities);
			log.debug("resultUserAuthorities = {}", resultUserAuthorities);
			
			// 4. 메모 공란 등록
			int resultUserMemoEnroll = userService.userMemoEnroll(paramUser.getMemberNo());
			log.debug("resultUserMemoEnroll = {}", resultUserMemoEnroll);
			
			// 2.리다이렉트 & 사용자피드백 전달
			redirectAttribute.addFlashAttribute("msg", "회원가입 성공!");
		} catch (Exception e) {
			log.error("회원가입 실패", e);
			throw e;
		}
		
		return "redirect:/";
	}
	
	// 이메일 중복 검사
	@ResponseBody
	@GetMapping("/checkEmailDuplicate.do")
	public Map<String, Object> checkEmailDuplicate(@RequestParam Map<String, Object> param) {
		log.debug("{}", "checkEmailDuplicate.do 실행!");
		log.debug("param = {}", param);
		Map<String, Object> map = new HashMap<>();
		User user = userService.selectOneMemberByEmail(param);
		map.put("available", user == null);
		return map;
	}
	
}
