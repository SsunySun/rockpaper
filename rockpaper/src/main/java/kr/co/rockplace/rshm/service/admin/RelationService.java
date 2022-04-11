package kr.co.rockplace.rshm.service.admin;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.EntityEntity;
import kr.co.rockplace.rshm.db.entity.RelationEntity;
import kr.co.rockplace.rshm.db.repository.CommonRepository;
import kr.co.rockplace.rshm.db.repository.EntityRepository;
import kr.co.rockplace.rshm.db.repository.RelationRepository;
import kr.co.rockplace.rshm.db.service.SequenceKeyService;
import kr.co.rockplace.rshm.utils.ReflectionUtil;

/**
 * Relation Service
 * @author wonsunlee
 *
 */
@Service
public class RelationService extends AdminCommonService<RelationEntity, CommonRepository<RelationEntity, String>> {

	@Autowired
	private RelationRepository repository;

	@Autowired
	private SequenceKeyService sequenceKeyService;

	@Autowired
	private EntityRepository entityRepository;

	@Override
	@Transactional
	public RelationEntity create(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		Optional<EntityEntity> thisEntity = this.entityRepository.findById(entId);
		if(StringUtils.isNoneBlank((String) map.get("id"))) {

			Optional<RelationEntity> checkEntity = this.repository.findById(thisEntity.get().getPrefix() + "_" + map.get("id"));
			if(checkEntity.isPresent()) {
				return null;
			}
		}

		RelationEntity returnRelationEntity = null;

		// Key 설정
		if(!map.containsKey("id") || StringUtils.isBlank((String) map.get("id"))) {
			map.put("id", this.sequenceKeyService.getKey(entId));
		} else {
			map.put("id", thisEntity.get().getPrefix() + "_" + map.get("id"));
		}

		returnRelationEntity = this.repository.save(
			ReflectionUtil.convertToValueObject(map, RelationEntity.class)
		);

		return returnRelationEntity;
	}

	@Override
	@Transactional
	public RelationEntity update(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		RelationEntity returnRelationEntity = null;
		Optional<RelationEntity> relationEntity = this.repository.findById((String) map.get("id"));
		if(relationEntity.isPresent()) {

			Map<String, Object> resultMap = ReflectionUtil.diffEntityAndMap(relationEntity.get(), map);
			returnRelationEntity = this.repository.save(
				ReflectionUtil.convertToValueObject(resultMap, RelationEntity.class)
			);
		}

		return returnRelationEntity;
	}
}