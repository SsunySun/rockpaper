package kr.co.rockplace.rshm.utils;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.common.usermodel.HyperlinkType;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Hyperlink;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;

/**
 * Excel Utility
 * @author wonsunlee
 */
public class ExcelUtils {

	/**
	 * Default Sheet Name
	 */
	public static final String DEFAULT_SHEET_NAME = "rockpaper";

	/**
	 * Default Sheet Row Height
	 */
	public static final short DEFAULT_SHEET_ROW_HEIGHT = 500;

	/**
	 * Default Column Width
	 */
	public static final int DEFAULT_COLUMN_WIDTH = 30 * 256;

	/**
	 * Default Hyperlink Address
	 */
	public static final String DEFAULT_HYPERLINK_ADDRESS = "A1";

	/**
	 * Title Font Height
	 */
	public static final short TITLE_FONT_HEIGHT = 20 * 20;

	/**
	 * Empty Box Data
	 */
	public static final String DEFAULT_EMPTY_BOX_DATA = "NO DATA";

	/**
	 * Sheet 정보 가져오기 
	 * @param workbook {@link org.apache.poi.ss.usermodel.Workbook}
	 * @return {@link org.apache.poi.ss.usermodel.Sheet}
	 */
	public static Sheet getSheet(Workbook workbook) {
		return getSheet(workbook, DEFAULT_SHEET_NAME);
	}

	/**
	 * Sheet 가져오기 
	 * @param workbook {@link org.apache.poi.ss.usermodel.Workbook}
	 * @param sheetName Sheet Name
	 * @return {@link org.apache.poi.ss.usermodel.Sheet}
	 */
	public static Sheet getSheet(Workbook workbook, String sheetName) {

		Sheet sheet = workbook.createSheet(sheetName);
		sheet.setDefaultRowHeight(DEFAULT_SHEET_ROW_HEIGHT);

		return sheet;
	}

	/**
	 * Row 가져오기 
	 * @param sheet {@link org.apache.poi.ss.usermodel.Sheet}
	 * @param rowIndex Row Index
	 * @return {@link org.apache.poi.ss.usermodel.Row}
	 */
	public static Row getRow(Sheet sheet, int rowIndex) {

		Row row = sheet.getRow(rowIndex);
		if (CommonUtils.isNull(row)) {
			row = sheet.createRow(rowIndex);
		}

		return row;
	}

	/**
	 * Cell 가져오기 
	 * @param row {@link org.apache.poi.ss.usermodel.Row}
	 * @param cellIndex Cell Index
	 * @return {@link org.apache.poi.ss.usermodel.Cell}
	 */
	public static Cell getCell(Row row, int cellIndex) {
		return getCell(row, cellIndex, false);
	}

	/**
	 * Cell 가져오기 
	 * @param row {@link org.apache.poi.ss.usermodel.Row}
	 * @param cellIndex Cell Index
	 * @param isCreate cell 생성여부 
	 * @return {@link org.apache.poi.ss.usermodel.Cell}
	 */
	public static Cell getCell(Row row, int cellIndex, boolean isCreate) {

		Cell cell = row.getCell(cellIndex);
		if (CommonUtils.isNull(cell)) {
			cell = row.createCell(cellIndex);
		}

		CellStyle cellStyle;
		if (isCreate) {
			cellStyle = cell.getCellStyle();
		} else {
			cellStyle = cell.getSheet().getWorkbook().createCellStyle();
		}
		cell.setCellStyle(cellStyle);

		return cell;
	}

	/**
	 * Merge할 Cell를 모두 생성하고 Style 적용 
	 * @param sheet {@link org.apache.poi.ss.usermodel.Sheet}
	 * @param firstRow 시작 Row Index
	 * @param lastRow 마지막 Row Index
	 * @param firstCol 시작 Column Index
	 * @param lastCol 마지막 Column Index
	 */
	public static void createMergeCell(Sheet sheet, int firstRow, int lastRow, int firstCol, int lastCol) {

		for(int i = firstRow; i <= lastRow; i++) {

			Row row = getRow(sheet, i);
			for(int j = firstCol; j <= lastCol; j++) {

				Cell cell = getCell(row, j);
				cell.setBlank();
				cell = setBorderStyle(cell, BorderStyle.THIN, BorderStyle.THIN, BorderStyle.THIN, BorderStyle.THIN);
			}
		}
	}

	/**
	 * Cell Style 정보 가져오기
	 * @param cell {@link org.apache.poi.ss.usermodel.Cell}
	 * @return {@link org.apache.poi.ss.usermodel.CellStyle}
	 */
	public static CellStyle getCellStyle(Cell cell) {
		return cell.getCellStyle();
	}

