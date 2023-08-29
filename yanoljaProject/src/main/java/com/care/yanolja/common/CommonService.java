package com.care.yanolja.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class CommonService {
	@Autowired private CommonMapper commomMapper;
	@Autowired private HttpSession session;
	

}
