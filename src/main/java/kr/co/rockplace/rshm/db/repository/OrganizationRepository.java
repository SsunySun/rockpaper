package kr.co.rockplace.rshm.db.repository;

import org.springframework.stereotype.Repository;

import kr.co.rockplace.rshm.db.entity.OrganizationEntity;

/**
 * Organization Repository
 * @author wonsunlee
 *
 */
@Repository
public interface OrganizationRepository extends CommonRepository<OrganizationEntity, String> {

}