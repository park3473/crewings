package egovframework.sample.admin.exam.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.Row.MissingCellPolicy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.system.util.SUtil;

import egovframework.sample.admin.exam.model.AdminExamVo;
import egovframework.sample.admin.exam.service.AdminExamService;
import egovframework.sample.admin.question.model.AdminQuestionListVo;

@Controller
public class AdminExamController {

	@Autowired
	AdminExamService adminExamService;

	
	//EXAM
	@RequestMapping(value="/admin/exam/list.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamListGet(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , HttpServletRequest request , HttpServletResponse response) {
		
		System.out.println("PAGE : " + AdminExamVo.getPAGE());
		System.out.println("ITEM_COUNT : " + AdminExamVo.getITEM_COUNT());
		
		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
		
		AdminExamVo.setPAGE(Integer.parseInt(PAGE));
		AdminExamVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		int pagelimit = AdminExamVo.getPAGE() * AdminExamVo.getITEM_COUNT();
		
		AdminExamVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		AdminExamVo.setOFFSET(pagelimit);
		
		ModelMap model = new ModelMap();
		
		model = adminExamService.getAllList(AdminExamVo);
		
		model.put("before", AdminExamVo);
		
		return new ModelAndView("admin/exam/list" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/exam/insert.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamInsertGet(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminExamService.getExamCategoryAllList();
		
		return new ModelAndView("admin/exam/insert" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/exam/insert.do", method = RequestMethod.POST )
	public void AdminExamInsertPost(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , MultipartHttpServletRequest request , HttpServletResponse response) throws IOException {
		
		//파일 등록
		String drv = request.getRealPath("");
		drv = drv.substring(0 , drv.length()) + "./resources/" + ((HttpServletRequest) request).getContextPath() + "/upload/exam/image/";
				
		String filename = SUtil.setFileUpload(request, drv);
		
		AdminExamVo.setImage(filename);
		
		adminExamService.setAdminExamData(AdminExamVo , "insert");
		
		SUtil.AlertAndPageMove(response, "해당 자가진단이 등록되었습니다.", "/admin/exam/list.do");
	
	}
	
	@RequestMapping(value="/admin/exam/update.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamUpdateGet(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminExamService.getExamView(AdminExamVo);
		
		return new ModelAndView("admin/exam/update" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/exam/update.do", method = RequestMethod.POST)
	public void AdminExamUpdatePost(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo ,  MultipartHttpServletRequest  request , HttpServletResponse response) throws IOException {
		
		if(AdminExamVo.getImage_change_bool().equals("true")) {
			//파일 등록
			String drv = request.getRealPath("");
			drv = drv.substring(0 , drv.length()) + "./resources/" + ((HttpServletRequest) request).getContextPath() + "/upload/exam/image/";
					
			String filename = SUtil.setFileUpload(request, drv);
			
			AdminExamVo.setImage(filename);
		}
		
		adminExamService.setAdminExamData(AdminExamVo , "update");
		
		SUtil.AlertAndPageMove(response, "해당 자가진단이 수정되었습니다.", "/admin/exam/list.do");
		
	}
	
	@RequestMapping(value="/admin/exam/delete.do" , method = RequestMethod.POST)
	public void AdminExamDeletePost(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		//자가진단 폼 삭제 (해당 자가진단 참가한 인원 있을시 삭제 X)
		adminExamService.setAdminExamData(AdminExamVo, "delete");
		
		//해당 문항 및 답안 삭제
		SUtil.AlertAndPageMove(response, "해당 자가진단이 삭제 되었습니다.", "/admin/exam/list.do");
	}
	
	@RequestMapping(value="/admin/exam/status.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamStatusData(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , HttpServletRequest request , HttpServletResponse response){
		
		ModelMap model = new ModelMap();
	
		model = adminExamService.getStatusData(AdminExamVo);
		
		model.put("before", AdminExamVo);
		
		return new ModelAndView( "admin/exam/status" , "model" , model);
		
	}
	
	
	//QUESTION_LIST 부분
	@RequestMapping(value="/admin/exam/question_list.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamQuestionList(@ModelAttribute("AdminQuestionListVo")AdminQuestionListVo AdminQuestionListVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminExamService.getQuestionList(AdminQuestionListVo);
		
		model.put("exam_idx", AdminQuestionListVo.getExam_idx());
		
		String category = request.getParameter("category") != null ? request.getParameter("category") : "0";
		
		model.put("category", category);
		
		return new ModelAndView("admin/exam/question_list" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/exam/question_list/insert.do" , method = RequestMethod.POST)
	public void AdminExamQuestionListInsert(@ModelAttribute("AdminQuestionListVo")AdminQuestionListVo AdminQuestionListVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminExamService.setAdminExamQuestionList(AdminQuestionListVo , "insert");
		
	}
	
	@RequestMapping(value="/admin/exam/question_list/update.do" , method = RequestMethod.POST)
	public void AdminExamQuestionListUpdate(@ModelAttribute("AdminQuestionListVo")AdminQuestionListVo AdminQuestionListVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminExamService.setAdminExamQuestionList(AdminQuestionListVo , "update");
		
	}
	
	@RequestMapping(value="/admin/exam/question_list/delete.do" , method = RequestMethod.POST)
	public void AdminExamQuestionListDelete(@ModelAttribute("AdminQuestionListVo")AdminQuestionListVo AdminQuestionListVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminExamService.setAdminExamQuestionList(AdminQuestionListVo , "delete");
		
	}
	
	@RequestMapping(value="/admin/question/coment.do" , method = RequestMethod.POST)
	public void AdminQuestionComentPost(@ModelAttribute("AdminQuestionListVo")AdminQuestionListVo AdminQuestionListVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminExamService.setAdminExamQuestionListComent(AdminQuestionListVo);
		
	}
	
	@RequestMapping(value="/admin/question_list/sort.do" , method = RequestMethod.POST)
	public void AdminQuestionSortList(@ModelAttribute("AdminQuestionListVo")AdminQuestionListVo AdminQuestionListVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminExamService.setAdminExamQuestionSort(AdminQuestionListVo);
		
	}
	
	@RequestMapping(value="/admin/exam/result/list.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamResultListGet(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , HttpServletRequest request , HttpServletResponse response) {
		
		System.out.println("PAGE : " + AdminExamVo.getPAGE());
		System.out.println("ITEM_COUNT : " + AdminExamVo.getITEM_COUNT());
		
		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
		
		AdminExamVo.setPAGE(Integer.parseInt(PAGE));
		AdminExamVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		int pagelimit = AdminExamVo.getPAGE() * AdminExamVo.getITEM_COUNT();
		
		AdminExamVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		AdminExamVo.setOFFSET(pagelimit);
		
		ModelMap model = new ModelMap();
		
		model = adminExamService.getResultAllList(AdminExamVo);
		
		model.put("before", AdminExamVo);
		
		return new ModelAndView("admin/exam/Resultlist" , "model" , model);
		
	}
	
	//최종 출력문 다운로드
	@RequestMapping(value="/admin/exam/result/FinalExcelDown.do" , method = RequestMethod.GET)
	public void AdminExamResultExcelDownTotal(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , HttpServletRequest request , HttpServletResponse response) {
		
		
		
	}
	
	@RequestMapping(value="/admin/exam/result/ExcelDown.do" , method = RequestMethod.GET)
	public void AdminExamResultExcelDown(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , HttpServletRequest request , HttpServletResponse response) throws UnsupportedEncodingException {
		
		System.out.println("--excelDownStart--");
		
		ModelMap model = new ModelMap();
		
		model = adminExamService.getExamExcelAll(AdminExamVo);
		
		List<HashMap> questionList = (List<HashMap>) model.get("question");
		
		List<HashMap> resultList = (List<HashMap>) model.get("result");
		
		List<HashMap> dataList = (List<HashMap>) model.get("datalist");
		
		Workbook workbook = new HSSFWorkbook();
		
		Sheet sheet = workbook.createSheet("문항 리스트");
		
		// 헤더 스타일 생성
        CellStyle headerStyle = workbook.createCellStyle();
        headerStyle.setAlignment(HorizontalAlignment.CENTER);
        headerStyle.setFillForegroundColor(IndexedColors.SKY_BLUE.getIndex());
        headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		
        Font font = workbook.createFont();
        font.setBold(true);
        font.setFontHeightInPoints((short) 12);
        headerStyle.setFont(font);
        
        // 바디 스타일 생성
        CellStyle bodyStyle = workbook.createCellStyle();
        bodyStyle.setAlignment(HorizontalAlignment.CENTER);
        
        // 헤더 생성
        String[] headers = {"문항 순서", "문항 제목", "문항 타입", "선택지 갯수", "선택지"};
        Row headerRow = sheet.createRow(0);
        for (int i = 0; i < headers.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(headers[i]);
            cell.setCellStyle(headerStyle);
        }
        
        // 데이터 채우기
        int rowIndex = 1;
        
        for (HashMap<String, Object> question : questionList) {
        	
        	Row row = sheet.createRow(rowIndex++);

            
            // "문항 순서"는 엑셀 파일 내의 순서를 반영
            row.createCell(0).setCellValue(rowIndex - 1);
            row.createCell(1).setCellValue(String.valueOf(question.getOrDefault("name", "")));
            // "문항 타입" 변환
            String selectType = "";
            switch (String.valueOf(question.getOrDefault("select_type", ""))) {
                case "1":
                    selectType = "객관식";
                    break;
                case "2":
                    selectType = "체크박스";
                    break;
                case "3":
                    selectType = "답변형";
                    break;
            }
            row.createCell(2).setCellValue(selectType);
            // "선택지 갯수"와 "선택지 리스트"
            row.createCell(3).setCellValue(String.valueOf(question.getOrDefault("select_count", "")));
            String choicesStr = String.valueOf(question.getOrDefault("Choices", ""));

            String[] choicesArr = choicesStr.split("#");

            // 결과 문자열을 저장할 StringBuilder 객체를 생성합니다.
            StringBuilder formattedChoices = new StringBuilder();

            // 분리된 선택지 정보를 순회하면서 번호를 붙여 문자열을 구성합니다.
            for (int i = 0; i < choicesArr.length; i++) {
                // i + 1은 선택지 앞에 붙일 순서 번호입니다.
                formattedChoices.append(i + 1).append(". ").append(choicesArr[i]);
                // 마지막 선택지가 아니라면 공백을 추가합니다.
                if (i < choicesArr.length - 1) {
                    formattedChoices.append(" ");
                }
            }

            // 엑셀 셀에 구성된 문자열을 기록합니다.
            row.createCell(4).setCellValue(formattedChoices.toString());
            
            
        }
        
        // 제목행에만 배경색 스타일 적용
        Row headerRow1 = sheet.getRow(0); // 0번째 행이 제목행이라고 가정
        if (headerRow1 != null) {
            for (int cellNum = 0; cellNum < headerRow1.getLastCellNum(); cellNum++) {
                Cell cell = headerRow1.getCell(cellNum, MissingCellPolicy.CREATE_NULL_AS_BLANK);
                cell.setCellStyle(headerStyle);
            }
        }
        
        // 열 너비 자동 조정
        for (int i = 0; i < headers.length; i++) {
            sheet.autoSizeColumn(i , true);
            int width = sheet.getColumnWidth(i);
            sheet.setColumnWidth(i, width + 1024);
        }
        
        // 두 번째 시트 생성
        Sheet sheet2 = workbook.createSheet("응답자");
        // 헤더 생성
        // 헤더 생성
        String[] headers2 = {"번호","결과 리스트"};
        Row headerRow11 = sheet2.createRow(0);
        for (int i = 0; i < headers2.length; i++) {
            Cell cell = headerRow11.createCell(i);
            cell.setCellValue(headers2[i]);
            cell.setCellStyle(headerStyle);
        }
        
        // 데이터 채우기
        int rowIndex1 = 1;
        
        for (HashMap<String, Object> result : resultList) {
            Row row = sheet2.createRow(rowIndex1++);
            // "문항 순서"는 엑셀 파일 내의 순서를 반영
            row.createCell(0).setCellValue(rowIndex1 - 1);
            row.createCell(1).setCellValue(String.valueOf(result.getOrDefault("inquiries", "")));
            
        }
        
        // 제목행에만 배경색 스타일 적용
        Row headerRow111 = sheet2.getRow(0); // 0번째 행이 제목행이라고 가정
        if (headerRow111 != null) {
            for (int cellNum = 0; cellNum < headerRow11.getLastCellNum(); cellNum++) {
                Cell cell = headerRow111.getCell(cellNum, MissingCellPolicy.CREATE_NULL_AS_BLANK);
                cell.setCellStyle(headerStyle);
            }
        }

        // 중앙 정렬 스타일 생성
        CellStyle centerAlignStyle1 = workbook.createCellStyle();
        centerAlignStyle1.setAlignment(HorizontalAlignment.CENTER);
        centerAlignStyle1.setVerticalAlignment(VerticalAlignment.CENTER);
        
        // 열 너비 자동 조정
        for (int i = 0; i < headers2.length; i++) {
            sheet2.autoSizeColumn(i , true);
            int width = sheet2.getColumnWidth(i);
            sheet2.setColumnWidth(i, width + 1024);
        }
        
        List<HashMap<String, Object>> questionList1 = (List<HashMap<String, Object>>) model.get("question");
        List<HashMap<String, Object>> dataList1 = (List<HashMap<String, Object>>) model.get("datalist");
        
        int titleNum = 1;
	     // 문제 리스트를 반복 처리
	        for (HashMap question : questionList1) {
	        	
	        	String questionTitle = String.valueOf(question.getOrDefault("name",""));
	            Sheet sheet3 = workbook.createSheet(titleNum+"번 문항");  // 시트 이름 설정

	            Map<String, Map<String, Map<String, Integer>>> dataMap = processData(question, dataList1);
	            createSheetWithData(sheet3, dataMap);
	        	
	            titleNum += 1;
	            
	            for (int i = 0; i < 8; i++) {
		            sheet3.autoSizeColumn(i , true);
		            int width = sheet3.getColumnWidth(i);
		            sheet3.setColumnWidth(i, width + 1024);
		        }
	            
	            System.out.println(titleNum + "번 문항 종료");
	            
	            
        }
        
        // 컨텐츠 타입과 파일명 지정

	    response.setContentType("ms-vnd/excel");
	    String excel_name_is = "설문결과물";
	    AdminExamVo vo = (AdminExamVo) model.get("view");
	    System.out.println("name : " + vo.getName());
	    String Name = vo.getName();
	    excel_name_is = Name + "_" + excel_name_is;
	    excel_name_is = URLEncoder.encode(excel_name_is,"UTF-8");
	    response.setHeader("Content-Disposition", "attachment;filename="+excel_name_is+".xls");
        
	    // 엑셀 출력
		   
	    try {
	    	workbook.write(response.getOutputStream());
	    	workbook.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
	}
	
	private void createSheetWithData(Sheet sheet, Map<String, Map<String, Map<String, Integer>>> dataMap) {
        // Create header
        Row header = sheet.createRow(0);
        createHeader(header);

        int rowIdx = 1;
        for (String region : dataMap.keySet()) {
            for (String answer : dataMap.get(region).keySet()) {
                Row row = sheet.createRow(rowIdx++);
                int cellIdx = 0;
                row.createCell(cellIdx++).setCellValue(region);
                row.createCell(cellIdx++).setCellValue(answer);

                Map<String, Integer> demographics = dataMap.get(region).get(answer);
                int total = 0;
                for (Integer count : demographics.values()) {
                    total += count;
                }
                row.createCell(cellIdx++).setCellValue(total);
                row.createCell(cellIdx++).setCellValue(total > 0 ? "100%" : "0%"); // Assuming total for region and answer is 100%

                for (Map.Entry<String, Integer> entry : demographics.entrySet()) {
                    String key = entry.getKey();
                    Integer count = entry.getValue();
                    row.createCell(cellIdx++).setCellValue(key + ": " + count);
                }
            }
        }
    }

    private void createHeader(Row header) {
        String[] headers = {"Region", "Answer", "Count", "Percentage", "Details"};
        for (int i = 0; i < headers.length; i++) {
            Cell cell = header.createCell(i);
            cell.setCellValue(headers[i]);
        }
    }

    private Map<String, Map<String, Map<String, Integer>>> processData(HashMap<String, Object> question, List<HashMap<String, Object>> dataList) {
        Map<String, Map<String, Map<String, Integer>>> result = new HashMap<String, Map<String, Map<String, Integer>>>();
        String[] choices = ((String) question.get("Choices")).split("#");

        for (HashMap<String, Object> data : dataList) {
            String region = (String) data.get("address_local");
            String selectList = (String) data.get("select_list");
            String[] selectedIndices = selectList.split(",");
            for (String index : selectedIndices) {
                int idx = Integer.parseInt(index.trim()) - 1;
                if (idx < 0 || idx >= choices.length) continue;
                String choice = choices[idx];
                String gender = (String) data.get("sex");
                int schoolYear = Integer.parseInt((String) data.get("school_year"));
                String demographicKey = "Grade " + schoolYear + " " + gender;

                if (!result.containsKey(region)) {
                    result.put(region, new HashMap<String, Map<String, Integer>>());
                }
                if (!result.get(region).containsKey(choice)) {
                    result.get(region).put(choice, new HashMap<String, Integer>());
                }
                if (!result.get(region).get(choice).containsKey(demographicKey)) {
                    result.get(region).get(choice).put(demographicKey, 0);
                }

                int currentCount = result.get(region).get(choice).get(demographicKey);
                result.get(region).get(choice).put(demographicKey, currentCount + 1);
            }
        }

        return result;
    }

	
}
