package egovframework.sample.admin.exam.controller;

import java.awt.GraphicsEnvironment;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Chart;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Picture;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.charts.ChartDataSource;
import org.apache.poi.ss.usermodel.charts.ChartLegend;
import org.apache.poi.ss.usermodel.charts.DataSources;
import org.apache.poi.ss.usermodel.charts.LegendPosition;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.util.IOUtils;
import org.apache.poi.xddf.usermodel.chart.ChartTypes;
import org.apache.poi.xddf.usermodel.chart.XDDFChartData;
import org.apache.poi.xddf.usermodel.chart.XDDFChartLegend;
import org.apache.poi.xddf.usermodel.chart.XDDFDataSource;
import org.apache.poi.xddf.usermodel.chart.XDDFDataSourcesFactory;
import org.apache.poi.xddf.usermodel.chart.XDDFNumericalDataSource;
import org.apache.poi.xddf.usermodel.chart.XDDFPieChartData;
import org.apache.poi.xssf.usermodel.XSSFChart;
import org.apache.poi.xssf.usermodel.XSSFDrawing;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtils;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.PieSectionLabelGenerator;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.general.DefaultPieDataset;
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
	
	//최종 출력문 다운로드
	@RequestMapping(value="/admin/exam/result/final.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamResultExcelDownTotal(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , HttpServletRequest request , HttpServletResponse response) {
			
		ModelMap model = new ModelMap();
			
		model = adminExamService.getExamFinalAll(AdminExamVo);
			
		return new ModelAndView("admin/exam/final" , "model" , model);
			
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

	
	@RequestMapping(value="/admin/exam/result/ExcelDown.do" , method = RequestMethod.GET)
	public void AdminExamResultExcelDown(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		System.out.println("--excelDownStart--");
		
		ModelMap model = new ModelMap();
		
		model = adminExamService.getExamExcelAll(AdminExamVo);
		
		List<HashMap> questionList = (List<HashMap>) model.get("question");
		
		List<HashMap> resultList = (List<HashMap>) model.get("result");
		
		//List<HashMap> dataList = (List<HashMap>) model.get("datalist");
		
		Workbook workbook = new XSSFWorkbook();
		
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
        
        /*
        List<HashMap<String, Object>> questionList1 = (List<HashMap<String, Object>>) model.get("question");
        List<HashMap<String, Object>> dataList1 = (List<HashMap<String, Object>>) model.get("datalist");
        
        // 문항별 시트 생성
        int sheetIndex = 1;
        for (int i = 0; i < questionList1.size(); i++) {
            HashMap<String, Object> question = questionList1.get(i);
            String sheetName = sheetIndex + "번 문항";
            XSSFSheet sheet3 = (XSSFSheet) workbook.createSheet(sheetName);
            setupSheetHeader(sheet3);
            fillSheetWithData(sheet3, question, dataList1, i); // 데이터 집계 및 입력
            int statsStartRow = addOverallStatistics(sheet3, question, dataList1, i); // 전체 통계 추가, 시작 행 반환
            addPieChart((XSSFWorkbook) workbook, sheet3, statsStartRow , dataList1 , i , question); // 파이 차트 추가
            sheetIndex++;
        }
		*/

        
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
	
	// 3시트 헤더 설정
	private void setupSheetHeader(XSSFSheet sheet) {
	    Row headerRow1 = sheet.createRow(0);
	    Row headerRow2 = sheet.createRow(1);

	    // 첫 번째 행 (병합 헤더)
	    sheet.addMergedRegion(new CellRangeAddress(0, 1, 0, 0)); // 지역
	    sheet.addMergedRegion(new CellRangeAddress(0, 1, 1, 1)); // 답변
	    sheet.addMergedRegion(new CellRangeAddress(0, 1, 2, 2)); // 인원
	    sheet.addMergedRegion(new CellRangeAddress(0, 1, 3, 3)); // 백분율

	    // 헤더 셀 설정
	    headerRow1.createCell(0).setCellValue("지역");
	    headerRow1.createCell(1).setCellValue("답변");
	    headerRow1.createCell(2).setCellValue("인원");
	    headerRow1.createCell(3).setCellValue("%");

	    // 학년 및 성별 헤더
	    String[] grades = {"초4", "초5", "초6"};
	    int cellIndex = 4;
	    for (String grade : grades) {
	        headerRow1.createCell(cellIndex).setCellValue(grade);
	        headerRow2.createCell(cellIndex).setCellValue("남");
	        headerRow2.createCell(cellIndex + 1).setCellValue("여");
	        sheet.addMergedRegion(new CellRangeAddress(0, 0, cellIndex, cellIndex + 1));
	        cellIndex += 2;
	    }
	}


	// 데이터 집계 및 입력
	private void fillSheetWithData(Sheet sheet, HashMap<String, Object> question, List<HashMap<String, Object>> dataList, int questionIndex) {
	    String[] choices = question.get("Choices").toString().split("#");
	    Map<String, Map<String, Integer[]>> regionChoicesMap = new TreeMap<String, Map<String, Integer[]>>();

	    // 초기화: 모든 지역 및 선택지 조합의 카운트를 0으로 설정
	    for (HashMap<String, Object> data : dataList) {
	        String region = data.get("address_local").toString();
	        if (!regionChoicesMap.containsKey(region)) {
	            Map<String, Integer[]> choiceMap = new LinkedHashMap<String, Integer[]>();
	            for (String choice : choices) {
	                choiceMap.put(choice, new Integer[]{0, 0, 0, 0, 0, 0}); // 모든 선택지를 0으로 초기화 (초4 남, 초4 여, 초5 남, 초5 여, 초6 남, 초6 여)
	            }
	            regionChoicesMap.put(region, choiceMap);
	        }
	    }

	    // 데이터 집계
	    for (HashMap<String, Object> data : dataList) {
	        String region = data.get("address_local").toString();
	        String[] selectedIndices = data.get("select_list").toString().split(",");
	        if (selectedIndices.length > questionIndex) {
	            int index = Integer.parseInt(selectedIndices[questionIndex].trim()) - 1;
	            if (index >= 0 && index < choices.length) {
	                String choice = choices[index];
	                Map<String, Integer[]> choiceMap = regionChoicesMap.get(region);
	                int genderIndex = Integer.parseInt(data.get("school_year").toString()) - 4;
	                genderIndex = genderIndex * 2 + (data.get("sex").toString().equals("남자") ? 0 : 1);
	                choiceMap.get(choice)[genderIndex]++;
	            }
	        }
	    }

	    // 데이터 입력
	    int rowIndex = 2; // 헤더 다음 행부터 시작
	    for (Map.Entry<String, Map<String, Integer[]>> regionEntry : regionChoicesMap.entrySet()) {
	        int totalResponses = 0;
	        for (Integer[] counts : regionEntry.getValue().values()) {
	            for (int count : counts) {
	                totalResponses += count;
	            }
	        }
	        for (Map.Entry<String, Integer[]> choiceEntry : regionEntry.getValue().entrySet()) {
	            Row row = sheet.createRow(rowIndex++);
	            row.createCell(0).setCellValue(regionEntry.getKey()); // 지역
	            row.createCell(1).setCellValue(choiceEntry.getKey()); // 답변
	            Integer[] counts = choiceEntry.getValue();
	            int sumCounts = 0;
	            for (int count : counts) sumCounts += count;
	            row.createCell(2).setCellValue(sumCounts); // 인원 총계
	            double percentage = totalResponses > 0 ? (double) sumCounts / totalResponses * 100 : 0;
	            row.createCell(3).setCellValue(String.format("%.2f%%", percentage)); // 백분율
	            int cellIndex = 4;
	            for (int count : counts) {
	                row.createCell(cellIndex++).setCellValue(count); // 초4 남, 초4 여, 초5 남, 초5 여, 초6 남, 초6 여 각각의 값 입력
	            }
	        }
	    }
	}

	private int addOverallStatistics(XSSFSheet sheet, HashMap<String, Object> question, List<HashMap<String, Object>> dataList, int questionIndex) {
	    String[] choices = question.get("Choices").toString().split("#");
	    Map<String, Integer[][]> overallStats = new LinkedHashMap<>();

	    // 초기화
	    for (String choice : choices) {
	        Integer[][] statsByGenderAndGrade = new Integer[3][2]; // 각 학년별 남자, 여자 데이터를 위한 2차원 배열
	        for (int grade = 0; grade < 3; grade++) {
	            for (int gender = 0; gender < 2; gender++) {
	                statsByGenderAndGrade[grade][gender] = 0;
	            }
	        }
	        overallStats.put(choice, statsByGenderAndGrade);
	    }

	    // 데이터 집계
	    for (HashMap<String, Object> data : dataList) {
	        String[] selectedIndices = data.get("select_list").toString().split(",");
	        if (selectedIndices.length > questionIndex) {
	            int index = Integer.parseInt(selectedIndices[questionIndex].trim()) - 1;
	            if (index >= 0 && index < choices.length) {
	                String choice = choices[index];
	                int gradeIndex = Integer.parseInt(data.get("school_year").toString()) - 4;
	                int genderIndex = data.get("sex").toString().equals("남자") ? 0 : 1;
	                overallStats.get(choice)[gradeIndex][genderIndex]++;
	            }
	        }
	    }

	    // 헤더 설정 및 데이터 입력
	    int startRow = sheet.getLastRowNum() + 1; // 마지막 사용된 행 다음에 헤더를 추가
	    Row headerRow1 = sheet.createRow(startRow);
	    Row headerRow2 = sheet.createRow(startRow + 1);

	    // 병합 헤더 설정
	    sheet.addMergedRegion(new CellRangeAddress(startRow, startRow + 1, 0, 0)); // "답변"
	    sheet.addMergedRegion(new CellRangeAddress(startRow, startRow + 1, 1, 1)); // "인원"
	    sheet.addMergedRegion(new CellRangeAddress(startRow, startRow + 1, 2, 2)); // "백분율"

	    headerRow1.createCell(0).setCellValue("답변");
	    headerRow1.createCell(1).setCellValue("인원");
	    headerRow1.createCell(2).setCellValue("백분율");

	    // 학년 및 성별 헤더
	    String[] grades = {"초4", "초5", "초6"};
	    int cellIndex = 3;
	    for (String grade : grades) {
	        headerRow1.createCell(cellIndex).setCellValue(grade);
	        headerRow2.createCell(cellIndex).setCellValue("남");
	        headerRow2.createCell(cellIndex + 1).setCellValue("여");
	        sheet.addMergedRegion(new CellRangeAddress(startRow, startRow, cellIndex, cellIndex + 1));
	        cellIndex += 2;
	    }

	    // 선택지별 데이터 입력
	    int rowIndex = startRow + 2; // 데이터 입력을 시작할 행
	    for (Map.Entry<String, Integer[][]> entry : overallStats.entrySet()) {
	        Row row = sheet.createRow(rowIndex++);
	        row.createCell(0).setCellValue(entry.getKey());
	        Integer[][] counts = entry.getValue();
	        int sumCounts = 0;
	        for (Integer[] gradeCounts : counts) {
	            for (int count : gradeCounts) {
	                sumCounts += count;
	            }
	        }
	        row.createCell(1).setCellValue(sumCounts);
	        row.createCell(2).setCellValue(String.format("%.2f%%", 100.0 * sumCounts / dataList.size()));
	        cellIndex = 3; // 성별 데이터 시작 위치 초기화
	        for (Integer[] gradeCounts : counts) {
	            for (int count : gradeCounts) {
	                row.createCell(cellIndex++).setCellValue(count);
	            }
	        }
	    }

	    return rowIndex; // 통계가 추가된 마지막 행 번호 반환
	}





	// 파이 차트 추가 메서드
	private void addPieChart(XSSFWorkbook workbook, Sheet sheet, int startRow, List<HashMap<String, Object>> dataList, int questionIndex, HashMap<String, Object> question) throws IOException {
	    
		 try {
	            // 외부 폰트 파일 로드
	            InputStream is = AdminExamController.class.getResourceAsStream("/font/malgun.ttf");
	            
	            if (is == null) {
	                System.out.println("폰트 파일을 찾을 수 없습니다.");
	                return;
	            }
	            
	            java.awt.Font awtFont = java.awt.Font.createFont(java.awt.Font.TRUETYPE_FONT, is).deriveFont(12f);;

	            is.close();  // InputStream 사용 후 닫기
	            
	            // 시스템 폰트로 등록
	            GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
	            ge.registerFont(awtFont);

	            // 선택지 추출
	            String[] choices = question.get("Choices").toString().split("#");

	            // 파이 차트 데이터 생성
	            DefaultPieDataset dataset = new DefaultPieDataset();
	            Map<String, Integer> totalResponsesMap = new HashMap<>();

	            for (HashMap<String, Object> data : dataList) {
	                String[] selectedIndices = data.get("select_list").toString().split(",");
	                if (selectedIndices.length > questionIndex) {
	                    int index = Integer.parseInt(selectedIndices[questionIndex].trim()) - 1;
	                    if (index >= 0 && index < choices.length) {
	                        String choice = choices[index];
	                        totalResponsesMap.put(choice, totalResponsesMap.getOrDefault(choice, 0) + 1);
	                    }
	                }
	            }

	            for (Map.Entry<String, Integer> entry : totalResponsesMap.entrySet()) {
	                dataset.setValue(entry.getKey(), entry.getValue());
	            }

	            // 파이 차트 생성
	            JFreeChart chart = ChartFactory.createPieChart(
	                question.get("name").toString(), // 질문 제목을 차트 제목으로 사용
	                dataset,
	                true, // legend
	                true, // tooltips
	                false // urls
	            );

	            // 한글 폰트 설정
	            chart.getTitle().setFont(awtFont); // 제목에 폰트 적용
	            chart.getLegend().setItemFont(awtFont); // 범례에 폰트 적용

	            PiePlot plot = (PiePlot) chart.getPlot();
	            plot.setLabelFont(awtFont); // 데이터 레이블에 폰트 적용
	            PieSectionLabelGenerator generator = new StandardPieSectionLabelGenerator("{0}: {1} ({2})");
	            plot.setLabelGenerator(generator); // 레이블 제너레이터 설정

	            ByteArrayOutputStream chartOut = new ByteArrayOutputStream();
	            ChartUtils.writeChartAsPNG(chartOut, chart, 600, 400);
	            chartOut.flush();

	            // 이미지를 엑셀 파일에 삽입
	            CreationHelper helper = workbook.getCreationHelper();
	            Drawing<?> drawing = sheet.createDrawingPatriarch();
	            ClientAnchor anchor = helper.createClientAnchor();
	            anchor.setCol1(0);
	            anchor.setRow1(startRow);
	            int pictureIdx = workbook.addPicture(chartOut.toByteArray(), Workbook.PICTURE_TYPE_PNG);
	            Picture pict = drawing.createPicture(anchor, pictureIdx);
	            pict.resize();

	            chartOut.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    
	}



    
    private double calculatePercentage(Integer[] counts, int totalResponses) {
        int sumCounts = Arrays.stream(counts).mapToInt(Integer::intValue).sum();
        return totalResponses > 0 ? (double) sumCounts / totalResponses * 100 : 0.0;
    }

    
    private int determineGenderIndex(HashMap<String, Object> data) {
        String sex = data.get("sex").toString();
        if (sex.equals("남자")) {
            return 0;
        } else if (sex.equals("여자")) {
            return 1;
        } else {
            // 예외 처리: 남자와 여자 이외의 값이 올 경우
            throw new IllegalArgumentException("잘못된 성별 값입니다: " + sex);
        }
    }



	
}
