package kr.co.rockplace.rshm.db.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import kr.co.rockplace.rshm.db.entity.ControlEntity;

/**
 * Control Repository
 * @author wonsunlee
 *
 */
@Repository
public interface ControlRepository extends CommonRepository<ControlEntity, String> {

	public List<ControlEntity> findByEntId(String entityId);
	public Iterable<ControlEntity> findByEntId(String entityId, Sort sort);
	public Page<ControlEntity> findByEntId(String entityId, Pageable pageable);

	public List<ControlEntity> findByTasId(String taskId);
	public Iterable<ControlEntity> findByTasId(String taskId, Sort sort);
	public Page<ControlEntity> findByTasId(String taskId, Pageable pageable);

	public List<ControlEntity> findByNextTasId(String taskId);
	public Iterable<ControlEntity> findByNextTasId(String taskId, Sort sort);
	public Page<ControlEntity> findByNextTasId(String taskId, Pageable pageable);
}