	/**
	 * Cell의 Border Style 설정하기 
	 * @param cell {@link org.apache.poi.ss.usermodel.Cell}
	 * @param topBorderStyle {@link org.apache.poi.ss.usermodel.BorderStyle}
	 * @param rightBorderStyle {@link org.apache.poi.ss.usermodel.BorderStyle}
	 * @param bottomBorderStyle {@link org.apache.poi.ss.usermodel.BorderStyle}
	 * @param leftBorderStyle {@link org.apache.poi.ss.usermodel.BorderStyle}
	 * @see {@link org.apache.poi.ss.usermodel.BorderStyle}이 Null일 경우 BorderStyle.THIN 으로 설정 
	 */
	public static Cell setBorderStyle(Cell cell, BorderStyle topBorderStyle, BorderStyle rightBorderStyle, BorderStyle bottomBorderStyle, BorderStyle leftBorderStyle) {

		CellStyle cellStyle = getCellStyle(cell);

		if (CommonUtils.isNull(topBorderStyle)) {
			topBorderStyle = BorderStyle.THIN;
		}

		if (CommonUtils.isNull(rightBorderStyle)) {
			rightBorderStyle = BorderStyle.THIN;
		}

		if (CommonUtils.isNull(bottomBorderStyle)) {
			bottomBorderStyle = BorderStyle.THIN;
		}

		if (CommonUtils.isNull(leftBorderStyle)) {
			leftBorderStyle = BorderStyle.THIN;
		}

		cellStyle.setBorderTop(topBorderStyle);
		cellStyle.setBorderRight(rightBorderStyle);
		cellStyle.setBorderBottom(bottomBorderStyle);
		cellStyle.setBorderLeft(leftBorderStyle);

		cell.setCellStyle(cellStyle);

		return cell;
	}

	/**
	 * Cell의 Alignment 설정하기 
	 * @param cell {@link org.apache.poi.ss.usermodel.Cell}
	 * @param horizontalAlignment {@link org.apache.poi.ss.usermodel.HorizontalAlignment}
	 * @param verticalAlignment {@link org.apache.poi.ss.usermodel.VerticalAlignment}
	 * @see {@link org.apache.poi.ss.usermodel.HorizontalAlignment}이 Null일 경우: HorizontalAlignment.CENTER
	 * @see {@link org.apache.poi.ss.usermodel.VerticalAlignment}이 Null일 경우: VerticalAlignment.CENTER
	 */
	public static Cell setAlignment(Cell cell, HorizontalAlignment horizontalAlignment, VerticalAlignment verticalAlignment) {

		CellStyle cellStyle = getCellStyle(cell);

		if (CommonUtils.isNull(horizontalAlignment)) {
			horizontalAlignment = HorizontalAlignment.CENTER;
		}

		if (CommonUtils.isNull(verticalAlignment)) {
			verticalAlignment = VerticalAlignment.CENTER;
		}

		cellStyle.setAlignment(horizontalAlignment);
		cellStyle.setVerticalAlignment(verticalAlignment);

		cell.setCellStyle(cellStyle);

		return cell;
	}

	/**
	 * Cell의 Fill Foreground 설정하기 
	 * @param cell {@link org.apache.poi.ss.usermodel.Cell}
	 * @param colors {@link org.apache.poi.ss.usermodel.IndexedColors}
	 * @see {@link org.apache.poi.ss.usermodel.IndexedColors}이 Null일 경우: IndexedColors.AUTOMATIC
	 */
	public static Cell setFillForegroundColor(Cell cell, IndexedColors colors) {

		CellStyle cellStyle = getCellStyle(cell);

		if (CommonUtils.isNull(colors)) {
			colors = IndexedColors.AUTOMATIC;
		}

		cellStyle.setFillForegroundColor(colors.getIndex());
		cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		cell.setCellStyle(cellStyle);

		return cell;
	}

	/**
	 * Cell의 자동 줄바꿈 설정하기 
	 * @param cell {@link org.apache.poi.ss.usermodel.Cell}
	 * @param isWrapText 자동 줄바꿈 여부 
	 */
	public static Cell setWrapText(Cell cell, boolean isWrapText) {

		CellStyle cellStyle = getCellStyle(cell);

		cellStyle.setWrapText(isWrapText);

		cell.setCellStyle(cellStyle);

		return cell;
	}

