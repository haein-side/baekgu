package com.baekgu.silvertown.business.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.baekgu.silvertown.business.model.dto.BusinessDTO;
import com.baekgu.silvertown.business.model.dto.HrDTO;
import com.baekgu.silvertown.business.model.serivce.BusinessService;

import net.coobird.thumbnailator.Thumbnails;




@WebServlet("/business/signup")
public class BusinessSignUpServlet extends HttpServlet {
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String hrId_1 = request.getParameter("hrId_1");
		
		String path = "/WEB-INF/views/business/main/signupB.jsp";
		
		request.getRequestDispatcher(path).forward(request, response);
		

		
		BusinessService service = new BusinessService();
		
		String result = service.chekId(hrId_1);
		
		System.out.println("dsafsdf" + result);
		
		PrintWriter out = response.getWriter();
		out.print(result);
		
		out.flush();
		out.close();
		

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
//		String imageRoot = "";
		if(ServletFileUpload.isMultipartContent(request)) {
			
			/* 이미지 경로 설정하기 */
			// WebContent 경로 설정하기
			String rootContext =  getServletContext().getRealPath("/");
			// 이미지 크기 설정
			int maxFileSize = 1024 * 1024 * 10;
			
			System.out.println("rootContext : "  + rootContext);
			// 파일 저장 경로 설정하기
			String imageFilesDirectory = rootContext + "RESOURCES/IMAGES/bLogos/";
			
			BusinessDTO business = null;
			HrDTO hr = null;
			
			Map<String, String> parameter = new HashMap<>();
			
			Map<String, String> fileMap = null;
			
			/* 파일을 업로드할 시 최대 크기나 임시 저장할 폴더의 경로 등을 포함하기 위한 인스턴스이다. */
			DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
	        fileItemFactory.setRepository(new File(imageFilesDirectory));
	        fileItemFactory.setSizeThreshold(maxFileSize);		
	        
	        /* 서블릿에서 기본 제공하는거 말고 꼭 commons fileupload 라이브러이에 있는 클래스로 임포트 해야 한다. */
	        ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
	        
	        
	        try {
	        	// request 를 파싱해서 FileIte으로 변환
				List<FileItem> fileItems = fileUpload.parseRequest(request);
					
				// fileItems 리스트안에 파일 꺼내오기
				for(int i = 0; i < fileItems.size(); i++) {
					FileItem item = fileItems.get(i);
				
					// 폼 데이터 이면 true 파일 데이터면 false 를 반환
					if(!item.isFormField()) {
						
						// 파일의 크기가 0이상일 시에만 파일을 저장한다.
						if(item.getSize() > 0) {
							
							String fileName = item.getFieldName();
							String originFileName = item.getName();
							
							System.out.println("fileName : " + fileName);
							System.out.println("originName : " + originFileName);
							
							// . 의 위치를 변수에 담는다
							int dot = originFileName.lastIndexOf(".");
							System.out.println("dot : " + dot);
							
							// . 이후의 확장자 명을 변수에 담는다
							String ext = originFileName.substring(dot);
							System.out.println("ext : " + ext);
							
							// 파일 이름들을 랜덤으로 만든다 (중복을 피하게 위해) 
							String randomFileName = UUID.randomUUID().toString().replace("-","")+ ext;
							
							/* 저장할 파일의 경로와 이름을 담을 객체를 생성 */
							File storeFile = new File(imageFilesDirectory + "/" + randomFileName);
							
							item.write(storeFile);
							System.out.println("오셨어요???");
							
							
							/* 필요한 정보를 Map에 담는다. */
							fileMap = new HashMap<>();
							fileMap.put("filedName", fileName);
							fileMap.put("originFileName", originFileName);
							fileMap.put("savedFileName", randomFileName);
							fileMap.put("savePath", imageFilesDirectory);
							
							/* 제목 사진과 나머지 사진을 구분하고 썸네일도 생성한다. */
							int width = 0;
							int height = 0;
			
								
							/* 썸네일로 변환 할 사이즈를 지정한다. */
														
							width = 120;
							height = 100;
							
							/* 썸네일로 변환 후 저장한다. */
							Thumbnails.of(imageFilesDirectory + randomFileName)
									.size(width, height)
									.toFile(rootContext + "RESOURCES/UPLOAD/THUMBNAIL/" + "thumbnail_" + randomFileName);
							
							/* 나중에 웹서버에서 접근 가능한 경로 형태로 썸네일의 저장 경로도 함께 저장한다. */
							fileMap.put("thumbnailPath", "/resources/upload/thumbnail/thumbnail_" + randomFileName);
							
						}
						
					} else {
						/* 폼 데이터인 경우 */
						/* 전송된 폼의 name은 getFiledName()으로 받아오고, 해당 필드의 value는 getString()으로 받아온다. 
						 * 하지만 인코딩 설정을 하더라도 전송되는 파라미터는 ISO-8859-1로 처리된다.
						 * 별도로 ISO-8859-1로 해석된 한글을 UTF-8로 변경해주어야 한다.
						 * */
//						parameter.put(item.getFieldName(), item.getString());
						parameter.put(item.getFieldName(), new String(item.getString().getBytes("ISO-8859-1"), "UTF-8"));
						
					}
					
				}
				
				// map에 담긴 기업 값 가져오기
				String bName =  parameter.get("bName");
				String bNumber = parameter.get("businessNo");
				String bPhone = parameter.get("bPhone");
				String bOwner = parameter.get("ownerName");
				String bLogo = fileMap.get("thumbnailPath");
				int bType = Integer.parseInt(parameter.get("BC"));
				Long profit = Long.parseLong(parameter.get("profit"));
				String bAddress = parameter.get("zipCode").replace(" ", "") + "&" + parameter.get("address1").replace(" ", "") + "&" + parameter.get("address2").replace(" ", "");
				
				
				business = new BusinessDTO();
				
				business.setbName(bName);
				business.setbNumber(bNumber);
				business.setbPhone(bPhone);
				business.setbOwner(bOwner);
				business.setProfit(profit);
				business.setbLogo(bLogo);
				business.setbCategoryCode(bType);
				business.setbAddress(bAddress);
				
				// map 에 담긴 담당자 값 가져오기

				String hrId = parameter.get("hrId");
				String hrPwd = parameter.get("enteredPwd");
				String hrName = parameter.get("hrName");
				String hrPhone = parameter.get("hrPhone");
				String hrEmail = parameter.get("hrEmail");
				
				hr = new HrDTO();
				
				hr.setHrId(hrId);
				hr.setHrPwd(hrPwd);
				hr.setHrName(hrName);
				hr.setHrPhone(hrPhone);
				hr.setHrEmail(hrEmail);
				
				

				
			} catch (Exception e) {
				e.printStackTrace();
			} 
	        
		

		
		BusinessService service = new BusinessService();
		
		int result = service.insertNewBusiness(business, hr);
		
		if(result > 0 ) {
			
			response.sendRedirect(request.getContextPath() + "/business/login");
			
		}
		
		}

	}

}
