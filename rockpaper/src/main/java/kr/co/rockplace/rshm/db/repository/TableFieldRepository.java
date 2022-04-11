package kr.co.rockplace.rshm.db.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import kr.co.rockplace.rshm.db.entity.TableFieldEntity;

/**
 * Table Field Repository
 * @author wonsunlee
 *
 */
@Repository
public interface TableFieldRepository extends CommonRepository<TableFieldEntity, String> {

	public List<TableFieldEntity> findByTypeCd(String codeId);
	public Iterable<TableFieldEntity> findByTypeCd(String codeId, Sort sort);
	public Page<TableFieldEntity> findByTypeCd(String codeId, Pageable pageable);

	public List<TableFieldEntity> findByEntId(String entityId);
	public Iterable<TableFieldEntity> findByEntId(String entityId, Sort sort);
	public Page<TableFieldEntity> findByEntId(String entityId, Pageable pageable);

	public List<TableFieldEntity> findByTabId(String tableId);
	public Iterable<TableFieldEntity> findByTabId(String tableId, Sort sort);
	public Page<TableFieldEntity> findByTabId(String tableId, Pageable pageable);

	public List<TableFieldEntity> findByTabIdAndName(String tableId, String name);
	public Iterable<TableFieldEntity> findByTabIdAndName(String tableId, String name, Sort sort);
	public Page<TableFieldEntity> findByTabIdAndName(String tableId, String name, Pageable pageable);

	public List<TableFieldEntity> findByTabIdAndIsProductTrue(String tableId);
	public Iterable<TableFieldEntity> findByTabIdAndIsProductTrue(String tableId, Sort sort);
	public Page<TableFieldEntity> findByTabIdAndIsProductTrue(String tableId, Pageable pageable);

	public List<TableFieldEntity> findByTabIdAndIsProductFalse(String tableId);
	public Iterable<TableFieldEntity> findByTabIdAndIsProductFalse(String tableId, Sort sort);
	public Page<TableFieldEntity> findByTabIdAndIsProductFalse(String tableId, Pageable pageable);

	public List<TableFieldEntity> findByTabIdAndNameAndIsProductFalse(String tableId, String name);
	public Iterable<TableFieldEntity> findByTabIdAndNameAndIsProductFalse(String tableId, String name, Sort sort);
	public Page<TableFieldEntity> findByTabIdAndNameAndIsProductFalse(String tableId, String name, Pageable pageable);

	public List<TableFieldEntity> findByTabIdAndNameAndIsProductTrue(String tableId, String name);
	public Iterable<TableFieldEntity> findByTabIdAndNameAndIsProductTrue(String tableId, String name, Sort sort);
	public Page<TableFieldEntity> findByTabIdAndNameAndIsProductTrue(String tableId, String name, Pageable pageable);
}