	/**
	 * Cell의 HyperLink 설정하기 
	 * @param cell {@link org.apache.poi.ss.usermodel.Cell}
	 * @param address Reference Address
	 */
	public static Cell setHyperLink(Cell cell, String address) {

		CreationHelper createHelper = cell.getSheet().getWorkbook().getCreationHelper();

		// HyperLink
		Hyperlink hyperlink = createHelper.createHyperlink(HyperlinkType.DOCUMENT);
		hyperlink.setAddress(address);
		cell.setHyperlink(hyperlink);

		// Font
		Font font = cell.getSheet().getWorkbook().createFont();
		font.setUnderline(Font.U_SINGLE);
		font.setColor(IndexedColors.BLUE.getIndex());
//		font.setFontHeight((short) (20 * 20));

		// Style Setting
		CellStyle cellStyle = getCellStyle(cell);
		cellStyle.setFont(font);

		cell.setCellStyle(cellStyle);

		return cell;
	}

	/**
	 * HyperLink Style 적용 
	 * @param cell {@link org.apache.poi.ss.usermodel.Cell}
	 * @param hyperLinkAddress
	 */
	public static Cell setStyleOfHyperLink(Cell cell, String hyperLinkAddress) {

		// Setting of HyperLink
		setHyperLink(cell, hyperLinkAddress);

		// Setting of Border Style
//		setBorderStyle(cell, BorderStyle.THIN, BorderStyle.THIN, BorderStyle.THIN, BorderStyle.THIN);

		// Setting of Fill Foreground Color Style
//		setFillForegroundColor(cell, IndexedColors.LEMON_CHIFFON);

		// Setting of Alignment
		setAlignment(cell, HorizontalAlignment.LEFT, VerticalAlignment.CENTER);

		return cell;
	}

	/**
	 * Excel Cell의 줄바꿈으로 높이 조절 
	 * @param cell {@link org.apache.poi.ss.usermodel.Cell}
	 */
	public static Cell setCellHeight(Cell cell) {

		// Data의 줄바꿈에 따른 높이 설정(줄바꿈으로 완벽하게 처리되지 않음)
		int height = StringUtils.countMatches(cell.getStringCellValue(), "\n");
		if (height > 0) {
			cell.getRow().setHeight((short) (StringUtils.countMatches(cell.getStringCellValue(), "\n") * 360));
		}

		return cell;
	}

	/**
	 * List Title Style 적용 
	 * @param cell {@link org.apache.poi.ss.usermodel.Cell}
	 */
	public static Cell setStyleOfTitle(Cell cell) {

		// Font
		Font font = cell.getSheet().getWorkbook().createFont();
		font.setFontHeight((short) (20 * 20));

		// Style Setting
		CellStyle cellStyle = ExcelUtils.getCellStyle(cell);
		cellStyle.setFont(font);

		// Setting of Fill Foreground Color Style
		cell = setFillForegroundColor(cell, IndexedColors.AQUA);

		// Alignment
		cell = setAlignment(cell, HorizontalAlignment.CENTER, VerticalAlignment.CENTER);

		// Setting of Border Style
		cell = setBorderStyle(cell, BorderStyle.THIN, BorderStyle.THIN, BorderStyle.DOUBLE, BorderStyle.THIN);

		// WrapText
		cell = setWrapText(cell, true);

		return cell;
	}

	/**
	 * List Column Header Style 적용 
	 * @param cell {@link org.apache.poi.ss.usermodel.Cell}
	 */
	public static Cell setStyleOfHeader(Cell cell) {

		// Font
		Font font = cell.getSheet().getWorkbook().createFont();
		font.setFontHeight((short) (20 * 20));

		// Style Setting
		CellStyle cellStyle = ExcelUtils.getCellStyle(cell);
		cellStyle.setFont(font);

		// Alignment
		cell = setAlignment(cell, HorizontalAlignment.CENTER, VerticalAlignment.CENTER);

		// Setting of Border Style
		cell = setBorderStyle(cell, BorderStyle.THIN, BorderStyle.THIN, BorderStyle.THIN, BorderStyle.THIN);

		// WrapText
		cell = setWrapText(cell, true);

		return cell;
	}

	/**
	 * List Data Style 적용 
	 * @param cell {@link org.apache.poi.ss.usermodel.Cell}
	 */
	public static Cell setStyleOfData(Cell cell) {

		// Font
		Font font = cell.getSheet().getWorkbook().createFont();
		font.setFontHeight((short) (20 * 20));

		// Style Setting
		CellStyle cellStyle = ExcelUtils.getCellStyle(cell);
		cellStyle.setFont(font);

		// Alignment
		cell = setAlignment(cell, HorizontalAlignment.LEFT, VerticalAlignment.CENTER);

		// Setting of Border Style
		cell = setBorderStyle(cell, BorderStyle.THIN, BorderStyle.THIN, BorderStyle.THIN, BorderStyle.THIN);

		// WrapText
		cell = setWrapText(cell, true);

		return cell;
	}
} 