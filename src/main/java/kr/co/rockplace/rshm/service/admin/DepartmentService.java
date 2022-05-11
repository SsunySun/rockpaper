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
import kr.co.rockplace.rshm.db.entity.EntityEntity;
import kr.co.rockplace.rshm.db.entity.OrganizationEntity;
import kr.co.rockplace.rshm.db.repository.CommonRepository;
import kr.co.rockplace.rshm.db.repository.DepartmentRepository;
import kr.co.rockplace.rshm.db.repository.EntityRepository;
import kr.co.rockplace.rshm.db.repository.OrganizationRepository;
import kr.co.rockplace.rshm.db.service.SequenceKeyService;
import kr.co.rockplace.rshm.utils.ReflectionUtil;

/**
 * Department Service
 * @author wonsunlee
 *
 */
@Service
public class DepartmentService extends AdminCommonService<DepartmentEntity, CommonRepository<DepartmentEntity, String>> {

	@Autowired
	private DepartmentRepository repository;

	@Autowired
	private SequenceKeyService sequenceKeyService;

	@Autowired
	private OrganizationRepository organizationRepository;

	@Autowired
	private EntityRepository entityRepository;

	@Override
	@Transactional
	public DepartmentEntity create(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		Optional<EntityEntity> thisEntity = this.entityRepository.findById(entId);
		if(StringUtils.isNoneBlank((String) map.get("id"))) {

			Optional<DepartmentEntity> checkEntity = this.repository.findById(thisEntity.get().getPrefix() + "_" + map.get("id"));
			if(checkEntity.isPresent()) {
				return null;
			}
		}

		DepartmentEntity returnDepartmentEntity = null;
		Optional<OrganizationEntity> organizationEntity = this.organizationRepository.findById((String) map.get("orgId"));
		if(organizationEntity.isPresent()) {

			// Key 설정
			if(!map.containsKey("id") || StringUtils.isBlank((String) map.get("id"))) {
				map.put("id", this.sequenceKeyService.getKey(entId));
			} else {
				map.put("id", thisEntity.get().getPrefix() + "_" + map.get("id"));
			}

			returnDepartmentEntity = this.repository.save(
				ReflectionUtil.convertToValueObject(map, DepartmentEntity.class)
			);
		}

		return returnDepartmentEntity;
	}

	@Override
	@Transactional
	public DepartmentEntity update(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		DepartmentEntity returnDepartmentEntity = null;
		Optional<OrganizationEntity> organizationEntity = this.organizationRepository.findById((String) map.get("orgId"));
		if(organizationEntity.isPresent()) {

			Optional<DepartmentEntity> departmentEntity = this.repository.findById((String) map.get("id"));
			if(departmentEntity.isPresent()) {

				Map<String, Object> resultMap = ReflectionUtil.diffEntityAndMap(departmentEntity.get(), map);
				returnDepartmentEntity = this.repository.save(
					ReflectionUtil.convertToValueObject(resultMap, DepartmentEntity.class)
				);
			}
		}

		return returnDepartmentEntity;
	}

	/**
	 * 이름 가져오기 
	 * @param id
	 * @return 이름
	 */
	@Cacheable(value = "departmentById")
	public String getName(String id) {

		String name = id;
		Optional<DepartmentEntity> departmentEntity = this.repository.findById(id);
		if(departmentEntity.isPresent()) {
			name = departmentEntity.get().getName();
		}

		return name;
	}
}