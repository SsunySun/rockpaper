package kr.co.rockplace.rshm.view;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.HttpHeaders;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import kr.co.rockplace.rshm.db.entity.ListEntity;
import kr.co.rockplace.rshm.service.CommonService;
import kr.co.rockplace.rshm.service.ExcelService;
import kr.co.rockplace.rshm.service.WorkTimeService;
import kr.co.rockplace.rshm.service.WorkTimeService.TimeSet;
import kr.co.rockplace.rshm.service.admin.EmployeeService;
import kr.co.rockplace.rshm.service.admin.HolidayService;
import kr.co.rockplace.rshm.service.admin.ListService;
import kr.co.rockplace.rshm.utils.ExcelUtils;
import kr.co.rockplace.rshm.utils.JsonUtil;
import lombok.extern.slf4j.Slf4j;

/**
 * WorkTime Excel Result View Class
 * @author wonsunlee
 *
 */
@Slf4j
public class WorkTimeExcelView extends AbstractXlsxView {

	/**
	 * The content type for an Excel response
	 */
	private final String CONTENT_TYPE = "application/vnd.ms-excel";

	/**
	 * Constructor
	 */
	public WorkTimeExcelView() {
		setContentType(CONTENT_TYPE);
	}

	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model, 
			Workbook workbook,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		long start = System.currentTimeMillis();

		// View에서는 @Autowired가 안되어서 model 객체에 service 객체를 담아서 넘김. 
		ExcelService excelService = (ExcelService) model.get("excelService");
		ListService listService = (ListService) model.get("listService");
		WorkTimeService workTimeService = (WorkTimeService) model.get("workTimeService");
		HolidayService holidayService = (HolidayService) model.get("holidayService");
		CommonService commonService = (CommonService) model.get("commonService");
		EmployeeService employeeService = (EmployeeService) model.get("employeeService");

		String lstId = (String) model.get("lstId");

