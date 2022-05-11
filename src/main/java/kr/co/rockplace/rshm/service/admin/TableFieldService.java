package kr.co.rockplace.rshm.service.admin;

import java.lang.reflect.InvocationTargetException;
import java.time.LocalDateTime;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.EntityEntity;
import kr.co.rockplace.rshm.db.entity.TableEntity;
import kr.co.rockplace.rshm.db.entity.TableFieldEntity;
import kr.co.rockplace.rshm.db.repository.CommonRepository;
import kr.co.rockplace.rshm.db.repository.EntityRepository;
import kr.co.rockplace.rshm.db.repository.TableFieldRepository;
import kr.co.rockplace.rshm.db.repository.TableRepository;
import kr.co.rockplace.rshm.service.TableSchemaService;
import kr.co.rockplace.rshm.utils.AuthUtil;
import kr.co.rockplace.rshm.utils.ReflectionUtil;

/**
 * Table Field Service
 * @author wonsunlee
 *
 */
@Service
public class TableFieldService extends AdminCommonService<TableFieldEntity, CommonRepository<TableFieldEntity, String>> {

	@Autowired
	private TableFieldRepository repository;

	@Autowired
	private TableSchemaService tableSchemaService;

	@Autowired
	private TableRepository tableRepository;

	@Autowired
	private EntityRepository entityRepository;

	@Override
	@Transactional
	public TableFieldEntity create(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		Optional<EntityEntity> thisEntity = this.entityRepository.findById(entId);
		if(StringUtils.isNoneBlank((String) map.get("id"))) {

			Optional<TableFieldEntity> checkEntity = this.repository.findById(thisEntity.get().getPrefix() + "_" + map.get("id"));
			if(checkEntity.isPresent()) {
				return null;
			}
		}

		TableFieldEntity returnTableFieldEntity = null;
		Optional<EntityEntity> entityEntity = this.entityRepository.findById((String) map.get("entId"));
		Optional<TableEntity> tableEntity = this.tableRepository.findById((String) map.get("tabId"));
		if(entityEntity.isPresent() && tableEntity.isPresent()) {

			// Key 설정
			map.put("id", map.get("tabId") + "/" + map.get("name"));

			returnTableFieldEntity = this.repository.save(
				ReflectionUtil.convertToValueObject(map, TableFieldEntity.class)
			);

			// Add Column
			String columnType = "";
			if(StringUtils.equals((String) map.get("tfdId"), "FLT_TYPE_STRING")) {

				if(StringUtils.equals((String) map.get("typeCd"), "FLT_TYPE_STRING_TEXT")) {
					columnType = "VARCHAR(255)";
				} else if(StringUtils.equals((String) map.get("typeCd"), "FLT_TYPE_STRING_TEXTAREA")) {
					columnType = "LONGTEXT";
				}
			} else if(StringUtils.equals((String) map.get("tfdId"), "FLT_TYPE_BOOLEAN")) {
				columnType = "BIT";
			} else if(StringUtils.equals((String) map.get("tfdId"), "FLT_TYPE_NUMBER")) {
				columnType = "INTEGER";
			} else if(StringUtils.equals((String) map.get("tfdId"), "FLT_TYPE_DATE")) {

				if(StringUtils.equals((String) map.get("typeCd"), "FLT_TYPE_DATE_DTTM")) {
					columnType = "DATETIME";
				} else if(StringUtils.equals((String) map.get("typeCd"), "FLT_TYPE_DATE_DT")) {
					columnType = "DATE";
				} else {
					columnType = "DATETIME";
				}
			} else if(StringUtils.equals((String) map.get("tfdId"), "FLT_TYPE_ENTITY")) {
				columnType = "VARCHAR(255)";
			} else {
				columnType = "VARCHAR(255)";
			}
			this.tableSchemaService.addColumn((String) map.get("tabId"), (String) map.get("name"), columnType);
		}

		return returnTableFieldEntity;
	}

