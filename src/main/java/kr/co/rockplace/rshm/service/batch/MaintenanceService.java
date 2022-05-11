package kr.co.rockplace.rshm.service.batch;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.SqlEntity;
import kr.co.rockplace.rshm.db.mapper.rshm.CommonMapper;
import kr.co.rockplace.rshm.service.CommonService;
import kr.co.rockplace.rshm.service.LogService;
import kr.co.rockplace.rshm.service.MailService;
import kr.co.rockplace.rshm.service.admin.SqlService;
import kr.co.rockplace.rshm.utils.CommonUtils;
import kr.co.rockplace.rshm.utils.JsonUtil;
import kr.co.rockplace.rshm.vo.MapperParseVo;

/**
 * Maintenance Service
 * @author wonsunlee
 *
 */
@Service
public class MaintenanceService {

	@Autowired
	private CommonMapper commonMapper;

	@Autowired
	private SqlService sqlService;

	@Autowired
	private CommonService commonService;

	@Autowired
	private MailService mailService;

	@Autowired
	private LogService logService;

	/**
	 * Create Ticket Monthly SHM Maintenance
	 */
	public int createTicketOfMonthlyMaintenance() {

		String logType = "LOG_TYPE_MA_MONTH";
		return this.saveShmToWorkorder(logType, "SHM_MA_CYCLE_001");
	}

	/**
	 * Create Ticket Bimonthly SHM Maintenance
	 */
	public int createTicketOfBimonthlyMaintenance() {

		String logType = "LOG_TYPE_MA_BIMONTH";
		return this.saveShmToWorkorder(logType, "SHM_MA_CYCLE_005");
	}

	/**
	 * Create Ticket Quarterly SHM Maintenance
	 */
	public int createTicketOfQuarterlyMaintenance() {

		String logType = "LOG_TYPE_MA_QUARTER";
		return this.saveShmToWorkorder(logType, "SHM_MA_CYCLE_002");
	}

	/**
	 * Create Ticket Half SHM Maintenance
	 */
	public int createTicketOfHalfMaintenance() {

		String logType = "LOG_TYPE_MA_HALF";
		return this.saveShmToWorkorder(logType, "SHM_MA_CYCLE_003");
	}

	/**
	 * Create Ticket Year SHM Maintenance
	 */
	public int createTicketOfYearMaintenance() {

		// 연간
		String logType = "LOG_TYPE_MA_YEAR";
		return this.saveShmToWorkorder(logType, "SHM_MA_CYCLE_004");
	}

	private int saveShmToWorkorder(String logType, String codeId) {

		long startTime = System.currentTimeMillis();
		long finishTime;
		long elapsedTime;
		boolean isLogResult = true;
		String logMessage = "";
		String logContent = "";

		SqlEntity sqlEntity = this.sqlService.getObject("SHM_MA_LIST");
		Map<String, Object> configMap = null;
		if(sqlEntity != null) {
			configMap = JsonUtil.convertJSONStringToMap(sqlEntity.getConfig());
		}

		String entId = "WOR";
		String ctlId = "CTL_WOR_M_001";

		int resultCount = 0;

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ma_cycle_cd", codeId);
		MapperParseVo mapperParseVo = CommonUtils.parseSqlParam(paramMap, configMap);

		Map<String, Object> mapperMap = new HashMap<String, Object>();
		mapperMap.put("query", CommonUtils.transVarsByData(sqlEntity.getQuery(), paramMap));
		mapperMap.put("mapperParseVo", mapperParseVo);

		List<Map<String, Object>> resultList = this.commonMapper.getSqlResultList(mapperMap);
		for (Map<String, Object> resultMap : resultList) {

			try {

				Map<String, Object> workorderMap = new HashMap<String, Object>();
				workorderMap.put("key", "");
				workorderMap.put("entId", entId);
				workorderMap.put("ctlId", ctlId);

				workorderMap.put("type_cd", "SHM_TYPE_MAINTENANCE");
				workorderMap.put("src_id", CommonUtils.convertMapToDefaultString(resultMap, "id"));
				workorderMap.put("src_ent_id", CommonUtils.convertMapToDefaultString(resultMap, "ent_id"));
				workorderMap.put("id", "");
				workorderMap.put("name", CommonUtils.convertMapToDefaultString(resultMap, "name"));
				workorderMap.put("req_date", resultMap.get("req_date"));
				workorderMap.put("req_emp_id", CommonUtils.convertMapToDefaultString(resultMap, "req_emp_id"));

				workorderMap.put("crm_id", CommonUtils.convertMapToDefaultString(resultMap, "crm_id"));
				workorderMap.put("product_cd", CommonUtils.convertMapToDefaultString(resultMap, "product_cd"));
				workorderMap.put("charge_emp_id", CommonUtils.convertMapToDefaultString(resultMap, "ma_charge_emp_id"));
				workorderMap.put("cat_cd", CommonUtils.convertMapToDefaultString(resultMap, "cat_cd"));
				// workorderMap.put("workday_cd", CommonUtils.convertMapToDefaultString(resultMap, "workday_cd"));

				workorderMap.put("support_city", CommonUtils.convertMapToDefaultString(resultMap, "support_city"));
				workorderMap.put("support_location", CommonUtils.convertMapToDefaultString(resultMap, "support_location"));
				workorderMap.put("customer", CommonUtils.convertMapToDefaultString(resultMap, "customer"));
				workorderMap.put("customer_contact", CommonUtils.convertMapToDefaultString(resultMap, "customer_contact"));

				LocalDate requestDate = LocalDate.parse((String) resultMap.get("ma_work_date"));
				int day = requestDate.getDayOfMonth();

				LocalDate thisMonth = LocalDate.now().withDayOfMonth(LocalDate.now().lengthOfMonth());
				if(requestDate.getDayOfMonth() > thisMonth.getDayOfMonth()) {
					day = thisMonth.getDayOfMonth();
				}

				LocalDate convertDate = LocalDate.of(LocalDate.now().getYear(), LocalDate.now().getMonthValue(), day);

				workorderMap.put("plan_start_date", LocalDateTime.of(convertDate, LocalTime.of(9, 0)).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
				workorderMap.put("plan_finish_date", LocalDateTime.of(convertDate, LocalTime.of(18, 0)).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
				workorderMap.put("act_start_date", "");
				workorderMap.put("act_finish_date", "");
				workorderMap.put("src_content", CommonUtils.convertMapToDefaultString(resultMap, "content"));
				workorderMap.put("content", "");
				workorderMap.put("etc_content", "");

				String key = this.commonService.saveForm(entId, ctlId, workorderMap);
				if(StringUtils.isNotEmpty(key) && StringUtils.isNotEmpty(ctlId)) {
					this.mailService.sendMailByControl(key, ctlId);
				}
				resultCount++;
			} catch (Exception e) {

				e.printStackTrace();
				logContent += e.getMessage();
			}
		}

		finishTime = System.currentTimeMillis();
		elapsedTime = finishTime - startTime;
		isLogResult = true;
		logMessage = "Total : " + resultList.size() + ", Count : " + resultCount + ", elapsedTime : " + elapsedTime + "ms";

		this.logService.create(logType, logMessage, logContent, isLogResult);

		return resultCount;
	}
}