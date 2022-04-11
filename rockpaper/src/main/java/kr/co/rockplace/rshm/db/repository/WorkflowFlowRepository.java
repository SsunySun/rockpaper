package kr.co.rockplace.rshm.db.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import kr.co.rockplace.rshm.db.entity.WorkflowFlowEntity;

/**
 * Workflow Flow Repository
 * @author wonsunlee
 *
 */
@Repository
public interface WorkflowFlowRepository extends CommonRepository<WorkflowFlowEntity, String> {

	public List<WorkflowFlowEntity> findBySrcId(String sourceId);
	public Iterable<WorkflowFlowEntity> findBySrcId(String sourceId, Sort sort);
	public Page<WorkflowFlowEntity> findBySrcId(String sourceId, Pageable pageable);
}