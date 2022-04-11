package kr.co.rockplace.rshm.view;

import org.springframework.http.HttpStatus;

import lombok.Getter;

/**
 * Table Result View Class
 * @author wonsunlee
 * @param <T1> {@link Object}
 * @param <T2> {@link Object}
 */
@Getter
public class ChildTableResultView<T1, T2> {

	private static final int SUCCESS = 0;

	private int status = HttpStatus.OK.value();

	private int resultCode;
	private String message;
	private T1 meta;
	private T2 result;

	/**
	 * Common Result View Constructor
	 */
	public ChildTableResultView() {}

	/**
	 * Common Result View Constructor
	 * @param resultCode 결과 코드 
	 * @param message 결과 메시지 
	 * @param meta 메타 정보
	 * @param result 결과 Object
	 */
	public ChildTableResultView(int resultCode, String message, T1 meta, T2 result) {

		this.resultCode = resultCode;
		this.message = message;
		this.meta = meta;
		this.result = result;
	}

	/**
	 * Common Result View Constructor
	 * @param status 결과 코드 {@link org.springframework.http.HttpStatus}
	 * @param resultCode 결과 코드 
	 * @param message 결과 메시지 
	 * @param meta 메타 정보
	 * @param result 결과 Object
	 */
	public ChildTableResultView(HttpStatus status, int resultCode, String message, T1 meta, T2 result) {

		this.status = status.value();
		this.resultCode = resultCode;
		this.message = message;
		this.meta = meta;
		this.result = result;
	}

	/**
	 * 성공일 경우 
	 * @return
	 */
	public static <T1> ChildTableResultView<T1, Boolean> success(T1 meta) {
		return new ChildTableResultView<>(SUCCESS, "success", meta, true);
	}

	/**
	 * 성공일 경우 
	 * @param result 결과 Object
	 * @return
	 */
	public static <T1, T2> ChildTableResultView<T1, T2> success(T1 meta, T2 result) {
		return new ChildTableResultView<>(SUCCESS, "success", meta, result);
	}

	/**
	 * 처리 코드에 따른 정보
	 * @param status
	 * @param message
	 * @param meta 메타 정보
	 * @param result
	 * @return
	 */
	public static <T1, T2> ChildTableResultView<T1, T2> status(HttpStatus status, String message, T1 meta, T2 result) {
		return new ChildTableResultView<>(status, 0, message, meta, result);
	}

	/**
	 * 처리 코드에 따른 정보
	 * @param status
	 * @param resultCode 
	 * @param message
	 * @param meta 메타 정보
	 * @param result
	 * @return
	 */
	public static <T1, T2> ChildTableResultView<T1, T2> status(HttpStatus status, int resultCode, String message, T1 meta, T2 result) {
		return new ChildTableResultView<>(status, resultCode, message, meta, result);
	}

	/**
	 * 실패일 경우 
	 * @param resultCode 결과 코드
	 * @param message 결과 메시지 
	 * @param meta 메타 정보
	 * @param result 결과 Object
	 * @return
	 */
	public static <T1, T2> ChildTableResultView<T1, T2> fail(int resultCode, String message, T1 meta, T2 result) {
		return new ChildTableResultView<>(HttpStatus.INTERNAL_SERVER_ERROR, resultCode, message, meta, result);
	}

	/**
	 * 실패일 경우 
	 * @param status 결과 코드 {@link org.springframework.http.HttpStatus}
	 * @param resultCode 결과 코드 
	 * @param message 결과 메시지 
	 * @param meta 메타 정보
	 * @param result 결과 Object
	 * @return
	 */
	public static <T1, T2> ChildTableResultView<T1, T2> fail(HttpStatus status, int resultCode, String message, T1 meta, T2 result) {
		return new ChildTableResultView<>(status, resultCode, message, meta, result);
	}
}