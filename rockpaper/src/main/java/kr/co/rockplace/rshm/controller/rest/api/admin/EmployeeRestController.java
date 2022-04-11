package kr.co.rockplace.rshm.controller.rest.api.admin;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import kr.co.rockplace.rshm.db.entity.EmployeeEntity;

/**
 * Employee Rest Controller
 * @author wonsunlee
 *
 */
@RestController
@RequestMapping(value="/api/admin/employee")
@Api(tags = "employee")
public class EmployeeRestController extends AdminCommonRestController<EmployeeEntity> {

}