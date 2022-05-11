package kr.co.rockplace.rshm.service.admin;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.EntityEntity;
import kr.co.rockplace.rshm.db.entity.OrganizationEntity;
import kr.co.rockplace.rshm.db.repository.CommonRepository;
import kr.co.rockplace.rshm.db.repository.EntityRepository;
import kr.co.rockplace.rshm.db.repository.OrganizationRepository;
import kr.co.rockplace.rshm.db.service.SequenceKeyService;
import kr.co.rockplace.rshm.utils.ReflectionUtil;

/**
 * Organization Service
 * @author wonsunlee
 *
 */
@Service
public class OrganizationService extends AdminCommonService<OrganizationEntity, CommonRepository<OrganizationEntity, String>> {

	@Autowired
	private OrganizationRepository repository;

	@Autowired
	private SequenceKeyService sequenceKeyService;

	@Autowired
	private EntityRepository entityRepository;

	@Override
	@Transactional
	public OrganizationEntity create(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		Optional<EntityEntity> thisEntity = this.entityRepository.findById(entId);
		if(StringUtils.isNoneBlank((String) map.get("id"))) {

			Optional<OrganizationEntity> checkEntity = this.repository.findById(thisEntity.get().getPrefix() + "_" + map.get("id"));
			if(checkEntity.isPresent()) {
				return null;
			}
		}

		OrganizationEntity returnOrganizationEntity = null;

		// Key 설정
		if(!map.containsKey("id") || StringUtils.isBlank((String) map.get("id"))) {
			map.put("id", this.sequenceKeyService.getKey(entId));
		} else {
			map.put("id", thisEntity.get().getPrefix() + "_" + map.get("id"));
		}

		returnOrganizationEntity = this.repository.save(
			ReflectionUtil.convertToValueObject(map, OrganizationEntity.class)
		);

		return returnOrganizationEntity;
	}

	@Override
	@Transactional
	public OrganizationEntity update(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		OrganizationEntity returnOrganizationEntity = null;
		Optional<OrganizationEntity> organizationEntity = this.repository.findById((String) map.get("id"));
		if(organizationEntity.isPresent()) {

			Map<String, Object> resultMap = ReflectionUtil.diffEntityAndMap(organizationEntity.get(), map);
			returnOrganizationEntity = this.repository.save(
				ReflectionUtil.convertToValueObject(resultMap, OrganizationEntity.class)
			);
		}

		return returnOrganizationEntity;
	}

	/**
	 * 이름 가져오기 
	 * @param id
	 * @return 이름
	 */
	@Cacheable(value = "organizationById")
	public String getName(String id) {

		String name = id;
		Optional<OrganizationEntity> organizationEntity = this.repository.findById(id);
		if(organizationEntity.isPresent()) {
			name = organizationEntity.get().getName();
		}

		return name;
	}
}