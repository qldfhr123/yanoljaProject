package com.care.yanolja.cart;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MemCartMapper {

	void memCartProc(MemCartDTO cart);	
	ArrayList<MemCartDTO> cartSelectId(String userId);
	MemCartDTO cartSelectReseNum(String reseNum);
	void cartDeleteProc(MemCartDTO reqData);
	void cartDeleteProc(String userId, String roomName, String checkIn);
	
	
}
