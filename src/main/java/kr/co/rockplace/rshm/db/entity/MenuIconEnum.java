package kr.co.rockplace.rshm.db.entity;

/**
 * Menu Icon Enumeration 
 * @author wonsunlee
 */
public enum MenuIconEnum implements EnumModel {

	LAYERS(1),
	LAYOUT_4_BLOCKS(2),
	BARCODE_READ(3),
	BUCKET(4),
	COMPILING(5),
	SETTINGS_1(6),
	LIBRARY(7),
	BOX2(8),
	PICTURES1(9),
	PENANDRULLER(10),
	LAYOUT_LEFT_PANEL_2(11),
	LAYOUT_HORIZONTAL(12),
	UPLOAD(13),
	LAYOUT_ARRANGE(14),
	DIAGNOSTICS(15),
	ATTACHMENT2(16),
	SELECT(17),
	EQUALIZER(18),
	BOOK_OPEN(19),
	MIRROR(20);

	private int value;

	MenuIconEnum(int value) {
		this.value = value;
	}

	@Override
	public String getKey() {
		return name();
	}

	@Override
	public int getValue() {
		return value;
	}

	public static MenuIconEnum valueOf(int value) {

		switch (value) {
			case 1: return MenuIconEnum.LAYERS;
			case 2: return MenuIconEnum.LAYOUT_4_BLOCKS;
			case 3: return MenuIconEnum.BARCODE_READ;
			case 4: return MenuIconEnum.BUCKET;
			case 5: return MenuIconEnum.COMPILING;
			case 6: return MenuIconEnum.SETTINGS_1;
			case 7: return MenuIconEnum.LIBRARY;
			case 8: return MenuIconEnum.BOX2;
			case 9: return MenuIconEnum.PICTURES1;
			case 10: return MenuIconEnum.PENANDRULLER;
			case 11: return MenuIconEnum.LAYOUT_LEFT_PANEL_2;
			case 12: return MenuIconEnum.LAYOUT_HORIZONTAL;
			case 13: return MenuIconEnum.UPLOAD;
			case 14: return MenuIconEnum.LAYOUT_ARRANGE;
			case 15: return MenuIconEnum.DIAGNOSTICS;
			case 16: return MenuIconEnum.ATTACHMENT2;
			case 17: return MenuIconEnum.SELECT;
			case 18: return MenuIconEnum.EQUALIZER;
			case 19: return MenuIconEnum.BOOK_OPEN;
			case 20: return MenuIconEnum.MIRROR;
			default:
				return MenuIconEnum.LAYERS;
		}
	}
}