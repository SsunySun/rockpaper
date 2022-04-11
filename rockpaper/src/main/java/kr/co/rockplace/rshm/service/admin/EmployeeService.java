package kr.co.rockplace.rshm.service.admin;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.DepartmentEntity;
import kr.co.rockplace.rshm.db.entity.EmployeeEntity;
import kr.co.rockplace.rshm.db.entity.EntityEntity;
import kr.co.rockplace.rshm.db.entity.OrganizationEntity;
import kr.co.rockplace.rshm.db.repository.CommonRepository;
import kr.co.rockplace.rshm.db.repository.DepartmentRepository;
import kr.co.rockplace.rshm.db.repository.EmployeeRepository;
import kr.co.rockplace.rshm.db.repository.EntityRepository;
import kr.co.rockplace.rshm.db.repository.OrganizationRepository;
import kr.co.rockplace.rshm.db.service.SequenceKeyService;
import kr.co.rockplace.rshm.utils.ReflectionUtil;

/**
 * Employee Service
 * @author wonsunlee
 *
 */
@Service
public class EmployeeService extends AdminCommonService<EmployeeEntity, CommonRepository<EmployeeEntity, String>> {

	@Autowired
	private EmployeeRepository repository;

	@Autowired
	private SequenceKeyService sequenceKeyService;

	@Autowired
	private OrganizationRepository organizationRepository;

	@Autowired
	private DepartmentRepository departmentRepository;

	@Autowired
	private EntityRepository entityRepository;

	@Override
	@Transactional
	public EmployeeEntity create(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		Optional<EntityEntity> thisEntity = this.entityRepository.findById(entId);
		if(StringUtils.isNoneBlank((String) map.get("id"))) {

			Optional<EmployeeEntity> checkEntity = this.repository.findById(thisEntity.get().getPrefix() + "_" + map.get("id"));
			if(checkEntity.isPresent()) {
				return null;
			}
		}

		EmployeeEntity returnEmployeeEntity = null;
		Optional<OrganizationEntity> organizationEntity = this.organizationRepository.findById((String) map.get("orgId"));
		Optional<DepartmentEntity> departmentEntity = this.departmentRepository.findById((String) map.get("dptId"));

		if(organizationEntity.isPresent() && departmentEntity.isPresent()) {

			// Key 설정
			if(!map.containsKey("id") || StringUtils.isBlank((String) map.get("id"))) {
				map.put("id", this.sequenceKeyService.getKey(entId));
			} else {
				map.put("id", thisEntity.get().getPrefix() + "_" + map.get("id"));
			}

			returnEmployeeEntity = this.repository.save(
				ReflectionUtil.convertToValueObject(map, EmployeeEntity.class)
			);
		}

		return returnEmployeeEntity;
	}

	@Override
	@Transactional
	public EmployeeEntity update(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		EmployeeEntity returnEmployeeEntity = null;
		Optional<OrganizationEntity> organizationEntity = this.organizationRepository.findById((String) map.get("orgId"));
		Optional<DepartmentEntity> departmentEntity = this.departmentRepository.findById((String) map.get("dptId"));
		if(organizationEntity.isPresent() && departmentEntity.isPresent()) {

			Optional<EmployeeEntity> employeeEntity = this.repository.findById((String) map.get("id"));
			if(employeeEntity.isPresent()) {

				Map<String, Object> resultMap = ReflectionUtil.diffEntityAndMap(employeeEntity.get(), map);
				returnEmployeeEntity = this.repository.save(
					ReflectionUtil.convertToValueObject(resultMap, EmployeeEntity.class)
				);
			}
		}

		return returnEmployeeEntity;
	}

	/**
	 * 이름 가져오기 
	 * @param id
	 * @return 이름
	 */
	@Cacheable(value = "employeeById")
	public String getName(String empId) {

		String name = empId;
		Optional<EmployeeEntity> employeeEntity = this.repository.findById(empId);
		if(employeeEntity.isPresent()) {
			name = employeeEntity.get().getName();
		}

		return name;
	}

	/**
	 * 부서ID 가져오기 
	 * @param empId
	 * @return departmentId
	 */
	@Cacheable(value = "departmentByEmployee")
	public String getDepartmentId(String empId) {

		String departmentId = "";
		Optional<EmployeeEntity> employeeEntity = this.repository.findById(empId);
		if(employeeEntity.isPresent()) {
			departmentId = employeeEntity.get().getDptId();
		}

		return departmentId;
	}

	/**
	 * 회사ID 가져오기 
	 * @param empId
	 * @return organizationId
	 */
	@Cacheable(value = "organizationByEmployee")
	public String getOrganizationId(String empId) {

		String organizationId = "";
		Optional<EmployeeEntity> employeeEntity = this.repository.findById(empId);
		if(employeeEntity.isPresent()) {
			organizationId = employeeEntity.get().getOrgId();
		}

		return organizationId;
	}
}