package kr.co.rockplace.rshm.db.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import kr.co.rockplace.rshm.db.entity.TableEntity;

/**
 * Table Repository
 * @author wonsunlee
 *
 */
@Repository
public interface TableRepository extends CommonRepository<TableEntity, String> {

	public List<TableEntity> findByTypeCd(String codeId);
	public Iterable<TableEntity> findByTypeCd(String codeId, Sort sort);
	public Page<TableEntity> findByTypeCd(String codeId, Pageable pageable);

	public List<TableEntity> findByEntId(String entityId);
	public Iterable<TableEntity> findByEntId(String entityId, Sort sort);
	public Page<TableEntity> findByEntId(String entityId, Pageable pageable);

	public Optional<TableEntity> findByEntIdAndTypeCdIn(String entityId, List<String> typeList);
}