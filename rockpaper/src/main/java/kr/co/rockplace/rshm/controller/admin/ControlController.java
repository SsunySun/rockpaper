package kr.co.rockplace.rshm.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.rockplace.rshm.db.entity.ControlEntity;
import kr.co.rockplace.rshm.service.admin.EntityService;
import kr.co.rockplace.rshm.service.admin.TaskService;
import kr.co.rockplace.rshm.utils.LogUtils;
import kr.co.rockplace.rshm.utils.RequestUtils;

/**
 * Control Controller
 * @author wonsunlee
 *
 */
@Controller
@RequestMapping(value="/admin/control")
public class ControlController extends AdminCommonController<ControlEntity> {

	@Autowired
	private EntityService entityService;

	@Autowired
	private TaskService taskService;

	@Override
	public String create(
			@RequestParam Map<String, Object> parameterMap,
			HttpServletRequest request,
			Model model) {

		LogUtils.printParam("/create", parameterMap, true);

		// Menu ID의 정보를 기준으로 Aside 및 Menu Entity 설정
		super.commonService.setMenuInfo(parameterMap, model);

		// Form Elements
		model.addAttribute("entityList", this.entityService.getWorkflowTypeList());
		model.addAttribute("taskList", this.taskService.getList());

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

		// Form Elements
		model.addAttribute("entityList", this.entityService.getWorkflowTypeList());
		model.addAttribute("taskList", this.taskService.getList());

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

		// Form Elements
		model.addAttribute("entityList", this.entityService.getWorkflowTypeList());
		model.addAttribute("taskList", this.taskService.getList());

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

		// Form Elements
		model.addAttribute("entityList", this.entityService.getWorkflowTypeList());
		model.addAttribute("taskList", this.taskService.getList());

		// Fragment Parameter
		model.addAttribute("form_id", "ticket_form");
		model.addAttribute("form_action", String.format("/api/%s/%s/update", RequestUtils.getServletPath(request, 0), RequestUtils.getServletPath(request, 1)));
		model.addAttribute("delete_action", String.format("/api/%s/%s/delete", RequestUtils.getServletPath(request, 0), RequestUtils.getServletPath(request, 1)));
		model.addAttribute("isModal", true);

		return String.format("fragments/%s/%s/action :: %sFragment", RequestUtils.getServletPath(request, 0), RequestUtils.getServletPath(request, 1), RequestUtils.getServletPath(request, 3));
	}
}