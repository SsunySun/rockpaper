package kr.co.rockplace.rshm.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.rockplace.rshm.db.entity.ListEntity;
import kr.co.rockplace.rshm.utils.LogUtils;
import kr.co.rockplace.rshm.utils.RequestUtils;

/**
 * List Controller
 * @author wonsunlee
 *
 */
@Controller
@RequestMapping(value="/admin/list")
public class ListController extends AdminCommonController<ListEntity> {

	@Override
	public String create(
			@RequestParam Map<String, Object> parameterMap,
			HttpServletRequest request,
			Model model) {

		LogUtils.printParam("/create", parameterMap, true);

		// Menu ID의 정보를 기준으로 Aside 및 Menu Entity 설정
		super.commonService.setMenuInfo(parameterMap, model);

		// Common - Fragment Info
		model.addAttribute("fragments", String.format("fragments/%s/%s/action", RequestUtils.getServletPath(request, 0), RequestUtils.getServletPath(request, 1)));
		model.addAttribute("form_action", String.format("/api/%s/%s/%s", RequestUtils.getServletPath(request, 0), RequestUtils.getServletPath(request, 1), RequestUtils.getServletPath(request, 2)));
		model.addAttribute("isModal", "false");

		return String.format("content/common/%s", RequestUtils.getServletPath(request, 2));
	}

	@Override
	public String update(
			@RequestParam(value = "key", required = true) String key,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletRequest request,
			Model model) {

		LogUtils.printParam("/update", parameterMap, true, "key");

		// Menu ID의 정보를 기준으로 Aside 및 Menu Entity 설정
		super.commonService.setMenuInfo(parameterMap, model);

		// Object Info
		model.addAttribute("object", super.service.getObject(key));

		// Common - Fragment Info
		model.addAttribute("fragments", String.format("fragments/%s/%s/action", RequestUtils.getServletPath(request, 0), RequestUtils.getServletPath(request, 1)));
		model.addAttribute("form_action", String.format("/api/%s/%s/%s", RequestUtils.getServletPath(request, 0), RequestUtils.getServletPath(request, 1), RequestUtils.getServletPath(request, 2)));
		model.addAttribute("delete_action", String.format("/api/%s/%s/delete", RequestUtils.getServletPath(request, 0), RequestUtils.getServletPath(request, 1)));
		model.addAttribute("isModal", "false");

		return String.format("content/common/%s", RequestUtils.getServletPath(request, 2));
	}

	@Override
	public String modalCreate(
			@RequestParam Map<String, Object> parameterMap,
			HttpServletRequest request,
			Model model) {

		LogUtils.printParam("/modal/create", parameterMap, true);

		// Fragment Parameter
		model.addAttribute("form_id", "ticket_form");
		model.addAttribute("form_action", String.format("/api/%s/%s/%s", RequestUtils.getServletPath(request, 0), RequestUtils.getServletPath(request, 1), RequestUtils.getServletPath(request, 3)));
		model.addAttribute("isModal", true);

		return String.format("fragments/%s/%s/action :: %sFragment", RequestUtils.getServletPath(request, 0), RequestUtils.getServletPath(request, 1), RequestUtils.getServletPath(request, 3));
	}

	@Override
	public String modalUpdate(
			@RequestParam(value = "key", required = true) String key,
			@RequestParam Map<String, Object> parameterMap,
			HttpServletRequest request,
			Model model) {

		LogUtils.printParam("/modal/update", parameterMap, true, "key");

		// Object Info
		model.addAttribute("object", super.service.getObject(key));

		// Fragment Parameter
		model.addAttribute("form_id", "ticket_form");
		model.addAttribute("form_action", String.format("/api/%s/%s/update", RequestUtils.getServletPath(request, 0), RequestUtils.getServletPath(request, 1)));
		model.addAttribute("delete_action", String.format("/api/%s/%s/delete", RequestUtils.getServletPath(request, 0), RequestUtils.getServletPath(request, 1)));
		model.addAttribute("isModal", true);

		return String.format("fragments/%s/%s/action :: %sFragment", RequestUtils.getServletPath(request, 0), RequestUtils.getServletPath(request, 1), RequestUtils.getServletPath(request, 3));
	}
}