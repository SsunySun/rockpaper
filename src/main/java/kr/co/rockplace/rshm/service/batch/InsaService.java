package kr.co.rockplace.rshm.service.batch;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.CodeEntity;
import kr.co.rockplace.rshm.db.entity.DepartmentEntity;
import kr.co.rockplace.rshm.db.entity.EmployeeEntity;
import kr.co.rockplace.rshm.db.entity.EntityEntity;
import kr.co.rockplace.rshm.db.entity.OrganizationEntity;
import kr.co.rockplace.rshm.db.mapper.insa.InsaMapper;
import kr.co.rockplace.rshm.db.repository.CodeRepository;
import kr.co.rockplace.rshm.db.repository.DepartmentRepository;
import kr.co.rockplace.rshm.db.repository.EmployeeRepository;
import kr.co.rockplace.rshm.db.repository.EntityRepository;
import kr.co.rockplace.rshm.db.repository.OrganizationRepository;
import kr.co.rockplace.rshm.service.CommonService;
import kr.co.rockplace.rshm.service.LogService;

/**
 * Insa Service
 * @author wonsunlee
 *
 */
@Service
public class InsaService {

	@Autowired
	private InsaMapper insaMapper;

	@Autowired
	private CodeRepository codeRepository;

	@Autowired
	private OrganizationRepository organizationRepository;

	@Autowired
	private DepartmentRepository departmentRepository;

	@Autowired
	private EmployeeRepository employeeRepository;

	@Autowired
	private EntityRepository entityRepository;

	@Autowired
	private LogService logService;

	@Autowired
	private CommonService commonService;

