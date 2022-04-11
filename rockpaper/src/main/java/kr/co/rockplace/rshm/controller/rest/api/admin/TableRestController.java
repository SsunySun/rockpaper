package kr.co.rockplace.rshm.controller.rest.api.admin;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import kr.co.rockplace.rshm.db.entity.TableEntity;

/**
 * Table Rest Controller
 * @author wonsunlee
 *
 */
@RestController
@RequestMapping(value="/api/admin/table")
@Api(tags = "table")
public class TableRestController extends AdminCommonRestController<TableEntity> {

}