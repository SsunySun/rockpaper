package kr.co.rockplace.rshm.controller.admin;

import java.util.Arrays;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.rockplace.rshm.db.entity.MenuEntity;
import kr.co.rockplace.rshm.db.entity.MenuIconEnum;
import kr.co.rockplace.rshm.service.admin.MenuService;
import kr.co.rockplace.rshm.utils.AuthUtil;
import kr.co.rockplace.rshm.utils.LogUtils;
import kr.co.rockplace.rshm.utils.RequestUtils;
import kr.co.rockplace.rshm.vo.EnumValue;

/**
 * Menu Controller
 * @author wonsunlee
 *
 */
@Controller
@RequestMapping(value="/admin/menu")
public class MenuController extends AdminCommonController<MenuEntity> {

	@Autowired
	private MenuService menuService;

	@Override
	public String create(
			@RequestParam Map<String, Object> parameterMap,
			HttpServletRequest request,
			Model model) {

		LogUtils.printParam("/create", parameterMap, true);

		// Menu ID의 정보를 기준으로 Aside 및 Menu Entity 설정
		super.commonService.setMenuInfo(parameterMap, model);

		// 팀장/팀원 구분 
		boolean isLeader = !StringUtils.equals("DUTY_POSITION_ROCKPLACE_30001", AuthUtil.getCurrentUser().get("dutyCode").toString())
				&& !StringUtils.equals("DUTY_POSITION_OSZONE_30001", AuthUtil.getCurrentUser().get("dutyCode").toString());

		// Form Elements
		model.addAttribute("pidList", this.menuService.getMenuList(isLeader, AuthUtil.hasRole("ROLE_ADMIN")));
		model.addAttribute("menuIcon", Arrays
				.stream(MenuIconEnum.class.getEnumConstants())
				.map(EnumValue::new)
				.collect(Collectors.toList()));

		// Common - Menu List
		model.addAttribute("menuList", this.menuService.getMenuList(isLeader, AuthUtil.hasRole("ROLE_ADMIN")));

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

		// 팀장/팀원 구분 
		boolean isLeader = !StringUtils.equals("DUTY_POSITION_ROCKPLACE_30001", AuthUtil.getCurrentUser().get("dutyCode").toString())
				&& !StringUtils.equals("DUTY_POSITION_OSZONE_30001", AuthUtil.getCurrentUser().get("dutyCode").toString());

		// Form Elements
		model.addAttribute("pidList", this.menuService.getMenuList(isLeader, AuthUtil.hasRole("ROLE_ADMIN")));
		model.addAttribute("menuIcon", Arrays
				.stream(MenuIconEnum.class.getEnumConstants())
				.map(EnumValue::new)
				.collect(Collectors.toList()));

		// Common - Menu List
		model.addAttribute("menuList", this.menuService.getMenuList(isLeader, AuthUtil.hasRole("ROLE_ADMIN")));

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

		// 팀장/팀원 구분 
		boolean isLeader = StringUtils.equals("DUTY_POSITION_ROCKPLACE_30001", AuthUtil.getCurrentUser().get("dutyCode").toString())
				| StringUtils.equals("DUTY_POSITION_OSZONE_30001", AuthUtil.getCurrentUser().get("dutyCode").toString());

		// Form Elements
		model.addAttribute("pidList", this.menuService.getMenuList(isLeader, AuthUtil.hasRole("ROLE_ADMIN")));
		model.addAttribute("menuIcon", Arrays
				.stream(MenuIconEnum.class.getEnumConstants())
				.map(EnumValue::new)
				.collect(Collectors.toList()));

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

		// 팀장/팀원 구분 
		boolean isLeader = !StringUtils.equals("DUTY_POSITION_ROCKPLACE_30001", AuthUtil.getCurrentUser().get("dutyCode").toString())
				&& !StringUtils.equals("DUTY_POSITION_OSZONE_30001", AuthUtil.getCurrentUser().get("dutyCode").toString());

		// Form Elements
		model.addAttribute("pidList", this.menuService.getMenuList(isLeader, AuthUtil.hasRole("ROLE_ADMIN")));
		model.addAttribute("menuIcon", Arrays
				.stream(MenuIconEnum.class.getEnumConstants())
				.map(EnumValue::new)
				.collect(Collectors.toList()));

		// Fragment Parameter
		model.addAttribute("form_id", "ticket_form");
		model.addAttribute("form_action", String.format("/api/%s/%s/update", RequestUtils.getServletPath(request, 0), RequestUtils.getServletPath(request, 1)));
		model.addAttribute("delete_action", String.format("/api/%s/%s/delete", RequestUtils.getServletPath(request, 0), RequestUtils.getServletPath(request, 1)));
		model.addAttribute("isModal", true);

		return String.format("fragments/%s/%s/action :: %sFragment", RequestUtils.getServletPath(request, 0), RequestUtils.getServletPath(request, 1), RequestUtils.getServletPath(request, 3));
	}
}