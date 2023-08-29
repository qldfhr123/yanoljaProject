package com.care.yanolja.common;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import jakarta.servlet.http.HttpSession;

//import jakarta.servlet.http.HttpSession;

@Service
public class indexService {
	
	@Autowired private IndexMapper indexMapper;
	@Autowired private HttpSession session;
	
	
	@ModelAttribute
	public ArrayList<indexDTO> indexShow(String C_rental_type, Model model, String selectedText) {
		System.out.println(selectedText);
	    ArrayList<indexDTO> mainList;
	    List<String> imagePathList = new ArrayList<>();

	    if ("ㆍ낮은 가격순".equals(selectedText)) {
	        // 가격 순으로 정렬
	    	mainList = indexMapper.showMainIndexOrderByPrice(C_rental_type,selectedText);
	    } else if ("ㆍ높은 가격순".equals(selectedText)) {
	        // 가격 역순으로 정렬
	        mainList = indexMapper.showMainIndexOrderByPriceDesc(C_rental_type,selectedText);
	    } else if ("ㆍ별점 높은순".equals(selectedText)) {
	        // 별점 높은순으로 정렬
	        mainList = indexMapper.showMainIndexOrderByRating(C_rental_type,selectedText);
	    } else if ("ㆍ후기 많은순".equals(selectedText)) {
	        // 후기 많은순으로 정렬
	        mainList = indexMapper.showMainIndexOrderByReviews(C_rental_type,selectedText);
	    }
	    
	    else {
	        mainList = indexMapper.showMainIndex(C_rental_type);
	    }
	    
	    
	    String hostName="";
	    String photo="";
	    session.removeAttribute("hostName");
	    if (mainList == null || mainList.isEmpty()) {
	        System.out.println("받아오는게 없음");
	    } else {
	        System.out.println("정상");
	         
	        for (indexDTO mainshow : mainList) {
	            System.out.println(mainshow.getHost_name());
	            hostName = mainshow.getHost_name();
	            photo = mainshow.getRepresentative_photo();
	            System.out.println("hostName 출력하기 :"+hostName);
	            System.out.println("hostP 출력하기 :"+photo);

		        session.setAttribute("hostName", hostName);
		        String imageDirectoryPath = "img\\";

				

					String fileName = photo;
				    String fileExtension = fileName.substring(fileName.length() - 3);
				    String imagePath="";


				    if (fileExtension.equalsIgnoreCase("JPG") || fileExtension.equalsIgnoreCase("jpg")) {
				        imagePath = imageDirectoryPath + fileName;
				    } else if (fileExtension.equalsIgnoreCase("PNG") || fileExtension.equalsIgnoreCase("png")) {
				        imagePath = imageDirectoryPath + fileName;
				    } else {
				        System.out.println("Unsupported image format: " + fileExtension);
				        continue;
				    }
				   System.out.println("Image path: " + imagePath);
				   session.setAttribute("imagePath", imagePath);   // 이미지 세션저장
				   imagePathList.add(imagePath); 

	        }
	       
	        ArrayList<host_nameDTO> hostNameDto = indexMapper.su_dae(hostName);
	           for(host_nameDTO hnDTO : hostNameDto) {
	        	   System.out.println(hnDTO.getRoom_payDae());
	        	   
	            }  
	        model.addAttribute("hostNameDto", hostNameDto);
	        model.addAttribute("mainList", mainList);
	        model.addAttribute("imagePaths", imagePathList);
	        System.out.println(mainList);
	    }
	    
	    return mainList;
	}
	
/**전부 보여주기 
 * @param selectedText */
	@ModelAttribute
	public ArrayList<indexDTO> allindexShow(String C_rental_type, String C_region, Model model, String selectedText) { 
		ArrayList<indexDTO> AllmainList;
		List<String> imagePathList = new ArrayList<>();
	    if ("ㆍ낮은 가격순".equals(selectedText)) {
	        // 가격 순으로 정렬
	        AllmainList = indexMapper.initialAllshowMainIndexOrderByReviews();
	    } else if ("ㆍ높은 가격순".equals(selectedText)) {
	        // 가격 역순으로 정렬
	        AllmainList = indexMapper.AllshowMainIndexOrderByPriceDesc(C_rental_type, C_region,selectedText);
	    } else if ("ㆍ별점 높은순".equals(selectedText)) {
	        // 별점 높은순으로 정렬
	        AllmainList = indexMapper.AllshowMainIndexOrderByRating(C_rental_type, C_region,selectedText);
	    } else if ("ㆍ후기 많은순".equals(selectedText)) {
	        // 후기 많은순으로 정렬
	        AllmainList = indexMapper.AllshowMainIndexOrderByReviews(C_rental_type, C_region,selectedText);
	    } else {

	        AllmainList = indexMapper.AllshowMainIndex(C_rental_type, C_region);
	    }

	    if (AllmainList == null || AllmainList.isEmpty()) {
	        System.out.println("받아오는게 없음");
	    } else {
	        System.out.println("정상");
	        String hostName="";
	        String photo="";
	        session.removeAttribute("hostName");
	        for (indexDTO mainshow : AllmainList) {
	            System.out.println(mainshow.getHost_name());
	            hostName = mainshow.getHost_name();
	            photo = mainshow.getRepresentative_photo();
	            System.out.println("hostName 출력하기 :"+hostName);
	            System.out.println("hostP 출력하기 :"+photo);
	            
		        session.setAttribute("hostName", hostName);
		        String imageDirectoryPath = "img\\";

				

				String fileName = photo;
			    String fileExtension = fileName.substring(fileName.length() - 3);
			    String imagePath="";


			    if (fileExtension.equalsIgnoreCase("JPG") || fileExtension.equalsIgnoreCase("jpg")) {
			        imagePath = imageDirectoryPath + fileName;
			    } else if (fileExtension.equalsIgnoreCase("PNG") || fileExtension.equalsIgnoreCase("png")) {
			        imagePath = imageDirectoryPath + fileName;
			    } else {
			        System.out.println("Unsupported image format: " + fileExtension);
			        continue;
			    }
			   System.out.println("Image path: " + imagePath);
			   imagePathList.add(imagePath); 

	        }
	        
	        ArrayList<host_nameDTO> hostNameDto = indexMapper.su_dae(hostName);
	           for(host_nameDTO hnDTO : hostNameDto) {
	        	   System.out.println(hnDTO.getRoom_payDae());
	        	   
	            }  
	        model.addAttribute("hostNameDto", hostNameDto);
	        model.addAttribute("mainList", AllmainList);
	        model.addAttribute("imagePaths", imagePathList);
	        System.out.println(AllmainList);
	    }

	    return AllmainList;
	    
	    
	}
	
	
	@ModelAttribute
	public ArrayList<indexDTO> initialAllindexShow(Model model) { 
		ArrayList<indexDTO> AllmainList;
		List<String> imagePathList = new ArrayList<>();
		AllmainList = indexMapper.initialAllshowMainIndexOrderByReviews();
	  
	    if (AllmainList == null || AllmainList.isEmpty()) {
	        System.out.println("받아오는게 없음");
	    } else {
	        System.out.println("정상");
	        String hostName="";
	        String photo="";
	        session.removeAttribute("hostName");
	        for (indexDTO mainshow : AllmainList) {
	            System.out.println(mainshow.getHost_name());
	            hostName = mainshow.getHost_name();
	            photo = mainshow.getRepresentative_photo();
	            System.out.println("hostName 출력하기 :"+hostName);
	            System.out.println("hostP 출력하기 :"+photo);
	            
		        session.setAttribute("hostName", hostName);
		        String imageDirectoryPath = "img\\";

				

				String fileName = photo;
			    String fileExtension = fileName.substring(fileName.length() - 3);
			    String imagePath="";


			    if (fileExtension.equalsIgnoreCase("JPG") || fileExtension.equalsIgnoreCase("jpg")) {
			        imagePath = imageDirectoryPath + fileName;
			    } else if (fileExtension.equalsIgnoreCase("PNG") || fileExtension.equalsIgnoreCase("png")) {
			        imagePath = imageDirectoryPath + fileName;
			    } else {
			        System.out.println("Unsupported image format: " + fileExtension);
			        continue;
			    }
			   System.out.println("Image path: " + imagePath);
			   imagePathList.add(imagePath); 

	        }
	        
	        ArrayList<host_nameDTO> hostNameDto = indexMapper.su_dae(hostName);
	           for(host_nameDTO hnDTO : hostNameDto) {
	        	   System.out.println(hnDTO.getRoom_payDae());
	        	   
	            }  
	        model.addAttribute("hostNameDto", hostNameDto);
	        model.addAttribute("mainList", AllmainList);
	        model.addAttribute("imagePaths", imagePathList);
	        System.out.println(AllmainList);
	    }

	    return AllmainList;
	    
	    
	}
	
	
	/**지역만 보여주기
	 * @param selectedText */
	@ModelAttribute
	public ArrayList<indexDTO> regionindexShow(String C_region, Model model, String selectedText) {
		ArrayList<indexDTO> regionmainList;
		List<String> imagePathList = new ArrayList<>();
	    if ("ㆍ낮은 가격순".equals(selectedText)) {
	        // 가격 순으로 정렬
	        regionmainList = indexMapper.regionshowMainIndexOrderByPrice(C_region,selectedText);
	    } else if ("ㆍ높은 가격순".equals(selectedText)) {
	        // 가격 역순으로 정렬
	        regionmainList = indexMapper.regionshowMainIndexOrderByPriceDesc(C_region,selectedText);
	    } else if ("ㆍ별점 높은순".equals(selectedText)) {
	        // 별점 높은순으로 정렬
	        regionmainList = indexMapper.regionshowMainIndexOrderByRating(C_region,selectedText);
	    } else if ("ㆍ후기 많은순".equals(selectedText)) {
	        // 후기 많은순으로 정렬
	        regionmainList = indexMapper.regionshowMainIndexOrderByReviews(C_region,selectedText);
	    } else {

	        regionmainList = indexMapper.regionshowMainIndex(C_region);
	    }

	    if (regionmainList == null || regionmainList.isEmpty()) {
	        System.out.println("받아오는게 없음");
	    } else {
	        System.out.println("정상");
		    String hostName="";
	        String photo="";
	        session.removeAttribute("hostName");
        for (indexDTO mainshow : regionmainList) {
            System.out.println(mainshow.getHost_name());
            hostName = mainshow.getHost_name();
            photo = mainshow.getRepresentative_photo();
            System.out.println("hostName 출력하기 :"+hostName);
            System.out.println("hostP 출력하기 :"+photo);
       
	        session.setAttribute("hostName", hostName);
	        String imageDirectoryPath = "img\\";

			

			String fileName = photo;
		    String fileExtension = fileName.substring(fileName.length() - 3);
		    String imagePath="";


		    if (fileExtension.equalsIgnoreCase("JPG") || fileExtension.equalsIgnoreCase("jpg")) {
		        imagePath = imageDirectoryPath + fileName;
		    } else if (fileExtension.equalsIgnoreCase("PNG") || fileExtension.equalsIgnoreCase("png")) {
		        imagePath = imageDirectoryPath + fileName;
		    } else {
		        System.out.println("Unsupported image format: " + fileExtension);
		        continue;
		    }
		   System.out.println("Image path: " + imagePath);
		   imagePathList.add(imagePath); 
		   session.setAttribute("imagePath", imagePath);
	        }

	        session.setAttribute("hostName", hostName);
	        ArrayList<host_nameDTO> hostNameDto = indexMapper.su_dae(hostName);
	           for(host_nameDTO hnDTO : hostNameDto) {
	        	   System.out.println(hnDTO.getRoom_payDae());
	        	   
	            }  
	        model.addAttribute("hostNameDto", hostNameDto);
	        model.addAttribute("mainList", regionmainList);
	        model.addAttribute("imagePaths", imagePathList);
	        System.out.println(regionmainList);
	    }

	    return regionmainList;
	
	}
	
//	/** 이미지 설정*/
//	public void ImgSrcSetting (Model model) {
//		indexDTO indexDto = new indexDTO();
//		String imgSetting_RoomName = indexDto.getRoom_name();
//		
//		ArrayList<String> imgSrc = indexMapper.ImgSrcSetting(imgSetting_RoomName);
//
//		String imageDirectoryPath = "C:\\Users\\hi\\Desktop\\testimg\\";
//
//		// imgSrc에서 파일 이름을 가져와서 이미지의 src 경로 설정
//		for (String fileName : imgSrc) {
//			String fileExtension = fileName.substring(fileName.length() - 3);
//
//		    // 이미지 확장자 확인 및 이미지 파일의 실제 경로 조합
//		    String imagePath;
//		    if (fileExtension.equalsIgnoreCase("jpg")) {
//		        imagePath = imageDirectoryPath + fileName + ".jpg";
//		    } else if (fileExtension.equalsIgnoreCase("png")) {
//		        imagePath = imageDirectoryPath + fileName + ".png";
//		    } 
//		    else {
//		        // 지원하지 않는 확장자일 경우 처리
//		        System.out.println("Unsupported image format: " + fileExtension);
//		        continue;
//		    }
//
//		   
//		    System.out.println("imagePath src: " + imagePath);
//		    model.addAttribute("imagePath",imagePath);
//		
//		}
//	}
	
}

