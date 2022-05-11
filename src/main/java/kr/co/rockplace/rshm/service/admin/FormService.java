package kr.co.rockplace.rshm.service.admin;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.rockplace.rshm.db.entity.CodeEntity;
import kr.co.rockplace.rshm.db.entity.EntityEntity;
import kr.co.rockplace.rshm.db.entity.FormEntity;
import kr.co.rockplace.rshm.db.entity.RelationEntity;
import kr.co.rockplace.rshm.db.entity.TableEntity;
import kr.co.rockplace.rshm.db.entity.TableFieldEntity;
import kr.co.rockplace.rshm.db.mapper.rshm.CommonMapper;
import kr.co.rockplace.rshm.db.mapper.rshm.FormMapper;
import kr.co.rockplace.rshm.db.repository.CommonRepository;
import kr.co.rockplace.rshm.db.repository.EntityRepository;
import kr.co.rockplace.rshm.db.repository.FormRepository;
import kr.co.rockplace.rshm.db.repository.RelationRepository;
import kr.co.rockplace.rshm.db.repository.TableFieldRepository;
import kr.co.rockplace.rshm.db.repository.TableRepository;
import kr.co.rockplace.rshm.db.repository.WorkflowFlowRepository;
import kr.co.rockplace.rshm.db.service.SequenceKeyService;
import kr.co.rockplace.rshm.utils.AuthUtil;
import kr.co.rockplace.rshm.utils.CommonUtils;
import kr.co.rockplace.rshm.utils.JsonUtil;
import kr.co.rockplace.rshm.utils.ReflectionUtil;

/**
 * Form Service
 * @author wonsunlee
 *
 */
@Service
public class FormService extends AdminCommonService<FormEntity, CommonRepository<FormEntity, String>> {

	@Autowired
	private FormRepository repository;

	@Autowired
	private SequenceKeyService sequenceKeyService;

	@Autowired
	private EntityRepository entityRepository;

	@Autowired
	private TableRepository tableRepository;

	@Autowired
	private TableFieldRepository tableFieldRepository;

	@Autowired
	private WorkflowFlowRepository workflowFlowRepository;

	@Autowired
	private RelationRepository relationRepository;

	@Autowired
	private CommonMapper commonMapper;

	@Autowired
	private FormMapper formMapper;

	@Override
	@Transactional
	public FormEntity create(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		Optional<EntityEntity> thisEntity = this.entityRepository.findById(entId);
		if(StringUtils.isNoneBlank((String) map.get("id"))) {

			Optional<FormEntity> checkEntity = this.repository.findById(thisEntity.get().getPrefix() + "_" + map.get("id"));
			if(checkEntity.isPresent()) {
				return null;
			}
		}

		FormEntity returnFormEntity = null;

		Optional<EntityEntity> entityEntity = this.entityRepository.findById((String) map.get("entId"));
		if(entityEntity.isPresent()) {

			// Key 설정
			if(!map.containsKey("id") || StringUtils.isBlank((String) map.get("id"))) {
				map.put("id", this.sequenceKeyService.getKey((String) map.get("var/entId")));
			} else {
				map.put("id", thisEntity.get().getPrefix() + "_" + map.get("id"));
			}

			returnFormEntity = this.repository.save(
				ReflectionUtil.convertToValueObject(map, FormEntity.class)
			);
		}

		return returnFormEntity;
	}

	@Override
	@Transactional
	public FormEntity update(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		FormEntity returnFormEntity = null;
		Optional<EntityEntity> entityEntity = this.entityRepository.findById((String) map.get("entId"));
		if(entityEntity.isPresent()) {

			Optional<FormEntity> formEntity = this.repository.findById((String) map.get("id"));
			if(formEntity.isPresent()) {

				Map<String, Object> resultMap = ReflectionUtil.diffEntityAndMap(formEntity.get(), map);
				returnFormEntity = this.repository.save(
					ReflectionUtil.convertToValueObject(resultMap, FormEntity.class)
				);
			}
		}

		return returnFormEntity;
	}

