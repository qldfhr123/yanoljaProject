package com.care.yanolja.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

	MemberDTO loginMemberProc(String userId);  // id 존재확인

	void registerMemberProc(MemberDTO member);
	void registerKakao(MemberDTO member);
	void kakaoInsert(MemberDTO member);  // 카카오계정 정보저장
	MemberDTO kakaoLoginProc(String userId);
	
	int updateMemberProc(MemberDTO member);
	
	void deleteMember(String userId);

	

}
