package kr.co.rockplace.rshm.controller.rest.api;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.View;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import kr.co.rockplace.rshm.service.CommonService;
import kr.co.rockplace.rshm.service.ExcelService;
import kr.co.rockplace.rshm.service.MailService;
import kr.co.rockplace.rshm.service.WorkTimeService;
import kr.co.rockplace.rshm.service.admin.DepartmentService;
import kr.co.rockplace.rshm.service.admin.EmployeeService;
import kr.co.rockplace.rshm.service.admin.HolidayService;
import kr.co.rockplace.rshm.service.admin.ListService;
import kr.co.rockplace.rshm.service.admin.OrganizationService;
import kr.co.rockplace.rshm.utils.LogUtils;
import kr.co.rockplace.rshm.view.ChildTableResultView;
import kr.co.rockplace.rshm.view.CommonResultView;
import kr.co.rockplace.rshm.view.ExcelView;
import kr.co.rockplace.rshm.view.TableResultView;
import kr.co.rockplace.rshm.view.TeamWorkTimeExcelView;
import kr.co.rockplace.rshm.view.WorkTimeExcelView;
import kr.co.rockplace.rshm.vo.MapperParseVo;

/**
 * Common Rest Controller
 * @author wonsunlee
 *
 */
@RestController
@RequestMapping(value="/api/common")
@Api(tags = "common")
public class CommonRestController {

	@Autowired
	private CommonService commonService;

	@Autowired
	private MailService mailService;

	@Autowired
	private ExcelService excelService;

	@Autowired
	private ListService listService;

	@Autowired
	private WorkTimeService workTimeService;

	@Autowired
	private HolidayService holidayService;

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private DepartmentService departmentService;

	@Autowired
	private OrganizationService organizationService;

	/**
	 * 전체 목록 조회(Table)
	 * @param lstId
	 * @param draw
	 * @param request
	 * @return
	 */
	@PostMapping(value = "/tablelist")
	public TableResultView<List<Map<String, Object>>> getTableList(
			@RequestParam(value = "lstId", required = true) String lstId,
			@RequestParam(value = "draw", required = false, defaultValue = "0") int draw,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletRequest request) {

		LogUtils.printParam("/tablelist", parameterMap, true, "lstId", "draw");

		return this.commonService.getTableListByList(request, lstId, draw);
	}

	/**
	 * 전체 목록 조회(Child Table)
	 * @param lstId
	 * @param searchId
	 * @param request
	 * @return
	 */
	@PostMapping(value = "/childtablelist")
	public ChildTableResultView<MapperParseVo.MetaData, List<Map<String, Object>>> getChildTableList(
			@RequestParam(value = "lstId", required = true) String lstId,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletRequest request) {

		LogUtils.printParam("/childtablelist", parameterMap, true, "lstId");

		return this.commonService.getChildTableListByList(request, lstId);
	}

	@GetMapping(value = "/excel")
	public View excelDownload(
			@RequestParam(value = "lstId", required = true) String lstId,
			@RequestParam Map<String, Object> parameterMap,
			ModelMap modelMap) {

		LogUtils.printParam("/excel", parameterMap, true, "lstId");

		modelMap.put("lstId", lstId);
		modelMap.put("excelService", this.excelService);
		modelMap.put("listService", this.listService);

		return new ExcelView();
	}

	/**
	 * 근무시간 계산 목록 조회(Table)
	 * @param lstId
	 * @param draw
	 * @param request
	 * @return
	 */
	@PostMapping(value = "/worktime-tablelist")
	public TableResultView<List<Map<String, Object>>> getWorkTimeTableList(
			@RequestParam(value = "lstId", required = true) String lstId,
			@RequestParam(value = "draw", required = false, defaultValue = "0") int draw,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletRequest request) {

		LogUtils.printParam("/worktime-tablelist", parameterMap, true, "lstId", "draw");

		return this.commonService.getWorkTimeTableListByList(request, lstId, draw);
	}

