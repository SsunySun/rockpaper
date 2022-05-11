package kr.co.rockplace.rshm.db.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import kr.co.rockplace.rshm.db.entity.EmployeeEntity;

/**
 * Employee Repostiroy
 * @author wonsunlee
 *
 */
@Repository
public interface EmployeeRepository extends CommonRepository<EmployeeEntity, String> {

	public List<EmployeeEntity> findByOrgId(String organizationId);
	public Iterable<EmployeeEntity> findByOrgId(String organizationId, Sort sort);
	public Page<EmployeeEntity> findByOrgId(String organizationId, Pageable pageable);

	public List<EmployeeEntity> findByDptId(String organizationId);
	public Iterable<EmployeeEntity> findByDptId(String organizationId, Sort sort);
	public Page<EmployeeEntity> findByDptId(String organizationId, Pageable pageable);
}