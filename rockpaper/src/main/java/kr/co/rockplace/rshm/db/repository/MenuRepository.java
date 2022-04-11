package kr.co.rockplace.rshm.db.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import kr.co.rockplace.rshm.db.entity.MenuEntity;

/**
 * Menu Repository
 * @author wonsunlee
 *
 */
@Repository
public interface MenuRepository extends CommonRepository<MenuEntity, String> {

	public List<MenuEntity> findByPidIsNull();
	public Iterable<MenuEntity> findByPidIsNull(Sort sort);
	public Page<MenuEntity> findByPidIsNull(Pageable pageable);

	public List<MenuEntity> findByPidIsNullAndIsAdmin(boolean isAdmin);
	public Iterable<MenuEntity> findByPidIsNullAndIsAdmin(boolean isAdmin, Sort sort);
	public Page<MenuEntity> findByPidIsNullAndIsAdmin(boolean isAdmin, Pageable pageable);

	public List<MenuEntity> findByPidIsNullAndIsUsedTrue();
	public Iterable<MenuEntity> findByPidIsNullAndIsUsedTrue(Sort sort);
	public Page<MenuEntity> findByPidIsNullAndIsUsedTrue(Pageable pageable);

	public List<MenuEntity> findByPidIsNullAndIsUsedTrueAndIsAdmin(boolean isAdmin);
	public Iterable<MenuEntity> findByPidIsNullAndIsUsedTrueAndIsAdmin(boolean isAdmin, Sort sort);
	public Page<MenuEntity> findByPidIsNullAndIsUsedTrueAndIsAdmin(boolean isAdmin, Pageable pageable);

	public List<MenuEntity> findByPidIsNullAndIsUsedTrueAndIsLeaderAndIsAdmin(boolean isLeader, boolean isAdmin);
	public Iterable<MenuEntity> findByPidIsNullAndIsUsedTrueAndIsLeaderAndIsAdmin(boolean isLeader, boolean isAdmin, Sort sort);
	public Page<MenuEntity> findByPidIsNullAndIsUsedTrueAndIsLeaderAndIsAdmin(boolean isLeader, boolean isAdmin, Pageable pageable);
}