	@Override
	@Transactional
	public TableFieldEntity update(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		TableFieldEntity returnTableFieldEntity = null;
		Optional<EntityEntity> entityEntity = this.entityRepository.findById((String) map.get("entId"));
		Optional<TableEntity> tableEntity = this.tableRepository.findById((String) map.get("tabId"));
		if(entityEntity.isPresent() && tableEntity.isPresent()) {

			Optional<TableFieldEntity> tableFieldEntity = this.repository.findById((String) map.get("id"));
			if(tableFieldEntity.isPresent()) {

				Map<String, Object> resultMap = ReflectionUtil.diffEntityAndMap(tableFieldEntity.get(), map);
				returnTableFieldEntity = this.repository.save(
					ReflectionUtil.convertToValueObject(resultMap, TableFieldEntity.class)
				);

				// Update Column
				String columnType = "";
				if(StringUtils.equals((String) map.get("tfdId"), "FLT_TYPE_STRING")) {

					if(StringUtils.equals((String) map.get("typeCd"), "FLT_TYPE_STRING_TEXT")) {
						columnType = "VARCHAR(255)";
					} else if(StringUtils.equals((String) map.get("typeCd"), "FLT_TYPE_STRING_TEXTAREA")) {
						columnType = "LONGTEXT";
					}
				} else if(StringUtils.equals((String) map.get("tfdId"), "FLT_TYPE_BOOLEAN")) {
					columnType = "BIT";
				} else if(StringUtils.equals((String) map.get("tfdId"), "FLT_TYPE_NUMBER")) {
					columnType = "INTEGER";
				} else if(StringUtils.equals((String) map.get("tfdId"), "FLT_TYPE_DATE")) {

					if(StringUtils.equals((String) map.get("typeCd"), "FLT_TYPE_DATE_DTTM")) {
						columnType = "DATETIME";
					} else if(StringUtils.equals((String) map.get("typeCd"), "FLT_TYPE_DATE_DT")) {
						columnType = "DATE";
					} else {
						columnType = "DATETIME";
					}
				} else if(StringUtils.equals((String) map.get("tfdId"), "FLT_TYPE_ENTITY")) {
					columnType = "VARCHAR(255)";
				} else {
					columnType = "VARCHAR(255)";
				}
				this.tableSchemaService.modifyColumn(tableFieldEntity.get().getTabId(), tableFieldEntity.get().getName(), columnType);
			}
		}

		return returnTableFieldEntity;
	}

	@Override
	@Transactional
	public boolean delete(String id) {

		Optional<TableFieldEntity> tableFieldEntity = this.repository.findById(id);
		if(tableFieldEntity.isPresent()) {

			this.repository.delete(tableFieldEntity.get());
			this.tableSchemaService.dropColumn(tableFieldEntity.get().getTabId(), tableFieldEntity.get().getName());

			return true;
		} else {
			return false;
		}
	}

	/**
	 * Table 리스트
	 * @param tableId
	 * @param name
	 * @param product
	 * @return
	 */
	public Iterable<TableFieldEntity> getTableFieldByTableList(String tableId, String name, boolean isProduct) {

		// Product이 True/False/Null 일 경우
		if(isProduct) {

			// name이 없을 경우 
			if(StringUtils.isBlank(name)) {
				return this.repository.findByTabIdAndIsProductTrue(tableId, Sort.by(new Order(Sort.Direction.ASC, "orderBy"), new Order(Sort.Direction.ASC, "id")));
			} else {
				return this.repository.findByTabIdAndNameAndIsProductTrue(tableId, name, Sort.by(new Order(Sort.Direction.ASC, "orderBy"), new Order(Sort.Direction.ASC, "id")));
			}
		} else if(!isProduct) {

			// name이 없을 경우 
			if(StringUtils.isBlank(name)) {
				return this.repository.findByTabIdAndIsProductFalse(tableId, Sort.by(new Order(Sort.Direction.ASC, "orderBy"), new Order(Sort.Direction.ASC, "id")));
			} else {
				return this.repository.findByTabIdAndNameAndIsProductFalse(tableId, name, Sort.by(new Order(Sort.Direction.ASC, "orderBy"), new Order(Sort.Direction.ASC, "id")));
			}
		} else {

			// name이 없을 경우 
			if(StringUtils.isBlank(name)) {
				return this.repository.findByTabId(tableId, Sort.by(new Order(Sort.Direction.ASC, "orderBy"), new Order(Sort.Direction.ASC, "id")));
			} else {
				return this.repository.findByTabIdAndName(tableId, name, Sort.by(new Order(Sort.Direction.ASC, "orderBy"), new Order(Sort.Direction.ASC, "id")));
			}
		}
		
		
	}

