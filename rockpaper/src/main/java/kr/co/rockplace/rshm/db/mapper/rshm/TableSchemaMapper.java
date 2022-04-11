package kr.co.rockplace.rshm.db.mapper.rshm;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.repository.NoRepositoryBean;

/**
 * Table Schema Mapper
 * @author wonsunlee
 */
@NoRepositoryBean
public interface TableSchemaMapper {

	/**
	 * Create System Table
	 * @param schema
	 * @param tableName
	 */
	public int createSystemTable(
			@Param("schema") String schema,
			@Param("tableName") String tableName);

	/**
	 * Initialize System Table Field
	 * @param schema
	 * @param tableName
	 * @param userId
	 * @param entId
	 */
	public int initSystemTableField(
			@Param("schema") String schema,
			@Param("tableName") String tableName,
			@Param("userId") String userId,
			@Param("entId") String entId);

	/**
	 * Create Workflow Table
	 * @param schema
	 * @param tableName
	 */
	public int createWorkflowTable(
			@Param("schema") String schema,
			@Param("tableName") String tableName);

	/**
	 * Initialize Workflow Table Field
	 * @param schema
	 * @param tableName
	 * @param userId
	 * @param entId
	 */
	public int initWorkflowTableField(
			@Param("schema") String schema,
			@Param("tableName") String tableName,
			@Param("userId") String userId,
			@Param("entId") String entId);

	/**
	 * Create Custom Table
	 * @param schema
	 * @param tableName
	 */
	public int createCustomTable(
			@Param("schema") String schema,
			@Param("tableName") String tableName);

	/**
	 * Initialize Custom Table Field
	 * @param schema
	 * @param tableName
	 * @param userId
	 * @param entId
	 */
	public int initCustomTableField(
			@Param("schema") String schema,
			@Param("tableName") String tableName,
			@Param("userId") String userId,
			@Param("entId") String entId);

	/**
	 * Drop Table
	 * @param schema
	 * @param tableName
	 */
	public int dropTable(
			@Param("schema") String schema,
			@Param("tableName") String tableName);

	/**
	 * Rename Table
	 * @param schema
	 * @param oldTableName
	 * @param newTableName
	 */
	public int renameTable(
			@Param("schema") String schema,
			@Param("oldTableName") String oldTableName,
			@Param("newTableName") String newTableName);

	/**
	 * Column exist check
	 * @param schema
	 * @param tableName
	 * @param columnName
	 * @return 0: not exist, 1: exist
	 */
	public int existColumn(
			@Param("schema") String schema,
			@Param("tableName") String tableName,
			@Param("columnName") String columnName);

	/**
	 * Add Column
	 * @param schema
	 * @param tableName
	 * @param columnName
	 * @param columnType
	 */
	public int addColumn(
			@Param("schema") String schema,
			@Param("tableName") String tableName,
			@Param("columnName") String columnName,
			@Param("columnType") String columnType);

	/**
	 * Change Column
	 * @param schema
	 * @param tableName
	 * @param oldColumnName
	 * @param newColumnName
	 * @param columnType
	 */
	public int changeColumn(
			@Param("schema") String schema,
			@Param("tableName") String tableName,
			@Param("oldColumnName") String oldColumnName,
			@Param("newColumnName") String newColumnName,
			@Param("columnType") String columnType);

	/**
	 * Modify Column
	 * @param schema
	 * @param tableName
	 * @param columnName
	 * @param columnType
	 */
	public int modifyColumn(
			@Param("schema") String schema,
			@Param("tableName") String tableName,
			@Param("columnName") String columnName,
			@Param("columnType") String columnType);

	/**
	 * Rename Column
	 * @param schema
	 * @param tableName
	 * @param oldColumnName
	 * @param newColumnName
	 */
	public int renameColumn(
			@Param("schema") String schema,
			@Param("tableName") String tableName,
			@Param("oldColumnName") String oldColumnName,
			@Param("newColumnName") String newColumnName);

	/**
	 * Drop Column
	 * @param schema
	 * @param tableName
	 * @param columnName
	 */
	public int dropColumn(
			@Param("schema") String schema,
			@Param("tableName") String tableName,
			@Param("columnName") String columnName);
}