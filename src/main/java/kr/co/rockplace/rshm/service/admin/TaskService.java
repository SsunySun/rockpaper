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
import kr.co.rockplace.rshm.db.entity.TaskEntity;
import kr.co.rockplace.rshm.db.repository.ActivityRepository;
import kr.co.rockplace.rshm.db.repository.CommonRepository;
import kr.co.rockplace.rshm.db.repository.EntityRepository;
import kr.co.rockplace.rshm.db.repository.TaskRepository;
import kr.co.rockplace.rshm.db.service.SequenceKeyService;
import kr.co.rockplace.rshm.utils.ReflectionUtil;

/**
 * Task Service
 * @author wonsunlee
 *
 */
@Service
public class TaskService extends AdminCommonService<TaskEntity, CommonRepository<TaskEntity, String>> {

	@Autowired
	private TaskRepository repository;

	@Autowired
	private SequenceKeyService sequenceKeyService;

	@Autowired
	private EntityRepository entityRepository;

	@Autowired
	private ActivityRepository activityRepository;

	@Override
	@Transactional
	public TaskEntity create(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		Optional<EntityEntity> thisEntity = this.entityRepository.findById(entId);
		if(StringUtils.isNoneBlank((String) map.get("id"))) {

			Optional<TaskEntity> checkEntity = this.repository.findById(thisEntity.get().getPrefix() + "_" + map.get("id"));
			if(checkEntity.isPresent()) {
				return null;
			}
		}

		TaskEntity returnTaskEntity = null;
		Optional<EntityEntity> entityEntity = this.entityRepository.findById((String) map.get("entId"));
		Optional<ActivityEntity> activityEntity = this.activityRepository.findById((String) map.get("actId"));
		if(entityEntity.isPresent() && activityEntity.isPresent()) {

			// Key 설정
			if(!map.containsKey("id") || StringUtils.isBlank((String) map.get("id"))) {
				map.put("id", this.sequenceKeyService.getKey(entId));
			} else {
				map.put("id", thisEntity.get().getPrefix() + "_" + map.get("id"));
			}

			returnTaskEntity = this.repository.save(
				ReflectionUtil.convertToValueObject(map, TaskEntity.class)
			);
		}

		return returnTaskEntity;
	}

	@Override
	@Transactional
	public TaskEntity update(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		TaskEntity returnTaskEntity = null;
		Optional<EntityEntity> entityEntity = this.entityRepository.findById((String) map.get("entId"));
		Optional<ActivityEntity> activityEntity = this.activityRepository.findById((String) map.get("actId"));
		if(entityEntity.isPresent() && activityEntity.isPresent()) {

			Optional<TaskEntity> taskEntity = this.repository.findById((String) map.get("id"));
			if(taskEntity.isPresent()) {

				Map<String, Object> resultMap = ReflectionUtil.diffEntityAndMap(taskEntity.get(), map);
				returnTaskEntity = this.repository.save(
					ReflectionUtil.convertToValueObject(resultMap, TaskEntity.class)
				);
			}
		}

		return returnTaskEntity;
	}
}