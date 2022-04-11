package kr.co.rockplace.rshm.db.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import kr.co.rockplace.rshm.db.entity.DepartmentEntity;

/**
 * Department Repository
 * @author wonsunlee
 *
 */
@Repository
public interface DepartmentRepository extends CommonRepository<DepartmentEntity, String> {

	public List<DepartmentEntity> findByOrgId(String organizationId);
	public Iterable<DepartmentEntity> findByOrgId(String organizationId, Sort sort);
	public Page<DepartmentEntity> findByOrgId(String organizationId, Pageable pageable);

	public List<DepartmentEntity> findByIdIn(List<String> idList);
}