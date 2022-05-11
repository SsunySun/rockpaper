package kr.co.rockplace.rshm.controller.rest.api.admin;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import kr.co.rockplace.rshm.config.annotation.ApiPageable;
import kr.co.rockplace.rshm.db.entity.CommonEntity;
import kr.co.rockplace.rshm.db.repository.CommonRepository;
import kr.co.rockplace.rshm.service.admin.AdminCommonService;
import kr.co.rockplace.rshm.view.CommonResultView;
import lombok.extern.slf4j.Slf4j;

/**
 * Administrator Common Rest Controller
 * @author wonsunlee
 *
 */
@Slf4j
public abstract class AdminCommonRestController<T extends CommonEntity> {

	@Autowired
	private AdminCommonService<T, CommonRepository<T, String>> service;

	/**
	 * 전체 목록 조회
	 * @return
	 */
	@GetMapping(value = "/list")
	@ApiOperation(value="전체 목록 조회", notes = "전체 목록 조회")
	@Deprecated
	public CommonResultView<List<T>> getList() {

		List<T> entityList = this.service.getList();
		if(entityList.size() > 0) {
			return CommonResultView.success(entityList);
		} else {
			return CommonResultView.fail(HttpStatus.NO_CONTENT, HttpStatus.NO_CONTENT.value(), HttpStatus.NO_CONTENT.getReasonPhrase(), entityList);
		}
	}

	/**
	 * 전체 목록 조회(페이지)
	 * @param pageable
	 * @return
	 */
	@GetMapping(value = "/pagelist")
	@ApiPageable
	@ApiOperation(value="전체 목록 조회(페이지)", notes = "전체 목록 조회(페이지)")
	@Deprecated
	public CommonResultView<Page<T>> getPageList(
			Pageable pageable) {

		log.info("== getPageList ==");
		log.info("pageable: {}", pageable);
		log.info("pageable.sort: {}", pageable.getSort());

		Page<T> entityList = this.service.getList(pageable);

		log.info("getNumber: {}", entityList.getNumber());
		log.info("getNumberOfElements: {}", entityList.getNumberOfElements());
		log.info("getSize: {}", entityList.getSize());
		log.info("getTotalElements: {}", entityList.getTotalElements());
		log.info("getTotalPages: {}", entityList.getTotalPages());
		log.info("getContent: {}", entityList.getContent());
		log.info("getPageable: {}", entityList.getPageable());
		log.info("getSort: {}", entityList.getSort());
		log.info("nextPageable: {}", entityList.nextPageable());

		if(entityList.getTotalElements() > 0) {
			return CommonResultView.success(entityList);
		} else {
			return CommonResultView.fail(HttpStatus.NO_CONTENT, HttpStatus.NO_CONTENT.value(), HttpStatus.NO_CONTENT.getReasonPhrase(), entityList);
		}
	}

	/**
	 * 특정 객체 조회(ID)
	 * @param id
	 * @return
	 */
	@GetMapping(value = "/one")
	@ApiOperation(value="특정 객체 조회(ID)", notes = "특정 객체 조회(ID)")
	@Deprecated
	public CommonResultView<T> getOne(@RequestParam(value = "id", required = true) String id) {

		log.info("== getOne ==");
		log.info("id: {}", id);

		T entity = this.service.getObject(id);
		if(entity != null && StringUtils.isNotEmpty(entity.getId())) {
			return CommonResultView.success(entity);
		} else {
			return CommonResultView.fail(HttpStatus.NO_CONTENT, HttpStatus.NO_CONTENT.value(), HttpStatus.NO_CONTENT.getReasonPhrase(), null);
		}
	}

	/**
	 * 객체 등록(Form에서 등록시)
	 * @param entId
	 * @param map
	 * @return
	 */
	@PostMapping(value = "/create")
	@ApiOperation(value = "객체 등록", notes = "객체 등록")
	@ApiResponses({
		@ApiResponse(code = 201, message = "created")
	})
	@Deprecated
	public CommonResultView<T> create(
			@RequestParam(value = "var/entId", required = true) String entId,
			@RequestParam Map<String, Object> map) {

		log.info("== create ==");
		log.info("entId: {}", entId);
		log.info("map: {}", map);

		try {

			T entity = this.service.create(entId, map);
			if(entity != null) {
				return CommonResultView.success(entity);
			} else {
				return CommonResultView.fail(HttpStatus.BAD_REQUEST.value(), HttpStatus.BAD_REQUEST.getReasonPhrase(), null);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return CommonResultView.fail(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage(), null);
		}
	}

	/**
	 * 객체 수정(Form에서 수정시)
	 * @param entId
	 * @param map
	 * @return
	 */
	@PostMapping(value = "/update")
	@ApiOperation(value = "객체 수정", notes = "객체 수정")
	@Deprecated
	public CommonResultView<T> update(
			@RequestParam(value = "var/entId", required = true) String entId,
			@RequestParam Map<String, Object> map) {

		log.info("== update ==");
		log.info("map: {}", map);

		try {

			T entity = this.service.update(entId, map);
			if(entity != null) {
				return CommonResultView.success(entity);
			} else {
				return CommonResultView.fail(HttpStatus.BAD_REQUEST.value(), HttpStatus.BAD_REQUEST.getReasonPhrase(), null);
			}
		} catch (Exception e) {
			return CommonResultView.fail(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage(), null);
		}
		
	}

	/**
	 * 객체 삭제
	 * @param id
	 * @return
	 */
	@DeleteMapping(value = "/delete")
	@ApiOperation(value = "객체 삭제", notes = "객체 삭제")
	@Deprecated
	public CommonResultView<Boolean> delete(@RequestParam(value = "id", required = true) String id) {

		log.info("== delete ==");
		log.info("id: {}", id);

		boolean result = this.service.delete(id);
		if(result) {
			return CommonResultView.success(result);
		} else {
			return CommonResultView.fail(HttpStatus.BAD_REQUEST.value(), HttpStatus.BAD_REQUEST.getReasonPhrase(), result);
		}
	}
}