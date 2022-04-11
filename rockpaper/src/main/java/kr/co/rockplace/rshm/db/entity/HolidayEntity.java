package kr.co.rockplace.rshm.db.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

/**
 * Holiday Entity 
 * @author wonsunlee
 *
 */
@SuperBuilder
@Getter
@Setter
//@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Entity(name = "TAB_HOLIDAY")
@ApiModel(description = "Holiday 객체")
public class HolidayEntity extends CommonEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "holiday", nullable = false)
	@ApiModelProperty(position = 7, value = "공휴일 여부", example = "true")
	protected boolean isHoliday;
}