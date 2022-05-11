package kr.co.rockplace.rshm.db.repository;

import org.springframework.stereotype.Repository;

import kr.co.rockplace.rshm.db.entity.SequenceEntity;

/**
 * Sequence Service
 * @author wonsunlee
 *
 */
@Repository
public interface SequenceRepository extends CommonRepository<SequenceEntity, String> {

	public SequenceEntity findByEntId(String entityId);
}