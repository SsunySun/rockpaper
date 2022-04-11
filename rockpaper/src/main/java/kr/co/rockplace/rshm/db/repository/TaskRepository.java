package kr.co.rockplace.rshm.db.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import kr.co.rockplace.rshm.db.entity.TaskEntity;

/**
 * Task Repository
 * @author wonsunlee
 *
 */
@Repository
public interface TaskRepository extends CommonRepository<TaskEntity, String> {

	public List<TaskEntity> findByEntId(String entityId);
	public Iterable<TaskEntity> findByEntId(String entityId, Sort sort);
	public Page<TaskEntity> findByEntId(String entityId, Pageable pageable);

	public List<TaskEntity> findByActId(String activityId);
	public Iterable<TaskEntity> findByActId(String activityId, Sort sort);
	public Page<TaskEntity> findByActId(String activityId, Pageable pageable);
}