	@Override
	@Transactional
	public boolean delete(String id) {

		Optional<FormEntity> formEntity = this.repository.findById(id);
		if(formEntity.isPresent()) {

			this.repository.delete(formEntity.get());
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 
	 * @param model
	 * @param formId
	 * @param key
	 * @param entId
	 * @param isAuth
	 * @param parameterMap
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public FormEntity getFormData(
			Model model,
			String formId,
			String key,
			String entId,
			Boolean isAuth,
			Map<String, Object> parameterMap) {

		Map<String, Object> formMap = null;
		String tableId = null;

		// Case 1: Form: Null, Key: Null
		if(StringUtils.isEmpty(formId) && StringUtils.isEmpty(key)) {
			return null;
		}

		// Case 2: Form: Not Null
		if(StringUtils.isNotEmpty(formId)) {

			formMap = this.formMapper.getFormById(formId);
			if(formMap == null) {
				return null;
			}

			Optional<TableEntity> tableEntity = this.tableRepository.findByEntIdAndTypeCdIn((String) formMap.get("ent_id"), List.of("TAB_TYPE_SYSTEM", "TAB_TYPE_WORKFLOW"));
			if(tableEntity.isPresent()) {
				tableId = tableEntity.get().getId();
			}
		}

		// Case 3: Form: Null, Key: Not Null (수정일 경우 - 리스트)
		if(StringUtils.isEmpty(formId) && StringUtils.isNotEmpty(key)) {

			if(StringUtils.isNotEmpty(entId)) {

				Optional<EntityEntity> entityEntity = this.entityRepository.findById(entId);
				if(entityEntity.isPresent()) {

					Optional<TableEntity> tableEntity = this.tableRepository.findByEntIdAndTypeCdIn(entId, List.of("TAB_TYPE_SYSTEM", "TAB_TYPE_WORKFLOW"));
					if(tableEntity.isPresent()) {

						tableId = tableEntity.get().getId();
						List<Map<String, Object>> formList = this.formMapper.getFormListByTaskId(Map.of(
								"table", tableId,
								"key", key,
								"entId", entId));

						if(formList.size() > 0) {
							formMap = formList.get(0);
						}
					}
				}
			}
		}

		if(formMap != null) {

			Map<String, Object> objectMap = Map.of();
			if(StringUtils.isNotEmpty(key)) {

				objectMap = this.formMapper.getObjectById(Map.of(
						"table", tableId,
						"key", key));

				if(objectMap != null) {

					model.addAttribute("object", objectMap);
					model.addAttribute("key", key);

					// Workflow Flow 설정
					model.addAttribute("workflowFlowList", this.workflowFlowRepository.findBySrcId(key, Sort.by(new Order(Sort.Direction.DESC, "createDate"))));

					if(objectMap.containsKey("ass_emp_id") && StringUtils.equals((String) objectMap.get("ass_emp_id"), AuthUtil.getCurrentUserId())) {
						model.addAttribute("auth", true);
					} else {
						model.addAttribute("auth", false);
					}
				} else {

					objectMap = Map.of();
					model.addAttribute("auth", true);
				}
			} else {

				model.addAttribute("object", objectMap);
				model.addAttribute("auth", true);
			}

			if(isAuth && (AuthUtil.hasRole("ROLE_ADMIN") || AuthUtil.hasRole("ROLE_BUSINESS_MANAGEMENT"))) {
				model.addAttribute("auth", true);
			}

			Optional<FormEntity> formEntity = this.repository.findById((String) formMap.get("id"));
			model.addAttribute("formEntity", formEntity.get());

			String config = CommonUtils.transVars(formEntity.get().getConfig(), parameterMap, objectMap);
			Map<String, Object> configMap = JsonUtil.convertJSONStringToMap(config);
			model.addAttribute("configMap", configMap);

			String script = CommonUtils.transVars(formEntity.get().getScript(), objectMap);
			model.addAttribute("script", script);

			Map<String, Object> configFormMap = (Map<String, Object>) configMap.get("form");
			model.addAttribute("form_id", (String) configFormMap.get("id"));
			model.addAttribute("form_action", (String) configFormMap.get("action"));

			Map<String, Map<String, Object>> relationMap = new HashMap<>();
			Map<String, List<Map<String, Object>>> relationFieldMap = new HashMap<>();
			Map<String, List<Map<String, Object>>> relationObjectMap = new HashMap<>();

			Map<String, List<?>> refListMap = new HashMap<>();
			Map<String, List<?>> relationRefListMap = new HashMap<>();

			List<Map<String, Object>> fieldList = (List<Map<String, Object>>) configMap.get("fields");
			for (Map<String, Object> field : fieldList) {

				String fldId = (String) field.get("fld_id");
				Optional<TableFieldEntity> tableFieldEntity = this.tableFieldRepository.findById(fldId);
				if(tableFieldEntity.isPresent()) {

					if(StringUtils.equals(tableFieldEntity.get().getTfdId(), "FLT_TYPE_ENTITY")) {

						String fieldValue = "";
						if(!objectMap.isEmpty() && objectMap.containsKey(field.get("id"))) {
							fieldValue = (String) objectMap.get((String) field.get("id"));
						}

						if(StringUtils.isEmpty(fieldValue)) {
							fieldValue = (String) field.get("def_val");
						}

						if(StringUtils.isNotEmpty(fieldValue)) {

							// FLT_TYPE_ENTITY
							Optional<TableEntity> refTableEntity = this.tableRepository.findByEntIdAndTypeCdIn(tableFieldEntity.get().getRefEntId(), List.of("TAB_TYPE_SYSTEM", "TAB_TYPE_WORKFLOW"));
							if(refTableEntity.isPresent()) {
								refListMap.put((String) field.get("id"), this.formMapper.getObjectListById(refTableEntity.get().getId(), fieldValue));
							}
						}
					} else if(StringUtils.equals(tableFieldEntity.get().getTfdId(), "FLT_TYPE_CODE")) {

						// FLT_TYPE_CODE
						if(tableFieldEntity.get().getRefCtyCodeTypeEntity() != null) {

							List<CodeEntity> codeEntity = tableFieldEntity.get().getRefCtyCodeTypeEntity().getCodeEntityList();
							refListMap.put((String) field.get("id"), codeEntity);
						}
					}
				}

				// Relation에서 필요한 정보 설정
				if(StringUtils.equals((String) field.get("uiitem"), "Custom.Relation")) {

					String relationId = (String) field.get("config");
					Optional<RelationEntity> relationEntity = this.relationRepository.findById(relationId);
					if(relationEntity.isPresent()) {

						String relationConfig = CommonUtils.transVars(relationEntity.get().getConfig(), Map.of(), objectMap);
						Map<String, Object> relationConfigMap = JsonUtil.convertJSONStringToMap(relationConfig);
						relationMap.put((String) field.get("id"), relationConfigMap);

						List<Map<String, Object>> relationFieldList = (List<Map<String, Object>>) relationConfigMap.get("fields");
						relationFieldMap.put((String) field.get("id"), relationFieldList);

						List<Map<String, Object>> relationObjectList = this.commonMapper.getListToMapBySQL(CommonUtils.transVarsByData(relationEntity.get().getQuery(), Map.of("key", key)));
						relationObjectMap.put((String) field.get("id"), relationObjectList);

						for (Map<String, Object> relationField : relationFieldList) {

							String relationFldId = (String) relationField.get("fld_id");
							if(relationFldId.isEmpty()) {	// action일 경우 
								continue;
							}

							Optional<TableFieldEntity> relationTableFieldEntity = this.tableFieldRepository.findById(relationFldId);
							if(relationTableFieldEntity.isPresent()) {

								if(StringUtils.equals(relationTableFieldEntity.get().getTfdId(), "FLT_TYPE_ENTITY")) {

									for (Map<String, Object> relationObjMap : relationObjectList) {

										int index = relationObjectList.indexOf(relationObjMap);
										String relationFieldValue = "";
										if(!relationObjMap.isEmpty() && relationObjMap.containsKey(relationField.get("id"))) {
											relationFieldValue = (String) relationObjMap.get((String) relationField.get("id"));
										}

										if(StringUtils.isEmpty(relationFieldValue)) {
											relationFieldValue = (String) relationField.get("def_val");
										}

										if(StringUtils.isNotEmpty(relationFieldValue)) {

											// FLT_TYPE_ENTITY
											Optional<TableEntity> refTableEntity = this.tableRepository.findByEntIdAndTypeCdIn(relationTableFieldEntity.get().getRefEntId(), List.of("TAB_TYPE_SYSTEM", "TAB_TYPE_WORKFLOW"));
											if(refTableEntity.isPresent()) {
												relationRefListMap.put((String) relationField.get("id") + index, this.formMapper.getObjectListById(refTableEntity.get().getId(), relationFieldValue));
											}
										}
									}

									if((boolean) model.getAttribute("auth")) {

										int index = 99;
										String relationFieldValue = (String) relationField.get("def_val");
										if(StringUtils.isNotEmpty(relationFieldValue)) {

											// FLT_TYPE_ENTITY
											Optional<TableEntity> refTableEntity = this.tableRepository.findByEntIdAndTypeCdIn(relationTableFieldEntity.get().getRefEntId(), List.of("TAB_TYPE_SYSTEM", "TAB_TYPE_WORKFLOW"));
											if(refTableEntity.isPresent()) {
												relationRefListMap.put((String) relationField.get("id") + index, this.formMapper.getObjectListById(refTableEntity.get().getId(), relationFieldValue));
											}
										}
									}
								} else if(StringUtils.equals(relationTableFieldEntity.get().getTfdId(), "FLT_TYPE_CODE")) {

									// FLT_TYPE_CODE
									if(relationTableFieldEntity.get().getRefCtyCodeTypeEntity() != null) {

										List<CodeEntity> codeEntity = relationTableFieldEntity.get().getRefCtyCodeTypeEntity().getCodeEntityList();
										relationRefListMap.put((String) relationField.get("id"), codeEntity);
									}
								}
							}
						}
					}
				}
			}

			model.addAttribute("refListMap", refListMap);

			model.addAttribute("relationConfigMap", relationMap);
			model.addAttribute("relationFieldMap", relationFieldMap);
			model.addAttribute("relationRefListMap", relationRefListMap);
			model.addAttribute("relationObjectMap", relationObjectMap);

			return formEntity.get();
		} else{

			model.addAttribute("object", Map.of());
			return null;
		}
	}

	/**
	 * 
	 * @param model
	 * @param fieldId
	 * @param formId
	 * @param key
	 * @param entId
	 * @param isAuth
	 * @param parameterMap
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public FormEntity getFormRelationData(
			Model model,
			String fieldId,
			String formId,
			String key,
			String entId,
			Boolean isAuth,
			Map<String, Object> parameterMap) {

		Map<String, Object> formMap = null;
		String tableId = null;

		// Case 2: Form: Not Null
		if(StringUtils.isNotEmpty(formId)) {

			formMap = this.formMapper.getFormById(formId);
			if(formMap == null) {
				return null;
			}

			Optional<TableEntity> tableEntity = this.tableRepository.findByEntIdAndTypeCdIn((String) formMap.get("ent_id"), List.of("TAB_TYPE_SYSTEM", "TAB_TYPE_WORKFLOW"));
			if(tableEntity.isPresent()) {
				tableId = tableEntity.get().getId();
			}
		}

		if(formMap != null) {

			Map<String, Object> objectMap = Map.of();
			if(StringUtils.isNotEmpty(key)) {

				objectMap = this.formMapper.getObjectById(Map.of(
						"table", tableId,
						"key", key));
				model.addAttribute("object", objectMap);
				model.addAttribute("key", key);

				// Workflow Flow 설정
				model.addAttribute("workflowFlowList", this.workflowFlowRepository.findBySrcId(key, Sort.by(new Order(Sort.Direction.ASC, "createDate"))));

				if(objectMap.containsKey("ass_emp_id") && StringUtils.equals((String) objectMap.get("ass_emp_id"), AuthUtil.getCurrentUserId())) {
					model.addAttribute("auth", true);
				} else {
					model.addAttribute("auth", false);
				}
			} else {

				model.addAttribute("object", Map.of());
				model.addAttribute("auth", true);
			}

			if(isAuth) {
				model.addAttribute("auth", true);
			}

			Optional<FormEntity> formEntity = this.repository.findById((String) formMap.get("id"));
			model.addAttribute("formEntity", formEntity.get());

			String config = CommonUtils.transVars(formEntity.get().getConfig(), objectMap);
			Map<String, Object> configMap = JsonUtil.convertJSONStringToMap(config);
			model.addAttribute("configMap", configMap);

			Map<String, Object> configFormMap = (Map<String, Object>) configMap.get("form");
			model.addAttribute("form_id", (String) configFormMap.get("id"));
			model.addAttribute("form_action", (String) configFormMap.get("action"));

			Map<String, Map<String, Object>> relationMap = new HashMap<>();
			Map<String, List<Map<String, Object>>> relationFieldMap = new HashMap<>();
			Map<String, List<Map<String, Object>>> relationObjectMap = new HashMap<>();

			Map<String, List<?>> relationRefListMap = new HashMap<>();

			List<Map<String, Object>> fieldList = (List<Map<String, Object>>) configMap.get("fields");
			for (Map<String, Object> field : fieldList) {

				// Relation에서 필요한 정보 설정
				if(StringUtils.equals((String) field.get("uiitem"), "Custom.Relation") && 
						StringUtils.equals((String) field.get("id"), fieldId)) {

					String relationId = (String) field.get("config");
					Optional<RelationEntity> relationEntity = this.relationRepository.findById(relationId);
					if(relationEntity.isPresent()) {

						String relationConfig = CommonUtils.transVars(relationEntity.get().getConfig(), Map.of(), objectMap);
						Map<String, Object> relationConfigMap = JsonUtil.convertJSONStringToMap(relationConfig);
						relationMap.put((String) field.get("id"), relationConfigMap);

						List<Map<String, Object>> relationFieldList = (List<Map<String, Object>>) relationConfigMap.get("fields");
						relationFieldMap.put((String) field.get("id"), relationFieldList);

						List<Map<String, Object>> relationObjectList = this.commonMapper.getListToMapBySQL(CommonUtils.transVarsByData(relationEntity.get().getQuery(), Map.of("key", key)));
						relationObjectMap.put((String) field.get("id"), relationObjectList);

						for (Map<String, Object> relationField : relationFieldList) {

							String relationFldId = (String) relationField.get("fld_id");
							if(relationFldId.isEmpty()) {	// action일 경우 
								continue;
							}

							Optional<TableFieldEntity> relationTableFieldEntity = this.tableFieldRepository.findById(relationFldId);
							if(relationTableFieldEntity.isPresent()) {

								if(StringUtils.equals(relationTableFieldEntity.get().getTfdId(), "FLT_TYPE_ENTITY")) {

									for (Map<String, Object> relationObjMap : relationObjectList) {

										int index = relationObjectList.indexOf(relationObjMap);
										String relationFieldValue = "";
										if(!relationObjMap.isEmpty() && relationObjMap.containsKey((String) relationField.get("id"))) {
											relationFieldValue = (String) relationObjMap.get((String) relationField.get("id"));
										}

										if(StringUtils.isEmpty(relationFieldValue)) {
											relationFieldValue = (String) relationField.get("def_val");
										}

										if(StringUtils.isNotEmpty(relationFieldValue)) {

											// FLT_TYPE_ENTITY
											Optional<TableEntity> refTableEntity = this.tableRepository.findByEntIdAndTypeCdIn(relationTableFieldEntity.get().getRefEntId(), List.of("TAB_TYPE_SYSTEM", "TAB_TYPE_WORKFLOW"));
											if(refTableEntity.isPresent()) {
												relationRefListMap.put((String) relationField.get("id") + index, this.formMapper.getObjectListById(refTableEntity.get().getId(), relationFieldValue));
											}
										}
									}

									if((boolean) model.getAttribute("auth")) {

										int index = 99;
										String relationFieldValue = (String) relationField.get("def_val");
										if(StringUtils.isNotEmpty(relationFieldValue)) {

											// FLT_TYPE_ENTITY
											Optional<TableEntity> refTableEntity = this.tableRepository.findByEntIdAndTypeCdIn(relationTableFieldEntity.get().getRefEntId(), List.of("TAB_TYPE_SYSTEM", "TAB_TYPE_WORKFLOW"));
											if(refTableEntity.isPresent()) {
												relationRefListMap.put((String) relationField.get("id") + index, this.formMapper.getObjectListById(refTableEntity.get().getId(), relationFieldValue));
											}
										}
									}
								} else if(StringUtils.equals(relationTableFieldEntity.get().getTfdId(), "FLT_TYPE_CODE")) {

									// FLT_TYPE_CODE
									if(relationTableFieldEntity.get().getRefCtyCodeTypeEntity() != null) {

										List<CodeEntity> codeEntity = relationTableFieldEntity.get().getRefCtyCodeTypeEntity().getCodeEntityList();
										relationRefListMap.put((String) relationField.get("id"), codeEntity);
									}
								}
							}
						}
					}

					model.addAttribute("field", field);
				}
			}

			model.addAttribute("relationConfigMap", relationMap);
			model.addAttribute("relationFieldMap", relationFieldMap);
			model.addAttribute("relationRefListMap", relationRefListMap);
			model.addAttribute("relationObjectMap", relationObjectMap);

			return formEntity.get();
		} else{

			model.addAttribute("object", Map.of());
			return null;
		}
	}
}