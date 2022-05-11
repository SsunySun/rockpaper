package kr.co.rockplace.rshm.service.admin;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.EntityEntity;
import kr.co.rockplace.rshm.db.entity.SequenceEntity;
import kr.co.rockplace.rshm.db.repository.CommonRepository;
import kr.co.rockplace.rshm.db.repository.EntityRepository;
import kr.co.rockplace.rshm.db.repository.SequenceRepository;
import kr.co.rockplace.rshm.db.service.SequenceKeyService;
import kr.co.rockplace.rshm.utils.ReflectionUtil;

/**
 * Sequence Service
 * @author wonsunlee
 *
 */
@Service
public class SequenceService extends AdminCommonService<SequenceEntity, CommonRepository<SequenceEntity, String>> {

	@Autowired
	private SequenceRepository repository;

	@Autowired
	private SequenceKeyService sequenceKeyService;

	@Autowired
	private EntityRepository entityRepository;

	@Override
	@Transactional
	public SequenceEntity create(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		Optional<EntityEntity> thisEntity = this.entityRepository.findById(entId);
		if(StringUtils.isNoneBlank((String) map.get("id"))) {

			Optional<SequenceEntity> checkEntity = this.repository.findById(thisEntity.get().getPrefix() + "_" + map.get("id"));
			if(checkEntity.isPresent()) {
				return null;
			}
		}

		SequenceEntity returnSequenceEntity = null;
		Optional<EntityEntity> entityEntity = this.entityRepository.findById((String) map.get("entId"));
		if(entityEntity.isPresent()) {

			// Key 설정
			if(!map.containsKey("id") || StringUtils.isBlank((String) map.get("id"))) {
				map.put("id", this.sequenceKeyService.getKey(entId));
			} else {
				map.put("id", thisEntity.get().getPrefix() + "_" + map.get("id"));
			}

			returnSequenceEntity = this.repository.save(
				ReflectionUtil.convertToValueObject(map, SequenceEntity.class)
			);
		}

		return returnSequenceEntity;
	}

	@Override
	@Transactional
	public SequenceEntity update(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		SequenceEntity returnSequenceEntity = null;
		Optional<EntityEntity> entityEntity = this.entityRepository.findById((String) map.get("entId"));
		if(entityEntity.isPresent()) {

			Optional<SequenceEntity> sequenceEntity = this.repository.findById((String) map.get("id"));
			if(sequenceEntity.isPresent()) {

				Map<String, Object> resultMap = ReflectionUtil.diffEntityAndMap(sequenceEntity.get(), map);
				returnSequenceEntity = this.repository.save(
					ReflectionUtil.convertToValueObject(resultMap, SequenceEntity.class)
				);
			}
		}

		return returnSequenceEntity;
	}
}