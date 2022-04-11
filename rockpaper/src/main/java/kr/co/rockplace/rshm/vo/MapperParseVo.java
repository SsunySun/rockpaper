package kr.co.rockplace.rshm.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * 
 * @author wonsunlee
 */
@Data
@ToString
public class MapperParseVo {

	private List<ColumnData> columns = new ArrayList<ColumnData>();
	private Map<String, Object> map = new HashMap<String, Object>();
	private List<String> filterList = new ArrayList<String>();
	private String where;
	private String orderBy;
	private MetaData metadata = new MetaData();

	@Builder
	@Data
	@ToString
	public static class ColumnData implements Serializable {

		private static final long serialVersionUID = 1L;

		int index;
		String data;
		String name;
		boolean searchable;
		boolean orderable;
		String searchValue;
		boolean searchRegex;
	}

	@Builder
	@Data
	@ToString
	@NoArgsConstructor
	@AllArgsConstructor
	public static class MetaData implements Serializable {

		private static final long serialVersionUID = 1L;

		long page;
		long pages;
		long perpage;
		long total;
		String sort;
		String field;
	}
}