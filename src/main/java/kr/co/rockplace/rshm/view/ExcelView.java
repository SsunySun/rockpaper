package kr.co.rockplace.rshm.view;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.HttpHeaders;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import kr.co.rockplace.rshm.db.entity.ListEntity;
import kr.co.rockplace.rshm.service.ExcelService;
import kr.co.rockplace.rshm.service.admin.ListService;
import kr.co.rockplace.rshm.utils.ExcelUtils;
import kr.co.rockplace.rshm.utils.JsonUtil;
import lombok.extern.slf4j.Slf4j;

/**
 * Excel Result View Class
 * @author wonsunlee
 *
 */
@Slf4j
public class ExcelView extends AbstractXlsxView {

	/**
	 * The content type for an Excel response
	 */
	private final String CONTENT_TYPE = "application/vnd.ms-excel";

	/**
	 * Constructor
	 */
	public ExcelView() {
		setContentType(CONTENT_TYPE);
	}

	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model, 
			Workbook workbook,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		long start = System.currentTimeMillis();

		// View에서는 @Autowired가 안되어서 model 객체에 service 객체를 담아서 넘김. 
		ExcelService excelService = (ExcelService) model.get("excelService");
		ListService listService = (ListService) model.get("listService");
		String lstId = (String) model.get("lstId");

		String excelName = "rockpaper";
		// Excel Download Filename 설정 
		response.setHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + excelName + ".xlsx");

		List<Map<String, Object>> resultList = excelService.getExcelList(request, lstId);

		workbook = new XSSFWorkbook();

		Sheet sheet = ExcelUtils.getSheet(workbook);

		ListEntity listEntity = listService.getObject(lstId);

		if(listEntity != null) {

			String listName = listEntity.getName();
			int columnSize = 0;
			Map<String, Object> configMap = JsonUtil.convertJSONStringToMap(listEntity.getConfig());
			List<Map<String, Object>> columnList = (List<Map<String, Object>>) configMap.get("column");
			for (Map<String, Object> map : columnList) {

				if(StringUtils.equals((String) map.get("type"), "view") || StringUtils.equals((String) map.get("type"), "excel")) {
					columnSize++;
				}
			}

			// Write of List Title
			excelService.writeTitle(sheet, listName, columnSize);

			// Write of List Column Header
			excelService.writeColumnHeader(sheet, columnList);

			// Write of List Column Data
			excelService.writeColumnData(sheet, columnList, resultList);
		} else {
			excelService.writeTitle(sheet, "리스트가 없습니다.", 1);
		}

		ServletOutputStream out = response.getOutputStream();
		workbook.write(out);
		workbook.close();

		if (out != null) {
			out.close();
		}

		long finish = System.currentTimeMillis();
		long timeElapsed = finish - start;
		log.info("timeElapsed : " + timeElapsed);
	}
}