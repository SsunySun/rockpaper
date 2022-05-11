package kr.co.rockplace.rshm.service.admin;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.CodeEntity;
import kr.co.rockplace.rshm.db.entity.EntityEntity;
import kr.co.rockplace.rshm.db.entity.SequenceEntity;
import kr.co.rockplace.rshm.db.entity.TableEntity;
import kr.co.rockplace.rshm.db.repository.CodeRepository;
import kr.co.rockplace.rshm.db.repository.CommonRepository;
import kr.co.rockplace.rshm.db.repository.EntityRepository;
import kr.co.rockplace.rshm.db.repository.SequenceRepository;
import kr.co.rockplace.rshm.db.repository.TableRepository;
import kr.co.rockplace.rshm.db.service.SequenceKeyService;
import kr.co.rockplace.rshm.utils.ReflectionUtil;

/**
 * Entity Service
 * @author wonsunlee
 *
 */
@Service
public class EntityService extends AdminCommonService<EntityEntity, CommonRepository<EntityEntity, String>> {

	@Autowired
	private EntityRepository repository;

	@Autowired
	private SequenceKeyService sequenceKeyService;

	@Autowired
	private TableFieldService tableFieldService;

	@Autowired
	private CodeRepository codeRepository;

	@Autowired
	private TableRepository tableRepository;

	@Autowired
	private SequenceRepository sequenceRepository;

	@Override
	@Transactional
	public EntityEntity create(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		if(StringUtils.isNoneBlank((String) map.get("id"))) {

			Optional<EntityEntity> checkEntity = this.repository.findById((String) map.get("id"));
			if(checkEntity.isPresent()) {
				return null;
			}
		}

		// 엔티티 생성 순서
		// 1. 엔티티 생성
		// 2. 테이블 생성
		// 3. 시퀀스 생성
		EntityEntity returnEntityEntity = null;

		Optional<CodeEntity> codeEntity = this.codeRepository.findById((String) map.get("typeCd"));
		if(codeEntity.isPresent()) {

			// 엔티티 생성
			// Key 설정
			if(!map.containsKey("id") || StringUtils.isBlank((String) map.get("id"))) {
				map.put("id", this.sequenceKeyService.getKey(entId));
			}

			// Entity ID 설정
			map.put("entId", map.get("id"));

			returnEntityEntity = this.repository.save(
				ReflectionUtil.convertToValueObject(map, EntityEntity.class)
			);

			// 시퀀스 생성
			SequenceEntity sequenceEntity = this.sequenceRepository.findByEntId((String) map.get("id"));
			if(sequenceEntity == null) {

				// TODO: 하드 코딩된 정보 수정 필요
				// Entity Type: 시스템(ENT_TYPE_SYSTEM), 워크플로우(ENT_TYPE_WORKFLOW)
				String midType = "";
				int midNum = 0;
				switch ((String) map.get("typeCd")) {
				case "ENT_TYPE_SYSTEM":		// 시스템
					midType = "";
					midNum = 0;
					break;
				case "ENT_TYPE_WORKFLOW":	// 워크플로우
					midType = "yyyyMM";
					midNum = 2;
					break;
				default:
					midType = "";
					midNum = 0;
					break;
				}

				// Sequence 정보
				map.put("midType", midType);
				map.put("midNum", midNum);
				map.put("curNum", 0);
				map.put("length", 5);

				// Key 설정
				map.put("id", this.sequenceKeyService.getKey("SEQ"));

				this.sequenceRepository.save(
					ReflectionUtil.convertToValueObject(map, SequenceEntity.class)
				);
			}

			// 테이블 생성
			if(Boolean.parseBoolean((String) map.get("isCreateTable"))) {

				// TODO: 하드 코딩된 정보 수정 필요
				// 엔티티 코드에 따른 테이블 코드 설정
				// Entity Type: 시스템(ENT_TYPE_SYSTEM), 워크플로우(ENT_TYPE_WORKFLOW)
				// Table Type: 시스템(TAB_TYPE_SYSTEM), 워크플로우(TAB_TYPE_WORKFLOW), 커스텀(TAB_TYPE_CUSTOM)
				String tableType = "";
				switch ((String) map.get("typeCd")) {
				case "ENT_TYPE_SYSTEM":		// 시스템
					tableType = "TAB_TYPE_SYSTEM";	// 시스템
					break;
				case "ENT_TYPE_WORKFLOW":		// 워크플로우
					tableType = "TAB_TYPE_WORKFLOW";	// 워크플로우
					break;
				default:
					tableType = "TAB_TYPE_CUSTOM";	// 커스텀
					break;
				}

				codeEntity = this.codeRepository.findById(tableType);
				Optional<EntityEntity> tableEntity = this.repository.findById("TAB");
				if(tableEntity.isPresent() && codeEntity.isPresent()) {

					// Key 설정
					map.put("id", tableEntity.get().getPrefix() + "_" + map.get("id"));

					this.tableRepository.save(
						ReflectionUtil.convertToValueObject(map, TableEntity.class)
					);

					this.tableFieldService.initSystemTableField((String) map.get("id"), (String) map.get("entId"));
					/*
					if(StringUtils.equals("TAB_TYPE_SYSTEM", tableType)) {

						// Initialize System Table Field
						this.tableFieldService.initSystemTableField((String) map.get("id"), (String) map.get("entId"));
					} else if(StringUtils.equals("TAB_TYPE_WORKFLOW", tableType)) {

						// Initialize Workflow Table Field
						this.tableFieldService.initWorkflowTableField((String) map.get("id"), (String) map.get("entId"));
					} else if(StringUtils.equals("TAB_TYPE_CUSTOM", tableType)) {

						// Initialize Custom Table Field
						this.tableFieldService.initCustomTableField((String) map.get("id"), (String) map.get("entId"));
					}
					*/
				}
			}
		}

		return returnEntityEntity;
	}

	@Override
	@Transactional
	public EntityEntity update(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		EntityEntity returnEntityEntity = null;
		Optional<CodeEntity> codeEntity = this.codeRepository.findById((String) map.get("typeCd"));
		if(codeEntity.isPresent()) {

			Optional<EntityEntity> entityEntity = this.repository.findById((String) map.get("id"));
			if(entityEntity.isPresent()) {

				Map<String, Object> resultMap = ReflectionUtil.diffEntityAndMap(entityEntity.get(), map);
				returnEntityEntity = this.repository.save(
					ReflectionUtil.convertToValueObject(resultMap, EntityEntity.class)
				);
			}
		}

		return returnEntityEntity;
	}

	/**
	 * Entity가 Workflow 타입인 리스트
	 * @return
	 */
	public List<EntityEntity> getWorkflowTypeList() {

		// TODO: 하드 코딩된 정보 수정 필요
		String type = "ENT_TYPE_WORKFLOW";
		return this.repository.findByTypeCd(type);
	}
}