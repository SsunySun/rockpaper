package kr.co.rockplace.rshm.db.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import kr.co.rockplace.rshm.db.entity.EntityEntity;

/**
 * Entity Repository
 * @author wonsunlee
 *
 */
@Repository
public interface EntityRepository extends CommonRepository<EntityEntity, String> {

	public List<EntityEntity> findByTypeCd(String codeId);
	public Iterable<EntityEntity> findByTypeCd(String codeId, Sort sort);
	public Page<EntityEntity> findByTypeCd(String codeId, Pageable pageable);

	public EntityRepository findBySequenceEntity_Id(String sequenceId);
}