	/**
	 * 근무시간 계산 목록 조회(Child Table)
	 * @param lstId
	 * @param draw
	 * @param request
	 * @return
	 */
	@PostMapping(value = "/worktime-childtablelist")
	public ChildTableResultView<MapperParseVo.MetaData, List<Map<String, Object>>> getWorkTimeChildTableList(
			@RequestParam(value = "lstId", required = true) String lstId,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletRequest request) {

		LogUtils.printParam("/worktime-childtablelist", parameterMap, true, "lstId");

		return this.commonService.getWorkTimeChildTableListByList(request, lstId);
	}

	@GetMapping(value = "/worktime-excel")
	public View workTimeExcelDownload(
			@RequestParam(value = "lstId", required = true) String lstId,
			@RequestParam Map<String, Object> parameterMap,
			ModelMap modelMap) {

		LogUtils.printParam("/worktime-excel", parameterMap, true, "lstId");

		modelMap.put("lstId", lstId);
		modelMap.put("excelService", this.excelService);
		modelMap.put("listService", this.listService);
		modelMap.put("workTimeService", this.workTimeService);
		modelMap.put("holidayService", this.holidayService);
		modelMap.put("commonService", this.commonService);
		modelMap.put("employeeService", this.employeeService);

		return new WorkTimeExcelView();
	}

	/**
	 * 팀별 근무시간 계산 목록 조회(Team WorkTime Child Table)
	 * @param lstId
	 * @param draw
	 * @param request
	 * @return
	 */
	@PostMapping(value = "/team-worktime-childtablelist")
	public ChildTableResultView<MapperParseVo.MetaData, List<Map<String, Object>>> getTeamWorkTimeChildTableList(
			@RequestParam(value = "lstId", required = true) String lstId,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletRequest request) {

		LogUtils.printParam("/team-worktime-childtablelist", parameterMap, true, "lstId");

		return this.commonService.getTeamWorkTimeChildTableListByList(request, lstId);
	}

	@GetMapping(value = "/team-worktime-excel")
	public View teamWorkTimeExcelDownload(
			@RequestParam(value = "lstId", required = true) String lstId,
			@RequestParam Map<String, Object> parameterMap,
			ModelMap modelMap) {

		LogUtils.printParam("/teamWorktime-excel", parameterMap, true, "lstId");

		modelMap.put("lstId", lstId);
		modelMap.put("excelService", this.excelService);
		modelMap.put("listService", this.listService);
		modelMap.put("workTimeService", this.workTimeService);
		modelMap.put("holidayService", this.holidayService);
		modelMap.put("commonService", this.commonService);
		modelMap.put("employeeService", this.employeeService);
		modelMap.put("departmentService", this.departmentService);
		modelMap.put("organizationService", this.organizationService);

		return new TeamWorkTimeExcelView();
	}

	/**
	 * 팀별 근무시간 계산 목록 조회(Team Child Table)
	 * @param lstId
	 * @param draw
	 * @param request
	 * @return
	 */
	@PostMapping(value = "/team-childtablelist")
	public ChildTableResultView<MapperParseVo.MetaData, List<Map<String, Object>>> getTeamTimeChildTableList(
			@RequestParam(value = "lstId", required = true) String lstId,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletRequest request) {

		LogUtils.printParam("/team-childtablelist", parameterMap, true, "lstId");

		return this.commonService.getTeamChildTableListByList(request, lstId);
	}

	/**
	 * SQL ID를 기반으로 결과 받기
	 * @param sqlId
	 * @param paramMap
	 * @return
	 */
	@PostMapping(value = "/sqlMap")
	public Map<String, Object> getSqlResultMap(
			@RequestParam(value = "sqlId", required = true) String sqlId,
			@RequestParam Map<String, Object> parameterMap) {

		LogUtils.printParam("/sqlMap", parameterMap, true, "sqlId");

		Map<String, Object> resultMap = this.commonService.getResultMapBySql(sqlId, parameterMap);
		return resultMap;
	}

	/**
	 * SQL ID를 기반으로 결과 받기(calendar 전용)
	 * @param sqlId
	 * @param paramMap
	 * @return
	 */
	@PostMapping(value = "/calendarList")
	public List<Map<String, Object>> getCalendarList(
			@RequestParam(value = "sqlId", required = true) String sqlId,
			@RequestParam Map<String, Object> parameterMap) {

		LogUtils.printParam("/calendarList", parameterMap, true, "sqlId");

		List<Map<String, Object>> resultList = this.commonService.getCalendarListBySql(sqlId, parameterMap);
		return resultList;
	}

