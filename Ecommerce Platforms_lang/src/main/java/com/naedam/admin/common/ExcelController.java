package com.naedam.admin.common;

import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.naedam.admin.member.model.service.MemberService;
import com.naedam.admin.member.model.vo.MemberAccessHistoryListExcelForm;
import com.naedam.admin.member.model.vo.MemberListExcelForm;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/excel")
@Slf4j
public class ExcelController {
	
	@Autowired
	private MemberService memberService;
	
	private static final int WIDTH = 2800;

	private final String[] memberListHeader = {"아이디", "이름", "휴대폰", "이메일", "주소", "메모", "등급", "상태", "최근 접속일", "수정일자", "등록일자"};
	private final String[] memberAccessHistoryListHeader = {"아이디", "이름", "접속 IP", "상태", "일시"};
	
	
	@PostMapping("/download.do")
	public void excelDownload(HttpServletResponse response, HttpServletRequest request) throws Exception {
		String type = request.getParameter("download_type");
		String searchType = request.getParameter("search_type");
		
		List<String> excelHeader = null;
		List<Object> excelContentList = new ArrayList<Object>(); 
		List<Object> excelContentList2 = new ArrayList<Object>();
		List<Object> excelContentList3 = new ArrayList<Object>();
		Workbook wb = new XSSFWorkbook();
		Sheet sheet = null;
		String fileName = "";
		
		String memberId = "";
		if(searchType != null && searchType != "") { // 특정 회원 조회
			int memberNo = Integer.parseInt(searchType);
			memberId = memberService.selectMemberIdByNo(memberNo);
		}
		
		Object[] data = null;
		
		// 주문 리스트 엑셀 다운로드
		if(type.equals("memberList")) {
			excelHeader = Arrays.asList(memberListHeader);
			sheet = wb.createSheet("member_list");
			fileName += "member_list_" + dateCode();
			List<MemberListExcelForm> MemberListExcelFormList = memberService.selectMemberListExcelForm();
			for(MemberListExcelForm p : MemberListExcelFormList) {
				excelContentList2.add(p);
			}
		}else if(type.equals("memberAccessHistoryList")) {
			excelHeader = Arrays.asList(memberAccessHistoryListHeader);
			sheet = wb.createSheet("member_access_history_list");
			fileName += "member_access_history_list_" + dateCode();
			List<MemberAccessHistoryListExcelForm> MemberAccessHistoryListExcelFormList = memberService.selectMemberAccessHistoryListExcelForm();
			for(MemberAccessHistoryListExcelForm p : MemberAccessHistoryListExcelFormList) {
				excelContentList2.add(p);
			}
		}

		Row row = null;
		Cell cell = null;
		int rowNum = 0;

		
		// header
		row = sheet.createRow(rowNum++);
		for(int i = 0; i < excelHeader.size(); i++) {
			sheet.setHorizontallyCenter(true);
			cell = row.createCell(i);
			cell.setCellValue(excelHeader.get(i));
		}
		// body
		for(Object vo : excelContentList) {
			int cnt = 0;
			row = sheet.createRow(rowNum++);
		    try{
		        Object obj = vo;
		        for (Field field : obj.getClass().getDeclaredFields()){
		            field.setAccessible(true);
		            Object value = field.get(obj);
		            
		            if(!field.getName().equals("serialVersionUID")) {
		            	
		            	// Date타입 ==> String으로 캐스팅
		            	if(value instanceof Date) {
		            		value = castDate((Date) value);
		            		log.debug("value = {}", value);
		            	}
		            	// 셀 너비 자동 조절
		    			sheet.autoSizeColumn(cnt);
		    		    sheet.setColumnWidth(cnt, (sheet.getColumnWidth(cnt))+(short)1024);
			            // 데이터 작성
		    		    cell = row.createCell(cnt);
			            cell.setCellValue(String.valueOf(value));
			            cnt++;
		            }
		        }
		    }catch (Exception e){
		    	e.printStackTrace();
		    }
		}

		
		// body
		for(Object vo : excelContentList2) {
			int cnt = 0;
			row = sheet.createRow(rowNum++);
		    try{
		        Object obj = vo;
		        for (Field field : obj.getClass().getDeclaredFields()){
		            field.setAccessible(true);
		            Object value = field.get(obj);
		            
		            if(!field.getName().equals("serialVersionUID")) {
		            	
		            	// Date타입 ==> String으로 캐스팅
		            	if(value instanceof Date) {
		            		value = memberDate((Date) value);
		            		log.debug("value = {}", value);
		            	}
		            	// 셀 너비 자동 조절
		    			sheet.autoSizeColumn(cnt);
		    		    sheet.setColumnWidth(cnt, (sheet.getColumnWidth(cnt))+(short)1024);
			            // 데이터 작성
		    		    cell = row.createCell(cnt);
			            cell.setCellValue(String.valueOf(value));
			            cnt++;
		            }
		        }
		    }catch (Exception e){
		    	e.printStackTrace();
		    }
		}
	
		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		fileName += ".xlsx";
		response.setHeader("content-Disposition", "attachment;filename=" + fileName);
		
		// Excel file output
		wb.write(response.getOutputStream());
		wb.close();
		
	}
	
	private String dateCode() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
		Date now = new Date();
		
		return sdf.format(now);
	}
	private String castDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
		return sdf.format(date);
	}
	private String memberDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		return sdf.format(date);
	}
}
