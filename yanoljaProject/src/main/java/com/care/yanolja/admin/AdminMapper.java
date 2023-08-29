package com.care.yanolja.admin;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {
	
	
	AdminDTO adminLoginProc(String adminId);
	
	void adminRegisterProc(AdminDTO admin);
	
	int adminUpdateProc(AdminDTO admin);
	
	void adminDeleteProc(String adminId);
}
