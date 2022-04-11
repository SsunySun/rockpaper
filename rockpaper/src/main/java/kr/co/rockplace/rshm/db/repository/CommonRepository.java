package kr.co.rockplace.rshm.db.repository;

import java.io.Serializable;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

import kr.co.rockplace.rshm.db.entity.CommonEntity;

/**
 * Common Repository
 * @author wonsunlee
 *
 * @param <T> {@link CommonEntity}
 * @param <ID> {@link Serializable}
 */
@NoRepositoryBean
public interface CommonRepository<T extends CommonEntity, ID extends Serializable> extends JpaRepository<T, ID> {

	/**
	 * 
	 * Like: Search
	 * StartingWith: Search%
	 * EndingWith: %Search
	 * Containing: %Search%
	 * LikeIgnoreCase: 대소문자 구문 없이
	 */
	public T findByNameLike(String name);
	public Iterable<T> findByNameLike(String nanme, Sort sort);
	public Page<T> findByNameLike(String nanme, Pageable pageable);

	public T findByName(String name);
	public Iterable<T> findByName(String nanme, Sort sort);
	public Page<T> findByName(String nanme, Pageable pageable);

	public T findByLabel(String label);
	public Iterable<T> findByLabel(String label, Sort sort);
	public Page<T> findByLabel(String label, Pageable pageable);

	public T findByDescr(String descr);
	public Iterable<T> findByDescr(String descr, Sort sort);
	public Page<T> findByDescr(String descr, Pageable pageable);

	public T findByIsUsed(boolean isUsed);
	public Iterable<T> findByIsUsed(boolean isUsed, Sort sort);
	public Page<T> findByIsUsed(boolean isUsed, Pageable pageable);
}