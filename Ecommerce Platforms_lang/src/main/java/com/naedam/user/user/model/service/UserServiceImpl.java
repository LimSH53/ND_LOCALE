package com.naedam.user.user.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.admin.member.model.vo.Address;
import com.naedam.admin.member.model.vo.AddressBook;
import com.naedam.admin.member.model.vo.Authorities;
import com.naedam.admin.member.model.vo.Member;
import com.naedam.user.user.model.dao.UserDao;
import com.naedam.user.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	

	// 이메일 중복검사
	@Override
	public User selectOneMemberByEmail(Map<String, Object> param) {
		return userDao.selectOneMemberByEmail(param);
	}

	// 아이디 중복검사
	@Override
	public User selectOneUserById(Map<String, Object> param) {
		return userDao.selectOneUserById(param);
	}

	// 회원 등록
	@Override
	public int UserEnroll(User paramUser) {
		return userDao.userEnroll(paramUser);
	}

	// 주소 등록
	@Override
	public int userAddressEnroll(Address address) {
		return userDao.userAddressEnroll(address);
	}

	// 주소록 등록
	@Override
	public int userAddressBookEnroll(AddressBook paramAddressBook) {
		return userDao.userAddressBookEnroll(paramAddressBook);
	}

	// 권한 등록
	@Override
	public int userAuthoritiesEnroll(Authorities paramAuthorities) {
		return userDao.userAuthoritiesEnroll(paramAuthorities);
	}

	// 메모 공란 등록
	@Override
	public int userMemoEnroll(int memberNo) {
		return userDao.userMemoEnroll(memberNo);
	}
}
