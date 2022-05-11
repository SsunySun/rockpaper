package kr.co.rockplace.rshm.db.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import kr.co.rockplace.rshm.db.entity.WorkflowEntity;

/**
 * Workflow Repository
 * @author wonsunlee
 *
 */
@Repository
public interface WorkflowRepository extends CommonRepository<WorkflowEntity, String> {

	public List<WorkflowEntity> findByEntId(String entityId);
	public Iterable<WorkflowEntity> findByEntId(String entityId, Sort sort);
	public Page<WorkflowEntity> findByEntId(String entityId, Pageable pageable);
}