package kr.co.rockplace.rshm.service.admin;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.CodeEntity;
import kr.co.rockplace.rshm.db.entity.EntityEntity;
import kr.co.rockplace.rshm.db.entity.TableEntity;
import kr.co.rockplace.rshm.db.repository.CodeRepository;
import kr.co.rockplace.rshm.db.repository.CommonRepository;
import kr.co.rockplace.rshm.db.repository.EntityRepository;
import kr.co.rockplace.rshm.db.repository.TableRepository;
import kr.co.rockplace.rshm.db.service.SequenceKeyService;
import kr.co.rockplace.rshm.service.TableSchemaService;
import kr.co.rockplace.rshm.utils.ReflectionUtil;

/**
 * Table Service
 * @author wonsunlee
 *
 */
@Service
public class TableService extends AdminCommonService<TableEntity, CommonRepository<TableEntity, String>> {

	@Autowired
	private TableRepository repository;

	@Autowired
	private SequenceKeyService sequenceKeyService;

	@Autowired
	private TableFieldService tableFieldService;

	@Autowired
	private TableSchemaService tableSchemaService;

	@Autowired
	private EntityRepository entityRepository;

	@Autowired
	private CodeRepository codeRepository;

	@Override
	@Transactional
	public TableEntity create(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		Optional<EntityEntity> thisEntity = this.entityRepository.findById(entId);
		if(StringUtils.isNoneBlank((String) map.get("id"))) {

			Optional<TableEntity> checkEntity = this.repository.findById(thisEntity.get().getPrefix() + "_" + map.get("id"));
			if(checkEntity.isPresent()) {
				return null;
			}
		}

		TableEntity returnTableEntity = null;
		Optional<EntityEntity> entityEntity = this.entityRepository.findById((String) map.get("entId"));
		Optional<CodeEntity> codeEntity = this.codeRepository.findById((String) map.get("typeCd"));
		if(entityEntity.isPresent() && codeEntity.isPresent()) {

			// Key 설정
			if(!map.containsKey("id") || StringUtils.isBlank((String) map.get("id"))) {
				map.put("id", this.sequenceKeyService.getKey(entId));
			} else {
				map.put("id", thisEntity.get().getPrefix() + "_" + map.get("id"));
			}

			returnTableEntity = this.repository.save(
				ReflectionUtil.convertToValueObject(map, TableEntity.class)
			);

			if(StringUtils.equals("TAB_TYPE_SYSTEM", (String) map.get("typeCd"))) {

				// 테이블 타입이 시스템(TAB_TYPE_SYSTEM) 일 경우
				this.tableSchemaService.createSystemTable((String) map.get("id"));

				// Initialize System Table Field
				this.tableFieldService.initSystemTableField((String) map.get("id"), (String) map.get("entId"));
			} else if(StringUtils.equals("TAB_TYPE_WORKFLOW", (String) map.get("typeCd"))) {

				// 테이블 타입이 워크플로우(TAB_TYPE_WORKFLOW) 일 경우
				this.tableSchemaService.createWorkflowTable((String) map.get("id"));

				// Initialize Workflow Table Field
				this.tableFieldService.initWorkflowTableField((String) map.get("id"), (String) map.get("entId"));
			} else if(StringUtils.equals("TAB_TYPE_CUSTOM", (String) map.get("typeCd"))) {

				// 테이블 타입이 커스텀(TAB_TYPE_CUSTOM) 일 경우
				this.tableSchemaService.createCustomTable((String) map.get("id"));

				// Initialize Custom Table Field
				this.tableFieldService.initCustomTableField((String) map.get("id"), (String) map.get("entId"));
			}
		}

		return returnTableEntity;
	}

	@Override
	@Transactional
	public TableEntity update(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		TableEntity returnTableEntity = null;
		Optional<EntityEntity> entityEntity = this.entityRepository.findById((String) map.get("entId"));

		Optional<CodeEntity> codeEntity = this.codeRepository.findById((String) map.get("typeCd"));
		if(entityEntity.isPresent() && codeEntity.isPresent()) {

			Optional<TableEntity> tableEntity = this.repository.findById((String) map.get("id"));
			if(tableEntity.isPresent()) {

				Map<String, Object> resultMap = ReflectionUtil.diffEntityAndMap(tableEntity.get(), map);
				returnTableEntity = this.repository.save(
					ReflectionUtil.convertToValueObject(resultMap, TableEntity.class)
				);
			}
		}

		return returnTableEntity;
	}
}