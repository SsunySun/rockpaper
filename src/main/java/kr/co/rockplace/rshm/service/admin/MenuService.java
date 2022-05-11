package kr.co.rockplace.rshm.service.admin;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.EntityEntity;
import kr.co.rockplace.rshm.db.entity.MenuEntity;
import kr.co.rockplace.rshm.db.repository.CommonRepository;
import kr.co.rockplace.rshm.db.repository.EntityRepository;
import kr.co.rockplace.rshm.db.repository.MenuRepository;
import kr.co.rockplace.rshm.db.service.SequenceKeyService;
import kr.co.rockplace.rshm.utils.ReflectionUtil;

/**
 * Menu Service
 * @author wonsunlee
 *
 */
@Service
public class MenuService extends AdminCommonService<MenuEntity, CommonRepository<MenuEntity, String>> {

	@Autowired
	private MenuRepository repository;

	@Autowired
	private SequenceKeyService sequenceKeyService;

	@Autowired
	private EntityRepository entityRepository;

	@Override
	@Transactional
	public MenuEntity create(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		Optional<EntityEntity> thisEntity = this.entityRepository.findById(entId);
		if(StringUtils.isNoneBlank((String) map.get("id"))) {

			Optional<MenuEntity> checkEntity = this.repository.findById(thisEntity.get().getPrefix() + "_" + map.get("id"));
			if(checkEntity.isPresent()) {
				return null;
			}
		}

		MenuEntity returnMenuEntity = null;

		// Key 설정
		if(!map.containsKey("id") || StringUtils.isBlank((String) map.get("id"))) {
			map.put("id", this.sequenceKeyService.getKey((String) map.get("var/entId")));
		} else {
			map.put("id", thisEntity.get().getPrefix() + "_" + map.get("id"));
		}

		returnMenuEntity = this.repository.save(
			ReflectionUtil.convertToValueObject(map, MenuEntity.class)
		);

		return returnMenuEntity;
	}

	@Override
	@Transactional
	public MenuEntity update(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		MenuEntity returnMenuEntity = null;
		Optional<MenuEntity> menuEntity = this.repository.findById((String) map.get("id"));
		if(menuEntity.isPresent()) {

			Map<String, Object> resultMap = ReflectionUtil.diffEntityAndMap(menuEntity.get(), map);
			returnMenuEntity = this.repository.save(
				ReflectionUtil.convertToValueObject(resultMap, MenuEntity.class)
			);
		}

		return returnMenuEntity;
	}

	@Override
	@Transactional
	public boolean delete(String id) {

		Optional<MenuEntity> entity = this.repository.findById(id);
		if(entity.isPresent()) {
			this.repository.delete(entity.get());
			return true;
		} else {
			return false;
		}
	}

	public Iterable<MenuEntity> getMenuList(
			boolean isLeader,
			boolean isAdmin) {

		if(isAdmin) {
			return this.repository.findByPidIsNullAndIsUsedTrue(Sort.by(new Order(Sort.Direction.ASC, "orderBy")));
		} else if(isLeader) {
			return this.repository.findByPidIsNullAndIsUsedTrueAndIsAdmin(isAdmin, Sort.by(new Order(Sort.Direction.ASC, "orderBy")));
		} else {
			return this.repository.findByPidIsNullAndIsUsedTrueAndIsLeaderAndIsAdmin(isLeader, isAdmin, Sort.by(new Order(Sort.Direction.ASC, "orderBy")));
		}
	}
}