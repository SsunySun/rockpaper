package kr.co.rockplace.rshm.db.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import kr.co.rockplace.rshm.db.entity.ActivityEntity;

/**
 * Activity Repository
 * @author wonsunlee
 *
 */
@Repository
public interface ActivityRepository extends CommonRepository<ActivityEntity, String> {

	public List<ActivityEntity> findByEntId(String entityId);
	public Iterable<ActivityEntity> findByEntId(String entityId, Sort sort);
	public Page<ActivityEntity> findByEntId(String entityId, Pageable pageable);

	public List<ActivityEntity> findByWofId(String workflowId);
	public Iterable<ActivityEntity> findByWofId(String workflowId, Sort sort);
	public Page<ActivityEntity> findByWofId(String workflowId, Pageable pageable);
}