	/**
	 * Initialize System Table Field
	 * @param tableName
	 * @param entId
	 */
	public void initSystemTableField(String tableName, String entId) {

		LocalDateTime createDate = LocalDateTime.now();
		String createEmpId = AuthUtil.getCurrentUserId();

		// ID
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "ID").name("ID").label("ID").descr("ID")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(1)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_STRING").typeCd("FLT_TYPE_STRING_TEXT").isProduct(true)
				.build()
		);

		// NAME
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "NAME").name("NAME").label("이름").descr("이름")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(2)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_STRING").typeCd("FLT_TYPE_STRING_TEXT").isProduct(true)
				.build()
		);

		// LABEL
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "LABEL").name("LABEL").label("라벨").descr("라벨")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(3)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_STRING").typeCd("FLT_TYPE_STRING_TEXT").isProduct(true)
				.build()
		);

		// DESCR
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "DESCR").name("DESCR").label("설명").descr("설명")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(4)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_STRING").typeCd("FLT_TYPE_STRING_TEXTAREA").isProduct(true)
				.build()
		);

		// USED
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "USED").name("USED").label("사용 여부").descr("사용 여부")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(5)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_BOOLEAN").typeCd("FLT_TYPE_BOOLEAN_RADIO").isProduct(true)
				.build()
		);

		// ORDER_BY
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "ORDER_BY").name("ORDER_BY").label("순서").descr("순서")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(6)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_NUMBER").typeCd("FLT_TYPE_NUMBER_DEF").isProduct(true)
				.build()
		);

		// CREATE_DATE
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "CREATE_DATE").name("CREATE_DATE").label("등록시간").descr("등록시간")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(7)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_DATE").typeCd("FLT_TYPE_DATE_DTTM").isProduct(true)
				.build()
		);

		// CREATE_EMP_ID
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "CREATE_EMP_ID").name("CREATE_EMP_ID").label("등록자").descr("등록자")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(8)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_ENTITY").typeCd("FLT_TYPE_ENTITY_SELECT")
				.refEntId("EMP").isProduct(true)
				.build()
		);

		// UPDATE_DATE
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "UPDATE_DATE").name("UPDATE_DATE").label("수정시간").descr("수정시간")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(9)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_DATE").typeCd("FLT_TYPE_DATE_DTTM").isProduct(true)
				.build()
		);

		// UPDATE_EMP_ID
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "UPDATE_EMP_ID").name("UPDATE_EMP_ID").label("수정자").descr("수정자")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(10)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_ENTITY").typeCd("FLT_TYPE_ENTITY_SELECT")
				.refEntId("EMP").isProduct(true)
				.build()
		);
	}

	/**
	 * Initialize Workflow Table Field
	 * @param tableName
	 * @param entId
	 */
	public void initWorkflowTableField(String tableName, String entId) {

		LocalDateTime createDate = LocalDateTime.now();
		String createEmpId = AuthUtil.getCurrentUserId();

		// ID
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "ID").name("ID").label("ID").descr("ID")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(1)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_STRING").typeCd("FLT_TYPE_STRING_TEXT").isProduct(true)
				.build()
		);

		// NAME
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "NAME").name("NAME").label("이름").descr("이름")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(2)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_STRING").typeCd("FLT_TYPE_STRING_TEXT").isProduct(true)
				.build()
		);

		// LABEL
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "LABEL").name("LABEL").label("라벨").descr("라벨")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(3)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_STRING").typeCd("FLT_TYPE_STRING_TEXT").isProduct(true)
				.build()
		);

		// DESCR
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "DESCR").name("DESCR").label("설명").descr("설명")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(4)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_STRING").typeCd("FLT_TYPE_STRING_TEXTAREA").isProduct(true)
				.build()
		);

		// USED
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "USED").name("USED").label("사용 여부").descr("사용 여부")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(5)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_BOOLEAN").typeCd("FLT_TYPE_BOOLEAN_RADIO").isProduct(true)
				.build()
		);

		// ORDER_BY
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "ORDER_BY").name("ORDER_BY").label("순서").descr("순서")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(6)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_NUMBER").typeCd("FLT_TYPE_NUMBER_DEF").isProduct(true)
				.build()
		);

		// CREATE_DATE
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "CREATE_DATE").name("CREATE_DATE").label("등록시간").descr("등록시간")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(7)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_DATE").typeCd("FLT_TYPE_DATE_DTTM").isProduct(true)
				.build()
		);

		// CREATE_EMP_ID
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "CREATE_EMP_ID").name("CREATE_EMP_ID").label("등록자").descr("등록자")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(8)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_ENTITY").typeCd("FLT_TYPE_ENTITY_SELECT")
				.refEntId("EMP").isProduct(true)
				.build()
		);

		// UPDATE_DATE
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "UPDATE_DATE").name("UPDATE_DATE").label("수정시간").descr("수정시간")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(9)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_DATE").typeCd("FLT_TYPE_DATE_DTTM").isProduct(true)
				.build()
		);

		// UPDATE_EMP_ID
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "UPDATE_EMP_ID").name("UPDATE_EMP_ID").label("수정자").descr("수정자")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(10)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_ENTITY").typeCd("FLT_TYPE_ENTITY_SELECT")
				.refEntId("EMP").isProduct(true)
				.build()
		);

		// TAS_ID
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "TAS_ID").name("TAS_ID").label("단계").descr("단계")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(11)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_ENTITY").typeCd("FLT_TYPE_ENTITY_SELECT")
				.refEntId("TAS").isProduct(true)
				.build()
		);

		// REQ_DATE
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "REQ_DATE").name("REQ_DATE").label("요청일자").descr("요청일자")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(12)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_DATE").typeCd("FLT_TYPE_DATE_DTTM").isProduct(true)
				.build()
		);

		// REQ_EMP_ID
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "REQ_EMP_ID").name("REQ_EMP_ID").label("요청자").descr("요청자")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(13)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_ENTITY").typeCd("FLT_TYPE_ENTITY_SELECT")
				.refEntId("EMP").isProduct(true)
				.build()
		);

		// ACP_DATE
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "ACP_DATE").name("ACP_DATE").label("접수일자").descr("접수일자")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(14)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_DATE").typeCd("FLT_TYPE_DATE_DTTM").isProduct(true)
				.build()
		);

		// ACP_EMP_ID
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "ACP_EMP_ID").name("ACP_EMP_ID").label("접수자").descr("접수자")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(15)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_ENTITY").typeCd("FLT_TYPE_ENTITY_SELECT")
				.refEntId("EMP").isProduct(true)
				.build()
		);

		// CLO_DATE
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "CLO_DATE").name("CLO_DATE").label("종료일자").descr("종료일자")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(16)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_DATE").typeCd("FLT_TYPE_DATE_DTTM").isProduct(true)
				.build()
		);

		// CLO_EMP_ID
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "CLO_EMP_ID").name("CLO_EMP_ID").label("종료자").descr("종료자")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(17)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_ENTITY").typeCd("FLT_TYPE_ENTITY_SELECT")
				.refEntId("EMP").isProduct(true)
				.build()
		);

		// ASS_EMP_ID
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "ASS_EMP_ID").name("ASS_EMP_ID").label("현재 담당자").descr("현재 담당자")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(18)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_ENTITY").typeCd("FLT_TYPE_ENTITY_SELECT")
				.refEntId("EMP").isProduct(true)
				.build()
		);

		// SRC_ID
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "SRC_ID").name("SRC_ID").label("상위 ID").descr("상위 ID")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(19)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_ENTITY").typeCd("FLT_TYPE_ENTITY_SELECT").isProduct(false)
				.build()
		);

		// SRC_ENT_ID
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "SRC_ENT_ID").name("SRC_ENT_ID").label("상위 Entity ID").descr("상위 Entity ID")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(20)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_ENTITY").typeCd("FLT_TYPE_ENTITY_SELECT")
				.refEntId("ENT").isProduct(false)
				.build()
		);
	}

	/**
	 * Initialize Custom Table Field
	 * @param tableName
	 * @param entId
	 */
	public void initCustomTableField(String tableName, String entId) {

		LocalDateTime createDate = LocalDateTime.now();
		String createEmpId = AuthUtil.getCurrentUserId();

		// ID
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "ID").name("ID").label("ID").descr("ID")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(1)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_STRING").typeCd("FLT_TYPE_STRING_TEXT").isProduct(true)
				.build()
		);

		// NAME
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "NAME").name("NAME").label("이름").descr("이름")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(2)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_STRING").typeCd("FLT_TYPE_STRING_TEXT").isProduct(true)
				.build()
		);

		// LABEL
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "LABEL").name("LABEL").label("라벨").descr("라벨")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(3)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_STRING").typeCd("FLT_TYPE_STRING_TEXT").isProduct(true)
				.build()
		);

		// DESCR
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "DESCR").name("DESCR").label("설명").descr("설명")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(4)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_STRING").typeCd("FLT_TYPE_STRING_TEXTAREA").isProduct(true)
				.build()
		);

		// USED
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "USED").name("USED").label("사용 여부").descr("사용 여부")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(5)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_BOOLEAN").typeCd("FLT_TYPE_BOOLEAN_RADIO").isProduct(true)
				.build()
		);

		// ORDER_BY
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "ORDER_BY").name("ORDER_BY").label("순서").descr("순서")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(6)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_NUMBER").typeCd("FLT_TYPE_NUMBER_DEF").isProduct(true)
				.build()
		);

		// CREATE_DATE
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "CREATE_DATE").name("CREATE_DATE").label("등록시간").descr("등록시간")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(7)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_DATE").typeCd("FLT_TYPE_DATE_DTTM").isProduct(true)
				.build()
		);

		// CREATE_EMP_ID
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "CREATE_EMP_ID").name("CREATE_EMP_ID").label("등록자").descr("등록자")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(8)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_ENTITY").typeCd("FLT_TYPE_ENTITY_SELECT")
				.refEntId("EMP").isProduct(true)
				.build()
		);

		// UPDATE_DATE
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "UPDATE_DATE").name("UPDATE_DATE").label("수정시간").descr("수정시간")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(9)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_DATE").typeCd("FLT_TYPE_DATE_DTTM").isProduct(true)
				.build()
		);

		// UPDATE_EMP_ID
		this.repository.save(TableFieldEntity.builder()
				.id(tableName + "/" + "UPDATE_EMP_ID").name("UPDATE_EMP_ID").label("수정자").descr("수정자")
				.createDate(createDate).createEmpId(createEmpId)
				.isUsed(true).orderBy(10)

				.entId(entId).tabId(tableName)
				.tfdId("FLT_TYPE_ENTITY").typeCd("FLT_TYPE_ENTITY_SELECT")
				.refEntId("EMP").isProduct(true)
				.build()
		);
	}
}