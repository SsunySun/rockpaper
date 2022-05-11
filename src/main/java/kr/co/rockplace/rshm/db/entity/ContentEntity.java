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
 * Content Entity
 * @author wonsunlee
 *
 */
@SuperBuilder
@Getter
@Setter
//@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Entity(name = "TAB_CONTENT")
@ApiModel(description = "Content 객체")
public class ContentEntity extends CommonEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "subject", nullable = false)
	@ApiModelProperty(position = 7, value = "제목", example = "제목")
	private String subject;

	@Column(name = "content", nullable = false, columnDefinition = "LONGTEXT")
	@ApiModelProperty(position = 8, value = "Content 본문", example = "html 코드")
	private String content;

	@Column(name = "to_sql", nullable = false, columnDefinition = "LONGTEXT")
	@ApiModelProperty(position = 9, value = "Content 받는 사람", example = "select emp_id from tab_employee where emp_id = ?")
	private String toSql;

	@Column(name = "content_sql", nullable = false, columnDefinition = "LONGTEXT")
	@ApiModelProperty(position = 10, value = "Content 본문의 내용", example = "select * from tab_shm")
	private String contentSql;
}