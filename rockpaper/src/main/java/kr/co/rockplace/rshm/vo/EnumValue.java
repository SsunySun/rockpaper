package kr.co.rockplace.rshm.vo;

import kr.co.rockplace.rshm.db.entity.EnumModel;
import lombok.Data;

@Data
public class EnumValue {

	private String key;
	private int value;

	public EnumValue(EnumModel enumModel) {

		key = enumModel.getKey();
		value = enumModel.getValue();
	}
}