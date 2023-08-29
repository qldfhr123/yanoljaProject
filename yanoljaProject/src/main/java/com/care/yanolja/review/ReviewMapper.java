package com.care.yanolja.review;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewMapper {
	ArrayList<ReviewDTO> reviewCheckProc(String hostName);
	ArrayList<ReviewDTO> reviewCheckProcStars(String hostName);
	void answerUpload(ReviewDTO review);
	void answerModify(ReviewDTO review);
	void answerDelete(ReviewDTO review);
}
