package kr.co.rockplace.rshm.controller;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.rockplace.rshm.db.entity.FormEntity;
import kr.co.rockplace.rshm.db.entity.ListEntity;
import kr.co.rockplace.rshm.service.CommonService;
import kr.co.rockplace.rshm.service.admin.FormService;
import kr.co.rockplace.rshm.service.admin.ListService;
import kr.co.rockplace.rshm.utils.LogUtils;

/**
 * Common Controller
 * @author wonsunlee
 *
 */
@Controller
@RequestMapping(value="/common")
public class CommonController {

	@Autowired
	private CommonService commonService;

	@Autowired
	private ListService listService;

	@Autowired
	private FormService formService;

	/**
	 * 
	 * @param model
	 * @param id
	 * @param parameterMap
	 * @return
	 */
	@GetMapping(value="/list")
	public String list(
			@RequestParam(value = "lstId", required = true) String lstId,
			@RequestParam Map<String, Object> parameterMap,
			Model model) {

		LogUtils.printParam("/list", parameterMap, true, "lstId");

		// Menu ID의 정보를 기준으로 Aside 및 Menu Entity 설정
		this.commonService.setMenuInfo(parameterMap, model);

		ListEntity listEntity = this.listService.getObject(lstId);
		if(listEntity == null) {

			model.addAttribute("code", "500");
			model.addAttribute("msg", "List is not exist");
			return "/error/error";
		} else if(listEntity != null) {

			this.commonService.setListConfig(model, listEntity);
		}

		model.addAttribute("object", listEntity);

		return "content/common/list";
	}

	/**
	 * 
	 * @param model
	 * @param id
	 * @param parameterMap
	 * @return
	 */
	@GetMapping(value="/child_list")
	public String childList(
			@RequestParam(value = "lstId", required = true) String lstId,
			@RequestParam Map<String, Object> parameterMap,
			Model model) {

		LogUtils.printParam("/child_list", parameterMap, true, "lstId");

		// Menu ID의 정보를 기준으로 Aside 및 Menu Entity 설정
		this.commonService.setMenuInfo(parameterMap, model);

		ListEntity listEntity = this.listService.getObject(lstId);
		if(listEntity == null) {

			model.addAttribute("code", "500");
			model.addAttribute("msg", "List is not exist");
			return "/error/error";
		} else if(listEntity != null) {

			this.commonService.setChildListConfig(model, listEntity);
		}

		model.addAttribute("object", listEntity);

		return "content/common/childList";
	}

	/**
	 * 
	 * @param model
	 * @param id
	 * @param parameterMap
	 * @return
	 */
	@GetMapping(value="/calendar")
	public String calendar(
			@RequestParam(value = "lstId", required = true) String lstId,
			@RequestParam Map<String, Object> parameterMap,
			Model model) {

		LogUtils.printParam("/calendar", parameterMap, true, "lstId");

		// Menu ID의 정보를 기준으로 Aside 및 Menu Entity 설정
		this.commonService.setMenuInfo(parameterMap, model);

		ListEntity listEntity = this.listService.getObject(lstId);
		if(listEntity == null) {

			model.addAttribute("code", "500");
			model.addAttribute("msg", "List is not exist");
			return "/error/error";
		} else if(listEntity != null) {
			this.commonService.setCalendarConfig(model, listEntity);
		}

		model.addAttribute("object", listEntity);

		return "content/common/calendar";
	}

	@PostMapping(value="/calendarByList")
	public String calendarByList(
			@RequestParam(value = "dpt_id", required = true) String dptId,
			@RequestParam(value = "charge_emp_name", required = false) String chargeEmpName,
			@RequestParam Map<String, Object> parameterMap,
			Model model) {

		LogUtils.printParam("/calendarByList", parameterMap, true, "dptId", "chargeEmpName");

		this.commonService.getEngineerList(model, dptId, chargeEmpName);

		return "fragments/common/calendar :: calendarFragment";
	}

	@GetMapping(value="/form")
	public String form(
			@RequestParam(value = "formId", required = false, defaultValue = "") String formId,
			@RequestParam(value = "key", required = false, defaultValue = "") String key,
			@RequestParam(value = "entId", required = false, defaultValue = "") String entId,
			@RequestParam(value = "auth", required = false) boolean isAuth,
			@RequestParam Map<String, Object> parameterMap,
			Model model) {

		LogUtils.printParam("/form", parameterMap, true, "formId", "key", "entId", "isAuth");

		// Menu ID의 정보를 기준으로 Aside 및 Menu Entity 설정
		this.commonService.setMenuInfo(parameterMap, false, model);

		FormEntity formEntity = this.formService.getFormData(model, formId, key, entId, isAuth, parameterMap);
		if(formEntity == null) {

			model.addAttribute("code", "500");
			model.addAttribute("msg", "Form is not exist");
			return "/error/error";
		}

		// Common - Fragment Info
		model.addAttribute("isModal", false);
		model.addAttribute("fragments", "fragments/common/form");

		return "content/common/form";
	}

	@GetMapping(value="/modal/form")
	public String modalForm(
			@RequestParam(value = "formId", required = false, defaultValue = "") String formId,
			@RequestParam(value = "key", required = false, defaultValue = "") String key,
			@RequestParam(value = "entId", required = false, defaultValue = "") String entId,
			@RequestParam(value = "auth", required = false) boolean isAuth,
			@RequestParam Map<String, Object> parameterMap,
			Model model) {

		LogUtils.printParam("/modal/form", parameterMap, true, "formId", "key", "entId", "isAuth");

		FormEntity formEntity = this.formService.getFormData(model, formId, key, entId, isAuth, parameterMap);
		if(formEntity == null) {

			model.addAttribute("code", "500");
			model.addAttribute("msg", "Form is not exist");
			return "/error/error";
		}

		// Common - Fragment Info
		model.addAttribute("isModal", true);

		return "fragments/common/form :: formFragment";
	}

	@PostMapping(value="/relationListByForm")
	public String relationListByForm(
			@RequestParam(value = "fieldId", required = true) String fieldId,
			@RequestParam(value = "key", required = true) String key,
			@RequestParam(value = "formId", required = true) String formId,
			@RequestParam(value = "entId", required = true) String entId,
			@RequestParam(value = "auth", required = false) boolean isAuth,
			@RequestParam(value = "mode", required = false) String mode,
			@RequestParam Map<String, Object> parameterMap,
			Model model) {

		LogUtils.printParam("/relationListByForm", parameterMap, true, "fieldId", "key", "formId", "entId", "isAuth", "mode");

		FormEntity formEntity = this.formService.getFormRelationData(model, fieldId, formId, key, entId, isAuth, parameterMap);
		if(formEntity == null) {

			model.addAttribute("code", "500");
			model.addAttribute("msg", "Form is not exist");
			return "/error/error";
		}

		String returnPage = "";
		if(StringUtils.equals(mode, "vertical")) {
			returnPage = "verticalFragment";
		} else {
			returnPage = "horizontalFragment";
		}

		return String.format("fragments/common/form/uiitem/Custom.Relation :: %s", returnPage);
	}
}