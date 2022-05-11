package kr.co.rockplace.rshm.service.admin;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.CommonEntity;
import kr.co.rockplace.rshm.db.repository.CommonRepository;

/**
 * Administrator Common Service
 * @author wonsunlee
 *
 * @param <T> {@link CommonEntity}}
 */
@Service
public abstract class AdminCommonService<T extends CommonEntity, T1 extends CommonRepository<T, String>> {

	@Autowired
	private T1 repository;

	/**
	 * 전체 목록 가져오기
	 * @return
	 */
	public List<T> getList() {
		return this.repository.findAll();
	}

	/**
	 * 목록 전체 갯수 가져오기
	 * @return
	 */
	public long getSize() {
		return this.repository.count();
	}

	/**
	 * 전체 목록 가져오기(페이지)
	 * @param pageable
	 * @return
	 */
	public Page<T> getList(Pageable pageable) {
		return this.repository.findAll(pageable);
	}

	/**
	 * ID 기반의 목록 가져오기
	 * @param id
	 * @return
	 */
	public T getObject(String id) {

		Optional<T> entity = this.repository.findById(id);
		if(entity.isPresent()) {
			return entity.get();
		} else {
			return null;
		}
	}

	/**
	 * 객체 생성
	 * @param entId
	 * @param map
	 * @return
	 * @throws SecurityException 
	 * @throws NoSuchMethodException 
	 * @throws InvocationTargetException 
	 * @throws IllegalArgumentException 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public abstract T create(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException;

	/**
	 * 객체 수정
	 * @param entId
	 * @param map
	 * @return
	 * @throws SecurityException 
	 * @throws NoSuchMethodException 
	 * @throws InvocationTargetException 
	 * @throws IllegalArgumentException 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public abstract T update(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException;

	/**
	 * 객체 삭제
	 * @param id
	 * @return
	 */
	@Transactional
	public boolean delete(String id) {

		Optional<T> entity = this.repository.findById(id);
		if(entity.isPresent()) {
			this.repository.delete(entity.get());
			return true;
		} else {
			return false;
		}
	}
}