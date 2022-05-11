package kr.co.rockplace.rshm.service.admin;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.ActivityEntity;
import kr.co.rockplace.rshm.db.entity.EntityEntity;
import kr.co.rockplace.rshm.db.entity.WorkflowEntity;
import kr.co.rockplace.rshm.db.repository.ActivityRepository;
import kr.co.rockplace.rshm.db.repository.CommonRepository;
import kr.co.rockplace.rshm.db.repository.EntityRepository;
import kr.co.rockplace.rshm.db.repository.WorkflowRepository;
import kr.co.rockplace.rshm.db.service.SequenceKeyService;
import kr.co.rockplace.rshm.utils.ReflectionUtil;

/**
 * Activity Service
 * @author wonsunlee
 *
 */
@Service
public class ActivityService extends AdminCommonService<ActivityEntity, CommonRepository<ActivityEntity, String>> {

	@Autowired
	private ActivityRepository repository;

	@Autowired
	private SequenceKeyService sequenceKeyService;

	@Autowired
	private EntityRepository entityRepository;

	@Autowired
	private WorkflowRepository workflowRepository;

	@Override
	@Transactional
	public ActivityEntity create(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		Optional<EntityEntity> thisEntity = this.entityRepository.findById(entId);
		if(StringUtils.isNoneBlank((String) map.get("id"))) {

			Optional<ActivityEntity> checkEntity = this.repository.findById(thisEntity.get().getPrefix() + "_" + (String) map.get("id"));
			if(checkEntity.isPresent()) {
				return null;
			}
		}

		ActivityEntity returnActivityEntity = null;
		Optional<EntityEntity> entityEntity = this.entityRepository.findById((String) map.get("entId"));
		Optional<WorkflowEntity> workflowEntity = this.workflowRepository.findById((String) map.get("wofId"));
		if(entityEntity.isPresent() && workflowEntity.isPresent()) {

			// Key 설정
			if(!map.containsKey("id") || StringUtils.isBlank((String) map.get("id"))) {
				map.put("id", this.sequenceKeyService.getKey(entId));
			} else {
				map.put("id", thisEntity.get().getPrefix() + "_" + map.get("id"));
			}

			returnActivityEntity = this.repository.save(
				ReflectionUtil.convertToValueObject(map, ActivityEntity.class)
			);
		}

		return returnActivityEntity;
	}

	@Override
	@Transactional
	public ActivityEntity update(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		ActivityEntity returnActivityEntity = null;
		Optional<EntityEntity> entityEntity = this.entityRepository.findById((String) map.get("entId"));
		Optional<WorkflowEntity> workflowEntity = this.workflowRepository.findById((String) map.get("wofId"));
		if(entityEntity.isPresent() && workflowEntity.isPresent()) {

			Optional<ActivityEntity> activityEntity = this.repository.findById((String) map.get("id"));
			if(activityEntity.isPresent()) {

				Map<String, Object> resultMap = ReflectionUtil.diffEntityAndMap(activityEntity.get(), map);
				returnActivityEntity = this.repository.save(
					ReflectionUtil.convertToValueObject(resultMap, ActivityEntity.class)
				);
			}
		}

		return returnActivityEntity;
	}
}