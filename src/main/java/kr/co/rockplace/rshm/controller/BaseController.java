package kr.co.rockplace.rshm.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.rockplace.rshm.service.CommonService;
import kr.co.rockplace.rshm.utils.LogUtils;

/**
 * Base Controller
 * @author wonsunlee
 *
 */
@Controller
public class BaseController {

	@Autowired
	private CommonService commonService;

	@GetMapping(value= {"", "/"})
	public String index(
			@RequestParam Map<String, Object> parameterMap,
			Model model) {

		LogUtils.printParam("/", parameterMap, true);
//		AuthUtil.printSession();

		// Menu ID의 정보를 기준으로 Aside 및 Menu Entity 설정
		this.commonService.setMenuInfo(parameterMap, model);

		List<Map<String, Object>> todoList = this.commonService.getResultListBySql("PORTAL_ASSIGN_LIST", parameterMap);
		model.addAttribute("todoList", todoList);

		return "content/dashboard";
	}

	@GetMapping(value= "/dashboard")
	public String dashboard(
			@RequestParam Map<String, Object> parameterMap,
			Model model) {

		LogUtils.printParam("/dashboard", parameterMap, true);
//		AuthUtil.printSession();

		// Menu ID의 정보를 기준으로 Aside 및 Menu Entity 설정
		this.commonService.setMenuInfo(parameterMap, model);

		List<Map<String, Object>> todoList = this.commonService.getResultListBySql("PORTAL_ASSIGN_LIST", parameterMap);
		model.addAttribute("todoList", todoList);

		return "content/dashboard";
	}
}