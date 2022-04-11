package kr.co.rockplace.rshm.controller.rest.api.admin;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import kr.co.rockplace.rshm.db.entity.ListEntity;

/**
 * List Rest Controller
 * @author wonsunlee
 *
 */
@RestController
@RequestMapping(value="/api/admin/list")
@Api(tags = "list")
public class ListRestController extends AdminCommonRestController<ListEntity> {

}