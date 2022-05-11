package kr.co.rockplace.rshm.db.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import kr.co.rockplace.rshm.db.entity.FormEntity;

/**
 * Form Repository
 * @author wonsunlee
 *
 */
@Repository
public interface FormRepository extends CommonRepository<FormEntity, String> {

	public List<FormEntity> findByEntId(String entityId);
	public Iterable<FormEntity> findByEntId(String entityId, Sort sort);
	public Page<FormEntity> findByEntId(String entityId, Pageable pageable);

	public List<FormEntity> findByTasId(String taskId);
	public Iterable<FormEntity> findByTasId(String taskId, Sort sort);
	public Page<FormEntity> findByTasId(String taskId, Pageable pageable);
}