		String excelName = "rockpaper";
		// Excel Download Filename 설정 
		response.setHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + excelName + ".xlsx");

		List<Map<String, Object>> resultList = excelService.getExcelList(request, lstId);

		workbook = new XSSFWorkbook();

		Sheet sheet = ExcelUtils.getSheet(workbook);

		ListEntity listEntity = listService.getObject(lstId);

		if(listEntity != null) {

			String listName = listEntity.getName();
			int columnSize = 0;
			Map<String, Object> configMap = JsonUtil.convertJSONStringToMap(listEntity.getConfig());
			List<Map<String, Object>> columnList = (List<Map<String, Object>>) configMap.get("column");
			for (Map<String, Object> map : columnList) {

				if(StringUtils.equals((String) map.get("type"), "view") || StringUtils.equals((String) map.get("type"), "excel")) {
					columnSize++;
				}
			}

			// Write of List Title
			excelService.writeTitle(sheet, listName, columnSize);

			// Write of List Column Header
			excelService.writeColumnHeader(sheet, columnList);

			List<Map<String, Object>> returnList = new ArrayList<Map<String, Object>>();

			Map<String, Map<LocalDate, List<Map<String, Object>>>> employeeMap = new HashMap<String, Map<LocalDate, List<Map<String, Object>>>>();

			// DB 조회 결과값을 엔지니어별, 날짜별로 데이터 재조합
			resultList.forEach(map -> {

				String employee = (String) map.get("charge_emp_id");
				LocalDateTime startDateTime = ((Timestamp) map.get("act_start_date")).toLocalDateTime();
				LocalDate standDate = LocalDate.of(startDateTime.getYear(), startDateTime.getMonth(), startDateTime.getDayOfMonth());

				if(employeeMap.containsKey(employee)) {

					Map<LocalDate, List<Map<String, Object>>> dateListMap = employeeMap.get(employee);
					if(dateListMap.containsKey(standDate)) {

						List<Map<String, Object>> list = dateListMap.get(standDate);
						list.add(map);

						dateListMap.put(standDate, list);
					} else {

						List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
						list.add(map);

						dateListMap.put(standDate, list);
					}

					employeeMap.put(employee, dateListMap);
				} else {

					Map<LocalDate, List<Map<String, Object>>> dateListMap = new HashMap<LocalDate, List<Map<String, Object>>>();
					if(dateListMap.containsKey(standDate)) {

						List<Map<String, Object>> list = dateListMap.get(standDate);
						list.add(map);

						dateListMap.put(standDate, list);
					} else {

						List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
						list.add(map);

						dateListMap.put(standDate, list);
					}
					employeeMap.put(employee, dateListMap);
				}
			});

			// 엔지니어별로 근로 시간 계산 / empId: 직원 ID, mapValue: 날짜별 리스트 정보 
			employeeMap.forEach((empId, dateListMap) -> {

				// 날짜별로 정렬 
				List<Map.Entry<LocalDate, List<Map<String, Object>>>> entries = dateListMap.entrySet().
						stream().
						sorted(Map.Entry.comparingByKey()).
						collect(Collectors.toList());

				for (Map.Entry<LocalDate, List<Map<String, Object>>> entry : entries) {

					LocalDate date = entry.getKey();
					List<Map<String, Object>> workList = entry.getValue();

					// 휴일 체크
					boolean isHoliday = holidayService.checkHoliday(date);

					// 지원 유형이 방문지원(SHM_CATALOG_001) 일 경우 true, 아닐 경우 false
					boolean isAlternativeHoliday = false;
					String catCd = "";

					List<TimeSet> timeSetList = new ArrayList<TimeSet>();
					for (Map<String, Object> workMap : workList) {

						timeSetList.add(new TimeSet(((Timestamp) workMap.get("act_start_date")).toLocalDateTime(), ((Timestamp) workMap.get("act_finish_date")).toLocalDateTime()));

						catCd = (String) workMap.get("cat_cd");
						if(StringUtils.equals(catCd, "SHM_CATALOG_001")) {
							isAlternativeHoliday = true;
						}
					}

					Map<String, List<TimeSet>> calcWorkTimeMap = workTimeService.calcWorkTime(timeSetList, isHoliday);
					Map<String, Double> calcWeightWorkTimeMap = workTimeService.calcWeightWorkTime(date, calcWorkTimeMap, isHoliday, isAlternativeHoliday);
					Map<String, Object> returnMap = new HashMap<String, Object>();

					String empName = employeeService.getName(empId);

					returnMap.put("charge_emp_name", empName);	// 엔지니어

					String workDateOfWeek = LocalDate.parse(date.toString()).getDayOfWeek().getDisplayName(TextStyle.SHORT, Locale.forLanguageTag("ko"));
					returnMap.put("start_date", date.toString() + "(" + workDateOfWeek + ")");	// 지원 시작일(요일)

					returnMap.put("rest_time", workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("restTimeTotalMinutes")));	// 휴계시간
					returnMap.put("total_time", workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("sumWorkTime")));	// 총 시간
					returnMap.put("calc_total_time", workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("calcSumWorkTime")));	// 총 시간(휴계제외)

					// 휴일 유무 
					if(!isHoliday) {

						String workTimeStr = "";
						List<TimeSet> workTimeList = calcWorkTimeMap.get("workTimeList");
						for (TimeSet timeSet : workTimeList) {
							workTimeStr += timeSet.toString() + "\n";
						}
						returnMap.put("work_time", workTimeStr);	// 소정 근로시간
						returnMap.put("holiday_time", "");	// 엑셀의 null 값 처리 
					} else {

						String holidayTimeStr = "";
						List<TimeSet> holidayTimeList = calcWorkTimeMap.get("holidayTimeList");
						for (TimeSet timeSet : holidayTimeList) {
							holidayTimeStr += timeSet.toString() + "\n";
						}
						returnMap.put("holiday_time", holidayTimeStr);	// 휴일 근로시간
						returnMap.put("work_time", "");	// 엑셀의 null 값 처리 
					}

					String overTimeStr = "";
					List<TimeSet> overTimeList = calcWorkTimeMap.get("overTimeList");
					for (TimeSet timeSet : overTimeList) {
						overTimeStr += timeSet.toString() + "\n";
					}
					returnMap.put("over_time", overTimeStr);	// 연장 근로시간

					String nightTimeStr = "";
					List<TimeSet> nightTimeList = calcWorkTimeMap.get("nightTimeList");
					for (TimeSet timeSet : nightTimeList) {
						nightTimeStr += timeSet.toString() + "\n";
					}
					returnMap.put("night_time", nightTimeStr);	// 야간 근로시간

					returnMap.put("weight_work_time", workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("weightWorkTimeTotalMinutes")));	// 소정근로
					returnMap.put("weight_over_time", workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("weightOverTimeTotalMinutes")));	// 연장근로
					returnMap.put("weight_night_time", workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("weightNightTimeTotalMinutes")));	// 야간근로
					returnMap.put("weight_holiday_time", workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("weightHolidayWorkTimeTotalMinutes")));	// 휴일근로
					returnMap.put("weight_total_time", workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("weightTotalTime")));	// 합계
					returnMap.put("weight_compensation_total_time", workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("weight_compensation_total_time")));	// 보상 발생시간

					String sqlId = "WORKTIME_OBJECT";
					Map<String, Object> sqlParamMap = new HashMap<String, Object>();
					sqlParamMap.put("work_date", date.toString());
					sqlParamMap.put("charge_emp_id", empId);

					Map<String, Object> worktimeObject = commonService.getResultMapBySql(sqlId, sqlParamMap);
					double usedWorkTime = 0;
					double compensation_time = 0;
					if(worktimeObject != null) {

						if(worktimeObject.containsKey("used_work_time")) {

							usedWorkTime = Double.parseDouble(worktimeObject.get("used_work_time").toString());
							returnMap.put("used_work_time", usedWorkTime);
							returnMap.put("used_work_time_str", workTimeService.convertPrintWorkTime((usedWorkTime * 60)));
						}

						if(worktimeObject.containsKey("compensation_time")) {

							compensation_time = Double.parseDouble(worktimeObject.get("compensation_time").toString());

							returnMap.put("compensation_time", compensation_time);
							returnMap.put("weight_compensation_total_time", workTimeService.convertPrintWorkTime(compensation_time * 60));	// 보상 발생시간
						} else {

							compensation_time = calcWeightWorkTimeMap.get("weight_compensation_total_time") / 60;

							returnMap.put("compensation_time", compensation_time);	// 기존에 등록된 사용시간
							returnMap.put("weight_compensation_total_time", workTimeService.convertPrintWorkTime(compensation_time * 60));	// 보상 발생시간
						}

						returnMap.put("key", worktimeObject.get("id"));					// 기존에 등록된 Key(있을 경우만 입력)
					} else {

						returnMap.put("used_work_time", usedWorkTime);
						returnMap.put("used_work_time_str", workTimeService.convertPrintWorkTime((usedWorkTime * 60)));	// 기존에 등록된 사용시간

						compensation_time = calcWeightWorkTimeMap.get("weight_compensation_total_time") / 60;

						returnMap.put("compensation_time", compensation_time);
						returnMap.put("weight_compensation_total_time", workTimeService.convertPrintWorkTime(compensation_time * 60));
					}

					double compensation_rest_time = (compensation_time * 60) - (usedWorkTime * 60);
					returnMap.put("compensation_rest_time", workTimeService.convertPrintWorkTime(compensation_rest_time));	// 잔여시간

					if(isAlternativeHoliday) {
						returnMap.put("alternative_holiday", "적용");	// 대체휴무 여부
					} else {
						returnMap.put("alternative_holiday", "미적용");	// 대체휴무 여부
					}

					returnList.add(returnMap);
				}
			});

			// Write of List Column Data
			excelService.writeColumnData(sheet, columnList, returnList);
		} else {
			excelService.writeTitle(sheet, "리스트가 없습니다.", 1);
		}

		ServletOutputStream out = response.getOutputStream();
		workbook.write(out);
		workbook.close();

		if (out != null) {
			out.close();
		}

		long finish = System.currentTimeMillis();
		long timeElapsed = finish - start;
		log.info("timeElapsed : " + timeElapsed);
	}
}