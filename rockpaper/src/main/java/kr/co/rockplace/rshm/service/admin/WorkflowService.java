package kr.co.rockplace.rshm.service.admin;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.EntityEntity;
import kr.co.rockplace.rshm.db.entity.WorkflowEntity;
import kr.co.rockplace.rshm.db.repository.CommonRepository;
import kr.co.rockplace.rshm.db.repository.EntityRepository;
import kr.co.rockplace.rshm.db.repository.WorkflowRepository;
import kr.co.rockplace.rshm.db.service.SequenceKeyService;
import kr.co.rockplace.rshm.utils.ReflectionUtil;

/**
 * Workflow Service
 * @author wonsunlee
 *
 */
@Service
public class WorkflowService extends AdminCommonService<WorkflowEntity, CommonRepository<WorkflowEntity, String>> {

	@Autowired
	private WorkflowRepository repository;

	@Autowired
	private SequenceKeyService sequenceKeyService;

	@Autowired
	private EntityRepository entityRepository;

	@Override
	@Transactional
	public WorkflowEntity create(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		Optional<EntityEntity> thisEntity = this.entityRepository.findById(entId);
		if(StringUtils.isNoneBlank((String) map.get("id"))) {

			Optional<WorkflowEntity> checkEntity = this.repository.findById(thisEntity.get().getPrefix() + "_" + map.get("id"));
			if(checkEntity.isPresent()) {
				return null;
			}
		}

		WorkflowEntity returnWorkflowEntity = null;
		Optional<EntityEntity> entityEntity = this.entityRepository.findById((String) map.get("entId"));
		if(entityEntity.isPresent()) {

			// Key 설정
			if(!map.containsKey("id") || StringUtils.isBlank((String) map.get("id"))) {
				map.put("id", this.sequenceKeyService.getKey(entId));
			} else {
				map.put("id", thisEntity.get().getPrefix() + "_" + map.get("id"));
			}

			returnWorkflowEntity = this.repository.save(
				ReflectionUtil.convertToValueObject(map, WorkflowEntity.class)
			);
		}

		return returnWorkflowEntity;
	}

	@Override
	@Transactional
	public WorkflowEntity update(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		WorkflowEntity returnWorkflowEntity = null;
		Optional<EntityEntity> entityEntity = this.entityRepository.findById((String) map.get("entId"));
		if(entityEntity.isPresent()) {

			Optional<WorkflowEntity> workflowEntity = this.repository.findById((String) map.get("id"));
			if(workflowEntity.isPresent()) {

				Map<String, Object> resultMap = ReflectionUtil.diffEntityAndMap(workflowEntity.get(), map);
				returnWorkflowEntity = this.repository.save(
					ReflectionUtil.convertToValueObject(resultMap, WorkflowEntity.class)
				);
			}
		}

		return returnWorkflowEntity;
	}
}