	/**
	 * Collect of Code
	 */
	public int collectCode() {

		long startTime = System.currentTimeMillis();
		long finishTime;
		long elapsedTime;
		boolean isLogResult = true;
		String logMessage = "";
		String logContent = "";
		String logType = "LOG_TYPE_CODE";

		int result = 0;

		try {

			final String POSITION_CODE_TYPE = "POSITION";
			final String DUTY_POSITION_CODE_TYPE = "DUTY_POSITION";

			List<CodeEntity> codeList = this.codeRepository.findByCtyIdIn(List.of(POSITION_CODE_TYPE, DUTY_POSITION_CODE_TYPE));
			List<Map<String, Object>> resultList = this.insaMapper.getCodeList();

			// 기존에 등록되어 있고 DB Inc에서 제공하는 데이터에 값이 없을 경우 USED: false로 변경
			for (CodeEntity entity : codeList) {

				boolean isExist = false;
				for (Map<String, Object> map : resultList) {

					if(this.checkBlankMapData(map, "CODE_DIV") && this.checkBlankMapData(map, "COMPANY_CODE") && this.checkBlankMapData(map, "CODE")) {
						if(StringUtils.equals(entity.getId(), map.get("CODE_DIV") + "_" + map.get("COMPANY_CODE") + "_" + map.get("CODE"))) {

							isExist = true;
							break;
						}
					}
				}

				if(!isExist) {

					entity.setUsed(false);
					entity.setUpdateDate(LocalDateTime.now());
					entity.setUpdateEmpId("rshmadmin@rockplace.co.kr");

					this.codeRepository.save(entity);
				}
			}

			for (Map<String, Object> map : resultList) {

//				String companyCode = null;
//				if(this.checkBlankMapData(map, "COMPANY_CODE")) {
//					companyCode = orgEntityPrefix + "_" + map.get("COMPANY_CODE");
//				}
				String codeDiv = null;
				if(this.checkBlankMapData(map, "CODE_DIV")) {
					codeDiv = (String) map.get("CODE_DIV");
				}
				String code = null;
				if(this.checkBlankMapData(map, "CODE") && this.checkBlankMapData(map, "COMPANY_CODE")) {
					code = codeDiv + "_" + map.get("COMPANY_CODE") + "_" + map.get("CODE");
				}
//				String language = null;
//				if(this.checkBlankMapData(map, "LANGUAGE")) {
//					language = (String) map.get("LANGUAGE");
//				}
				String codeName = null;
				if(this.checkBlankMapData(map, "CODE_NAME")) {
					codeName = (String) map.get("CODE_NAME");
				}

				LocalDateTime updatedDate = null;
				if(this.checkBlankMapData(map, "UPDATED_DATE")) {
					updatedDate = LocalDateTime.parse((String) map.get("UPDATED_DATE"), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
				}

				// Key Check
				CodeEntity entity = null;
				boolean isExist = false;
				for (CodeEntity codeEntity : codeList) {
					if(StringUtils.equals(code, codeEntity.getId())) {

						isExist = true;
						entity = codeEntity;
					}
				}

				if(isExist) {

					// Key가 있을 경우
					// Update 시간이 다를 경우 Update 실행
					if(updatedDate != null && !updatedDate.equals(entity.getUpdateDate())) {

						this.codeRepository.save(
							CodeEntity.builder()
								.id(code)
								.name(codeName)
								.label(codeName)
								.descr(codeName)
								.createDate(entity.getCreateDate())
								.createEmpId(entity.getCreateEmpId())
								.updateDate(updatedDate)
								.updateEmpId("rshmadmin@rockplace.co.kr")
								.isUsed(entity.isUsed())
								.orderBy(entity.getOrderBy())

								.ctyId(codeDiv)
								.val(code)
								.sid(null)
								.pid(null)
								.level(entity.getLevel())
								.build()
						);
					}
				} else {

					// Key가 없을 경우
					this.codeRepository.save(
						CodeEntity.builder()
							.id(code)
							.name(codeName)
							.label(codeName)
							.descr(codeName)
							.createDate(LocalDateTime.now())
							.createEmpId("rshmadmin@rockplace.co.kr")
							.updateDate(updatedDate)
							.updateEmpId("rshmadmin@rockplace.co.kr")
							.isUsed(true)
							.orderBy(1)

							.ctyId(codeDiv)
							.val(code)
							.sid(null)
							.pid(null)
							.level(0)
							.build()
					);
				}

				result++;
			}

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = true;
			logMessage = "Total: " + resultList.size() + ", Success Count : " + result + ", elapsedTime : " + elapsedTime + "ms";
			logContent = "";
		} catch (Exception e) {

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = false;
			logMessage = "elapsedTime : " + elapsedTime + "ms";
			logContent = e.getMessage();
		}

		this.logService.create(logType, logMessage, logContent, isLogResult);

		return result;
	}

	/**
	 * Collect of Organization
	 */
	@CacheEvict(value = "organizationById", allEntries = true)
	public int collectOrganization() {

		long startTime = System.currentTimeMillis();
		long finishTime;
		long elapsedTime;
		boolean isLogResult = true;
		String logMessage = "";
		String logContent = "";
		String logType = "LOG_TYPE_ORG";

		int result = 0;

		try {

			final String ORG_ENT_ID = "ORG";
			Optional<EntityEntity> orgEntity = this.entityRepository.findById(ORG_ENT_ID);
			String orgEntityPrefix = null;
			if(orgEntity.isPresent()) {
				orgEntityPrefix = orgEntity.get().getPrefix();
			}

			List<OrganizationEntity> organizationList = this.organizationRepository.findAll();
			List<Map<String, Object>> resultList = this.insaMapper.getOrganizationList();

			// 기존에 등록되어 있고 DB Inc에서 제공하는 데이터에 값이 없을 경우 USED: false로 변경
			for (OrganizationEntity entity : organizationList) {

				boolean isExist = false;
				for (Map<String, Object> map : resultList) {

					if(this.checkBlankMapData(map, "COMPANY_CODE")) {

						if(StringUtils.equals(entity.getId(), orgEntityPrefix + "_" + map.get("COMPANY_CODE"))) {

							isExist = true;
							break;
						}
					}
				}

				if(!isExist) {

					entity.setUsed(false);
					entity.setUpdateDate(LocalDateTime.now());
					entity.setUpdateEmpId("rshmadmin@rockplace.co.kr");

					this.organizationRepository.save(entity);
				}
			}

			for (Map<String, Object> map : resultList) {

				String companyCode = null;
				if(this.checkBlankMapData(map, "COMPANY_CODE")) {
					companyCode = orgEntityPrefix + "_" + map.get("COMPANY_CODE");
				}
				String companyName = null;
				if(this.checkBlankMapData(map, "COMPANY_NAME")) {
					companyName = (String) map.get("COMPANY_NAME");
				}
				LocalDateTime updatedDate = null;
				if(this.checkBlankMapData(map, "UPDATED_DATE")) {
					updatedDate = LocalDateTime.parse((String) map.get("UPDATED_DATE"), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
				}

				// Key Check
				OrganizationEntity entity = null;
				boolean isExist = false;
				for (OrganizationEntity organizationEntity : organizationList) {
					if(StringUtils.equals(companyCode, organizationEntity.getId())) {

						isExist = true;
						entity = organizationEntity;
					}
				}

				if(isExist) {

					// Key가 있을 경우
					// Update 시간이 다를 경우 Update 실행
					if(updatedDate != null && !updatedDate.equals(entity.getUpdateDate())) {

						this.organizationRepository.save(
							OrganizationEntity.builder()
								.id(companyCode)
								.name(companyName)
								.label(companyName)
								.descr(companyName)
								.createDate(entity.getCreateDate())
								.createEmpId(entity.getCreateEmpId())
								.updateDate(updatedDate)
								.updateEmpId("rshmadmin@rockplace.co.kr")
								.isUsed(entity.isUsed())
								.orderBy(entity.getOrderBy())
								.build()
						);
					}
				} else {

					// Key가 없을 경우
					this.organizationRepository.save(
						OrganizationEntity.builder()
							.id(companyCode)
							.name(companyName)
							.label(companyName)
							.descr(companyName)
							.createDate(LocalDateTime.now())
							.createEmpId("rshmadmin@rockplace.co.kr")
							.updateDate(updatedDate)
							.updateEmpId("rshmadmin@rockplace.co.kr")
							.isUsed(true)
							.orderBy(1)
							.build()
					);
				}

				result++;
			}

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = true;
			logMessage = "Total: " + resultList.size() + ", Success Count : " + result + ", elapsedTime : " + elapsedTime + "ms";
			logContent = "";
		} catch (Exception e) {

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = false;
			logMessage = "elapsedTime : " + elapsedTime + "ms";
			logContent = e.getMessage();
		}

		this.logService.create(logType, logMessage, logContent, isLogResult);

		return result;
	}

	/**
	 * Collect of Department
	 */
	@CacheEvict(value = "departmentById", allEntries = true)
	public int collectDepartment() {

		long startTime = System.currentTimeMillis();
		long finishTime;
		long elapsedTime;
		boolean isLogResult = true;
		String logMessage = "";
		String logContent = "";
		String logType = "LOG_TYPE_DPT";

		int result = 0;

		try {

			final String ORG_ENT_ID = "ORG";
			Optional<EntityEntity> orgEntity = this.entityRepository.findById(ORG_ENT_ID);
			String orgEntityPrefix = null;
			if(orgEntity.isPresent()) {
				orgEntityPrefix = orgEntity.get().getPrefix();
			}

			final String DPT_ENT_ID = "DPT";
			Optional<EntityEntity> dptEntity = this.entityRepository.findById(DPT_ENT_ID);
			String dptEntityPrefix = null;
			if(dptEntity.isPresent()) {
				dptEntityPrefix = dptEntity.get().getPrefix();
			}

			List<DepartmentEntity> departmentList = this.departmentRepository.findAll();
			List<Map<String, Object>> resultList = this.insaMapper.getDepartmentList();

			// 기존에 등록되어 있고 DB Inc에서 제공하는 데이터에 값이 없을 경우 USED: false로 변경
			for (DepartmentEntity entity : departmentList) {

				boolean isExist = false;
				for (Map<String, Object> map : resultList) {

					if(this.checkBlankMapData(map, "DEPT_CODE")) {

						if(StringUtils.equals(entity.getId(), dptEntityPrefix + "_" + map.get("DEPT_CODE"))) {

							isExist = true;
							break;
						}
					}
				}

				if(!isExist) {

					entity.setUsed(false);
					entity.setUpdateDate(LocalDateTime.now());
					entity.setUpdateEmpId("rshmadmin@rockplace.co.kr");

					this.departmentRepository.save(entity);
				}
			}

			for (Map<String, Object> map : resultList) {

				String companyCode = null;
				if(this.checkBlankMapData(map, "COMPANY_CODE")) {
					companyCode = orgEntityPrefix + "_" + map.get("COMPANY_CODE");
				}
				String deptCode = null;
				if(this.checkBlankMapData(map, "DEPT_CODE")) {
					deptCode = dptEntityPrefix + "_" + map.get("DEPT_CODE");
				}
				String deptName = null;
				if(this.checkBlankMapData(map, "DEPT_NAME")) {
					deptName = (String) map.get("DEPT_NAME");
				}
				String parentDeptCode = null;
				if(this.checkBlankMapData(map, "PARENT_DEPT_CODE")) {

					parentDeptCode = dptEntityPrefix + "_" + map.get("PARENT_DEPT_CODE");
					if(StringUtils.equals((String) map.get("PARENT_DEPT_CODE"), "0")) {
						parentDeptCode = null;
					}
				}
				LocalDateTime updatedDate = null;
				if(this.checkBlankMapData(map, "UPDATED_DATE")) {
					updatedDate = LocalDateTime.parse((String) map.get("UPDATED_DATE"), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
				}

				// Key Check
				DepartmentEntity entity = null;
				boolean isExist = false;
				for (DepartmentEntity departmentEntity : departmentList) {
					if(StringUtils.equals(deptCode, departmentEntity.getId())) {

						isExist = true;
						entity = departmentEntity;
					}
				}

				if(isExist) {

					// Key가 있을 경우
					// Update 시간이 다를 경우 Update 실행
					if(updatedDate != null && !updatedDate.equals(entity.getUpdateDate())) {

						this.departmentRepository.save(
							DepartmentEntity.builder()
								.id(deptCode)
								.name(deptName)
								.label(deptName)
								.descr(deptName)
								.createDate(entity.getCreateDate())
								.createEmpId(entity.getCreateEmpId())
								.updateDate(updatedDate)
								.updateEmpId("rshmadmin@rockplace.co.kr")
								.isUsed(entity.isUsed())
								.orderBy(entity.getOrderBy())

								.orgId(companyCode)
								.pid(parentDeptCode)
								.level(entity.getLevel())
								.build()
						);
					}
				} else {

					// Key가 없을 경우
					this.departmentRepository.save(
						DepartmentEntity.builder()
							.id(deptCode)
							.name(deptName)
							.label(deptName)
							.descr(deptName)
							.createDate(LocalDateTime.now())
							.createEmpId("rshmadmin@rockplace.co.kr")
							.updateDate(updatedDate)
							.updateEmpId("rshmadmin@rockplace.co.kr")
							.isUsed(true)
							.orderBy(1)

							.orgId(companyCode)
							.pid(parentDeptCode)
							.level(1)
							.build()
					);
				}

				result++;
			}

			int level = 1;
			List<DepartmentEntity> superDepartmentList = this.departmentRepository.findByIdIn(List.of("DPT_OSZONE", "DPT_ROCKPLACE"));
			for (DepartmentEntity departmentEntity : superDepartmentList) {
				this.updateDepartmentLevel(departmentEntity, level);
			}

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = true;
			logMessage = "Total: " + resultList.size() + ", Success Count : " + result + ", elapsedTime : " + elapsedTime + "ms";
			logContent = "";
		} catch (Exception e) {

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = false;
			logMessage = "elapsedTime : " + elapsedTime + "ms";
			logContent = e.getMessage();
		}

		this.logService.create(logType, logMessage, logContent, isLogResult);

		return result;
	}

	private void updateDepartmentLevel(DepartmentEntity departmentEntity, int level) {

		departmentEntity.setLevel(level);
		this.departmentRepository.save(departmentEntity);

		level++;

		for (DepartmentEntity subDepartmentEntity : departmentEntity.getSubDepartmentEntityList()) {
			this.updateDepartmentLevel(subDepartmentEntity, level);
		}
	}

	/**
	 * Collect of Employee
	 */
	@CacheEvict(value = {"employeeById", "organizationByEmployee", "departmentByEmployee"}, allEntries = true)
	public int collectEmployee() {

		long startTime = System.currentTimeMillis();
		long finishTime;
		long elapsedTime;
		boolean isLogResult = true;
		String logMessage = "";
		String logContent = "";
		String logType = "LOG_TYPE_EMP";

		int result = 0;

		try {

			final String POSITION = "POSITION";
			final String DUTY_POSITION = "DUTY_POSITION";

			final String ORG_ENT_ID = "ORG";
			Optional<EntityEntity> orgEntity = this.entityRepository.findById(ORG_ENT_ID);
			String orgEntityPrefix = null;
			if(orgEntity.isPresent()) {
				orgEntityPrefix = orgEntity.get().getPrefix();
			}

			final String DPT_ENT_ID = "DPT";
			Optional<EntityEntity> dptEntity = this.entityRepository.findById(DPT_ENT_ID);
			String dptEntityPrefix = null;
			if(dptEntity.isPresent()) {
				dptEntityPrefix = dptEntity.get().getPrefix();
			}

			List<EmployeeEntity> employeeList = this.employeeRepository.findAll();
			List<Map<String, Object>> resultList = this.insaMapper.getEmployeeList();

			// 기존에 등록되어 있고 DB Inc에서 제공하는 데이터에 값이 없을 경우 USED: false로 변경
			for (EmployeeEntity entity : employeeList) {

				boolean isExist = false;
				for (Map<String, Object> map : resultList) {

					if(this.checkBlankMapData(map, "EMAIL")) {

						if(StringUtils.equals(entity.getId(), (String) map.get("EMAIL"))) {

							isExist = true;
							break;
						}
					}
				}

				if(!isExist) {

					entity.setUsed(false);
					entity.setUpdateDate(LocalDateTime.now());
					entity.setUpdateEmpId("rshmadmin@rockplace.co.kr");

					this.employeeRepository.save(entity);
				}
			}

			for (Map<String, Object> map : resultList) {

				String companyCode = null;
				if(this.checkBlankMapData(map, "COMPANY_CODE")) {
					companyCode = orgEntityPrefix + "_" + map.get("COMPANY_CODE");
				}
				String deptCode = null;
				if(this.checkBlankMapData(map, "DEPT_CODE")) {
					deptCode = dptEntityPrefix + "_" + map.get("DEPT_CODE");
				}

				String empName = null;
				if(this.checkBlankMapData(map, "NM_KOR")) {
					empName = (String) map.get("NM_KOR");
				}
				String empEmail = null;
				if(this.checkBlankMapData(map, "EMAIL")) {
					empEmail = (String) map.get("EMAIL");
				}
				String empNo = null;
				if(this.checkBlankMapData(map, "EMP_NO")) {
					empNo = (String) map.get("EMP_NO");
				}
				String empPositionCode = null;
				if(this.checkBlankMapData(map, "POSITION_CODE")) {
					empPositionCode = POSITION + "_" + map.get("COMPANY_CODE") + "_" + map.get("POSITION_CODE");
				}
				String empDutyCode = null;
				if(this.checkBlankMapData(map, "DUTY_CODE")) {
					empDutyCode = DUTY_POSITION + "_" + map.get("COMPANY_CODE") + "_" + map.get("DUTY_CODE");
				}
				String empJobTelNo = null;
				if(this.checkBlankMapData(map, "JOB_TEL_NO")) {
					empJobTelNo = (String) map.get("JOB_TEL_NO");
				}
				String empMobileTelNo = null;
				if(this.checkBlankMapData(map, "MOBILE_TEL_NO")) {
					empMobileTelNo = (String) map.get("MOBILE_TEL_NO");
				}

				LocalDateTime updatedDate = null;
				if(this.checkBlankMapData(map, "UPDATED_DATE")) {
					updatedDate = LocalDateTime.parse((String) map.get("UPDATED_DATE"), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
				}

				// Key Check
				EmployeeEntity entity = null;
				boolean isExist = false;
				for (EmployeeEntity employeeEntity : employeeList) {
					if(StringUtils.equals(empEmail, employeeEntity.getId())) {

						isExist = true;
						entity = employeeEntity;
					}
				}

				if(isExist) {

					// Key가 있을 경우
					// Update 시간이 다를 경우 Update 실행
					if(updatedDate != null && !updatedDate.equals(entity.getUpdateDate())) {

						this.employeeRepository.save(
							EmployeeEntity.builder()
								.id(empEmail)
								.name(empName)
								.label(empName)
								.descr(empName)
								.createDate(entity.getCreateDate())
								.createEmpId(entity.getCreateEmpId())
								.updateDate(updatedDate)
								.updateEmpId("rshmadmin@rockplace.co.kr")
								.isUsed(entity.isUsed())
								.orderBy(entity.getOrderBy())

								.orgId(companyCode)
								.dptId(deptCode)
								.number(empNo)
								.hphone(empMobileTelNo)
								.jobTel(empJobTelNo)
								.positionCd(empPositionCode)
								.dutyPositionCd(empDutyCode)
								.mgrEmpId(entity.getMgrEmpId())
								.isMailUsed(entity.isMailUsed())
								.agcEmpId(entity.getAgcEmpId())
								.agcStartDate(entity.getAgcStartDate())
								.agcEndDate(entity.getAgcEndDate())
								.passwd(entity.getPasswd())
								.build()
						);
					}
				} else {

					// Key가 없을 경우
					this.employeeRepository.save(
						EmployeeEntity.builder()
							.id(empEmail)
							.name(empName)
							.label(empName)
							.descr(empName)
							.createDate(LocalDateTime.now())
							.createEmpId("rshmadmin@rockplace.co.kr")
							.updateDate(updatedDate)
							.updateEmpId("rshmadmin@rockplace.co.kr")
							.isUsed(true)
							.orderBy(1)

							.orgId(companyCode)
							.dptId(deptCode)
							.number(empNo)
							.hphone(empMobileTelNo)
							.jobTel(empJobTelNo)
							.positionCd(empPositionCode)
							.dutyPositionCd(empDutyCode)
							.mgrEmpId(null)
							.isMailUsed(true)
							.agcEmpId(null)
							.agcStartDate(null)
							.agcEndDate(null)
							.passwd(null)
							.build()
					);
				}

				result++;
			}

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = true;
			logMessage = "Total: " + resultList.size() + ", Success Count : " + result + ", elapsedTime : " + elapsedTime + "ms";
			logContent = "";
		} catch (Exception e) {

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = false;
			logMessage = "elapsedTime : " + elapsedTime + "ms";
			logContent = e.getMessage();
		}

		this.logService.create(logType, logMessage, logContent, isLogResult);

		return result;
	}

	public boolean checkBlankMapData(Map<String, Object> map, String key) {

		boolean isResult = false;
		if(map.containsKey(key)) {
			if(StringUtils.isNotBlank((String) map.get(key))) {
				isResult = true;
			}
		}

		return isResult;
	}

	/**
	 * Collect of Vacation Code
	 */
	public int collectVacationCode() {

		long startTime = System.currentTimeMillis();
		long finishTime;
		long elapsedTime;
		boolean isLogResult = true;
		String logMessage = "";
		String logContent = "";
		String logType = "LOG_TYPE_VACATION_CODE";

		int result = 0;

		try {

			final String CODE_TYPE = "VACATION";

			List<CodeEntity> codeList = this.codeRepository.findByCtyIdIn(List.of(CODE_TYPE));
			List<Map<String, Object>> resultList = this.insaMapper.getVacationCodeList();

			// 기존에 등록되어 있고 DB Inc에서 제공하는 데이터에 값이 없을 경우 USED: false로 변경
			for (CodeEntity entity : codeList) {

				boolean isExist = false;
				for (Map<String, Object> map : resultList) {

					if(this.checkBlankMapData(map, "CODE") && this.checkBlankMapData(map, "NAME")) {
						if(StringUtils.equals(entity.getId(), CODE_TYPE + "_" + map.get("CODE"))) {

							isExist = true;
							break;
						}
					}
				}

				if(!isExist) {

					entity.setUsed(false);
					entity.setUpdateDate(LocalDateTime.now());
					entity.setUpdateEmpId("rshmadmin@rockplace.co.kr");

					this.codeRepository.save(entity);
				}
			}

			for (Map<String, Object> map : resultList) {

				String code = null;
				if(this.checkBlankMapData(map, "CODE")) {
					code = CODE_TYPE + "_" + map.get("CODE");
				}

				String codeName = null;
				if(this.checkBlankMapData(map, "CODE_NAME")) {
					codeName = (String) map.get("CODE_NAME");
				}

				// Key Check
				CodeEntity entity = null;
				boolean isExist = false;
				for (CodeEntity codeEntity : codeList) {
					if(StringUtils.equals(code, codeEntity.getId())) {

						isExist = true;
						entity = codeEntity;
					}
				}

				if(isExist) {

					// Key가 있을 경우
					this.codeRepository.save(
						CodeEntity.builder()
							.id(code)
							.name(codeName)
							.label(codeName)
							.descr(codeName)
							.createDate(entity.getCreateDate())
							.createEmpId(entity.getCreateEmpId())
							.updateDate(LocalDateTime.now())
							.updateEmpId("rshmadmin@rockplace.co.kr")
							.isUsed(entity.isUsed())
							.orderBy(entity.getOrderBy())

							.ctyId(CODE_TYPE)
							.val(code)
							.sid(null)
							.pid(null)
							.level(entity.getLevel())
							.build()
					);
				} else {

					// Key가 없을 경우
					this.codeRepository.save(
						CodeEntity.builder()
							.id(code)
							.name(codeName)
							.label(codeName)
							.descr(codeName)
							.createDate(LocalDateTime.now())
							.createEmpId("rshmadmin@rockplace.co.kr")
							.updateDate(LocalDateTime.now())
							.updateEmpId("rshmadmin@rockplace.co.kr")
							.isUsed(true)
							.orderBy(1)

							.ctyId(CODE_TYPE)
							.val(code)
							.sid(null)
							.pid(null)
							.level(0)
							.build()
					);
				}

				result++;
			}

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = true;
			logMessage = "Total: " + resultList.size() + ", Success Count : " + result + ", elapsedTime : " + elapsedTime + "ms";
			logContent = "";
		} catch (Exception e) {

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = false;
			logMessage = "elapsedTime : " + elapsedTime + "ms";
			logContent = e.getMessage();
		}

		this.logService.create(logType, logMessage, logContent, isLogResult);

		return result;
	}

	/**
	 * Collect of Vacation
	 */
	public int collectVacation() {

		long startTime = System.currentTimeMillis();
		long finishTime;
		long elapsedTime;
		boolean isLogResult = true;
		String logMessage = "";
		String logContent = "";
		String logType = "LOG_TYPE_VACATION";

		int result = 0;

		try {

			LocalDate date = LocalDate.now();
			List<Map<String, Object>> vacationList = this.insaMapper.getVacationList(Map.of(
					"start", date.minusDays(7),
					"end", date));

			for (Map<String, Object> vacationMap : vacationList) {
				result += this.saveVacation(vacationMap);
			}

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = true;
			logMessage = "Total: " + vacationList.size() + ", Success Count : " + result + ", elapsedTime : " + elapsedTime + "ms";
			logContent = "";
		} catch (Exception e) {

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = false;
			logMessage = "elapsedTime : " + elapsedTime + "ms";
			logContent = e.getMessage();
		}

		this.logService.create(logType, logMessage, logContent, isLogResult);

		return result;
	}

	public int saveVacation(Map<String, Object> vacationMap) {

		String ENT_ID = "WOR";
		String CTL_ID = "";
		String TYPE_CD = "SHM_TYPE_VACATION";
		final String CODE_TYPE = "VACATION";

		Map<String, Object> paramMap = new HashMap<String, Object>();

		// 등록 유형(SHM_TYPE_VACATION)
		paramMap.put("type_cd", TYPE_CD);

		// 엔지니어
		String email = null;
		if(this.checkBlankMapData(vacationMap, "EMAIL")) {
			email = (String) vacationMap.get("EMAIL");
		}
		paramMap.put("charge_emp_id", email);

		/*
		 * 'VD001','연차' - 09:00 ~ 18:00
		 * 'VD002','연차(오전)' - 09:00~14:00
		 * 'VD003','연차(오후)' - 14:00~18:00
		 * 'VD004','결근'
		 * 'VD005','인정휴가'
		 * 'VD006','공가(일단위)' - 09:00 ~ 18:00
		 * 'VD007','공가(오전)' - 09:00~14:00
		 * 'VD008','공가(오후)' - 14:00~18:00
		 * 'VD009','태아검진휴가(오전)' - 09:00~14:00
		 * 'VD010','태아검진휴가(오후)' - 14:00~18:00
		 * 'VD011','경조휴가' - 09:00~18:00
		 * 'VD012','병가'
		 * 'VD015','국내출장'
		 * 'VD016','해외출장'
		 */
		String vacationCd = null;
		if(this.checkBlankMapData(vacationMap, "VACATION_CD")) {
			vacationCd = CODE_TYPE + "_" + vacationMap.get("VACATION_CD");
		}
		paramMap.put("vacation_cd", vacationCd);

		// 휴가 유형으로 제목 대체 
		Optional<CodeEntity> codeEntity = this.codeRepository.findById(vacationCd);
		if(codeEntity.isPresent()) {
			paramMap.put("name", codeEntity.get().getName());
		} else {
			paramMap.put("name", "휴가(코드 없음) - " + vacationCd);
		}

		// 유형에 따라서 시간 지정 
		LocalDate day = null;
		if(this.checkBlankMapData(vacationMap, "DAY")) {
			day = LocalDate.parse((String) vacationMap.get("DAY"));
		}

		// Key 설정
		paramMap.put("key", "");

		// 기존 등록여부 확인 
		Map<String, Object> checkMap = new HashMap<String, Object>();
		checkMap.put("emp_id", email);
		checkMap.put("day", day.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		checkMap.put("vacation_cd", vacationCd);
		List<Map<String, Object>> resultList = this.commonService.getResultListBySql("CHECK_VACATION", checkMap);
		if(resultList.size() > 0) {

			// Key 설정
			paramMap.put("key", resultList.get(0).get("id"));
		}

		switch (vacationCd) {
			case CODE_TYPE + "_" + "VD001":	// '연차' - 09:00 ~ 18:00

				paramMap.put("act_start_date", LocalDateTime.of(day, LocalTime.of(9, 0)).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
				paramMap.put("act_finish_date", LocalDateTime.of(day, LocalTime.of(18, 0)).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
				break;
			case CODE_TYPE + "_" + "VD002":	// '연차(오전)' - 09:00~14:00

				paramMap.put("act_start_date", LocalDateTime.of(day, LocalTime.of(9, 0)).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
				paramMap.put("act_finish_date", LocalDateTime.of(day, LocalTime.of(14, 0)).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
				break;
			case CODE_TYPE + "_" + "VD003":	// '연차(오후)' - 14:00~18:00

				paramMap.put("act_start_date", LocalDateTime.of(day, LocalTime.of(14, 0)).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
				paramMap.put("act_finish_date", LocalDateTime.of(day, LocalTime.of(18, 0)).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
				break;
			case CODE_TYPE + "_" + "VD006":	// '공가(일단위)' - 09:00 ~ 18:00

				paramMap.put("act_start_date", LocalDateTime.of(day, LocalTime.of(9, 0)).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
				paramMap.put("act_finish_date", LocalDateTime.of(day, LocalTime.of(18, 0)).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
				break;
			case CODE_TYPE + "_" + "VD007":	// '공가(오전)' - 09:00~14:00

				paramMap.put("act_start_date", LocalDateTime.of(day, LocalTime.of(9, 0)).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
				paramMap.put("act_finish_date", LocalDateTime.of(day, LocalTime.of(14, 0)).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
				break;
			case CODE_TYPE + "_" + "VD008":	// '공가(오후)' - 14:00~18:00

				paramMap.put("act_start_date", LocalDateTime.of(day, LocalTime.of(14, 0)).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
				paramMap.put("act_finish_date", LocalDateTime.of(day, LocalTime.of(18, 0)).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
				break;
			case CODE_TYPE + "_" + "VD009":	// '태아검진휴가(오전)' - 09:00~14:00

				paramMap.put("act_start_date", LocalDateTime.of(day, LocalTime.of(9, 0)).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
				paramMap.put("act_finish_date", LocalDateTime.of(day, LocalTime.of(14, 0)).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
				break;
			case CODE_TYPE + "_" + "VD010":	// '태아검진휴가(오후)' - 14:00~18:00

				paramMap.put("act_start_date", LocalDateTime.of(day, LocalTime.of(14, 0)).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
				paramMap.put("act_finish_date", LocalDateTime.of(day, LocalTime.of(18, 0)).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
				break;
			case CODE_TYPE + "_" + "VD011":	// '경조휴가' - 09:00~18:00

				paramMap.put("act_start_date", LocalDateTime.of(day, LocalTime.of(9, 0)).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
				paramMap.put("act_finish_date", LocalDateTime.of(day, LocalTime.of(18, 0)).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
				break;
			default:
				break;
		}

		this.commonService.saveForm(ENT_ID, CTL_ID, paramMap);

		return 1;
	}
}