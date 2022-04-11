package kr.co.rockplace.rshm.view;

import org.springframework.http.HttpStatus;

import lombok.Getter;

/**
 * Common Result View Class
 * @author wonsunlee
 * @param <T> {@link Object}
 */
@Getter
public class CommonResultView<T> {

	private static final int SUCCESS = 0;

	private int status = HttpStatus.OK.value();

	private int resultCode;
	private String message;
	private T result;

	/**
	 * Common Result View Constructor
	 */
	public CommonResultView() {}

	/**
	 * Common Result View Constructor
	 * @param resultCode 결과 코드 
	 * @param message 결과 메시지 
	 * @param result 결과 Object
	 */
	public CommonResultView(int resultCode, String message, T result) {

		this.resultCode = resultCode;
		this.message = message;
		this.result = result;
	}

	/**
	 * Common Result View Constructor
	 * @param status 결과 코드 {@link org.springframework.http.HttpStatus}
	 * @param resultCode 결과 코드 
	 * @param message 결과 메시지 
	 * @param result 결과 Object
	 */
	public CommonResultView(HttpStatus status, int resultCode, String message, T result) {

		this.status = status.value();
		this.resultCode = resultCode;
		this.message = message;
		this.result = result;
	}

	/**
	 * 성공일 경우 
	 * @return
	 */
	public static CommonResultView<Boolean> success() {
		return new CommonResultView<>(SUCCESS, "success", true);
	}

	/**
	 * 성공일 경우 
	 * @param result 결과 Object
	 * @return
	 */
	public static <T> CommonResultView<T> success(T result) {
		return new CommonResultView<>(SUCCESS, "success", result);
	}

	/**
	 * 성공일 경우 
	 * @param message Message
	 * @return
	 */
	public static CommonResultView<Boolean> success(String message) {
		return new CommonResultView<>(SUCCESS, message, true);
	}

	/**
	 * 처리 코드에 따른 정보
	 * @param status
	 * @param message
	 * @param result
	 * @return
	 */
	public static <T> CommonResultView<T> status(HttpStatus status, String message, T result) {
		return new CommonResultView<>(status, 0, message, result);
	}

	/**
	 * 처리 코드에 따른 정보
	 * @param status
	 * @param resultCode 
	 * @param message
	 * @param result
	 * @return
	 */
	public static <T> CommonResultView<T> status(HttpStatus status, int resultCode, String message, T result) {
		return new CommonResultView<>(status, resultCode, message, result);
	}

	/**
	 * 실패일 경우 
	 * @param resultCode 결과 코드
	 * @param message 결과 메시지 
	 * @param result 결과 Object
	 * @return
	 */
	public static <T> CommonResultView<T> fail(int resultCode, String message, T result) {
		return new CommonResultView<>(HttpStatus.INTERNAL_SERVER_ERROR, resultCode, message, result);
	}

	/**
	 * 실패일 경우 
	 * @param status 결과 코드 {@link org.springframework.http.HttpStatus}
	 * @param resultCode 결과 코드 
	 * @param message 결과 메시지 
	 * @param result 결과 Object
	 * @return
	 */
	public static <T> CommonResultView<T> fail(HttpStatus status, int resultCode, String message, T result) {
		return new CommonResultView<>(status, resultCode, message, result);
	}
}