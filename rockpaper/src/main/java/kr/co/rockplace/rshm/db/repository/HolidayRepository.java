package kr.co.rockplace.rshm.db.repository;

import org.springframework.stereotype.Repository;

import kr.co.rockplace.rshm.db.entity.HolidayEntity;

/**
 * Holiday Repository
 * @author wonsunlee
 *
 */
@Repository
public interface HolidayRepository extends CommonRepository<HolidayEntity, String> {

}