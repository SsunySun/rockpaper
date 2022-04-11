package kr.co.rockplace.rshm.view;

import org.springframework.http.HttpStatus;

import lombok.Getter;

/**
 * Table Result View Class
 * @author wonsunlee
 * @param <T> {@link Object}
 */
@Getter
public class TableResultView<T> {

	private static final int SUCCESS = 0;

	private int status = HttpStatus.OK.value();

	private int resultCode;
	private String message;
	private T result;

	private int draw;
	private long recordsTotal;
	private long recordsFiltered;

	/**
	 * Common Result View Constructor
	 */
	public TableResultView() {}

	/**
	 * Common Result View Constructor
	 * @param resultCode 결과 코드 
	 * @param message 결과 메시지 
	 * @param result 결과 Object
	 */
	public TableResultView(int resultCode, String message, T result) {

		this.resultCode = resultCode;
		this.message = message;
		this.result = result;
	}

	/**
	 * Common Result View Constructor
	 * @param resultCode 결과 코드 
	 * @param message 결과 메시지 
	 * @param result 결과 Object
	 * @param draw Draw
	 * @param recordsFiltered 필터된 레코드 전체 갯수
	 * @param recordsTotal 레코드 전체 갯수
	 */
	public TableResultView(int resultCode, String message, T result, int draw, long recordsFiltered, long recordsTotal) {

		this.resultCode = resultCode;
		this.message = message;
		this.result = result;

		this.draw = draw;
		this.recordsFiltered = recordsFiltered;
		this.recordsTotal = recordsTotal;
	}

	/**
	 * Common Result View Constructor
	 * @param status 결과 코드 {@link org.springframework.http.HttpStatus}
	 * @param resultCode 결과 코드 
	 * @param message 결과 메시지 
	 * @param result 결과 Object
	 */
	public TableResultView(HttpStatus status, int resultCode, String message, T result) {

		this.status = status.value();
		this.resultCode = resultCode;
		this.message = message;
		this.result = result;
	}

	/**
	 * 성공일 경우 
	 * @return
	 */
	public static TableResultView<Boolean> success() {
		return new TableResultView<>(SUCCESS, "success", true);
	}

	/**
	 * 성공일 경우 
	 * @param result 결과 Object
	 * @return
	 */
	public static <T> TableResultView<T> success(T result) {
		return new TableResultView<>(SUCCESS, "success", result);
	}

	/**
	 * 성공일 경우 
	 * @param result 결과 Object
	 * @return
	 */
	public static <T> TableResultView<T> success(T result, int draw, long recordsFiltered, long recordsTotal) {
		return new TableResultView<>(SUCCESS, "success", result, draw, recordsFiltered, recordsTotal);
	}

	/**
	 * 처리 코드에 따른 정보
	 * @param status
	 * @param message
	 * @param result
	 * @return
	 */
	public static <T> TableResultView<T> status(HttpStatus status, String message, T result) {
		return new TableResultView<>(status, 0, message, result);
	}

	/**
	 * 처리 코드에 따른 정보
	 * @param status
	 * @param resultCode 
	 * @param message
	 * @param result
	 * @return
	 */
	public static <T> TableResultView<T> status(HttpStatus status, int resultCode, String message, T result) {
		return new TableResultView<>(status, resultCode, message, result);
	}

	/**
	 * 실패일 경우 
	 * @param resultCode 결과 코드
	 * @param message 결과 메시지 
	 * @param result 결과 Object
	 * @return
	 */
	public static <T> TableResultView<T> fail(int resultCode, String message, T result) {
		return new TableResultView<>(HttpStatus.INTERNAL_SERVER_ERROR, resultCode, message, result);
	}

	/**
	 * 실패일 경우 
	 * @param status 결과 코드 {@link org.springframework.http.HttpStatus}
	 * @param resultCode 결과 코드 
	 * @param message 결과 메시지 
	 * @param result 결과 Object
	 * @return
	 */
	public static <T> TableResultView<T> fail(HttpStatus status, int resultCode, String message, T result) {
		return new TableResultView<>(status, resultCode, message, result);
	}
}