	/**
	 * SQL ID를 기반으로 결과 받기
	 * @param sqlId
	 * @param paramMap
	 * @return
	 */
	@PostMapping(value = "/sqlList")
	public List<Map<String, Object>> getSqlResultList(
			@RequestParam(value = "sqlId", required = true) String sqlId,
			@RequestParam Map<String, Object> parameterMap) {

		LogUtils.printParam("/sqlList", parameterMap, true, "sqlId");

		List<Map<String, Object>> resultList = this.commonService.getResultListBySql(sqlId, parameterMap);
		return resultList;
	}

	/**
	 * 객체 저장
	 * @param entId
	 * @param formId
	 * @param parameterMap
	 * @return
	 */
	@PostMapping(value = "/{entId}/saveForm")
	@ApiOperation(value = "객체 저장", notes = "객체 저장")
	public CommonResultView<Boolean> saveForm(
			@PathVariable(value = "entId") String entId,
			@RequestParam(value = "name", required = true, defaultValue = "") String name,
			@RequestParam(value = "ctlId", required = false, defaultValue = "") String ctlId,
			@RequestParam Map<String, Object> parameterMap) {

		LogUtils.printParam("/saveForm", parameterMap, true, "entId", "name", "ctlId");

		try {

			String key = this.commonService.saveForm(entId, ctlId, parameterMap);
			if(StringUtils.isNotEmpty(key) && StringUtils.isNotEmpty(ctlId)) {
				this.mailService.sendMailByControl(key, ctlId);
			}

			if(StringUtils.isNotEmpty(key)) {
				return CommonResultView.success(true);
			} else {
				return CommonResultView.fail(HttpStatus.BAD_REQUEST.value(), HttpStatus.BAD_REQUEST.getReasonPhrase(), false);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return CommonResultView.fail(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage(), false);
		}
	}

	/**
	 * 객체 삭제
	 * @param key
	 * @param entId
	 * @param formId
	 * @param parameterMap
	 * @return
	 */
	@DeleteMapping(value = "/{entId}/deleteForm")
	@ApiOperation(value = "객체 삭제", notes = "객체 삭제")
	public CommonResultView<Boolean> deleteForm(
			@PathVariable(value = "entId") String entId,
			@RequestParam(value = "key", required = true) String key,
			@RequestParam Map<String, Object> parameterMap) {

		LogUtils.printParam("/deleteForm", parameterMap, true, "entId", "key");

		try {

			int result = this.commonService.deleteForm(key, entId, parameterMap);
			if(result > -1) {
				return CommonResultView.success(true);
			} else {
				return CommonResultView.fail(HttpStatus.BAD_REQUEST.value(), HttpStatus.BAD_REQUEST.getReasonPhrase(), false);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return CommonResultView.fail(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage(), false);
		}
	}

	/**
	 * Relation 객체 저장
	 * @param relationId
	 * @param ctlId
	 * @param parameterMap
	 * @return
	 */
	@PostMapping(value = "/saveRelation")
	@ApiOperation(value = "Relation 객체 저장", notes = "Relation 객체 저장")
	public CommonResultView<Boolean> saveRelation(
			@RequestParam(value = "relationId", required = true) String relationId,
			@RequestParam(value = "name", required = true, defaultValue = "") String name,
			@RequestParam(value = "ctlId", required = false, defaultValue = "") String ctlId,
			@RequestParam Map<String, Object> parameterMap) {

		LogUtils.printParam("/saveRelation", parameterMap, true, "relationId", "name", "ctlId");

		try {

			String key = this.commonService.saveRelation(relationId, ctlId, parameterMap);

			if(StringUtils.isNotEmpty(key) && StringUtils.isNotEmpty(ctlId)) {
				this.mailService.sendMailByControl(key, ctlId);
			}

			if(StringUtils.isNotEmpty(key)) {
				return CommonResultView.success(true);
			} else {
				return CommonResultView.fail(HttpStatus.BAD_REQUEST.value(), HttpStatus.BAD_REQUEST.getReasonPhrase(), false);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return CommonResultView.fail(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage(), false);
		}
	}
}