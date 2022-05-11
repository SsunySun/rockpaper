/**
 * Table Field Table Initialize Data
 */
INSERT INTO RSHM.TAB_TABLE_FIELD
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TAB_ID, TFD_ID, TYPE_CD, REF_ENT_ID, REF_CTY_ID, PRODUCT)
VALUES
/* TAB_ENTITY - 엔티티 관리 */
('TAB_ENTITY/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'ENT', 'TAB_ENTITY', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_ENTITY/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'ENT', 'TAB_ENTITY', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_ENTITY/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'ENT', 'TAB_ENTITY', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_ENTITY/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'ENT', 'TAB_ENTITY', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_ENTITY/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'ENT', 'TAB_ENTITY', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_ENTITY/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'ENT', 'TAB_ENTITY', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_ENTITY/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'ENT', 'TAB_ENTITY', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_ENTITY/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'ENT', 'TAB_ENTITY', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_ENTITY/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'ENT', 'TAB_ENTITY', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_ENTITY/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'ENT', 'TAB_ENTITY', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_ENTITY/PREFIX', 'PREFIX', '엔티티 Prefix값', '엔티티 Prefix값', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'ENT', 'TAB_ENTITY', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 엔티티 Prefix값 */
('TAB_ENTITY/TYPE_CD', 'TYPE_CD', '유형 ID', '유형 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'ENT', 'TAB_ENTITY', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE_SELECT', null, 'ENT_TYPE', true),	/* 유형 값 */


/* TAB_TABLE - 테이블 관리 */
('TAB_TABLE/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'TAB', 'TAB_TABLE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_TABLE/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'TAB', 'TAB_TABLE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_TABLE/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'TAB', 'TAB_TABLE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_TABLE/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'TAB', 'TAB_TABLE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_TABLE/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'TAB', 'TAB_TABLE', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_TABLE/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'TAB', 'TAB_TABLE', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_TABLE/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'TAB', 'TAB_TABLE', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_TABLE/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'TAB', 'TAB_TABLE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_TABLE/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'TAB', 'TAB_TABLE', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_TABLE/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'TAB', 'TAB_TABLE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_TABLE/ENT_ID', 'ENT_ID', '엔티티 ID', '엔티티 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'TAB', 'TAB_TABLE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ENT', null, true),	/* 엔티티 ID */
('TAB_TABLE/TYPE_CD', 'TYPE_CD', '유형 ID', '유형 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'TAB', 'TAB_TABLE', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE_SELECT', null, 'TAB_TYPE', true),	/* 유형 ID */


/* TAB_SEQUENCE - 시퀀스 관리 */
('TAB_SEQUENCE/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SEQ', 'TAB_SEQUENCE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_SEQUENCE/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SEQ', 'TAB_SEQUENCE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_SEQUENCE/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SEQ', 'TAB_SEQUENCE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_SEQUENCE/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'SEQ', 'TAB_SEQUENCE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_SEQUENCE/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'SEQ', 'TAB_SEQUENCE', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_SEQUENCE/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'SEQ', 'TAB_SEQUENCE', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_SEQUENCE/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'SEQ', 'TAB_SEQUENCE', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_SEQUENCE/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'SEQ', 'TAB_SEQUENCE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_SEQUENCE/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'SEQ', 'TAB_SEQUENCE', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_SEQUENCE/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'SEQ', 'TAB_SEQUENCE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_SEQUENCE/ENT_ID', 'ENT_ID', '엔티티 ID', '엔티티 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'SEQ', 'TAB_SEQUENCE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ENT', null, true),	/* 엔티티 ID */
('TAB_SEQUENCE/MID_TYPE', 'MID_TYPE', '시퀀스 형식', '시퀀스 형식', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'SEQ', 'TAB_SEQUENCE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 시퀀스 형식 */
('TAB_SEQUENCE/MID_NUM', 'MID_NUM', '시퀀스 형식 값', '시퀀스 형식 값', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'SEQ', 'TAB_SEQUENCE', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 시퀀스 형식 값 */
('TAB_SEQUENCE/CUR_NUM', 'CUR_NUM', '현재 값', '현재 값', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 14, 
 'SEQ', 'TAB_SEQUENCE', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 현재 값 */
('TAB_SEQUENCE/LENGTH', 'LENGTH', '시퀀스의 키 자리수', '시퀀스의 키 자리수', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 15, 
 'SEQ', 'TAB_SEQUENCE', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 시퀀스의 키 자리수 */


/* TAB_CODE_TYPE - 코드 타입 관리 */
('TAB_CODE_TYPE/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'CTY', 'TAB_CODE_TYPE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_CODE_TYPE/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'CTY', 'TAB_CODE_TYPE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_CODE_TYPE/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'CTY', 'TAB_CODE_TYPE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_CODE_TYPE/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'CTY', 'TAB_CODE_TYPE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_CODE_TYPE/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'CTY', 'TAB_CODE_TYPE', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_CODE_TYPE/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'CTY', 'TAB_CODE_TYPE', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_CODE_TYPE/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'CTY', 'TAB_CODE_TYPE', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_CODE_TYPE/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'CTY', 'TAB_CODE_TYPE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_CODE_TYPE/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'CTY', 'TAB_CODE_TYPE', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_CODE_TYPE/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'CTY', 'TAB_CODE_TYPE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_CODE_TYPE/HIERARCHY', 'HIERARCHY', '계층 여부', '계층 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'CTY', 'TAB_CODE_TYPE', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 계층 여부 */


/* TAB_CODE - 코드 관리 */
('TAB_CODE/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'COD', 'TAB_CODE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_CODE/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'COD', 'TAB_CODE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_CODE/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'COD', 'TAB_CODE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_CODE/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'COD', 'TAB_CODE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_CODE/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'COD', 'TAB_CODE', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_CODE/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'COD', 'TAB_CODE', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_CODE/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'COD', 'TAB_CODE', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_CODE/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'COD', 'TAB_CODE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_CODE/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'COD', 'TAB_CODE', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_CODE/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'COD', 'TAB_CODE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_CODE/CTY_ID', 'CTY_ID', '유형 타입 ID', '유형 타입 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'COD', 'TAB_CODE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'CTY', null, true),	/* 유형 타입 ID */
('TAB_CODE/VAL', 'VAL', '코드 값', '코드 값', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'COD', 'TAB_CODE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 코드 값 */
('TAB_CODE/SID', 'SID', '최상위 코드 ID', '최상위 코드 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'COD', 'TAB_CODE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'COD', null, true),	/* 최상위 코드 ID */
('TAB_CODE/PID', 'PID', '상위 코드 ID', '상위 코드 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 14, 
 'COD', 'TAB_CODE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'COD', null, true),	/* 상위 코드 ID */
('TAB_CODE/LEVEL', 'LEVEL', '레벨', '레벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 15, 
 'COD', 'TAB_CODE', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 레벨 */


/* TAB_MENU - 메뉴 관리 */
('TAB_MENU/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'MEN', 'TAB_MENU', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_MENU/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'MEN', 'TAB_MENU', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_MENU/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'MEN', 'TAB_MENU', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_MENU/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'MEN', 'TAB_MENU', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_MENU/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'MEN', 'TAB_MENU', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_MENU/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'MEN', 'TAB_MENU', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_MENU/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'MEN', 'TAB_MENU', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_MENU/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'MEN', 'TAB_MENU', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_MENU/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'MEN', 'TAB_MENU', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_MENU/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'MEN', 'TAB_MENU', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_MENU/PID', 'PID', '상위 메뉴 ID', '상위 메뉴 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'MEN', 'TAB_MENU', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'MEN', null, true),	/* 상위 메뉴 ID */
('TAB_MENU/LEVEL', 'LEVEL', '레벨', '레벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'MEN', 'TAB_MENU', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 레벨 */
('TAB_MENU/URL', 'URL', 'URL', 'URL', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'MEN', 'TAB_MENU', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* URL */
('TAB_MENU/ICON', 'ICON', '아이콘', '아이콘', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 14, 
 'MEN', 'TAB_MENU', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 아이콘 */
('TAB_MENU/ASIDE', 'ASIDE', 'Aside 여부', 'Aside 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 15, 
 'MEN', 'TAB_MENU', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* Aside 여부 */
('TAB_MENU/NEW', 'NEW', '새창 여부', '새창 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 16, 
 'MEN', 'TAB_MENU', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 새창 여부 */
('TAB_MENU/LEADER', 'LEADER', '팀장 여부', '팀장 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 17, 
 'MEN', 'TAB_MENU', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 팀장 여부 */
('TAB_MENU/ADMIN', 'ADMIN', '관리자 여부', '관리자 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 18, 
 'MEN', 'TAB_MENU', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 관리자 여부 */


/* TAB_LOG - 로그 관리 */
('TAB_LOG/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'LOG', 'TAB_LOG', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_LOG/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'LOG', 'TAB_LOG', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_LOG/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'LOG', 'TAB_LOG', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_LOG/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'LOG', 'TAB_LOG', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_LOG/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'LOG', 'TAB_LOG', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_LOG/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'LOG', 'TAB_LOG', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_LOG/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'LOG', 'TAB_LOG', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_LOG/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'LOG', 'TAB_LOG', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_LOG/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'LOG', 'TAB_LOG', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_LOG/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'LOG', 'TAB_LOG', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_LOG/TYPE_CD', 'TYPE_CD', '로그 타입', '로그 타입', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'LOG', 'TAB_LOG', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE_SELECT', null, 'LOG_TYPE', true),	/* 로그 타입 */
('TAB_LOG/MESSAGE', 'MESSAGE', '결과 메시지', '결과 메시지', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'LOG', 'TAB_LOG', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 결과 메시지 */
('TAB_LOG/CONTENT', 'CONTENT', 'Content', 'Content', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'LOG', 'TAB_LOG', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* Content */
('TAB_LOG/RESULT', 'RESULT', '성공여부', '성공여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 14, 
 'LOG', 'TAB_LOG', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 성공여부 */

/* TAB_HOLIDAY - 휴일 관리 */
('TAB_HOLIDAY/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'HOD', 'TAB_HOLIDAY', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_HOLIDAY/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'HOD', 'TAB_HOLIDAY', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_HOLIDAY/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'HOD', 'TAB_HOLIDAY', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_HOLIDAY/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'HOD', 'TAB_HOLIDAY', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_HOLIDAY/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'HOD', 'TAB_HOLIDAY', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_HOLIDAY/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'HOD', 'TAB_HOLIDAY', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_HOLIDAY/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'HOD', 'TAB_HOLIDAY', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_HOLIDAY/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'HOD', 'TAB_HOLIDAY', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_HOLIDAY/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'HOD', 'TAB_HOLIDAY', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_HOLIDAY/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'HOD', 'TAB_HOLIDAY', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_HOLIDAY/HOLIDAY', 'HOLIDAY', '휴일 여부', '휴일 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'HOD', 'TAB_HOLIDAY', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 휴일 여부 */


/* TAB_SQL - SQL 관리 */
('TAB_SQL/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SQL', 'TAB_SQL', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_SQL/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SQL', 'TAB_SQL', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_SQL/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SQL', 'TAB_SQL', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_SQL/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'SQL', 'TAB_SQL', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_SQL/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'SQL', 'TAB_SQL', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_SQL/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'SQL', 'TAB_SQL', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_SQL/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'SQL', 'TAB_SQL', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_SQL/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'SQL', 'TAB_SQL', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_SQL/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'SQL', 'TAB_SQL', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_SQL/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'SQL', 'TAB_SQL', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_SQL/QUERY', 'QUERY', 'Query', 'Query', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'SQL', 'TAB_SQL', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* Query */
('TAB_SQL/CONFIG', 'CONFIG', 'Config', 'Config', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'SQL', 'TAB_SQL', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_JSON_EDITOR', null, null, true),	/* Config */


/* TAB_LIST - 리스트 관리 */
('TAB_LIST/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'LST', 'TAB_LIST', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_LIST/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'LST', 'TAB_LIST', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_LIST/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'LST', 'TAB_LIST', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_LIST/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'LST', 'TAB_LIST', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_LIST/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'LST', 'TAB_LIST', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_LIST/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'LST', 'TAB_LIST', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),    /* 순서 */
('TAB_LIST/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'LST', 'TAB_LIST', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_LIST/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'LST', 'TAB_LIST', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_LIST/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'LST', 'TAB_LIST', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_LIST/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'LST', 'TAB_LIST', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_LIST/QUERY', 'QUERY', 'Query', 'Query', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'LST', 'TAB_LIST', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* Query */
('TAB_LIST/CONFIG', 'CONFIG', 'Config', 'Config', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'LST', 'TAB_LIST', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_JSON_EDITOR', null, null, true),	/* Config */
('TAB_LIST/SCRIPT', 'SCRIPT', 'Script', 'Script', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'LST', 'TAB_LIST', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* Script */


/* TAB_RELATION - 릴레이션 관리 */
('TAB_RELATION/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'RLT', 'TAB_RELATION', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_RELATION/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'RLT', 'TAB_RELATION', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_RELATION/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'RLT', 'TAB_RELATION', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_RELATION/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'RLT', 'TAB_RELATION', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_RELATION/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'RLT', 'TAB_RELATION', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_RELATION/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'RLT', 'TAB_RELATION', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),    /* 순서 */
('TAB_RELATION/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'RLT', 'TAB_RELATION', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_RELATION/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'RLT', 'TAB_RELATION', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_RELATION/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'RLT', 'TAB_RELATION', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_RELATION/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'RLT', 'TAB_RELATION', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_RELATION/ENT_ID', 'ENT_ID', '엔티티 ID', '엔티티 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'RLT', 'TAB_RELATION', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ENT', null, true),	/* 엔티티 ID */
('TAB_RELATION/TAB_ID', 'TAB_ID', '테이블 ID', '테이블 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'RLT', 'TAB_RELATION', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'TAB', null, true),	/* 테이블 ID */
('TAB_RELATION/QUERY', 'QUERY', 'Query', 'Query', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'RLT', 'TAB_RELATION', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_JSON_EDITOR', null, null, true),	/* Query */
('TAB_RELATION/CONFIG', 'CONFIG', 'Config', 'Config', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 14, 
 'RLT', 'TAB_RELATION', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_JSON_EDITOR', null, null, true),	/* Config */


/* TAB_CONTENT - 컨텐츠 관리 */
('TAB_CONTENT/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'CTN', 'TAB_CONTENT', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_CONTENT/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'CTN', 'TAB_CONTENT', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_CONTENT/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'CTN', 'TAB_CONTENT', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_CONTENT/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'CTN', 'TAB_CONTENT', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_CONTENT/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'CTN', 'TAB_CONTENT', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_CONTENT/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'CTN', 'TAB_CONTENT', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),    /* 순서 */
('TAB_CONTENT/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'CTN', 'TAB_CONTENT', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_CONTENT/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'CTN', 'TAB_CONTENT', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_CONTENT/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'CTN', 'TAB_CONTENT', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_CONTENT/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'CTN', 'TAB_CONTENT', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_CONTENT/SUBJECT', 'SUBJECT', '제목', '제목', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'CTN', 'TAB_CONTENT', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 제목 */
('TAB_CONTENT/CONTENT', 'CONTENT', 'Content 본문', 'Content 본문', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'CTN', 'TAB_CONTENT', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* Content 본문 */
('TAB_CONTENT/TO_SQL', 'TO_SQL', 'Content 받는 사람', 'Content 받는 사람', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'CTN', 'TAB_CONTENT', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* Content 받는 사람 */
('TAB_CONTENT/CONTENT_SQL', 'CONTENT_SQL', 'Content 본문의 내용', 'Content 본문의 내용', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 14, 
 'CTN', 'TAB_CONTENT', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 본문의 내용 */


/* TAB_FIELD_TYPE - 필드 타입 관리 */
('TAB_FIELD_TYPE/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'FLT', 'TAB_FIELD_TYPE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_FIELD_TYPE/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'FLT', 'TAB_FIELD_TYPE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_FIELD_TYPE/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'FLT', 'TAB_FIELD_TYPE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_FIELD_TYPE/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'FLT', 'TAB_FIELD_TYPE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_FIELD_TYPE/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'FLT', 'TAB_FIELD_TYPE', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_FIELD_TYPE/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'FLT', 'TAB_FIELD_TYPE', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_FIELD_TYPE/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'FLT', 'TAB_FIELD_TYPE', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_FIELD_TYPE/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'FLT', 'TAB_FIELD_TYPE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_FIELD_TYPE/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'FLT', 'TAB_FIELD_TYPE', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_FIELD_TYPE/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'FLT', 'TAB_FIELD_TYPE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_FIELD_TYPE/DEF_UIITEM', 'DEF_UIITEM', 'Default UIItem', 'Default UIItem', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'FLT', 'TAB_FIELD_TYPE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* Default UIItem */
('TAB_FIELD_TYPE/TYPE_CD', 'TYPE_CD', '유형 ID', '유형 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'FLT', 'TAB_FIELD_TYPE', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE_SELECT', null, 'FLT_TYPE', true),	/* 유형 ID */


/* TAB_TABLE_FIELD - 테이블 필드 관리 */
('TAB_TABLE_FIELD/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'TFD', 'TAB_TABLE_FIELD', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_TABLE_FIELD/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'TFD', 'TAB_TABLE_FIELD', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_TABLE_FIELD/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'TFD', 'TAB_TABLE_FIELD', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_TABLE_FIELD/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'TFD', 'TAB_TABLE_FIELD', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_TABLE_FIELD/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'TFD', 'TAB_TABLE_FIELD', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_TABLE_FIELD/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'TFD', 'TAB_TABLE_FIELD', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_TABLE_FIELD/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'TFD', 'TAB_TABLE_FIELD', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_TABLE_FIELD/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'TFD', 'TAB_TABLE_FIELD', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_TABLE_FIELD/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'TFD', 'TAB_TABLE_FIELD', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_TABLE_FIELD/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'TFD', 'TAB_TABLE_FIELD', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_TABLE_FIELD/ENT_ID', 'ENT_ID', '엔티티 ID', '엔티티 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'TFD', 'TAB_TABLE_FIELD', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ENT', null, true),	/* 엔티티 ID */
('TAB_TABLE_FIELD/TAB_ID', 'TAB_ID', '테이블 ID', '테이블 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'TFD', 'TAB_TABLE_FIELD', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'TAB', null, true),	/* 테이블 ID */
('TAB_TABLE_FIELD/TYPE_CD', 'TYPE_CD', '유형 ID', '유형 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'TFD', 'TAB_TABLE_FIELD', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE_SELECT', null, 'FLT_TYPE', true),	/* 유형 ID */
 ('TAB_TABLE_FIELD/TFD_CTY_ID', 'TFD_CTY_ID', '필드의 코드 타입 ID', '필드의 코드 타입 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 14, 
 'TFD', 'TAB_TABLE_FIELD', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 필드의 코드 타입 ID */
('TAB_TABLE_FIELD/REF_ENT_ID', 'REF_ENT_ID', '참조 엔티티 ID', '참조 엔티티 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 15, 
 'TFD', 'TAB_TABLE_FIELD', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 참조 엔티티 ID */
 ('TAB_TABLE_FIELD/REF_CTY_ID', 'REF_CTY_ID', '참조 코드 타입 ID', '참조 코드 타입 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 16, 
 'TFD', 'TAB_TABLE_FIELD', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 참조 코드 타입 ID */
 ('TAB_TABLE_FIELD/PRODUCT', 'PRODUCT', '시스템 필드 여부', '시스템 필드 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 17, 
 'TFD', 'TAB_TABLE_FIELD', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 시스템 필드 여부 */


/* TAB_WORKFLOW - 워크플로우 관리 */
('TAB_WORKFLOW/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOF', 'TAB_WORKFLOW', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_WORKFLOW/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'WOF', 'TAB_WORKFLOW', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_WORKFLOW/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'WOF', 'TAB_WORKFLOW', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_WORKFLOW/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'WOF', 'TAB_WORKFLOW', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_WORKFLOW/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'WOF', 'TAB_WORKFLOW', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_WORKFLOW/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'WOF', 'TAB_WORKFLOW', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_WORKFLOW/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'WOF', 'TAB_WORKFLOW', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_WORKFLOW/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'WOF', 'TAB_WORKFLOW', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_WORKFLOW/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'WOF', 'TAB_WORKFLOW', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_WORKFLOW/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'WOF', 'TAB_WORKFLOW', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_WORKFLOW/ENT_ID', 'ENT_ID', '엔티티 ID', '엔티티 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'WOF', 'TAB_WORKFLOW', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ENT', null, true),	/* 엔티티 ID */


/* TAB_ACTIVITY - 액티비티 관리 */
('TAB_ACTIVITY/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'ACT', 'TAB_ACTIVITY', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_ACTIVITY/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'ACT', 'TAB_ACTIVITY', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_ACTIVITY/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'ACT', 'TAB_ACTIVITY', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_ACTIVITY/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'ACT', 'TAB_ACTIVITY', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_ACTIVITY/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'ACT', 'TAB_ACTIVITY', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_ACTIVITY/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'ACT', 'TAB_ACTIVITY', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_ACTIVITY/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'ACT', 'TAB_ACTIVITY', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_ACTIVITY/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'ACT', 'TAB_ACTIVITY', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_ACTIVITY/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'ACT', 'TAB_ACTIVITY', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_ACTIVITY/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'ACT', 'TAB_ACTIVITY', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_ACTIVITY/ENT_ID', 'ENT_ID', '엔티티 ID', '엔티티 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'ACT', 'TAB_ACTIVITY', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ENT', null, true),	/* 엔티티 ID */
('TAB_ACTIVITY/WOF_ID', 'WOF_ID', '워크플로우 ID', '워크플로우 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'ACT', 'TAB_ACTIVITY', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'WOF', null, true),	/* 워크플로우 ID */


/* TAB_TASK - 테스크 관리 */
('TAB_TASK/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'TAS', 'TAB_TASK', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_TASK/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'TAS', 'TAB_TASK', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_TASK/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'TAS', 'TAB_TASK', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_TASK/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'TAS', 'TAB_TASK', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_TASK/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'TAS', 'TAB_TASK', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_TASK/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'TAS', 'TAB_TASK', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_TASK/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'TAS', 'TAB_TASK', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_TASK/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'TAS', 'TAB_TASK', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_TASK/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'TAS', 'TAB_TASK', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_TASK/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'TAS', 'TAB_TASK', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_TASK/ENT_ID', 'ENT_ID', '엔티티 ID', '엔티티 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'TAS', 'TAB_TASK', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ENT', null, true),	/* 엔티티 ID */
('TAB_TASK/ACT_ID', 'ACT_ID', '액티비티 ID', '액티비티 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'TAS', 'TAB_TASK', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ACT', null, true),	/* 액티비티 ID */
('TAB_TASK/TYPE_CD', 'TYPE_CD', '유형 ID', '유형 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'TAS', 'TAB_TASK', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE_SELECT', null, 'TAS_TYPE', true),	/* 유형 ID */


/* TAB_CONTROL - 제어 관리 */
('TAB_CONTROL/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'CTL', 'TAB_CONTROL', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_CONTROL/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'CTL', 'TAB_CONTROL', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_CONTROL/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'CTL', 'TAB_CONTROL', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_CONTROL/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'CTL', 'TAB_CONTROL', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_CONTROL/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'CTL', 'TAB_CONTROL', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_CONTROL/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'CTL', 'TAB_CONTROL', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_CONTROL/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'CTL', 'TAB_CONTROL', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_CONTROL/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'CTL', 'TAB_CONTROL', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_CONTROL/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'CTL', 'TAB_CONTROL', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_CONTROL/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'CTL', 'TAB_CONTROL', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_CONTROL/ENT_ID', 'ENT_ID', '엔티티 ID', '엔티티 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'CTL', 'TAB_CONTROL', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ENT', null, true),	/* 엔티티 ID */
('TAB_CONTROL/TAS_ID', 'TAS_ID', '테스크 ID', '테스크 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'CTL', 'TAB_CONTROL', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'TAS', null, true),	/* 테스크 ID */
('TAB_CONTROL/NEXT_TAS_ID', 'NEXT_TAS_ID', '다음 테스크 ID', '다음 테스크 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'CTL', 'TAB_CONTROL', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'TAS', null, true),	/* 다음 테스크 ID */
('TAB_CONTROL/TYPE_CD', 'TYPE_CD', '유형 ID', '유형 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 14, 
 'CTL', 'TAB_CONTROL', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE_SELECT', null, 'CTL_TYPE', true),	/* 유형 ID */
('TAB_CONTROL/DATA_UPDATE', 'DATA_UPDATE', '데이터 업데이트', '데이터 업데이트', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 15, 
 'CTL', 'TAB_CONTROL', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_JSON_EDITOR', null, null, true),	/* 데이터 업데이트 */
('TAB_CONTROL/CONTENT_ID', 'CONTENT_ID', '컨텐츠 ID', '컨텐츠 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 16, 
 'CTL', 'TAB_CONTROL', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'CTN', null, true),	/* 컨텐츠 ID */


/* TAB_FORM - 폼 관리 */
('TAB_FORM/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'FRM', 'TAB_FORM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_FORM/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'FRM', 'TAB_FORM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_FORM/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'FRM', 'TAB_FORM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_FORM/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'FRM', 'TAB_FORM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_FORM/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'FRM', 'TAB_FORM', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_FORM/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'FRM', 'TAB_FORM', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_FORM/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'FRM', 'TAB_FORM', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_FORM/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'FRM', 'TAB_FORM', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_FORM/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'FRM', 'TAB_FORM', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_FORM/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'FRM', 'TAB_FORM', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_FORM/ENT_ID', 'ENT_ID', '엔티티 ID', '엔티티 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'FRM', 'TAB_FORM', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ENT', null, true),	/* 엔티티 ID */
('TAB_FORM/TAS_ID', 'TAS_ID', '테스크 ID', '테스크 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'FRM', 'TAB_FORM', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'TAS', null, true),	/* 테스크 ID */
('TAB_FORM/CONFIG', 'CONFIG', 'Config', 'Config', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'FRM', 'TAB_FORM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_JSON_EDITOR', null, null, true),	/* Config */
('TAB_FORM/SCRIPT', 'SCRIPT', 'Script', 'Script', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 14, 
 'FRM', 'TAB_FORM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* Script */


/* TAB_WFF - 워크플로우 플로우 */
('TAB_WFF/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WFF', 'TAB_WFF', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_WFF/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'WFF', 'TAB_WFF', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_WFF/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'WFF', 'TAB_WFF', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_WFF/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'WFF', 'TAB_WFF', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_WFF/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'WFF', 'TAB_WFF', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_WFF/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'WFF', 'TAB_WFF', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_WFF/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'WFF', 'TAB_WFF', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_WFF/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'WFF', 'TAB_WFF', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_WFF/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'WFF', 'TAB_WFF', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_WFF/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'WFF', 'TAB_WFF', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_WFF/ENT_ID', 'ENT_ID', '엔티티 ID', '엔티티 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'WFF', 'TAB_WFF', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ENT', null, true),	/* 엔티티 ID */
('TAB_WFF/SRC_ID', 'SRC_ID', '원본 티켓 ID', '원본 티켓 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'WFF', 'TAB_WFF', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 원본 티켓 ID */
('TAB_WFF/SRC_ENT_ID', 'SRC_ENT_ID', '원본 티켓 엔티티 ID', '원본 티켓 엔티티 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'WFF', 'TAB_WFF', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ENT', null, true),	/* 원본 티켓 엔티티 ID */
('TAB_WFF/ORG_ID', 'ORG_ID', '조직 ID', '조직 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 14, 
 'WFF', 'TAB_WFF', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ORG', null, true),	/* 조직 ID */
('TAB_WFF/DPT_ID', 'DPT_ID', '부서 ID', '부서 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 15, 
 'WFF', 'TAB_WFF', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'DPT', null, true),	/* 부서 ID */
('TAB_WFF/EMP_ID', 'EMP_ID', '직원 ID', '직원 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 16, 
 'WFF', 'TAB_WFF', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 직원 ID */
('TAB_WFF/TAS_ID', 'TAS_ID', '테스크 ID', '테스크 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 17, 
 'WFF', 'TAB_WFF', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'TAS', null, true),	/* 테스크 ID */
('TAB_WFF/NEXT_TAS_ID', 'NEXT_TAS_ID', '다음 테스크 ID', '다음 테스크 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 18, 
 'WFF', 'TAB_WFF', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'TAS', null, true),	/* 다음 테스크 ID */


/* TAB_ORG - 조직 관리 */
('TAB_ORG/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'ORG', 'TAB_ORG', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_ORG/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'ORG', 'TAB_ORG', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_ORG/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'ORG', 'TAB_ORG', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_ORG/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'ORG', 'TAB_ORG', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_ORG/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'ORG', 'TAB_ORG', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_ORG/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'ORG', 'TAB_ORG', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_ORG/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'ORG', 'TAB_ORG', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_ORG/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'ORG', 'TAB_ORG', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_ORG/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'ORG', 'TAB_ORG', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_ORG/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'ORG', 'TAB_ORG', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 

/* TAB_DEPT - 부서 관리 */
('TAB_DEPT/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'DPT', 'TAB_DEPT', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_DEPT/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'DPT', 'TAB_DEPT', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_DEPT/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'DPT', 'TAB_DEPT', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_DEPT/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'DPT', 'TAB_DEPT', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_DEPT/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'DPT', 'TAB_DEPT', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_DEPT/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'DPT', 'TAB_DEPT', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_DEPT/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'DPT', 'TAB_DEPT', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_DEPT/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'DPT', 'TAB_DEPT', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_DEPT/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'DPT', 'TAB_DEPT', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_DEPT/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'DPT', 'TAB_DEPT', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_DEPT/ORG_ID', 'ORG_ID', '조직 ID', '조직 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'DPT', 'TAB_DEPT', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ORG', null, true),	/* 조직 ID */
('TAB_DEPT/PID', 'PID', '상위 부서 ID', '상위 부서 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'DPT', 'TAB_DEPT', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'DPT', null, true),	/* 상위 부서 ID */
('TAB_DEPT/LEVEL', 'LEVEL', '레벨', '레벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'DPT', 'TAB_DEPT', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 레벨 */


/* TAB_EMPLOYEE - 직원 관리 */
('TAB_EMPLOYEE/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'EMP', 'TAB_EMPLOYEE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_EMPLOYEE/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'EMP', 'TAB_EMPLOYEE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_EMPLOYEE/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'EMP', 'TAB_EMPLOYEE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_EMPLOYEE/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'EMP', 'TAB_EMPLOYEE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_EMPLOYEE/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'EMP', 'TAB_EMPLOYEE', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_EMPLOYEE/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'EMP', 'TAB_EMPLOYEE', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_EMPLOYEE/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'EMP', 'TAB_EMPLOYEE', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_EMPLOYEE/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'EMP', 'TAB_EMPLOYEE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_EMPLOYEE/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'EMP', 'TAB_EMPLOYEE', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_EMPLOYEE/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'EMP', 'TAB_EMPLOYEE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_EMPLOYEE/ORG_ID', 'ORG_ID', '조직 ID', '조직 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'EMP', 'TAB_EMPLOYEE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ORG', null, true),	/* 조직 ID */
('TAB_EMPLOYEE/DPT_ID', 'DPT_ID', '부서 ID', '부서 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'EMP', 'TAB_EMPLOYEE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'DPT', null, true),	/* 부서 ID */
('TAB_EMPLOYEE/NUMBER', 'NUMBER', '사번', '사번', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'EMP', 'TAB_EMPLOYEE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 사번 */
('TAB_EMPLOYEE/HPHONE', 'HPHONE', '연락처', '연락처', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 14, 
 'EMP', 'TAB_EMPLOYEE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 연락처 */
('TAB_EMPLOYEE/JOB_TEL', 'JOB_TEL', '회사 연락처', '회사 연락처', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 15, 
 'EMP', 'TAB_EMPLOYEE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 회사 연락처 */
('TAB_EMPLOYEE/POSITION_CD', 'POSITION_CD', '직위', '직위', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 16, 
 'EMP', 'TAB_EMPLOYEE', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE_SELECT', null, 'POSITION', true),	/* 직위 */
('TAB_EMPLOYEE/DUTY_POSITION_CD', 'DUTY_POSITION_CD', '직책', '직책', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 17, 
 'EMP', 'TAB_EMPLOYEE', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE_SELECT', null, 'DUTY_POSITION', true),	/* 직책 */
('TAB_EMPLOYEE/MGR_EMP_ID', 'MGR_EMP_ID', '관리자 ID', '관리자 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 18, 
 'EMP', 'TAB_EMPLOYEE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 관리자 ID */
('TAB_EMPLOYEE/MAIL_USED', 'MAIL_USED', '이메일 발송 여부', '이메일 발송 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 19, 
 'EMP', 'TAB_EMPLOYEE', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 이메일 발송 여부 */
('TAB_EMPLOYEE/AGC_EMP_ID', 'AGC_EMP_ID', '대직자 ID', '대직자 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 20, 
 'EMP', 'TAB_EMPLOYEE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 대직자 ID */
('TAB_EMPLOYEE/AGC_START_DATE', 'AGC_START_DATE', '대직 시작일', '대직 시작일', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 21, 
 'EMP', 'TAB_EMPLOYEE', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DT', null, null, true),	/* 대직 시작일 */
('TAB_EMPLOYEE/AGC_END_DATE', 'AGC_END_DATE', '대직 종료일', '대직 종료일', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 22, 
 'EMP', 'TAB_EMPLOYEE', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DT', null, null, true);	/* 대직 종료일 */
