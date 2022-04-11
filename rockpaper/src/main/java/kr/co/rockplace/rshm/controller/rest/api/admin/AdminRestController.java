package kr.co.rockplace.rshm.controller.rest.api.admin;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.ApiOperation;
import kr.co.rockplace.rshm.db.entity.TableFieldEntity;
import kr.co.rockplace.rshm.service.admin.HolidayService;
import kr.co.rockplace.rshm.service.admin.TableFieldService;
import kr.co.rockplace.rshm.service.batch.CrmService;
import kr.co.rockplace.rshm.service.batch.InsaService;
import kr.co.rockplace.rshm.service.batch.MaintenanceService;
import kr.co.rockplace.rshm.utils.LogUtils;
import kr.co.rockplace.rshm.view.CommonResultView;
import lombok.extern.slf4j.Slf4j;

/**
 * Administrator Rest Controller
 * @author wonsunlee
 *
 */
@RestController
@RequestMapping(value="/api/admin")
@Slf4j
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class AdminRestController {

	@Autowired
	private TableFieldService tableFieldService;

	@Autowired
	private CrmService crmService;

	@Autowired
	private InsaService insaService;

	@Autowired
	private MaintenanceService maintenanceService;

	@Autowired
	private HolidayService holidayService;

	/**
	 * 테이블 필드 생성
	 * @param paramsMap
	 * @return
	 */
	@PostMapping(value = "/tablefield/create")
	@ApiOperation(value="테이블 필드 생성", notes = "테이블 필드 생성")
	public CommonResultView<TableFieldEntity> createTableField(
			@RequestParam(value = "var/entId", required = true) String entId,
			@RequestParam Map<String, Object> parameterMap) {

		LogUtils.printParam("/tablefield/create", parameterMap, true, "entId");

		try {

			TableFieldEntity entity = this.tableFieldService.create(entId, parameterMap);
			if(entity != null) {
				return CommonResultView.success(entity);
			} else {
				return CommonResultView.fail(HttpStatus.BAD_REQUEST.value(), HttpStatus.BAD_REQUEST.getReasonPhrase(), null);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return CommonResultView.fail(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage(), null);
		}
	}

	/**
	 * 테이블 필드 수정
	 * @param paramsMap
	 * @return
	 */
	@PostMapping(value = "/tablefield/update")
	@ApiOperation(value="테이블 필드 수정", notes = "테이블 필드 수정")
	public CommonResultView<TableFieldEntity> updateTableField(
			@RequestParam(value = "var/entId", required = true) String entId,
			@RequestParam Map<String, Object> parameterMap) {

		LogUtils.printParam("/tablefield/update", parameterMap, true, "entId");

		try {

			TableFieldEntity entity = this.tableFieldService.update(entId, parameterMap);
			if(entity != null) {
				return CommonResultView.success(entity);
			} else {
				return CommonResultView.fail(HttpStatus.BAD_REQUEST.value(), HttpStatus.BAD_REQUEST.getReasonPhrase(), null);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return CommonResultView.fail(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage(), null);
		}

//		return CommonResultView.success(new TableFieldEntity());
	}

	/**
	 * 테이블 필드 삭제 
	 * @param id
	 * @return
	 */
	@PostMapping(value = "/tablefield/delete")
	@ApiOperation(value="테이블 필드 삭제", notes = "테이블 필드 삭제")
	public CommonResultView<Boolean> deleteTableField(
			@RequestParam(value = "id", required = true) String id,
			@RequestParam Map<String, Object> parameterMap) {

		LogUtils.printParam("/tablefield/delete", parameterMap, false, "id");

		boolean result = this.tableFieldService.delete(id);
		if(result) {
			return CommonResultView.success(result);
		} else {
			return CommonResultView.fail(HttpStatus.BAD_REQUEST.value(), HttpStatus.BAD_REQUEST.getReasonPhrase(), result);
		}
	}

	@GetMapping("/collect/holiday")
	public CommonResultView<Boolean> collectHoliday(
			@RequestParam(value = "year", required = true) String year,
			@RequestParam(value = "month", required = false) String month) {

		long start = System.currentTimeMillis();

		log.info("=== collectHoliday start ===", year, month);
		log.info("year: {}", year);
		log.info("month: {}", month);

		int result = this.holidayService.collectHoliday(year, month);

		long finish = System.currentTimeMillis();
		long elapsedTime = finish - start;

		StringBuffer resultMessage = new StringBuffer();
		resultMessage.append("result count : " + result).append("	");
		resultMessage.append("elapsedTime : " + elapsedTime);

		log.info("resultmessage : " + resultMessage);
		log.info("=== collect end ===");

		return CommonResultView.success(resultMessage.toString());
	}

	@GetMapping("/collect/{type}/{subType}")
	public CommonResultView<Boolean> collect(
			@PathVariable("type") String type,
			@PathVariable("subType") String subType,
			@RequestParam(value = "id", required = false) String id) {

		long start = System.currentTimeMillis();

		log.info("=== collect {} {} start ===", type, subType);
		log.info("id: {}", id);

		int result = 0;
		if(StringUtils.equalsIgnoreCase(type, "insa")) {

			if(StringUtils.equalsIgnoreCase(subType, "code")) {
				result = this.insaService.collectCode();
				result += this.insaService.collectVacationCode();
			} else if(StringUtils.equalsIgnoreCase(subType, "org")) {
				result = this.insaService.collectOrganization();
			} else if(StringUtils.equalsIgnoreCase(subType, "dpt")) {
				result = this.insaService.collectDepartment();
			} else if(StringUtils.equalsIgnoreCase(subType, "emp")) {
				result = this.insaService.collectEmployee();
			} else if(StringUtils.equalsIgnoreCase(subType, "vacation")) {
				result = this.insaService.collectVacation();
			}
		} else if(StringUtils.equalsIgnoreCase(type, "crm")) {

			if(StringUtils.equalsIgnoreCase(subType, "crm")) {

				if(StringUtils.isNotEmpty(id)) {
					result = this.crmService.collectCrm(id);
				} else {
					result = this.crmService.collectCrm();
				}
			} else if(StringUtils.equalsIgnoreCase(subType, "prod")) {

				if(StringUtils.isNotEmpty(id)) {
					result = this.crmService.collectCrmProduct(id);
				} else {
					result = this.crmService.collectCrmProduct();
				}
			}
		} else if(StringUtils.equalsIgnoreCase(type, "ma")) {

			if(StringUtils.equalsIgnoreCase(subType, "month")) {
				result = this.maintenanceService.createTicketOfMonthlyMaintenance();
			} else if(StringUtils.equalsIgnoreCase(subType, "bimonth")) {
				result = this.maintenanceService.createTicketOfBimonthlyMaintenance();
			} else if(StringUtils.equalsIgnoreCase(subType, "quarter")) {
				result = this.maintenanceService.createTicketOfQuarterlyMaintenance();
			} else if(StringUtils.equalsIgnoreCase(subType, "half")) {
				result = this.maintenanceService.createTicketOfHalfMaintenance();
			} else if(StringUtils.equalsIgnoreCase(subType, "year")) {
				result = this.maintenanceService.createTicketOfYearMaintenance();
			}
		}

		long finish = System.currentTimeMillis();
		long elapsedTime = finish - start;

		StringBuffer resultMessage = new StringBuffer();
		resultMessage.append("result count : " + result).append("	");
		resultMessage.append("elapsedTime : " + elapsedTime);

		log.info("resultmessage : " + resultMessage);
		log.info("=== collect {} {} end ===", type, subType);

		return CommonResultView.success(resultMessage.toString());
	}
}