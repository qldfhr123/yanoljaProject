package com.care.yanolja.review;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemReviewMapper {

	MemReviewDTO fintReviewProc(String reseNum);
	ArrayList<MemReviewDTO> reviewSelectId(String userId);
	MemReviewDTO fintReviewProc(String userId, String reseNum, String content);
	void memReviewProc(MemReviewDTO review);
	void reviewDeleteProc(MemReviewDTO reqData);
	void reviewUpdateProc(MemReviewDTO review);


}
