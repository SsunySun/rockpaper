package kr.co.rockplace.rshm.controller.admin;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.rockplace.rshm.db.entity.TableEntity;
import kr.co.rockplace.rshm.db.entity.TableFieldEntity;
import kr.co.rockplace.rshm.service.CommonService;
import kr.co.rockplace.rshm.service.admin.ActivityService;
import kr.co.rockplace.rshm.service.admin.CodeService;
import kr.co.rockplace.rshm.service.admin.EntityService;
import kr.co.rockplace.rshm.service.admin.TableFieldService;
import kr.co.rockplace.rshm.service.admin.TableService;
import kr.co.rockplace.rshm.service.admin.TaskService;
import kr.co.rockplace.rshm.service.admin.WorkflowService;
import kr.co.rockplace.rshm.utils.LogUtils;

/**
 * Administrator Controller
 * @author wonsunlee
 *
 */
@Controller
@RequestMapping(value="/admin")
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class AdminController {

	@Autowired
	private CommonService commonService;

	@Autowired
	private TableService tableService;

	@Autowired
	private TableFieldService tableFieldService;

	@Autowired
	private CodeService codeService;

	@Autowired
	private EntityService entityService;

	@Autowired
	private WorkflowService workflowService;

	@Autowired
	private ActivityService activityService;

	@Autowired
	private TaskService taskService;

	@GetMapping(value="/tablefield")
	public String tablefield(
			@RequestParam Map<String, Object> parameterMap,
			Model model) {

		LogUtils.printParam("/tablefield", parameterMap, true);

		// Menu ID의 정보를 기준으로 Aside 및 Menu Entity 설정
		this.commonService.setMenuInfo(parameterMap, model);

		model.addAttribute("tableList", this.tableService.getList());
		model.addAttribute("title", "Table Field");

		model.addAttribute("entityList", this.entityService.getList());

		TableFieldEntity tableFieldEntity = this.tableFieldService.getObject("TAB_FIELD_TYPE/TYPE_CD");
		model.addAttribute("fieldTypeList", this.codeService.getCodeByCodeTypeList(tableFieldEntity.getRefCtyId(), Integer.valueOf(1)));

		return "content/admin/tableField";
	}

	@PostMapping(value="/tableFieldByTableList")
	public String tableFieldByTableList(
			@RequestParam(value = "tableId", required = true) String tableId,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "product", required = false) Boolean isProduct,
			@RequestParam Map<String, Object> parameterMap,
			Model model) {

		LogUtils.printParam("/tableFieldByTableList", parameterMap, true, "tableId", "name", "product");

		model.addAttribute("list", this.tableFieldService.getTableFieldByTableList(tableId, name, isProduct));

		model.addAttribute("entityList", this.entityService.getList());
		model.addAttribute("tableList", this.tableService.getList());
		model.addAttribute("tableId", tableId);

		TableFieldEntity tableFieldEntity = this.tableFieldService.getObject("TAB_FIELD_TYPE/TYPE_CD");
		model.addAttribute("fieldTypeList", this.codeService.getCodeByCodeTypeList(tableFieldEntity.getRefCtyId(), Integer.valueOf(1)));

		if(StringUtils.isNoneBlank(tableId)) {
			model.addAttribute("tableEntity", this.tableService.getObject(tableId));
		} else {
			model.addAttribute("tableEntity", new TableEntity());
		}

		return "fragments/admin/console :: tableFieldByTableListFragment";
	}

	@GetMapping(value="/console")
	public String console(
			@RequestParam Map<String, Object> parameterMap,
			Model model) {

		LogUtils.printParam("/console", parameterMap, true);

		// Menu ID의 정보를 기준으로 Aside 및 Menu Entity 설정
		this.commonService.setMenuInfo(parameterMap, model);

		model.addAttribute("title", "admin console");

		return "content/admin/console";
	}

	@PostMapping(value="/workflow")
	public String workflow(
			@RequestParam Map<String, Object> parameterMap,
			Model model) {

		LogUtils.printParam("/workflow", parameterMap, true);

		model.addAttribute("list", this.workflowService.getList());

		return "fragments/admin/console :: workflowFragment";
	}

	@PostMapping(value="/activity")
	public String activity(
			@RequestParam(value = "wofId", required = true) String wofId,
			@RequestParam Map<String, Object> parameterMap,
			Model model) {

		LogUtils.printParam("/activity", parameterMap, true, "wofId");

		model.addAttribute("list", this.workflowService.getObject(wofId).getActivityEntityList());

		return "fragments/admin/console :: activityFragment";
	}

	@PostMapping(value="/task")
	public String task(
			@RequestParam(value = "actId", required = true) String actId,
			@RequestParam Map<String, Object> parameterMap,
			Model model) {

		LogUtils.printParam("/task", parameterMap, true, "actId");

		model.addAttribute("list", this.activityService.getObject(actId).getTaskEntityList());

		return "fragments/admin/console :: taskFragment";
	}

	@PostMapping(value="/form")
	public String form(
			@RequestParam(value = "form", required = true) String tasId,
			@RequestParam Map<String, Object> parameterMap,
			Model model) {

		LogUtils.printParam("/form", parameterMap, true, "form");

		model.addAttribute("list", this.taskService.getObject(tasId).getFormEntityList());

		return "fragments/admin/console :: formFragment";
	}

	@PostMapping(value="/control")
	public String control(
			@RequestParam(value = "tasId", required = true) String tasId,
			@RequestParam Map<String, Object> parameterMap,
			Model model) {

		LogUtils.printParam("/control", parameterMap, true, "tasId");

		model.addAttribute("list", this.taskService.getObject(tasId).getControlEntityList());

		return "fragments/admin/console :: controlFragment";
	}
}