package kr.co.rockplace.rshm.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.rockplace.rshm.db.entity.CommonEntity;
import kr.co.rockplace.rshm.db.repository.CommonRepository;
import kr.co.rockplace.rshm.service.CommonService;
import kr.co.rockplace.rshm.service.admin.AdminCommonService;

/**
 * Administrator Common Controller
 * @author wonsunlee
 *
 */
public abstract class AdminCommonController<T extends CommonEntity> {

	@Autowired
	protected CommonService commonService;

	@Autowired
	protected AdminCommonService<T, CommonRepository<T, String>> service;

	/**
	 * 객체 등록
	 * @param parameterMap
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/create")
	protected abstract String create(
			@RequestParam Map<String, Object> parameterMap,
			HttpServletRequest request,
			Model model);

	/**
	 * 객체 수정
	 * @param key
	 * @param parameterMap
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/update")
	protected abstract String update(
			@RequestParam(value = "key", required = true) String key,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletRequest request,
			Model model);

	/**
	 * 객체 등록(모달)
	 * @param parameterMap
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/modal/create")
	protected abstract String modalCreate(
			@RequestParam Map<String, Object> parameterMap,
			HttpServletRequest request,
			Model model);

	/**
	 * 객체 수정(모달)
	 * @param key
	 * @param parameterMap
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/modal/update")
	protected abstract String modalUpdate(
			@RequestParam(value = "key", required = true) String key,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletRequest request,
			Model model);
}