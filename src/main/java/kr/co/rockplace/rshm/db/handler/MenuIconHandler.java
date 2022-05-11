package kr.co.rockplace.rshm.db.handler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import kr.co.rockplace.rshm.db.entity.MenuIconEnum;

/**
 * Menu Icon JPA Handler
 * @author wonsunlee
 *
 */
public class MenuIconHandler extends BaseTypeHandler<MenuIconEnum> {

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, MenuIconEnum parameter, JdbcType jdbcType) throws SQLException {
		ps.setInt(i, parameter.getValue());
	}

	@Override
	public MenuIconEnum getNullableResult(ResultSet rs, String columnName) throws SQLException {
		return MenuIconEnum.valueOf(rs.getInt(columnName));
	}

	@Override
	public MenuIconEnum getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		return MenuIconEnum.valueOf(rs.getInt(columnIndex));
	}

	@Override
	public MenuIconEnum getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		return MenuIconEnum.valueOf(cs.getInt(columnIndex));
	}
}