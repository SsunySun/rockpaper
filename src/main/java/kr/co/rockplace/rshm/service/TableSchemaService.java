package kr.co.rockplace.rshm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.mapper.rshm.TableSchemaMapper;

/**
 * Table Schema Service
 * @author wonsunlee
 *
 */
@Service
public class TableSchemaService {

	@Value("${spring.datasource.rshm.username}")
	private String schema;

	@Autowired
	private TableSchemaMapper tableSchemaMapper;

	/**
	 * Initialize System Table Field
	 * @param tableName
	 * @param userId
	 * @param entId
	 */
	public void initSystemTableField(String tableName, String userId, String entId) {
		this.tableSchemaMapper.initSystemTableField(this.schema, tableName, userId, entId);
	}

	/**
	 * Initialize Workflow Table Field
	 * @param tableName
	 * @param userId
	 * @param entId
	 */
	public void initWorkflowTableField(String tableName, String userId, String entId) {
		this.tableSchemaMapper.initWorkflowTableField(this.schema, tableName, userId, entId);
	}

	/**
	 * Create System Table
	 * @param tableName
	 */
	public void createSystemTable(String tableName) {
		this.tableSchemaMapper.createSystemTable(this.schema, tableName);
	}

	/**
	 * Create Workflow Table
	 * @param tableName
	 */
	public void createWorkflowTable(String tableName) {
		this.tableSchemaMapper.createWorkflowTable(this.schema, tableName);
	}

	/**
	 * Create Custom Table
	 * @param tableName
	 */
	public void createCustomTable(String tableName) {
		this.tableSchemaMapper.createCustomTable(this.schema, tableName);
	}

	/**
	 * Drop Table
	 * @param tableName
	 */
	public void dropTable(String tableName) {
		this.tableSchemaMapper.dropTable(this.schema, tableName);
	}

	/**
	 * Rename Table
	 * @param oldTableName
	 * @param newTableName
	 */
	public void renameTable(String oldTableName, String newTableName) {
		this.tableSchemaMapper.renameTable(this.schema, newTableName, newTableName);
	}

	/**
	 * Add Column
	 * @param tableName
	 * @param columnName
	 * @param columnType
	 */
	public void addColumn(String tableName, String columnName, String columnType) {

		if(this.tableSchemaMapper.existColumn(this.schema, tableName, columnName) == 0) {
			this.tableSchemaMapper.addColumn(this.schema, tableName, columnName, columnType);
		}
	}

	/**
	 * Change Column
	 * @param tableName
	 * @param oldColumnName
	 * @param newColumnName
	 * @param columnType
	 */
	public void changeColumn(String tableName, String oldColumnName, String newColumnName, String columnType) {

		if(this.tableSchemaMapper.existColumn(this.schema, tableName, oldColumnName) > 0) {
			this.tableSchemaMapper.changeColumn(this.schema, tableName, oldColumnName, newColumnName, columnType);
		}
	}

	/**
	 * Modify Column
	 * @param tableName
	 * @param columnName
	 * @param columnType
	 */
	public void modifyColumn(String tableName, String columnName, String columnType) {

		if(this.tableSchemaMapper.existColumn(this.schema, tableName, columnName) > 0) {
			this.tableSchemaMapper.modifyColumn(this.schema, tableName, columnName, columnType);
		}
	}

	/**
	 * Rename Column
	 * @param tableName
	 * @param oldColumnName
	 * @param newColumnName
	 */
	public void renameColumn(String tableName, String oldColumnName, String newColumnName) {

		if(this.tableSchemaMapper.existColumn(this.schema, tableName, oldColumnName) > 0) {
			this.tableSchemaMapper.renameColumn(this.schema, tableName, oldColumnName, newColumnName);
		}
	}

	/**
	 * Drop Column
	 * @param tableName
	 * @param columnName
	 */
	public void dropColumn(String tableName, String columnName) {

		if(this.tableSchemaMapper.existColumn(this.schema, tableName, columnName) > 0) {
			this.tableSchemaMapper.dropColumn(this.schema, tableName, columnName);
		}
	}
}