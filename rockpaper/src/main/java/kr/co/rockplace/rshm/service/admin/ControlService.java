package kr.co.rockplace.rshm.service.admin;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.ControlEntity;
import kr.co.rockplace.rshm.db.entity.EntityEntity;
import kr.co.rockplace.rshm.db.entity.TaskEntity;
import kr.co.rockplace.rshm.db.repository.CommonRepository;
import kr.co.rockplace.rshm.db.repository.ControlRepository;
import kr.co.rockplace.rshm.db.repository.EntityRepository;
import kr.co.rockplace.rshm.db.repository.TaskRepository;
import kr.co.rockplace.rshm.db.service.SequenceKeyService;
import kr.co.rockplace.rshm.utils.ReflectionUtil;

/**
 * Control Service
 * @author wonsunlee
 *
 */
@Service
public class ControlService extends AdminCommonService<ControlEntity, CommonRepository<ControlEntity, String>> {

	@Autowired
	private ControlRepository repository;

	@Autowired
	private SequenceKeyService sequenceKeyService;

	@Autowired
	private EntityRepository entityRepository;

	@Autowired
	private TaskRepository taskRepository;

	@Override
	@Transactional
	public ControlEntity create(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		Optional<EntityEntity> thisEntity = this.entityRepository.findById(entId);
		if(StringUtils.isNoneBlank((String) map.get("id"))) {

			Optional<ControlEntity> checkEntity = this.repository.findById(thisEntity.get().getPrefix() + "_" + (String) map.get("id"));
			if(checkEntity.isPresent()) {
				return null;
			}
		}

		ControlEntity returnControlEntity = null;
		Optional<EntityEntity> entityEntity = this.entityRepository.findById((String) map.get("entId"));
		Optional<TaskEntity> taskEntity = this.taskRepository.findById((String) map.get("tasId"));
		Optional<TaskEntity> nextTaskEntity = this.taskRepository.findById((String) map.get("nextTasId"));
		if(entityEntity.isPresent() && taskEntity.isPresent() && nextTaskEntity.isPresent()) {

			// Key 설정
			if(!map.containsKey("id") || StringUtils.isBlank((String) map.get("id"))) {
				map.put("id", this.sequenceKeyService.getKey(entId));
			} else {
				map.put("id", thisEntity.get().getPrefix() + "_" + map.get("id"));
			}

			returnControlEntity = this.repository.save(
				ReflectionUtil.convertToValueObject(map, ControlEntity.class)
			);
		}

		return returnControlEntity;
	}

	@Override
	@Transactional
	public ControlEntity update(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		ControlEntity returnControlEntity = null;
		Optional<EntityEntity> entityEntity = this.entityRepository.findById((String) map.get("entId"));
		Optional<TaskEntity> taskEntity = this.taskRepository.findById((String) map.get("tasId"));
		Optional<TaskEntity> nextTaskEntity = this.taskRepository.findById((String) map.get("nextTasId"));
		if(entityEntity.isPresent() && taskEntity.isPresent() && nextTaskEntity.isPresent()) {

			Optional<ControlEntity> controlEntity = this.repository.findById((String) map.get("id"));
			if(controlEntity.isPresent()) {

				Map<String, Object> resultMap = ReflectionUtil.diffEntityAndMap(controlEntity.get(), map);
				returnControlEntity = this.repository.save(
					ReflectionUtil.convertToValueObject(resultMap, ControlEntity.class)
				);
			}
		}

		return returnControlEntity;
	}
}