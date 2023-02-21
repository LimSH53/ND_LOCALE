package com.naedam.user.user.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naedam.admin.member.model.vo.Address;
import com.naedam.admin.member.model.vo.AddressBook;
import com.naedam.admin.member.model.vo.Authorities;
import com.naedam.admin.member.model.vo.Member;
import com.naedam.user.user.model.vo.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired SqlSession session;

	// 이메일 중복검사
	@Override
	public User selectOneMemberByEmail(Map<String, Object> param) {
		return session.selectOne("user.selectOneMemberByEmail", param);
	}

	// 아이디 중복검사
	@Override
	public User selectOneUserById(Map<String, Object> param) {
		return session.selectOne("user.selectOneUserById", param);
	}

	// 회원 등록
	@Override
	public int userEnroll(User paramUser) {
		return session.insert("user.userEnroll", paramUser);
	}

	// 주소 등록
	@Override
	public int userAddressEnroll(Address address) {
		return session.insert("user.userAddressEnroll", address);
	}

	// 주소록 등록
	@Override
	public int userAddressBookEnroll(AddressBook paramAddressBook) {
		return session.insert("user.userAddressBookEnroll", paramAddressBook);
	}

	// 회원 등록
	@Override
	public int userAuthoritiesEnroll(Authorities paramAuthorities) {
		return session.insert("user.userAuthoritiesEnroll", paramAuthorities);
	}

	// 메모 공란 등록
	@Override
	public int userMemoEnroll(int memberNo) {
		return session.insert("user.userMemoEnroll", memberNo);
	}
}
