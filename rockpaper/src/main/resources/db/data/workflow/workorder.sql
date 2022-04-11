/* Entity */
INSERT INTO RSHM.TAB_ENTITY
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 PREFIX, TYPE_CD )
VALUES
('WOR', '기술지원 내역서', '기술지원 내역서', '기술지원 내역서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'ENT_TYPE_WORKFLOW');	/* 기술지원 내역서 */

/* Table */
INSERT INTO RSHM.TAB_TABLE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TYPE_CD )
VALUES
('TAB_WORKORDER', '기술지원 내역서', '기술지원 내역서', '기술지원 내역서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAB_TYPE_WORKFLOW');	/* 기술지원 내역서 */

/* Table Field */
INSERT INTO RSHM.TAB_TABLE_FIELD
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TAB_ID, TFD_ID, TYPE_CD, REF_ENT_ID, REF_CTY_ID, PRODUCT)
VALUES
('TAB_WORKORDER/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_WORKORDER/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_WORKORDER/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_WORKORDER/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_WORKORDER/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_WORKORDER/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_WORKORDER/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_WORKORDER/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_WORKORDER/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_WORKORDER/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_WORKORDER/ENT_ID', 'ENT_ID', '엔티티 ID', '엔티티 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ENT', null, true),	/* 엔티티 ID */
('TAB_WORKORDER/TAS_ID', 'TAS_ID', '단계', '단계', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'TAS', null, true),	/* 단계 */
('TAB_WORKORDER/REQ_DATE', 'REQ_DATE', '요청일', '요청일', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DT', null, null, true),	/* 요청일 */
('TAB_WORKORDER/REQ_EMP_ID', 'REQ_EMP_ID', '요청자', '요청자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 14, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 요청자 */
('TAB_WORKORDER/CLO_DATE', 'CLO_DATE', '종료일', '종료일', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 15, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 종료일 */
('TAB_WORKORDER/CLO_EMP_ID', 'CLO_EMP_ID', '종료자', '종료자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 16, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 종료자 */
('TAB_WORKORDER/ASS_EMP_ID', 'ASS_EMP_ID', '현재 담당자', '현재 담당자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 17, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 현재 담당자 */
('TAB_WORKORDER/SRC_ID', 'SRC_ID', '상위 ID', '상위 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 18, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 상위 ID */
('TAB_WORKORDER/SRC_ENT_ID', 'SRC_ENT_ID', '상위 Entity ID', '상위 Entity ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 19, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ENT', null, true),	/* 상위 Entity ID */
('TAB_WORKORDER/CONTENT', 'CONTENT', '지원 내역', '지원 내역', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 20, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 지원 내역 */
('TAB_WORKORDER/SRC_CONTENT', 'SRC_CONTENT', '상위 지원 내역', '상위 지원 내역', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 21, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 상위 지원 내역 */

('TAB_WORKORDER/TYPE_CD', 'TYPE_CD', '등록 유형', '등록 유형', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 22, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE_SELECT', null, 'SHM_TYPE', true),	/* 등록 유형 */
('TAB_WORKORDER/CAT_CD', 'CAT_CD', '지원 유형', '지원 유형', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 23, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE_SELECT', null, 'SHM_CATALOG', true),	/* 지원 유형 */
('TAB_WORKORDER/CRM_ID', 'CRM_ID', 'CRM ID', 'CRM ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 24, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'CRM', null, true),	/* CRM ID(영업기회 코드) */
('TAB_WORKORDER/PRODUCT_CD', 'PRODUCT_CD', '제품 유형', '제품 유형', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 25, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE_SELECT', null, 'SHM_PRODUCT', true),	/* 제품 유형 */

('TAB_WORKORDER/SUPPORT_CITY', 'SUPPORT_CITY', '지원 도시', '지원 도시', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 26, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 지원 도시 */
('TAB_WORKORDER/SUPPORT_LOCATION', 'SUPPORT_LOCATION', '지원 장소', '지원 장소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 27, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 지원 장소 */
('TAB_WORKORDER/CUSTOMER', 'CUSTOMER', '고객명', '고객명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 28, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 고객 담당자 */
('TAB_WORKORDER/CUSTOMER_CONTACT', 'CUSTOMER_CONTACT', '고객 담당자', '고객 담당자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 29, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 고객 담당자 */
('TAB_WORKORDER/WORKDAY_CD', 'WORKDAY_CD', '근무일 유형', '근무일 유형', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 30, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE_SELECT', null, 'WOR_WORKDAY', true),	/* 근무일 유형 */

('TAB_WORKORDER/CHARGE_EMP_ID', 'CHARGE_EMP_ID', '엔지니어', '엔지니어', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 31, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 엔지니어 */

('TAB_WORKORDER/PLAN_START_DATE', 'PLAN_START_DATE', '예정 시작일시', '예정 시작일시', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 32, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_RANGE_DTTM', null, null, true),	/* 예정 시작일시 */
('TAB_WORKORDER/PLAN_FINISH_DATE', 'PLAN_FINISH_DATE', '예정 종료일시', '예정 종료일시', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 33, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_RANGE_DTTM', null, null, true),	/* 예정 종료일시 */
('TAB_WORKORDER/ACT_START_DATE', 'ACT_START_DATE', '실제 시작일시', '실제 시작일시', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 34, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_RANGE_DTTM', null, null, true),	/* 실제 시작일시 */
('TAB_WORKORDER/ACT_FINISH_DATE', 'ACT_FINISH_DATE', '실제 종료일시', '실제 종료일시', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 35, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_RANGE_DTTM', null, null, true),	/* 실제 종료일시 */
('TAB_WORKORDER/ETC_CONTENT', 'ETC_CONTENT', '특이사항', '특이사항', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 36, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 특이사항 */
('TAB_WORKORDER/VACATION_CD', 'VACATION_CD', '휴가 유형', '휴가 유형', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 37, 
 'WOR', 'TAB_WORKORDER', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE_SELECT', null, 'VACATION', true);	/* 휴가 유형 */

/* Sequence */
INSERT INTO RSHM.TAB_SEQUENCE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, MID_TYPE, MID_NUM, CUR_NUM, LENGTH )
VALUES
('SEQ_WOR', '기술지원 내역서', '기술지원 내역서', '기술지원 내역서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 'WOR', 'yyyyMM', 0, 0, 5);	/* 기술지원 내역서 */

/* Menu */
INSERT INTO RSHM.TAB_MENU
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 PID, LEVEL, URL, ICON, ASIDE, NEW, LEADER, ADMIN )
VALUES
('MEN_WOR', '업무지원 처리', '업무지원 처리', '업무지원 처리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 null, 1, null, null, true, false, false, false),	/* 업무지원 처리 */

('MEN_WOR_I_001', '(나의 업무)내부업무 목록', '(나의 업무)내부업무 목록', '(나의 업무)내부업무 목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'MEN_WOR', 2, '/common/list?lstId=LST_WOR_I_001', 5, true, false, false, false),	/* (나의 업무)내부업무 목록 */
('MEN_WOR_T_001', '(나의 업무)업무지원 처리목록', '(나의 업무)업무지원 처리목록', '(나의 업무)업무지원 처리목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'MEN_WOR', 2, '/common/list?lstId=LST_WOR_T_001', 6, true, false, false, false),	/* (나의 업무)업무지원 처리목록 */
('MEN_WOR_M_001', '(나의 업무)정기점검 처리목록', '(나의 업무)정기점검 처리목록', '(나의 업무)정기점검 처리목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'MEN_WOR', 2, '/common/list?lstId=LST_WOR_M_001', 7, true, false, false, false),	/* (나의 업무)정기점검 처리목록 */
('MEN_WOR_I_002', '(전체)내부업무 목록', '(전체)내부업무 목록', '(전체)내부업무 목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'MEN_WOR', 2, '/common/list?lstId=LST_WOR_I_002', 8, true, false, false, false),	/* (전체)내부업무 목록 */
('MEN_WOR_T_002', '(전체)업무지원 처리목록', '(전체)업무지원 처리목록', '(전체)업무지원 처리목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'MEN_WOR', 2, '/common/list?lstId=LST_WOR_T_002', 9, true, false, false, false),	/* (전체)업무지원 처리목록 */
('MEN_WOR_M_002', '(전체)정기점검 처리목록', '(전체)정기점검 처리목록', '(전체)정기점검 처리목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'MEN_WOR', 2, '/common/list?lstId=LST_WOR_M_002', 10, true, false, false, false);	/* (전체)정기점검 처리목록 */

/* Workflow */
INSERT INTO RSHM.TAB_WORKFLOW
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID )
VALUES
('WOF_WOR_T_001', '업무지원', '업무지원', '업무지원', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR'),	/* (기술지원 내역서)업무지원 */
('WOF_WOR_I_001', '내부업무', '내부업무', '내부업무', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'WOR'),	/* (기술지원 내역서)내부업무 */
('WOF_WOR_M_001', '정기점검', '정기점검', '정기점검', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'WOR');	/* (기술지원 내역서)정기점검 */

/* Activity */
INSERT INTO RSHM.TAB_ACTIVITY
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, WOF_ID )
VALUES
/* (기술지원 내역서)업무지원 */
('ACT_WOR_T_001', '진행', '진행', '진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'WOF_WOR_T_001'),	/* 진행 */
('ACT_WOR_T_002', '완료', '완료', '완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'WOR', 'WOF_WOR_T_001'),	/* 완료 */

/* (기술지원 내역서)내부업무 */
('ACT_WOR_I_001', '등록', '등록', '등록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'WOF_WOR_I_001'),	/* 등록 */
('ACT_WOR_I_002', '완료', '완료', '완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'WOR', 'WOF_WOR_I_001'),	/* 완료 */

/* (기술지원 내역서)정기점검 */
('ACT_WOR_M_001', '등록', '등록', '등록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'WOF_WOR_M_001'),	/* 등록 */
('ACT_WOR_M_002', '진행', '진행', '진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'WOR', 'WOF_WOR_M_001'),	/* 진행 */
('ACT_WOR_M_003', '완료', '완료', '완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'WOR', 'WOF_WOR_M_001');	/* 완료 */

/* Task */
INSERT INTO RSHM.TAB_TASK
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, ACT_ID, TYPE_CD )
VALUES
/* (기술지원 내역서)업무지원 */
('TAS_WOR_T_001', '진행', '진행', '진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'ACT_WOR_T_001', 'TAS_TYPE_PROC'),	/* 진행 */
('TAS_WOR_T_002', '완료', '완료', '완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'WOR', 'ACT_WOR_T_002', 'TAS_TYPE_COMP'),	/* 완료 */
('TAS_WOR_T_003', '취소', '취소', '취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'WOR', 'ACT_WOR_T_002', 'TAS_TYPE_CANCEL'),	/* 취소 */

/* (기술지원 내역서)내부업무 */
('TAS_WOR_I_001', '등록', '등록', '등록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'ACT_WOR_I_001', 'TAS_TYPE_REG'),	/* 등록 */
('TAS_WOR_I_002', '임시저장', '임시저장', '임시저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'WOR', 'ACT_WOR_I_001', 'TAS_TYPE_REG'),	/* 임시저장 */
('TAS_WOR_I_003', '완료', '완료', '완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'WOR', 'ACT_WOR_I_002', 'TAS_TYPE_COMP'),	/* 완료 */
('TAS_WOR_I_004', '취소', '취소', '취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'WOR', 'ACT_WOR_I_002', 'TAS_TYPE_CANCEL'),	/* 취소 */

/* (기술지원 내역서)정기점검 */
('TAS_WOR_M_001', '등록', '등록', '등록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'ACT_WOR_M_001', 'TAS_TYPE_REG'),	/* 등록 */
('TAS_WOR_M_002', '임시저장', '임시저장', '임시저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'WOR', 'ACT_WOR_M_001', 'TAS_TYPE_REG'),	/* 임시저장 */
('TAS_WOR_M_003', '진행', '진행', '진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'WOR', 'ACT_WOR_M_002', 'TAS_TYPE_PROC'),	/* 진행 */
('TAS_WOR_M_004', '완료', '완료', '완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'WOR', 'ACT_WOR_M_003', 'TAS_TYPE_COMP'),	/* 완료 */
('TAS_WOR_M_005', '취소', '취소', '취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'WOR', 'ACT_WOR_M_003', 'TAS_TYPE_CANCEL');	/* 취소 */

/* Control */
INSERT INTO RSHM.TAB_CONTROL
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TAS_ID, NEXT_TAS_ID, TYPE_CD, DATA_UPDATE, CONTENT_ID)
VALUES
/* (기술지원 내역서)업무지원 */
('CTL_WOR_T_001', '할당', '할당', '할당', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, false, 1, 
 'WOR', 'TAS_WOR_T_001', 'TAS_WOR_T_001', 'CTL_TYPE_PRIMARY', '[
    {"field":"ass_emp_id", "value":"#{box.charge_emp_id}"}
]', 'CTN_WOR_T_ASSIGN'),	/* 릴레이션 - 할당 -> 진행 */

('CTL_WOR_T_002', '저장', '저장', '저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAS_WOR_T_001', 'TAS_WOR_T_001', 'CTL_TYPE_SECONDARY', '[
    {"field":"ass_emp_id", "value":"#{box.charge_emp_id}"}
]', null),	/* 진행 -> 진행 */
('CTL_WOR_T_003', '완료', '완료', '완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'WOR', 'TAS_WOR_T_001', 'TAS_WOR_T_002', 'CTL_TYPE_PRIMARY', '[
    {"field":"ass_emp_id", "value":"#{box.charge_emp_id}"},
    {"field":"clo_emp_id", "value":"#{user.id}"},
    {"field":"clo_date", "value":"#{date.curDTTM}"}
]', 'CTN_WOR_T_CLOSE'),	/* 진행 -> 완료 */
('CTL_WOR_T_004', '등록취소', '등록취소', '등록취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'WOR', 'TAS_WOR_T_001', 'TAS_WOR_T_003', 'CTL_TYPE_DANGER', '[
    {"field":"ass_emp_id", "value":""},
    {"field":"clo_emp_id", "value":"#{user.id}"},
    {"field":"clo_date", "value":"#{date.curDTTM}"}
]', 'CTN_WOR_T_CANCEL'),	/* 진행 -> 취소 */

('CTL_WOR_T_005', '완료취소', '완료취소', '완료취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'WOR', 'TAS_WOR_T_002', 'TAS_WOR_T_003', 'CTL_TYPE_DANGER', '[
    {"field":"ass_emp_id", "value":""}
]', 'CTN_WOR_T_CANCEL'),	/* 완료 -> 취소 */
('CTL_WOR_T_006', '저장', '저장', '저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAS_WOR_T_002', 'TAS_WOR_T_002', 'CTL_TYPE_SECONDARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"}
]', null),	/* 완료 -> 완료 */

/* (기술지원 내역서)내부업무 */
('CTL_WOR_I_001', '임시저장', '임시저장', '임시저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAS_WOR_I_001', 'TAS_WOR_I_002', 'CTL_TYPE_SECONDARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"}
]', null),	/* 등록 -> 임시저장 */
('CTL_WOR_I_002', '완료', '완료', '완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'WOR', 'TAS_WOR_I_001', 'TAS_WOR_I_003', 'CTL_TYPE_PRIMARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"},
    {"field":"clo_emp_id", "value":"#{user.id}"},
    {"field":"clo_date", "value":"#{date.curDTTM}"}
]', 'CTN_WOR_I_CLOSE'),	/* 등록 -> 완료 */

('CTL_WOR_I_003', '저장', '저장', '저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAS_WOR_I_002', 'TAS_WOR_I_002', 'CTL_TYPE_SECONDARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"}
]', null),	/* 임시저장 -> 임시저장 */
('CTL_WOR_I_004', '완료', '완료', '완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'WOR', 'TAS_WOR_I_002', 'TAS_WOR_I_003', 'CTL_TYPE_PRIMARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"},
    {"field":"clo_emp_id", "value":"#{user.id}"},
    {"field":"clo_date", "value":"#{date.curDTTM}"}
]', 'CTN_WOR_I_CLOSE'),	/* 임시저장 -> 완료 */
('CTL_WOR_I_005', '등록취소', '등록취소', '등록취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'WOR', 'TAS_WOR_I_002', 'TAS_WOR_I_004', 'CTL_TYPE_DANGER', '[
    {"field":"ass_emp_id", "value":""},
    {"field":"clo_emp_id", "value":"#{user.id}"},
    {"field":"clo_date", "value":"#{date.curDTTM}"}
]', 'CTN_WOR_I_CANCEL'),	/* 임시저장 -> 취소 */

('CTL_WOR_I_006', '저장', '저장', '저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAS_WOR_I_003', 'TAS_WOR_I_003', 'CTL_TYPE_SECONDARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"}
]', null),	/* 완료 -> 완료 */
('CTL_WOR_I_007', '완료취소', '완료취소', '완료취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'WOR', 'TAS_WOR_I_003', 'TAS_WOR_I_004', 'CTL_TYPE_DANGER', '[
    {"field":"ass_emp_id", "value":""}
]', 'CTN_WOR_I_CANCEL'),	/* 완료 -> 취소 */


/* (기술지원 내역서)정기점검 */
('CTL_WOR_M_001', '할당', '할당', '할당', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, false, 1, 
 'WOR', 'TAS_WOR_M_001', 'TAS_WOR_M_003', 'CTL_TYPE_PRIMARY', '[
    {"field":"ass_emp_id", "value":"#{box.charge_emp_id}"}
]', 'CTN_WOR_M_ASSIGN'),	/* 릴레이션 - 할당 -> 진행 */

-- 사용안함 시작
('CTL_WOR_M_002', '임시저장', '임시저장', '임시저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAS_WOR_M_001', 'TAS_WOR_M_002', 'CTL_TYPE_SECONDARY', '[
    {"field":"ass_emp_id", "value":"#{box.charge_emp_id}"}
]', null),	/* 등록 -> 임시저장 */
('CTL_WOR_M_003', '진행', '진행', '진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'WOR', 'TAS_WOR_M_001', 'TAS_WOR_M_003', 'CTL_TYPE_PRIMARY', '[
    {"field":"ass_emp_id", "value":"#{box.charge_emp_id}"}
]', 'CTN_WOR_M_ASSIGN'),	/* 등록 -> 진행 */

('CTL_WOR_M_004', '저장', '저장', '저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAS_WOR_M_002', 'TAS_WOR_M_002', 'CTL_TYPE_SECONDARY', '[
    {"field":"ass_emp_id", "value":"#{box.charge_emp_id}"}
]', null),	/* 임시저장 -> 임시저장 */
('CTL_WOR_M_005', '진행', '진행', '진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'WOR', 'TAS_WOR_M_002', 'TAS_WOR_M_003', 'CTL_TYPE_PRIMARY', '[
    {"field":"ass_emp_id", "value":"#{box.charge_emp_id}"}
]', 'CTN_WOR_M_ASSIGN'),	/* 임시저장 -> 진행 */
-- 사용안함 끝

('CTL_WOR_M_006', '저장', '저장', '저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAS_WOR_M_003', 'TAS_WOR_M_003', 'CTL_TYPE_SECONDARY', '[
    {"field":"ass_emp_id", "value":"#{box.charge_emp_id}"}
]', null),	/* 진행 -> 진행 */
('CTL_WOR_M_007', '완료', '완료', '완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'WOR', 'TAS_WOR_M_003', 'TAS_WOR_M_004', 'CTL_TYPE_PRIMARY', '[
    {"field":"ass_emp_id", "value":"#{box.charge_emp_id}"},
    {"field":"clo_emp_id", "value":"#{user.id}"},
    {"field":"clo_date", "value":"#{date.curDTTM}"}
]', 'CTN_WOR_M_CLOSE'),	/* 진행 -> 완료 */
('CTL_WOR_M_008', '등록취소', '등록취소', '등록취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'WOR', 'TAS_WOR_M_003', 'TAS_WOR_M_005', 'CTL_TYPE_DANGER', '[
    {"field":"ass_emp_id", "value":""},
    {"field":"clo_emp_id", "value":"#{user.id}"},
    {"field":"clo_date", "value":"#{date.curDTTM}"}
]', 'CTN_WOR_M_CANCEL'),	/* 진행 -> 취소 */

('CTL_WOR_M_009', '저장', '저장', '저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAS_WOR_M_004', 'TAS_WOR_M_004', 'CTL_TYPE_SECONDARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"}
]', null),	/* 완료 -> 완료 */
('CTL_WOR_M_010', '완료취소', '완료취소', '완료취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'WOR', 'TAS_WOR_M_004', 'TAS_WOR_M_005', 'CTL_TYPE_DANGER', '[
    {"field":"ass_emp_id", "value":""}
]', 'CTN_WOR_M_CANCEL');	/* 완료 -> 취소 */


/* Form */
INSERT INTO RSHM.TAB_FORM
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TAS_ID, CONFIG, SCRIPT )
VALUES
('FRM_WOR_T_001', '업무지원 - 진행', '업무지원 - 진행', '업무지원 - 진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAS_WOR_T_001',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/wor/saveForm"
    },
    "external": {
        "timeline": true
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"src_id", "fld_id":"TAB_WORKORDER/SRC_ID", "label":"상위 티켓 정보", "placeholder":"상위 티켓 정보", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Ticket", "config":"", "action": { "type":"", "event":""} },
        {"id":"id", "fld_id":"TAB_WORKORDER/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_WORKORDER/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_date", "fld_id":"TAB_WORKORDER/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_WORKORDER/REQ_EMP_ID", "label":"요청자(담당영업)", "placeholder":"요청자(담당영업)를 선택하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"crm_id", "fld_id":"TAB_WORKORDER/CRM_ID", "label":"영업기회 코드", "placeholder":"영업기회 코드를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelectCRM", "config": [{\"id\":\"table\", \"value\": \"tab_crm\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"product_cd", "fld_id":"TAB_WORKORDER/PRODUCT_CD", "label":"제품", "placeholder":"제품을 선택하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.Group.SearchSelect", "config": "2", "action": { "type":"", "event":""} },
        {"id":"charge_emp_id", "fld_id":"TAB_WORKORDER/CHARGE_EMP_ID", "label":"엔지니어", "placeholder":"엔지니어를 선택하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"cat_cd", "fld_id":"TAB_WORKORDER/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.", "group":"group_002", "x":1, "y":3, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },

        {"id":"support_city", "fld_id":"TAB_WORKORDER/SUPPORT_CITY", "label":"지원 도시", "placeholder":"지원 도시를 입력하세요.", "group":"group_002", "x":1, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"support_location", "fld_id":"TAB_WORKORDER/SUPPORT_LOCATION", "label":"지원 장소", "placeholder":"지원 장소를 입력하세요.", "group":"group_002", "x":2, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer", "fld_id":"TAB_WORKORDER/CUSTOMER", "label":"고객명(회사명)", "placeholder":"고객명(회사명)을 입력하세요.", "group":"group_002", "x":1, "y":5, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer_contact", "fld_id":"TAB_WORKORDER/CUSTOMER_CONTACT", "label":"고객 담당자", "placeholder":"고객 담당자를 입력하세요.", "group":"group_002", "x":2, "y":5, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"plan_start_date", "fld_id":"TAB_WORKORDER/PLAN_START_DATE", "label":"작업 예정일시", "placeholder":"작업 예정일시를 입력하세요.", "group":"group_002", "x":1, "y":6, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"plan_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"act_start_date", "fld_id":"TAB_WORKORDER/ACT_START_DATE", "label":"작업 실제일시", "placeholder":"작업 실제일시를 입력하세요.", "group":"group_002", "x":1, "y":7, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"act_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"src_content", "fld_id":"TAB_WORKORDER/SRC_CONTENT", "label":"고객요청사항", "placeholder":"고객요청사항을 입력하세요.", "group":"group_002", "x":1, "y":8, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"content", "fld_id":"TAB_WORKORDER/CONTENT", "label":"지원내역", "placeholder":"지원내역을 입력하세요.", "group":"group_002", "x":1, "y":9, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"etc_content", "fld_id":"TAB_WORKORDER/ETC_CONTENT", "label":"특이사항", "placeholder":"특이사항을 입력하세요.", "group":"group_002", "x":1, "y":10, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/wor/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 업무지원 - 진행 */
('FRM_WOR_T_002', '업무지원 - 완료', '업무지원 - 완료', '업무지원 - 완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAS_WOR_T_002',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/wor/saveForm"
    },
    "external": {
        "timeline": true
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"src_id", "fld_id":"TAB_WORKORDER/SRC_ID", "label":"상위 티켓 정보", "placeholder":"상위 티켓 정보", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Ticket", "config":"", "action": { "type":"", "event":""} },
        {"id":"id", "fld_id":"TAB_WORKORDER/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_WORKORDER/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_date", "fld_id":"TAB_WORKORDER/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_WORKORDER/REQ_EMP_ID", "label":"요청자(담당영업)", "placeholder":"요청자(담당영업)를 선택하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"crm_id", "fld_id":"TAB_WORKORDER/CRM_ID", "label":"영업기회 코드", "placeholder":"영업기회 코드를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelectCRM", "config": [{\"id\":\"table\", \"value\": \"tab_crm\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"product_cd", "fld_id":"TAB_WORKORDER/PRODUCT_CD", "label":"제품", "placeholder":"제품을 선택하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.Group.SearchSelect", "config": "2", "action": { "type":"", "event":""} },
        {"id":"charge_emp_id", "fld_id":"TAB_WORKORDER/CHARGE_EMP_ID", "label":"엔지니어", "placeholder":"엔지니어를 선택하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"cat_cd", "fld_id":"TAB_WORKORDER/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.", "group":"group_002", "x":1, "y":3, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },

        {"id":"support_city", "fld_id":"TAB_WORKORDER/SUPPORT_CITY", "label":"지원 도시", "placeholder":"지원 도시를 입력하세요.", "group":"group_002", "x":1, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"support_location", "fld_id":"TAB_WORKORDER/SUPPORT_LOCATION", "label":"지원 장소", "placeholder":"지원 장소를 입력하세요.", "group":"group_002", "x":2, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer", "fld_id":"TAB_WORKORDER/CUSTOMER", "label":"고객명(회사명)", "placeholder":"고객명(회사명)을 입력하세요.", "group":"group_002", "x":1, "y":5, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer_contact", "fld_id":"TAB_WORKORDER/CUSTOMER_CONTACT", "label":"고객 담당자", "placeholder":"고객 담당자를 입력하세요.", "group":"group_002", "x":2, "y":5, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"plan_start_date", "fld_id":"TAB_WORKORDER/PLAN_START_DATE", "label":"작업 예정일시", "placeholder":"작업 예정일시를 입력하세요.", "group":"group_002", "x":1, "y":6, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"plan_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"act_start_date", "fld_id":"TAB_WORKORDER/ACT_START_DATE", "label":"작업 실제일시", "placeholder":"작업 실제일시를 입력하세요.", "group":"group_002", "x":1, "y":7, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"act_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"src_content", "fld_id":"TAB_WORKORDER/SRC_CONTENT", "label":"고객요청사항", "placeholder":"고객요청사항을 입력하세요.", "group":"group_002", "x":1, "y":8, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"content", "fld_id":"TAB_WORKORDER/CONTENT", "label":"지원내역", "placeholder":"지원내역을 입력하세요.", "group":"group_002", "x":1, "y":9, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"etc_content", "fld_id":"TAB_WORKORDER/ETC_CONTENT", "label":"특이사항", "placeholder":"특이사항을 입력하세요.", "group":"group_002", "x":1, "y":10, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/wor/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 업무지원 - 완료 */
('FRM_WOR_T_003', '업무지원 - 취소', '업무지원 - 취소', '업무지원 - 취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAS_WOR_T_003',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/wor/saveForm"
    },
    "external": {
        "timeline": true
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"src_id", "fld_id":"TAB_WORKORDER/SRC_ID", "label":"상위 티켓 정보", "placeholder":"상위 티켓 정보", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Ticket", "config":"", "action": { "type":"", "event":""} },
        {"id":"id", "fld_id":"TAB_WORKORDER/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_WORKORDER/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_date", "fld_id":"TAB_WORKORDER/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_WORKORDER/REQ_EMP_ID", "label":"요청자(담당영업)", "placeholder":"요청자(담당영업)를 선택하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"crm_id", "fld_id":"TAB_WORKORDER/CRM_ID", "label":"영업기회 코드", "placeholder":"영업기회 코드를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelectCRM", "config": [{\"id\":\"table\", \"value\": \"tab_crm\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"product_cd", "fld_id":"TAB_WORKORDER/PRODUCT_CD", "label":"제품", "placeholder":"제품을 선택하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Code.Group.SearchSelect", "config": "2", "action": { "type":"", "event":""} },
        {"id":"charge_emp_id", "fld_id":"TAB_WORKORDER/CHARGE_EMP_ID", "label":"엔지니어", "placeholder":"엔지니어를 선택하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"cat_cd", "fld_id":"TAB_WORKORDER/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.", "group":"group_002", "x":1, "y":3, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },

        {"id":"support_city", "fld_id":"TAB_WORKORDER/SUPPORT_CITY", "label":"지원 도시", "placeholder":"지원 도시를 입력하세요.", "group":"group_002", "x":1, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"support_location", "fld_id":"TAB_WORKORDER/SUPPORT_LOCATION", "label":"지원 장소", "placeholder":"지원 장소를 입력하세요.", "group":"group_002", "x":2, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer", "fld_id":"TAB_WORKORDER/CUSTOMER", "label":"고객명(회사명)", "placeholder":"고객명(회사명)을 입력하세요.", "group":"group_002", "x":1, "y":5, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer_contact", "fld_id":"TAB_WORKORDER/CUSTOMER_CONTACT", "label":"고객 담당자", "placeholder":"고객 담당자를 입력하세요.", "group":"group_002", "x":2, "y":5, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"plan_start_date", "fld_id":"TAB_WORKORDER/PLAN_START_DATE", "label":"작업 예정일시", "placeholder":"작업 예정일시를 입력하세요.", "group":"group_002", "x":1, "y":6, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"plan_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"act_start_date", "fld_id":"TAB_WORKORDER/ACT_START_DATE", "label":"작업 실제일시", "placeholder":"작업 실제일시를 입력하세요.", "group":"group_002", "x":1, "y":7, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"act_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"src_content", "fld_id":"TAB_WORKORDER/SRC_CONTENT", "label":"고객요청사항", "placeholder":"고객요청사항을 입력하세요.", "group":"group_002", "x":1, "y":8, "cols":12, "rows": 3, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"content", "fld_id":"TAB_WORKORDER/CONTENT", "label":"지원내역", "placeholder":"지원내역을 입력하세요.", "group":"group_002", "x":1, "y":9, "cols":12, "rows": 3, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"etc_content", "fld_id":"TAB_WORKORDER/ETC_CONTENT", "label":"특이사항", "placeholder":"특이사항을 입력하세요.", "group":"group_002", "x":1, "y":10, "cols":12, "rows": 3, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/wor/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 업무지원 - 취소 */

('FRM_WOR_I_001', '내부업무 - 등록', '내부업무 - 등록', '내부업무 - 등록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAS_WOR_I_001',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/wor/saveForm"
    },
    "external": {
        "timeline": true
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"type_cd", "fld_id":"TAB_WORKORDER/TYPE_CD", "label":"등록 유형", "placeholder":"등록 유형을 선택하세요.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"SHM_TYPE_INTERNAL", "readonly":true, "hidden":true, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_WORKORDER/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"cat_cd", "fld_id":"TAB_WORKORDER/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"SHM_CATALOG_011", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"charge_emp_id", "fld_id":"TAB_WORKORDER/CHARGE_EMP_ID", "label":"엔지니어", "placeholder":"엔지니어를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":6, "rows":1, "def_val":"#{user.id}", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"plan_start_date", "fld_id":"TAB_WORKORDER/PLAN_START_DATE", "label":"작업 예정일시", "placeholder":"시작일시를 입력하세요.", "group":"group_002", "x":1, "y":2, "cols":12, "rows":1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"plan_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"act_start_date", "fld_id":"TAB_WORKORDER/ACT_START_DATE", "label":"작업 실제일시", "placeholder":"시작일시를 입력하세요.", "group":"group_002", "x":1, "y":3, "cols":12, "rows":1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"act_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"content", "fld_id":"TAB_WORKORDER/CONTENT", "label":"업무내역", "placeholder":"업무내역을 입력하세요.", "group":"group_002", "x":1, "y":4, "cols":12, "rows":3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"etc_content", "fld_id":"TAB_WORKORDER/ETC_CONTENT", "label":"특이사항", "placeholder":"특이사항을 입력하세요.", "group":"group_002", "x":1, "y":5, "cols":12, "rows":3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/wor/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 내부업무 - 등록 */
('FRM_WOR_I_002', '내부업무 - 임시저장', '내부업무 - 임시저장', '내부업무 - 임시저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAS_WOR_I_002',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/wor/saveForm"
    },
    "external": {
        "timeline": true
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_WORKORDER/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_WORKORDER/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"cat_cd", "fld_id":"TAB_WORKORDER/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"SHM_CATALOG_011", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"charge_emp_id", "fld_id":"TAB_WORKORDER/CHARGE_EMP_ID", "label":"엔지니어", "placeholder":"엔지니어를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"#{user.id}", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"plan_start_date", "fld_id":"TAB_WORKORDER/PLAN_START_DATE", "label":"작업 예정일시", "placeholder":"작업 예정일시를 입력하세요.", "group":"group_002", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"plan_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"act_start_date", "fld_id":"TAB_WORKORDER/ACT_START_DATE", "label":"작업 실제일시", "placeholder":"작업 실제일시를 입력하세요.", "group":"group_002", "x":1, "y":3, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"act_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"content", "fld_id":"TAB_WORKORDER/CONTENT", "label":"업무내역", "placeholder":"업무내역을 입력하세요.", "group":"group_002", "x":1, "y":4, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"etc_content", "fld_id":"TAB_WORKORDER/ETC_CONTENT", "label":"특이사항", "placeholder":"특이사항을 입력하세요.", "group":"group_002", "x":1, "y":5, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/wor/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 내부업무 - 임시저장 */
('FRM_WOR_I_003', '내부업무 - 완료', '내부업무 - 완료', '내부업무 - 완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAS_WOR_I_003',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/wor/saveForm"
    },
    "external": {
        "timeline": true
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_WORKORDER/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_WORKORDER/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"cat_cd", "fld_id":"TAB_WORKORDER/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"charge_emp_id", "fld_id":"TAB_WORKORDER/CHARGE_EMP_ID", "label":"엔지니어", "placeholder":"엔지니어를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"plan_start_date", "fld_id":"TAB_WORKORDER/PLAN_START_DATE", "label":"작업 예정일시", "placeholder":"작업 예정일시를 입력하세요.", "group":"group_002", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"plan_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"act_start_date", "fld_id":"TAB_WORKORDER/ACT_START_DATE", "label":"작업 실제일시", "placeholder":"작업 실제일시를 입력하세요.", "group":"group_002", "x":1, "y":3, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"act_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"content", "fld_id":"TAB_WORKORDER/CONTENT", "label":"업무내역", "placeholder":"업무내역을 입력하세요.", "group":"group_002", "x":1, "y":4, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"etc_content", "fld_id":"TAB_WORKORDER/ETC_CONTENT", "label":"특이사항", "placeholder":"특이사항을 입력하세요.", "group":"group_002", "x":1, "y":5, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/wor/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 내부업무 - 완료 */
('FRM_WOR_I_004', '내부업무 - 취소', '내부업무 - 취소', '내부업무 - 취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAS_WOR_I_004',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/wor/saveForm"
    },
    "external": {
        "timeline": true
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": false },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": false }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_WORKORDER/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_WORKORDER/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"cat_cd", "fld_id":"TAB_WORKORDER/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"charge_emp_id", "fld_id":"TAB_WORKORDER/CHARGE_EMP_ID", "label":"엔지니어", "placeholder":"엔지니어를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"plan_start_date", "fld_id":"TAB_WORKORDER/PLAN_START_DATE", "label":"작업 예정일시", "placeholder":"작업 예정일시를 입력하세요.", "group":"group_002", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"plan_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"act_start_date", "fld_id":"TAB_WORKORDER/ACT_START_DATE", "label":"작업 실제일시", "placeholder":"작업 실제일시를 입력하세요.", "group":"group_002", "x":1, "y":3, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"act_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"content", "fld_id":"TAB_WORKORDER/CONTENT", "label":"업무내역", "placeholder":"업무내역을 입력하세요.", "group":"group_002", "x":1, "y":4, "cols":12, "rows": 3, "def_val":"", "readonly":true, "hidden":true, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"etc_content", "fld_id":"TAB_WORKORDER/ETC_CONTENT", "label":"특이사항", "placeholder":"특이사항을 입력하세요.", "group":"group_002", "x":1, "y":5, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":true, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/ent/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 내부업무 - 취소 */

('FRM_WOR_M_001', '정기점검 - 등록', '정기점검 - 등록', '정기점검 - 등록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAS_WOR_M_001',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/wor/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"type_cd", "fld_id":"TAB_WORKORDER/TYPE_CD", "label":"등록 유형", "placeholder":"등록 유형을 선택하세요.", "group":"group_001", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"SHM_TYPE_MAINTENANCE", "readonly":true, "hidden":true, "require":true, "uiitem":"Code.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"src_id", "fld_id":"TAB_WORKORDER/SRC_ID", "label":"상위 티켓 정보", "placeholder":"상위 티켓 정보", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Ticket", "config":"", "action": { "type":"", "event":""} },
        {"id":"id", "fld_id":"TAB_WORKORDER/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_WORKORDER/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_date", "fld_id":"TAB_WORKORDER/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"#{date.curDT}", "readonly":true, "hidden":false, "require":false, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_WORKORDER/REQ_EMP_ID", "label":"요청자(담당영업)", "placeholder":"요청자(담당영업)를 선택하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"crm_id", "fld_id":"TAB_WORKORDER/CRM_ID", "label":"영업기회 코드", "placeholder":"영업기회 코드를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.SearchSelectCRM", "config": [{\"id\":\"table\", \"value\": \"tab_crm\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"product_cd", "fld_id":"TAB_WORKORDER/PRODUCT_CD", "label":"제품", "placeholder":"제품을 선택하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.Group.SearchSelect", "config": "2", "action": { "type":"", "event":""} },
        {"id":"charge_emp_id", "fld_id":"TAB_WORKORDER/CHARGE_EMP_ID", "label":"엔지니어", "placeholder":"엔지니어를 선택하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"#{user.id}", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"cat_cd", "fld_id":"TAB_WORKORDER/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.", "group":"group_002", "x":1, "y":3, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },

        {"id":"support_city", "fld_id":"TAB_WORKORDER/SUPPORT_CITY", "label":"지원 도시", "placeholder":"지원 도시를 입력하세요.", "group":"group_002", "x":1, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"support_location", "fld_id":"TAB_WORKORDER/SUPPORT_LOCATION", "label":"지원 장소", "placeholder":"지원 장소를 입력하세요.", "group":"group_002", "x":2, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer", "fld_id":"TAB_WORKORDER/CUSTOMER", "label":"고객명(회사명)", "placeholder":"고객명(회사명)을 입력하세요.", "group":"group_002", "x":1, "y":5, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer_contact", "fld_id":"TAB_WORKORDER/CUSTOMER_CONTACT", "label":"고객 담당자", "placeholder":"고객 담당자를 입력하세요.", "group":"group_002", "x":2, "y":5, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"plan_start_date", "fld_id":"TAB_WORKORDER/PLAN_START_DATE", "label":"작업 예정일시", "placeholder":"작업 예정일시를 입력하세요.", "group":"group_002", "x":1, "y":6, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"plan_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"act_start_date", "fld_id":"TAB_WORKORDER/ACT_START_DATE", "label":"작업 실제일시", "placeholder":"작업 실제일시를 입력하세요.", "group":"group_002", "x":1, "y":7, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"act_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"src_content", "fld_id":"TAB_WORKORDER/SRC_CONTENT", "label":"고객요청사항", "placeholder":"고객요청사항을 입력하세요.", "group":"group_002", "x":1, "y":8, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"content", "fld_id":"TAB_WORKORDER/CONTENT", "label":"지원내역", "placeholder":"지원내역을 입력하세요.", "group":"group_002", "x":1, "y":9, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"etc_content", "fld_id":"TAB_WORKORDER/ETC_CONTENT", "label":"특이사항", "placeholder":"특이사항을 입력하세요.", "group":"group_002", "x":1, "y":10, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/wor/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 정기점검 - 등록 */
('FRM_WOR_M_002', '정기점검 - 임시저장', '정기점검 - 임시저장', '정기점검 - 임시저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAS_WOR_M_002',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/wor/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"src_id", "fld_id":"TAB_WORKORDER/SRC_ID", "label":"상위 티켓 정보", "placeholder":"상위 티켓 정보", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Ticket", "config":"", "action": { "type":"", "event":""} },
        {"id":"id", "fld_id":"TAB_WORKORDER/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_WORKORDER/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_date", "fld_id":"TAB_WORKORDER/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_WORKORDER/REQ_EMP_ID", "label":"요청자(담당영업)", "placeholder":"요청자(담당영업)를 선택하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"crm_id", "fld_id":"TAB_WORKORDER/CRM_ID", "label":"영업기회 코드", "placeholder":"영업기회 코드를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.SearchSelectCRM", "config": [{\"id\":\"table\", \"value\": \"tab_crm\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"product_cd", "fld_id":"TAB_WORKORDER/PRODUCT_CD", "label":"제품", "placeholder":"제품을 선택하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.Group.SearchSelect", "config": "2", "action": { "type":"", "event":""} },
        {"id":"charge_emp_id", "fld_id":"TAB_WORKORDER/CHARGE_EMP_ID", "label":"엔지니어", "placeholder":"엔지니어를 선택하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"#{user.id}", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"cat_cd", "fld_id":"TAB_WORKORDER/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.", "group":"group_002", "x":1, "y":3, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },

        {"id":"support_city", "fld_id":"TAB_WORKORDER/SUPPORT_CITY", "label":"지원 도시", "placeholder":"지원 도시를 입력하세요.", "group":"group_002", "x":1, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"support_location", "fld_id":"TAB_WORKORDER/SUPPORT_LOCATION", "label":"지원 장소", "placeholder":"지원 장소를 입력하세요.", "group":"group_002", "x":2, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer", "fld_id":"TAB_WORKORDER/CUSTOMER", "label":"고객명(회사명)", "placeholder":"고객명(회사명)을 입력하세요.", "group":"group_002", "x":1, "y":5, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer_contact", "fld_id":"TAB_WORKORDER/CUSTOMER_CONTACT", "label":"고객 담당자", "placeholder":"고객 담당자를 입력하세요.", "group":"group_002", "x":2, "y":5, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"plan_start_date", "fld_id":"TAB_WORKORDER/PLAN_START_DATE", "label":"작업 예정일시", "placeholder":"작업 예정일시를 입력하세요.", "group":"group_002", "x":1, "y":6, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"plan_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"act_start_date", "fld_id":"TAB_WORKORDER/ACT_START_DATE", "label":"작업 실제일시", "placeholder":"작업 실제일시를 입력하세요.", "group":"group_002", "x":1, "y":7, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"act_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"src_content", "fld_id":"TAB_WORKORDER/SRC_CONTENT", "label":"고객요청사항", "placeholder":"고객요청사항을 입력하세요.", "group":"group_002", "x":1, "y":8, "cols":12, "rows": 3, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"content", "fld_id":"TAB_WORKORDER/CONTENT", "label":"지원내역", "placeholder":"지원내역을 입력하세요.", "group":"group_002", "x":1, "y":9, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"etc_content", "fld_id":"TAB_WORKORDER/ETC_CONTENT", "label":"특이사항", "placeholder":"특이사항을 입력하세요.", "group":"group_002", "x":1, "y":10, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/wor/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 정기점검 - 임시저장 */
('FRM_WOR_M_003', '정기점검 - 진행', '정기점검 - 진행', '정기점검 - 진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAS_WOR_M_003',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/wor/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"src_id", "fld_id":"TAB_WORKORDER/SRC_ID", "label":"상위 티켓 정보", "placeholder":"상위 티켓 정보", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Ticket", "config":"", "action": { "type":"", "event":""} },
        {"id":"id", "fld_id":"TAB_WORKORDER/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_WORKORDER/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_date", "fld_id":"TAB_WORKORDER/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_WORKORDER/REQ_EMP_ID", "label":"요청자(담당영업)", "placeholder":"요청자(담당영업)를 선택하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"crm_id", "fld_id":"TAB_WORKORDER/CRM_ID", "label":"영업기회 코드", "placeholder":"영업기회 코드를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelectCRM", "config": [{\"id\":\"table\", \"value\": \"tab_crm\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"product_cd", "fld_id":"TAB_WORKORDER/PRODUCT_CD", "label":"제품", "placeholder":"제품을 선택하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Code.Group.SearchSelect", "config": "2", "action": { "type":"", "event":""} },
        {"id":"charge_emp_id", "fld_id":"TAB_WORKORDER/CHARGE_EMP_ID", "label":"엔지니어", "placeholder":"엔지니어를 선택하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"cat_cd", "fld_id":"TAB_WORKORDER/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.", "group":"group_002", "x":1, "y":3, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },

        {"id":"support_city", "fld_id":"TAB_WORKORDER/SUPPORT_CITY", "label":"지원 도시", "placeholder":"지원 도시를 입력하세요.", "group":"group_002", "x":1, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"support_location", "fld_id":"TAB_WORKORDER/SUPPORT_LOCATION", "label":"지원 장소", "placeholder":"지원 장소를 입력하세요.", "group":"group_002", "x":2, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer", "fld_id":"TAB_WORKORDER/CUSTOMER", "label":"고객명(회사명)", "placeholder":"고객명(회사명)을 입력하세요.", "group":"group_002", "x":1, "y":5, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer_contact", "fld_id":"TAB_WORKORDER/CUSTOMER_CONTACT", "label":"고객 담당자", "placeholder":"고객 담당자를 입력하세요.", "group":"group_002", "x":2, "y":5, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"plan_start_date", "fld_id":"TAB_WORKORDER/PLAN_START_DATE", "label":"작업 예정일시", "placeholder":"작업 예정일시를 입력하세요.", "group":"group_002", "x":1, "y":6, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"plan_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"act_start_date", "fld_id":"TAB_WORKORDER/ACT_START_DATE", "label":"작업 실제일시", "placeholder":"작업 실제일시를 입력하세요.", "group":"group_002", "x":1, "y":7, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"act_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"src_content", "fld_id":"TAB_WORKORDER/SRC_CONTENT", "label":"고객요청사항", "placeholder":"고객요청사항을 입력하세요.", "group":"group_002", "x":1, "y":8, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"content", "fld_id":"TAB_WORKORDER/CONTENT", "label":"지원내역", "placeholder":"지원내역을 입력하세요.", "group":"group_002", "x":1, "y":9, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"etc_content", "fld_id":"TAB_WORKORDER/ETC_CONTENT", "label":"특이사항", "placeholder":"특이사항을 입력하세요.", "group":"group_002", "x":1, "y":10, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/wor/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 정기점검 - 진행 */
('FRM_WOR_M_004', '정기점검 - 완료', '정기점검 - 완료', '정기점검 - 완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAS_WOR_M_004',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/wor/saveForm"
    },
    "external": {
        "timeline": true
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"src_id", "fld_id":"TAB_WORKORDER/SRC_ID", "label":"상위 티켓 정보", "placeholder":"상위 티켓 정보", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Ticket", "config":"", "action": { "type":"", "event":""} },
        {"id":"id", "fld_id":"TAB_WORKORDER/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_WORKORDER/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_date", "fld_id":"TAB_WORKORDER/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_WORKORDER/REQ_EMP_ID", "label":"요청자(담당영업)", "placeholder":"요청자(담당영업)를 선택하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"crm_id", "fld_id":"TAB_WORKORDER/CRM_ID", "label":"영업기회 코드", "placeholder":"영업기회 코드를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelectCRM", "config": [{\"id\":\"table\", \"value\": \"tab_crm\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"product_cd", "fld_id":"TAB_WORKORDER/PRODUCT_CD", "label":"제품", "placeholder":"제품을 선택하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.Group.SearchSelect", "config": "2", "action": { "type":"", "event":""} },
        {"id":"charge_emp_id", "fld_id":"TAB_WORKORDER/CHARGE_EMP_ID", "label":"엔지니어", "placeholder":"엔지니어를 선택하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"cat_cd", "fld_id":"TAB_WORKORDER/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.", "group":"group_002", "x":1, "y":3, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },

        {"id":"support_city", "fld_id":"TAB_WORKORDER/SUPPORT_CITY", "label":"지원 도시", "placeholder":"지원 도시를 입력하세요.", "group":"group_002", "x":1, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"support_location", "fld_id":"TAB_WORKORDER/SUPPORT_LOCATION", "label":"지원 장소", "placeholder":"지원 장소를 입력하세요.", "group":"group_002", "x":2, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer", "fld_id":"TAB_WORKORDER/CUSTOMER", "label":"고객명(회사명)", "placeholder":"고객명(회사명)을 입력하세요.", "group":"group_002", "x":1, "y":5, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer_contact", "fld_id":"TAB_WORKORDER/CUSTOMER_CONTACT", "label":"고객 담당자", "placeholder":"고객 담당자를 입력하세요.", "group":"group_002", "x":2, "y":5, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"plan_start_date", "fld_id":"TAB_WORKORDER/PLAN_START_DATE", "label":"작업 예정일시", "placeholder":"작업 예정일시를 입력하세요.", "group":"group_002", "x":1, "y":6, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"plan_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"act_start_date", "fld_id":"TAB_WORKORDER/ACT_START_DATE", "label":"작업 실제일시", "placeholder":"작업 실제일시를 입력하세요.", "group":"group_002", "x":1, "y":7, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"act_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"src_content", "fld_id":"TAB_WORKORDER/SRC_CONTENT", "label":"고객요청사항", "placeholder":"고객요청사항을 입력하세요.", "group":"group_002", "x":1, "y":8, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"content", "fld_id":"TAB_WORKORDER/CONTENT", "label":"지원내역", "placeholder":"지원내역을 입력하세요.", "group":"group_002", "x":1, "y":9, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"etc_content", "fld_id":"TAB_WORKORDER/ETC_CONTENT", "label":"특이사항", "placeholder":"특이사항을 입력하세요.", "group":"group_002", "x":1, "y":10, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/wor/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 정기점검 - 완료 */
('FRM_WOR_M_005', '정기점검 - 취소', '정기점검 - 취소', '정기점검 - 취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAS_WOR_M_005',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/wor/saveForm"
    },
    "external": {
        "timeline": true
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"src_id", "fld_id":"TAB_WORKORDER/SRC_ID", "label":"상위 티켓 정보", "placeholder":"상위 티켓 정보", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Ticket", "config":"", "action": { "type":"", "event":""} },
        {"id":"id", "fld_id":"TAB_WORKORDER/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_WORKORDER/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_date", "fld_id":"TAB_WORKORDER/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_WORKORDER/REQ_EMP_ID", "label":"요청자(담당영업)", "placeholder":"요청자(담당영업)를 선택하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"crm_id", "fld_id":"TAB_WORKORDER/CRM_ID", "label":"영업기회 코드", "placeholder":"영업기회 코드를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelectCRM", "config": [{\"id\":\"table\", \"value\": \"tab_crm\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"product_cd", "fld_id":"TAB_WORKORDER/PRODUCT_CD", "label":"제품", "placeholder":"제품을 선택하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Code.Group.SearchSelect", "config": "2", "action": { "type":"", "event":""} },
        {"id":"charge_emp_id", "fld_id":"TAB_WORKORDER/CHARGE_EMP_ID", "label":"엔지니어", "placeholder":"엔지니어를 선택하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"cat_cd", "fld_id":"TAB_WORKORDER/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.", "group":"group_002", "x":1, "y":3, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },

        {"id":"support_city", "fld_id":"TAB_WORKORDER/SUPPORT_CITY", "label":"지원 도시", "placeholder":"지원 도시를 입력하세요.", "group":"group_002", "x":1, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"support_location", "fld_id":"TAB_WORKORDER/SUPPORT_LOCATION", "label":"지원 장소", "placeholder":"지원 장소를 입력하세요.", "group":"group_002", "x":2, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer", "fld_id":"TAB_WORKORDER/CUSTOMER", "label":"고객명(회사명)", "placeholder":"고객명(회사명)을 입력하세요.", "group":"group_002", "x":1, "y":5, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer_contact", "fld_id":"TAB_WORKORDER/CUSTOMER_CONTACT", "label":"고객 담당자", "placeholder":"고객 담당자를 입력하세요.", "group":"group_002", "x":2, "y":5, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"plan_start_date", "fld_id":"TAB_WORKORDER/PLAN_START_DATE", "label":"작업 예정일시", "placeholder":"작업 예정일시를 입력하세요.", "group":"group_002", "x":1, "y":6, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"plan_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"act_start_date", "fld_id":"TAB_WORKORDER/ACT_START_DATE", "label":"작업 실제일시", "placeholder":"작업 실제일시를 입력하세요.", "group":"group_002", "x":1, "y":7, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"act_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} },
        {"id":"src_content", "fld_id":"TAB_WORKORDER/SRC_CONTENT", "label":"고객요청사항", "placeholder":"고객요청사항을 입력하세요.", "group":"group_002", "x":1, "y":8, "cols":12, "rows": 3, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"content", "fld_id":"TAB_WORKORDER/CONTENT", "label":"지원내역", "placeholder":"지원내역을 입력하세요.", "group":"group_002", "x":1, "y":9, "cols":12, "rows": 3, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"etc_content", "fld_id":"TAB_WORKORDER/ETC_CONTENT", "label":"특이사항", "placeholder":"특이사항을 입력하세요.", "group":"group_002", "x":1, "y":10, "cols":12, "rows": 3, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/wor/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 정기점검 - 취소 */

('FRM_WOR_V_001', '휴가', '휴가', '휴가', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/wor/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true }
    ],
     "fields": [ 
        {"id":"type_cd", "fld_id":"TAB_WORKORDER/TYPE_CD", "label":"등록 유형", "placeholder":"등록 유형을 선택하세요.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"SHM_TYPE_VACATION", "readonly":true, "hidden":true, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_WORKORDER/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"휴가", "readonly":true, "hidden":true, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"id", "fld_id":"TAB_WORKORDER/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"vacation_cd", "fld_id":"TAB_WORKORDER/VACATION_CD", "label":"휴가 유형", "placeholder":"휴가 유형을 선택하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config": "2", "action": { "type":"", "event":""} },
        {"id":"charge_emp_id", "fld_id":"TAB_WORKORDER/CHARGE_EMP_ID", "label":"엔지니어", "placeholder":"엔지니어를 선택하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"act_start_date", "fld_id":"TAB_WORKORDER/ACT_START_DATE", "label":"휴가 일시", "placeholder":"휴가 일시를 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"act_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30}, "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": true, "action": "/api/common/wor/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', '');	/* 휴가 */

/* List */
INSERT INTO RSHM.TAB_LIST
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 QUERY, CONFIG, SCRIPT )
VALUES
('LST_WOR_T_001', '(나의 업무)업무지원 목록', '(나의 업무)업무지원 목록', '(나의 업무)업무지원 목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = wor.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       (select name
		  from tab_task
         where id = wor.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = wor.req_emp_id) as req_emp_name ,
       ass_emp_id,
       (select name
         from tab_employee
        where id = wor.ass_emp_id) as ass_emp_name,
       src_id,
       src_ent_id,
       type_cd,
       (select name
         from tab_code
        where id = wor.type_cd) as type_name,
       cat_cd,
       (select name
         from tab_code
        where id = wor.cat_cd) as cat_name,
       content,
       crm_id,
       (select name
          from tab_crm
         where id = wor.crm_id) as crm_name,
       product_cd,
       (select name
          from tab_code
         where id = wor.product_cd) as product_name,
       support_city,
       support_location,
       customer,
       customer_contact,
       charge_emp_id,
       (select name
         from tab_employee
        where id = wor.charge_emp_id) as charge_emp_name,
       date_format(plan_start_date, \'%Y-%m-%d %H:%i\') as plan_start_date,
       date_format(plan_finish_date, \'%Y-%m-%d %H:%i\') as plan_finish_date,
       date_format(act_start_date, \'%Y-%m-%d %H:%i\') as act_start_date,
       date_format(act_finish_date, \'%Y-%m-%d %H:%i\') as act_finish_date
  from tab_workorder wor
 where type_cd = \'SHM_TYPE_LEADER\'
   and tas_id not in (select id from tab_task where type_cd = \'TAS_TYPE_CANCEL\' and ent_id = \'WOR\')
   and charge_emp_id = \'#{user.id}\'', 
 '{
    "sql": {
        "where": true,
        "stmts": [
            { "stmt":"req_date between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"req_date", "param": "start_req_date,end_req_date", "type": "range-date", "require": true},
            { "stmt":"id like concat(\'%\', ?, \'%\')", "id":"id", "param": "id", "type": "text", "require": false},
            { "stmt":"crm_id like concat(\'%\', ?, \'%\')", "id":"crm_id", "param": "crm_id", "type": "text", "require": false},
            { "stmt":"crm_id in (select id from tab_crm where name like concat(\'%\', ?, \'%\'))", "id":"crm_name", "param": "crm_name", "type": "text", "require": false},
            { "stmt":"charge_emp_id in (select id from tab_employee where name like concat(\'%\', ?, \'%\'))", "id":"charge_emp_name", "param": "charge_emp_name", "type": "text", "require": false}
        ]
    },
    "action": {
        "create_btn": {
            "use": false,
            "title": "등록",
            "url": "",
            "modal_title": ""
        },
        "list_action_btn": {
            "url": "/common/modal/form"
        },
        "export_btn": {
            "use": true,
            "title": "출력",
            "print": true,
            "copy": true,
            "excel": false,
            "csv": false,
            "pdf": false,
            "excel_all": true
        }
    },
    "layout": {
        "list": "/api/common/tablelist",
        "excel": "/api/common/excel"
    },
    "filter": [
        [
            { "id": "req_date", "label": "요청일", "uiitem": "Date.Range.DT", "width": 6, "index": 5, "def_val": "m-1,d+0", "config": "" },
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" }
        ],
        [
            { "id": "crm_id", "label": "영업기회코드", "uiitem": "String.Text", "width": 3, "index": 3, "def_val": "", "config": "" },
            { "id": "crm_name", "label": "영업기회명", "uiitem": "String.Text", "width": 3, "index": 4, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "제목", "data": "name", "type": "view" },
        { "name": "단계", "data": "tas_name", "type": "view" },
        { "name": "영업기회코드", "data": "crm_id", "type": "view" },
        { "name": "영업기회명", "data": "crm_name", "type": "view" },
        { "name": "요청일", "data": "req_date", "type": "view" },
        { "name": "요청자", "data": "req_emp_name", "type": "view" },
        { "name": "등록자", "data": "create_emp_name", "type": "view" },
        { "name": "엔지니어", "data": "charge_emp_name", "type": "view" },
        { "name": "지원 유형", "data": "cat_name", "type": "view" },
        { "name": "제품명", "data": "product_name", "type": "view" },
        { "name": "작업 예정일시(시작)", "data": "plan_start_date", "type": "excel" },
        { "name": "작업 예정일시(종료)", "data": "plan_finish_date", "type": "excel" },
        { "name": "작업 실제일시(시작)", "data": "act_start_date", "type": "excel" },
        { "name": "작업 실제일시(종료)", "data": "act_finish_date", "type": "excel" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "desc" }
}', ''),
('LST_WOR_T_002', '(전체)업무지원 목록', '(전체)업무지원 목록', '(전체)업무지원 목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = wor.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       (select name
		  from tab_task
         where id = wor.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = wor.req_emp_id) as req_emp_name ,
       ass_emp_id,
       (select name
         from tab_employee
        where id = wor.ass_emp_id) as ass_emp_name,
       src_id,
       src_ent_id,
       type_cd,
       (select name
         from tab_code
        where id = wor.type_cd) as type_name,
       cat_cd,
       (select name
         from tab_code
        where id = wor.cat_cd) as cat_name,
       content,
       crm_id,
       (select name
          from tab_crm
         where id = wor.crm_id) as crm_name,
       product_cd,
       (select name
          from tab_code
         where id = wor.product_cd) as product_name,
       support_city,
       support_location,
       customer,
       customer_contact,
       charge_emp_id,
       (select name
         from tab_employee
        where id = wor.charge_emp_id) as charge_emp_name,
       date_format(plan_start_date, \'%Y-%m-%d %H:%i\') as plan_start_date,
       date_format(plan_finish_date, \'%Y-%m-%d %H:%i\') as plan_finish_date,
       date_format(act_start_date, \'%Y-%m-%d %H:%i\') as act_start_date,
       date_format(act_finish_date, \'%Y-%m-%d %H:%i\') as act_finish_date
  from tab_workorder wor
 where type_cd = \'SHM_TYPE_LEADER\'', 
 '{
    "sql": {
        "where": true,
        "stmts": [
            { "stmt":"req_date between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"req_date", "param": "start_req_date,end_req_date", "type": "range-date", "require": true},
            { "stmt":"id like concat(\'%\', ?, \'%\')", "id":"id", "param": "id", "type": "text", "require": false},
            { "stmt":"crm_id like concat(\'%\', ?, \'%\')", "id":"crm_id", "param": "crm_id", "type": "text", "require": false},
            { "stmt":"crm_id in (select id from tab_crm where name like concat(\'%\', ?, \'%\'))", "id":"crm_name", "param": "crm_name", "type": "text", "require": false},
            { "stmt":"charge_emp_id in (select id from tab_employee where name like concat(\'%\', ?, \'%\'))", "id":"charge_emp_name", "param": "charge_emp_name", "type": "text", "require": false}
        ]
    },
    "action": {
        "create_btn": {
            "use": false,
            "title": "등록",
            "url": "",
            "modal_title": ""
        },
        "list_action_btn": {
            "url": "/common/modal/form"
        },
        "export_btn": {
            "use": true,
            "title": "출력",
            "print": true,
            "copy": true,
            "excel": false,
            "csv": false,
            "pdf": false,
            "excel_all": true
        }
    },
    "layout": {
        "list": "/api/common/tablelist",
        "excel": "/api/common/excel"
    },
    "filter": [
        [
            { "id": "req_date", "label": "요청일", "uiitem": "Date.Range.DT", "width": 6, "index": 5, "def_val": "m-1,d+0", "config": "" },
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "charge_emp_id", "label": "엔지니어", "uiitem": "String.Text", "width": 3, "index": 8, "def_val": "", "config": "" }
        ],
        [
            { "id": "crm_id", "label": "영업기회코드", "uiitem": "String.Text", "width": 3, "index": 3, "def_val": "", "config": "" },
            { "id": "crm_name", "label": "영업기회명", "uiitem": "String.Text", "width": 3, "index": 4, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "제목", "data": "name", "type": "view" },
        { "name": "단계", "data": "tas_name", "type": "view" },
        { "name": "영업기회코드", "data": "crm_id", "type": "view" },
        { "name": "영업기회명", "data": "crm_name", "type": "view" },
        { "name": "요청일", "data": "req_date", "type": "view" },
        { "name": "요청자", "data": "req_emp_name", "type": "view" },
        { "name": "등록자", "data": "create_emp_name", "type": "view" },
        { "name": "엔지니어", "data": "charge_emp_name", "type": "view" },
        { "name": "지원 유형", "data": "cat_name", "type": "view" },
        { "name": "제품명", "data": "product_name", "type": "view" },
        { "name": "작업 예정일시(시작)", "data": "plan_start_date", "type": "excel" },
        { "name": "작업 예정일시(종료)", "data": "plan_finish_date", "type": "excel" },
        { "name": "작업 실제일시(시작)", "data": "act_start_date", "type": "excel" },
        { "name": "작업 실제일시(종료)", "data": "act_finish_date", "type": "excel" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "desc" }
}', ''),

('LST_WOR_I_001', '(나의 업무)내부업무 목록', '(나의 업무)내부업무 목록', '(나의 업무)내부업무 목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = wor.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       (select name
		  from tab_task
         where id = wor.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = wor.req_emp_id) as req_emp_name,
       ass_emp_id,
       (select name
         from tab_employee
        where id = wor.ass_emp_id) as ass_emp_name,
       src_id,
       src_ent_id,
       type_cd,
       (select name
         from tab_code
        where id = wor.type_cd) as type_name,
       cat_cd,
       (select name
         from tab_code
        where id = wor.cat_cd) as cat_name,
       content,
       crm_id,
       (select name
          from tab_crm
         where id = wor.crm_id) as crm_name,
       product_cd,
       (select name
          from tab_code
         where id = wor.product_cd) as product_name,
       support_city,
       support_location,
       customer,
       customer_contact,
       charge_emp_id,
       (select name
         from tab_employee
        where id = wor.charge_emp_id) as charge_emp_name,
       date_format(plan_start_date, \'%Y-%m-%d %H:%i\') as plan_start_date,
       date_format(plan_finish_date, \'%Y-%m-%d %H:%i\') as plan_finish_date,
       date_format(act_start_date, \'%Y-%m-%d %H:%i\') as act_start_date,
       date_format(act_finish_date, \'%Y-%m-%d %H:%i\') as act_finish_date
  from tab_workorder wor
 where type_cd = \'SHM_TYPE_INTERNAL\'
   and tas_id not in (select id from tab_task where type_cd = \'TAS_TYPE_CANCEL\' and ent_id = \'WOR\')
   and charge_emp_id = \'#{user.id}\'', 
 '{
    "sql": {
        "where": true,
        "stmts": [
            { "stmt":"create_date between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"req_date", "param": "start_req_date,end_req_date", "type": "range-date", "require": true},
            { "stmt":"id like concat(\'%\', ?, \'%\')", "id":"id", "param": "id", "type": "text", "require": false},
            { "stmt":"create_emp_name in (select id from tab_employee where name like concat(\'%\', ?, \'%\'))", "id":"charge_emp_name", "param": "charge_emp_name", "type": "text", "require": false}
        ]
    },
    "action": {
        "create_btn": {
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_WOR_I_001",
            "modal_title": "내부업무 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form"
        },
        "export_btn": {
            "use": true,
            "title": "출력",
            "print": true,
            "copy": true,
            "excel": false,
            "csv": false,
            "pdf": false,
            "excel_all": true
        }
    },
    "layout": {
        "list": "/api/common/tablelist",
        "excel": "/api/common/excel"
    },
    "filter": [
        [
            { "id": "create_date", "label": "등록일", "uiitem": "Date.Range.DT", "width": 6, "index": 3, "def_val": "m-1,d+0", "config": "" },
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "제목", "data": "name", "type": "view" },
        { "name": "단계", "data": "tas_name", "type": "view" },
        { "name": "등록일", "data": "create_date", "type": "view" },
        { "name": "등록자", "data": "create_emp_name", "type": "view" },
        { "name": "지원 유형", "data": "cat_name", "type": "view" },
        { "name": "작업 예정일시(시작)", "data": "plan_start_date", "type": "excel" },
        { "name": "작업 예정일시(종료)", "data": "plan_finish_date", "type": "excel" },
        { "name": "작업 실제일시(시작)", "data": "act_start_date", "type": "excel" },
        { "name": "작업 실제일시(종료)", "data": "act_finish_date", "type": "excel" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "desc" }
}', ''),
('LST_WOR_I_002', '(전체)내부업무 목록', '(전체)내부업무 목록', '(전체)내부업무 목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = wor.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       (select name
		  from tab_task
         where id = wor.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = wor.req_emp_id) as req_emp_name,
       ass_emp_id,
       (select name
         from tab_employee
        where id = wor.ass_emp_id) as ass_emp_name,
       src_id,
       src_ent_id,
       type_cd,
       (select name
         from tab_code
        where id = wor.type_cd) as type_name,
       cat_cd,
       (select name
         from tab_code
        where id = wor.cat_cd) as cat_name,
       content,
       crm_id,
       (select name
          from tab_crm
         where id = wor.crm_id) as crm_name,
       product_cd,
       (select name
          from tab_code
         where id = wor.product_cd) as product_name,
       support_city,
       support_location,
       customer,
       customer_contact,
       charge_emp_id,
       (select name
         from tab_employee
        where id = wor.charge_emp_id) as charge_emp_name,
       date_format(plan_start_date, \'%Y-%m-%d %H:%i\') as plan_start_date,
       date_format(plan_finish_date, \'%Y-%m-%d %H:%i\') as plan_finish_date,
       date_format(act_start_date, \'%Y-%m-%d %H:%i\') as act_start_date,
       date_format(act_finish_date, \'%Y-%m-%d %H:%i\') as act_finish_date
  from tab_workorder wor
 where type_cd = \'SHM_TYPE_INTERNAL\'', 
 '{
    "sql": {
        "where": true,
        "stmts": [
            { "stmt":"create_date between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"req_date", "param": "start_req_date,end_req_date", "type": "range-date", "require": true},
            { "stmt":"id like concat(\'%\', ?, \'%\')", "id":"id", "param": "id", "type": "text", "require": false},
            { "stmt":"charge_emp_id in (select id from tab_employee where name like concat(\'%\', ?, \'%\'))", "id":"charge_emp_name", "param": "charge_emp_name", "type": "text", "require": false}
        ]
    },
    "action": {
        "create_btn": {
            "use": false,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_WOR_I_001",
            "modal_title": "내부업무 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form"
        },
        "export_btn": {
            "use": true,
            "title": "출력",
            "print": true,
            "copy": true,
            "excel": false,
            "csv": false,
            "pdf": false,
            "excel_all": true
        }
    },
    "layout": {
        "list": "/api/common/tablelist",
        "excel": "/api/common/excel"
    },
    "filter": [
        [
            { "id": "create_date", "label": "등록일", "uiitem": "Date.Range.DT", "width": 6, "index": 3, "def_val": "m-1,d+0", "config": "" },
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "charge_emp_name", "label": "엔지니어", "uiitem": "String.Text", "width": 3, "index": 4, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "제목", "data": "name", "type": "view" },
        { "name": "단계", "data": "tas_name", "type": "view" },
        { "name": "등록일", "data": "create_date", "type": "view" },
        { "name": "엔지니어", "data": "charge_emp_name", "type": "view" },
        { "name": "지원 유형", "data": "cat_name", "type": "view" },
        { "name": "작업 예정일시(시작)", "data": "plan_start_date", "type": "excel" },
        { "name": "작업 예정일시(종료)", "data": "plan_finish_date", "type": "excel" },
        { "name": "작업 실제일시(시작)", "data": "act_start_date", "type": "excel" },
        { "name": "작업 실제일시(종료)", "data": "act_finish_date", "type": "excel" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "desc" }
}', ''),

('LST_WOR_M_001', '(나의 업무)정기점검 처리목록', '(나의 업무)정기점검 처리목록', '(나의 업무)정기점검 처리목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = wor.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       (select name
		  from tab_task
         where id = wor.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = wor.req_emp_id) as req_emp_name,
       ass_emp_id,
       (select name
         from tab_employee
        where id = wor.ass_emp_id) as ass_emp_name,
       src_id,
       src_ent_id,
       type_cd,
       (select name
         from tab_code
        where id = wor.type_cd) as type_name,
       cat_cd,
       (select name
         from tab_code
        where id = wor.cat_cd) as cat_name,
       content,
       crm_id,
       (select name
          from tab_crm
         where id = wor.crm_id) as crm_name,
       product_cd,
       (select name
          from tab_code
         where id = wor.product_cd) as product_name,
       support_city,
       support_location,
       customer,
       customer_contact,
       charge_emp_id,
       (select name
         from tab_employee
        where id = wor.charge_emp_id) as charge_emp_name,
       date_format(plan_start_date, \'%Y-%m-%d %H:%i\') as plan_start_date,
       date_format(plan_finish_date, \'%Y-%m-%d %H:%i\') as plan_finish_date,
       date_format(act_start_date, \'%Y-%m-%d %H:%i\') as act_start_date,
       date_format(act_finish_date, \'%Y-%m-%d %H:%i\') as act_finish_date
  from tab_workorder wor
 where type_cd = \'SHM_TYPE_MAINTENANCE\'
   and tas_id not in (select id from tab_task where type_cd = \'TAS_TYPE_CANCEL\' and ent_id = \'WOR\')
   and charge_emp_id = \'#{user.id}\'', 
 '{
    "sql": {
        "where": true,
        "stmts": [
            { "stmt":"req_date between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"req_date", "param": "start_req_date,end_req_date", "type": "range-date", "require": true},
            { "stmt":"id like concat(\'%\', ?, \'%\')", "id":"id", "param": "id", "type": "text", "require": false},
            { "stmt":"crm_id like concat(\'%\', ?, \'%\')", "id":"crm_id", "param": "crm_id", "type": "text", "require": false},
            { "stmt":"crm_id in (select id from tab_crm where name like concat(\'%\', ?, \'%\'))", "id":"crm_name", "param": "crm_name", "type": "text", "require": false},
            { "stmt":"charge_emp_id in (select id from tab_employee where name like concat(\'%\', ?, \'%\'))", "id":"charge_emp_name", "param": "charge_emp_name", "type": "text", "require": false}
        ]
    },
    "action": {
        "create_btn": {
            "use": false,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_WOR_M_001",
            "modal_title": "정기점검 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form"
        },
        "export_btn": {
            "use": true,
            "title": "출력",
            "print": true,
            "copy": true,
            "excel": false,
            "csv": false,
            "pdf": false,
            "excel_all": true
        }
    },
    "layout": {
        "list": "/api/common/tablelist",
        "excel": "/api/common/excel"
    },
    "filter": [
        [
            { "id": "req_date", "label": "요청일", "uiitem": "Date.Range.DT", "width": 6, "index": 5, "def_val": "m-1,d+0", "config": "" },
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" }
        ],
        [
            { "id": "crm_id", "label": "영업기회코드", "uiitem": "String.Text", "width": 3, "index": 3, "def_val": "", "config": "" },
            { "id": "crm_name", "label": "영업기회명", "uiitem": "String.Text", "width": 3, "index": 4, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "제목", "data": "name", "type": "view" },
        { "name": "단계", "data": "tas_name", "type": "view" },
        { "name": "영업기회코드", "data": "crm_id", "type": "view" },
        { "name": "영업기회명", "data": "crm_name", "type": "view" },
        { "name": "요청일", "data": "req_date", "type": "view" },
        { "name": "요청자", "data": "req_emp_name", "type": "view" },
        { "name": "등록자", "data": "create_emp_name", "type": "view" },
        { "name": "엔지니어", "data": "charge_emp_name", "type": "view" },
        { "name": "지원 유형", "data": "cat_name", "type": "view" },
        { "name": "제품명", "data": "product_name", "type": "view" },
        { "name": "작업 예정일시(시작)", "data": "plan_start_date", "type": "excel" },
        { "name": "작업 예정일시(종료)", "data": "plan_finish_date", "type": "excel" },
        { "name": "작업 실제일시(시작)", "data": "act_start_date", "type": "excel" },
        { "name": "작업 실제일시(종료)", "data": "act_finish_date", "type": "excel" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "desc" }
}', ''),
('LST_WOR_M_002', '(전체)정기점검 처리목록', '(전체)정기점검 처리목록', '(전체)정기점검 처리목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = wor.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       (select name
		  from tab_task
         where id = wor.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = wor.req_emp_id) as req_emp_name,
       ass_emp_id,
       (select name
         from tab_employee
        where id = wor.ass_emp_id) as ass_emp_name,
       src_id,
       src_ent_id,
       type_cd,
       (select name
         from tab_code
        where id = wor.type_cd) as type_name,
       cat_cd,
       (select name
         from tab_code
        where id = wor.cat_cd) as cat_name,
       content,
       crm_id,
       (select name
          from tab_crm
         where id = wor.crm_id) as crm_name,
       product_cd,
       (select name
          from tab_code
         where id = wor.product_cd) as product_name,
       support_city,
       support_location,
       customer,
       customer_contact,
       charge_emp_id,
       (select name
         from tab_employee
        where id = wor.charge_emp_id) as charge_emp_name,
       date_format(plan_start_date, \'%Y-%m-%d %H:%i\') as plan_start_date,
       date_format(plan_finish_date, \'%Y-%m-%d %H:%i\') as plan_finish_date,
       date_format(act_start_date, \'%Y-%m-%d %H:%i\') as act_start_date,
       date_format(act_finish_date, \'%Y-%m-%d %H:%i\') as act_finish_date
  from tab_workorder wor
 where type_cd = \'SHM_TYPE_MAINTENANCE\'', 
 '{
    "sql": {
        "where": true,
        "stmts": [
            { "stmt":"req_date between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"req_date", "param": "start_req_date,end_req_date", "type": "range-date", "require": true},
            { "stmt":"id like concat(\'%\', ?, \'%\')", "id":"id", "param": "id", "type": "text", "require": false},
            { "stmt":"crm_id like concat(\'%\', ?, \'%\')", "id":"crm_id", "param": "crm_id", "type": "text", "require": false},
            { "stmt":"crm_id in (select id from tab_crm where name like concat(\'%\', ?, \'%\'))", "id":"crm_name", "param": "crm_name", "type": "text", "require": false},
            { "stmt":"charge_emp_id in (select id from tab_employee where name like concat(\'%\', ?, \'%\'))", "id":"charge_emp_name", "param": "charge_emp_name", "type": "text", "require": false}
        ]
    },
    "action": {
        "create_btn": {
            "use": false,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_WOR_M_001",
            "modal_title": "정기점검 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form"
        },
        "export_btn": {
            "use": true,
            "title": "출력",
            "print": true,
            "copy": true,
            "excel": false,
            "csv": false,
            "pdf": false,
            "excel_all": true
        }
    },
    "layout": {
        "list": "/api/common/tablelist",
        "excel": "/api/common/excel"
    },
    "filter": [
        [
            { "id": "req_date", "label": "요청일", "uiitem": "Date.Range.DT", "width": 6, "index": 5, "def_val": "m-1,d+0", "config": "" },
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "charge_emp_id", "label": "엔지니어", "uiitem": "String.Text", "width": 3, "index": 8, "def_val": "", "config": "" }
        ],
        [
            { "id": "crm_id", "label": "영업기회코드", "uiitem": "String.Text", "width": 3, "index": 3, "def_val": "", "config": "" },
            { "id": "crm_name", "label": "영업기회명", "uiitem": "String.Text", "width": 3, "index": 4, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "제목", "data": "name", "type": "view" },
        { "name": "단계", "data": "tas_name", "type": "view" },
        { "name": "영업기회코드", "data": "crm_id", "type": "view" },
        { "name": "영업기회명", "data": "crm_name", "type": "view" },
        { "name": "요청일", "data": "req_date", "type": "view" },
        { "name": "요청자", "data": "req_emp_name", "type": "view" },
        { "name": "등록자", "data": "create_emp_name", "type": "view" },
        { "name": "엔지니어", "data": "charge_emp_name", "type": "view" },
        { "name": "지원 유형", "data": "cat_name", "type": "view" },
        { "name": "제품명", "data": "product_name", "type": "view" },
        { "name": "작업 예정일시(시작)", "data": "plan_start_date", "type": "excel" },
        { "name": "작업 예정일시(종료)", "data": "plan_finish_date", "type": "excel" },
        { "name": "작업 실제일시(시작)", "data": "act_start_date", "type": "excel" },
        { "name": "작업 실제일시(종료)", "data": "act_finish_date", "type": "excel" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "desc" }
}', '');

/* Relation */
INSERT INTO RSHM.TAB_RELATION
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TAB_ID, QUERY, CONFIG )
VALUES
('RLT_SHM001', '기술지원 내역서', '기술지원 내역서', '기술지원 내역서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAB_WORKORDER',
 'select *,
       case
		when (select type_cd from tab_task where id = wor.tas_id) in (\'TAS_TYPE_COMP\', \'TAS_TYPE_CANCEL\') then \'false\'
        else \'true\'
       end as is_edit 
  from tab_workorder wor
 where src_id = \'#{key}\'',
 '{
     "mode": "vertical",
     "groups": [
         { "id": "relation_group_001", "title": "엔지니어 배정 정보", "index": 1, "expand": true }
     ],
     "fields": [
        { "id":"crm_id", "fld_id":"TAB_WORKORDER/CRM_ID", "label":"영업기회코드", "placeholder":"영업기회 코드를 선택하세요", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"100px", "def_val":"#{row.crm_id}", "readonly":true, "hidden":true, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_crm\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}] },
        { "id":"src_content", "fld_id":"TAB_WORKORDER/SRC_CONTENT", "label":"상위 지원내역", "placeholder":"상위 지원내역를 입력하세요", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"100px", "def_val":"#{row.content}", "readonly":true, "hidden":true, "require":true, "uiitem":"String.Text", "config": "" },
        { "id":"name", "fld_id":"TAB_WORKORDER/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"100px", "def_val":"#{row.name}", "readonly":true, "hidden":true, "require":true, "uiitem":"String.Text", "config":"" },
        { "id":"type_cd", "fld_id":"TAB_WORKORDER/TYPE_CD", "label":"등록 유형", "placeholder":"등록 유형을 선택하세요.", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"150px", "def_val":"#{row.type_cd}", "readonly":false, "hidden":true, "require":true, "uiitem":"Code.SearchSelect", "config":"" },
        { "id":"product_cd", "fld_id":"TAB_WORKORDER/PRODUCT_CD", "label":"제품 유형", "placeholder":"제품 유형을 선택하세요.", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"150px", "def_val":"#{row.product_cd}", "readonly":false, "hidden":true, "require":true, "uiitem":"Code.SearchSelect", "config":"" },
        { "id":"customer", "fld_id":"TAB_WORKORDER/CUSTOMER", "label":"고객명(회사명)", "placeholder":"고객명(회사명)을 입력하세요.", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"100px", "def_val":"#{row.customer}", "readonly":false, "hidden":true, "require":true, "uiitem":"String.Text", "config":"" },

        { "id":"id", "fld_id":"TAB_WORKORDER/ID", "label":"ID", "placeholder":"자동으로 입력됩니다.", "group":"relation_group_001", "x":1, "y":1, "cols":6, "rows": 1, "width":"100px", "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.ID", "config":"" },
        { "id":"tas_id", "fld_id":"TAB_WORKORDER/TAS_ID", "label":"단계", "placeholder":"단계", "group":"relation_group_001", "x":2, "y":1, "cols":6, "rows": 1, "width":"100px", "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Entity.Select", "config":"" },
        { "id":"req_date", "fld_id":"TAB_WORKORDER/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"relation_group_001", "x":1, "y":2, "cols":6, "rows": 1, "width":"150px", "def_val":"#{row.req_date}", "readonly":true, "hidden":false, "require":false, "uiitem":"Date.DT", "config":"" },
        { "id":"req_emp_id", "fld_id":"TAB_WORKORDER/REQ_EMP_ID", "label":"요청자(담당영업)", "placeholder":"요청자(담당영업)를 선택하세요.", "group":"relation_group_001", "x":2, "y":2, "cols":6, "rows": 1, "width":"150px", "def_val":"#{row.req_emp_id}", "readonly":true, "hidden":false, "require":false, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}] },
        { "id":"cat_cd", "fld_id":"TAB_WORKORDER/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.",  "group":"relation_group_001", "x":1, "y":3, "cols":6, "rows": 1, "width":"150px", "def_val":"#{row.cat_cd}", "readonly":false, "hidden":false, "require":false, "uiitem":"Code.SearchSelect", "config":"" },
        { "id":"charge_emp_id", "fld_id":"TAB_WORKORDER/CHARGE_EMP_ID", "label":"엔지니어", "placeholder":"엔지니어를 선택하세요.", "group":"relation_group_001", "x":2, "y":3, "cols":6, "rows": 1, "width":"150px", "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}] },

        { "id":"support_city", "fld_id":"TAB_WORKORDER/SUPPORT_CITY", "label":"지원 도시", "placeholder":"지원 도시를 입력하세요.", "group":"relation_group_001", "x":1, "y":4, "cols":6, "rows": 1, "width":"100px", "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"" },
        { "id":"support_location", "fld_id":"TAB_WORKORDER/SUPPORT_LOCATION", "label":"지원 장소", "placeholder":"지원 장소를 입력하세요.", "group":"relation_group_001", "x":2, "y":4, "cols":6, "rows": 1, "width":"100px", "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"" },
        { "id":"customer_contact", "fld_id":"TAB_WORKORDER/CUSTOMER_CONTACT", "label":"고객 담당자", "placeholder":"고객 담당자를 입력하세요.", "group":"relation_group_001", "x":1, "y":5, "cols":12, "rows": 1, "width":"100px", "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"" },

        { "id":"plan_start_date", "fld_id":"TAB_WORKORDER/PLAN_START_DATE", "label":"작업 예정일시", "placeholder":"작업 예정일시를 입력하세요.", "group":"relation_group_001", "x":1, "y":6, "cols":12, "rows": 1, "width":"200px", "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"plan_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30} },
        { "id":"act_start_date", "fld_id":"TAB_WORKORDER/ACT_START_DATE", "label":"작업 실제일시", "placeholder":"작업 실제일시를 입력하세요.", "group":"relation_group_001", "x":1, "y":7, "cols":12, "rows": 1, "width":"200px", "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"act_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30} },
        { "id":"actions", "fld_id":"", "label":"Actions", "group":"relation_group_001", "x":1, "y":8, "cols":12, "rows": 1, "width":"85px", "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"Action", "config":"", "buttons": [{ "type":"create", "label":"할당", "ctl_id":"CTL_WOR_T_001" }, { "type":"update", "label":"수정", "ctl_id":"CTL_WOR_T_002" }, { "type":"delete", "label":"할당취소", "ctl_id":"CTL_WOR_T_004" }] }
    ],
    "script": "
        if(typeof checkWorkorderStatus === \'function\') {
			checkWorkorderStatus();
		}
    "
}'),	/* 기술지원 내역서 */
('RLT_SHM002', '정기점검 내역서(readonly)', '정기점검 내역서(readonly)', '정기점검 내역서(readonly)', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAB_WORKORDER',
 'select *,
       case
		when (select type_cd from tab_task where id = wor.tas_id) in (\'TAS_TYPE_COMP\', \'TAS_TYPE_CANCEL\') then \'false\'
        else \'true\'
       end as is_edit 
  from tab_workorder wor
 where src_id = \'#{key}\'',
 '{
     "mode": "vertical",
     "groups": [
         { "id": "relation_group_001", "title": "엔지니어 배정 정보", "index": 1, "expand": true }
     ],
     "fields": [
        { "id":"crm_id", "fld_id":"TAB_WORKORDER/CRM_ID", "label":"영업기회코드", "placeholder":"영업기회 코드를 선택하세요", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"100px", "def_val":"#{row.crm_id}", "readonly":true, "hidden":true, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_crm\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}] },
        { "id":"src_content", "fld_id":"TAB_WORKORDER/SRC_CONTENT", "label":"상위 지원내역", "placeholder":"상위 지원내역를 입력하세요", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"100px", "def_val":"#{row.content}", "readonly":true, "hidden":true, "require":true, "uiitem":"String.Text", "config": "" },
        { "id":"name", "fld_id":"TAB_WORKORDER/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"100px", "def_val":"#{row.name}", "readonly":true, "hidden":true, "require":true, "uiitem":"String.Text", "config":"" },
        { "id":"type_cd", "fld_id":"TAB_WORKORDER/TYPE_CD", "label":"등록 유형", "placeholder":"등록 유형을 선택하세요.", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"150px", "def_val":"#{row.type_cd}", "readonly":true, "hidden":true, "require":true, "uiitem":"Code.SearchSelect", "config":"" },
        { "id":"product_cd", "fld_id":"TAB_WORKORDER/PRODUCT_CD", "label":"제품 유형", "placeholder":"제품 유형을 선택하세요.", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"150px", "def_val":"#{row.product_cd}", "readonly":true, "hidden":true, "require":true, "uiitem":"Code.SearchSelect", "config":"" },
        { "id":"customer", "fld_id":"TAB_WORKORDER/CUSTOMER", "label":"고객명(회사명)", "placeholder":"고객명(회사명)을 입력하세요.", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"100px", "def_val":"#{row.customer}", "readonly":true, "hidden":true, "require":true, "uiitem":"String.Text", "config":"" },

        { "id":"id", "fld_id":"TAB_WORKORDER/ID", "label":"ID", "placeholder":"자동으로 입력됩니다.", "group":"relation_group_001", "x":1, "y":1, "cols":6, "rows": 1, "width":"100px", "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.ID", "config":"" },
        { "id":"tas_id", "fld_id":"TAB_WORKORDER/TAS_ID", "label":"단계", "placeholder":"단계", "group":"relation_group_001", "x":2, "y":1, "cols":6, "rows": 1, "width":"100px", "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Entity.Select", "config":"" },
        { "id":"req_date", "fld_id":"TAB_WORKORDER/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"relation_group_001", "x":1, "y":2, "cols":6, "rows": 1, "width":"150px", "def_val":"#{row.req_date}", "readonly":true, "hidden":false, "require":false, "uiitem":"Date.DT", "config":"" },
        { "id":"req_emp_id", "fld_id":"TAB_WORKORDER/REQ_EMP_ID", "label":"요청자(담당영업)", "placeholder":"요청자(담당영업)를 선택하세요.", "group":"relation_group_001", "x":2, "y":2, "cols":6, "rows": 1, "width":"150px", "def_val":"#{row.req_emp_id}", "readonly":true, "hidden":false, "require":false, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}] },
        { "id":"cat_cd", "fld_id":"TAB_WORKORDER/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.",  "group":"relation_group_001", "x":1, "y":3, "cols":6, "rows": 1, "width":"150px", "def_val":"#{row.cat_cd}", "readonly":true, "hidden":false, "require":false, "uiitem":"Code.SearchSelect", "config":"" },
        { "id":"charge_emp_id", "fld_id":"TAB_WORKORDER/CHARGE_EMP_ID", "label":"엔지니어", "placeholder":"엔지니어를 선택하세요.", "group":"relation_group_001", "x":2, "y":3, "cols":6, "rows": 1, "width":"150px", "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}] },

        { "id":"support_city", "fld_id":"TAB_WORKORDER/SUPPORT_CITY", "label":"지원 도시", "placeholder":"지원 도시를 입력하세요.", "group":"relation_group_001", "x":1, "y":4, "cols":6, "rows": 1, "width":"100px", "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"" },
        { "id":"support_location", "fld_id":"TAB_WORKORDER/SUPPORT_LOCATION", "label":"지원 장소", "placeholder":"지원 장소를 입력하세요.", "group":"relation_group_001", "x":2, "y":4, "cols":6, "rows": 1, "width":"100px", "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"" },
        { "id":"customer_contact", "fld_id":"TAB_WORKORDER/CUSTOMER_CONTACT", "label":"고객 담당자", "placeholder":"고객 담당자를 입력하세요.", "group":"relation_group_001", "x":1, "y":5, "cols":12, "rows": 1, "width":"100px", "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"" },

        { "id":"plan_start_date", "fld_id":"TAB_WORKORDER/PLAN_START_DATE", "label":"작업 예정일시", "placeholder":"작업 예정일시를 입력하세요.", "group":"relation_group_001", "x":1, "y":6, "cols":12, "rows": 1, "width":"200px", "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"plan_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30} },
        { "id":"act_start_date", "fld_id":"TAB_WORKORDER/ACT_START_DATE", "label":"작업 실제일시", "placeholder":"작업 실제일시를 입력하세요.", "group":"relation_group_001", "x":1, "y":7, "cols":12, "rows": 1, "width":"200px", "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"act_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30} }
    ],
    "script": ""
}'),	/* 정기점검 내역서(readonly) */
('RLT_SHM003', '정기점검 내역서', '정기점검 내역서', '정기점검 내역서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR', 'TAB_WORKORDER',
 'select *,
       case
		when (select type_cd from tab_task where id = wor.tas_id) in (\'TAS_TYPE_COMP\', \'TAS_TYPE_CANCEL\') then \'false\'
        else \'true\'
       end as is_edit 
  from tab_workorder wor
 where src_id = \'#{key}\'',
 '{
     "mode": "vertical",
     "groups": [
         { "id": "relation_group_001", "title": "엔지니어 배정 정보", "index": 1, "expand": true }
     ],
     "fields": [
        { "id":"crm_id", "fld_id":"TAB_WORKORDER/CRM_ID", "label":"영업기회코드", "placeholder":"영업기회 코드를 선택하세요", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"100px", "def_val":"#{row.crm_id}", "readonly":true, "hidden":true, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_crm\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}] },
        { "id":"src_content", "fld_id":"TAB_WORKORDER/SRC_CONTENT", "label":"상위 지원내역", "placeholder":"상위 지원내역를 입력하세요", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"100px", "def_val":"#{row.content}", "readonly":true, "hidden":true, "require":true, "uiitem":"String.Text", "config": "" },
        { "id":"name", "fld_id":"TAB_WORKORDER/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"100px", "def_val":"#{row.name}", "readonly":true, "hidden":true, "require":true, "uiitem":"String.Text", "config":"" },
        { "id":"type_cd", "fld_id":"TAB_WORKORDER/TYPE_CD", "label":"등록 유형", "placeholder":"등록 유형을 선택하세요.", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"150px", "def_val":"#{row.type_cd}", "readonly":true, "hidden":true, "require":true, "uiitem":"Code.SearchSelect", "config":"" },
        { "id":"product_cd", "fld_id":"TAB_WORKORDER/PRODUCT_CD", "label":"제품 유형", "placeholder":"제품 유형을 선택하세요.", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"150px", "def_val":"#{row.product_cd}", "readonly":true, "hidden":true, "require":true, "uiitem":"Code.SearchSelect", "config":"" },
        { "id":"customer", "fld_id":"TAB_WORKORDER/CUSTOMER", "label":"고객명(회사명)", "placeholder":"고객명(회사명)을 입력하세요.", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"100px", "def_val":"#{row.customer}", "readonly":true, "hidden":true, "require":true, "uiitem":"String.Text", "config":"" },

        { "id":"id", "fld_id":"TAB_WORKORDER/ID", "label":"ID", "placeholder":"자동으로 입력됩니다.", "group":"relation_group_001", "x":1, "y":1, "cols":6, "rows": 1, "width":"100px", "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.ID", "config":"" },
        { "id":"tas_id", "fld_id":"TAB_WORKORDER/TAS_ID", "label":"단계", "placeholder":"단계", "group":"relation_group_001", "x":2, "y":1, "cols":6, "rows": 1, "width":"100px", "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Entity.Select", "config":"" },
        { "id":"req_date", "fld_id":"TAB_WORKORDER/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"relation_group_001", "x":1, "y":2, "cols":6, "rows": 1, "width":"150px", "def_val":"#{row.req_date}", "readonly":true, "hidden":false, "require":false, "uiitem":"Date.DT", "config":"" },
        { "id":"req_emp_id", "fld_id":"TAB_WORKORDER/REQ_EMP_ID", "label":"요청자(담당영업)", "placeholder":"요청자(담당영업)를 선택하세요.", "group":"relation_group_001", "x":2, "y":2, "cols":6, "rows": 1, "width":"150px", "def_val":"#{row.req_emp_id}", "readonly":true, "hidden":false, "require":false, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}] },
        { "id":"cat_cd", "fld_id":"TAB_WORKORDER/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.",  "group":"relation_group_001", "x":1, "y":3, "cols":6, "rows": 1, "width":"150px", "def_val":"#{row.cat_cd}", "readonly":true, "hidden":false, "require":false, "uiitem":"Code.SearchSelect", "config":"" },
        { "id":"charge_emp_id", "fld_id":"TAB_WORKORDER/CHARGE_EMP_ID", "label":"엔지니어", "placeholder":"엔지니어를 선택하세요.", "group":"relation_group_001", "x":2, "y":3, "cols":6, "rows": 1, "width":"150px", "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}] },

        { "id":"support_city", "fld_id":"TAB_WORKORDER/SUPPORT_CITY", "label":"지원 도시", "placeholder":"지원 도시를 입력하세요.", "group":"relation_group_001", "x":1, "y":4, "cols":6, "rows": 1, "width":"100px", "def_val":"#{row.support_city}", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"" },
        { "id":"support_location", "fld_id":"TAB_WORKORDER/SUPPORT_LOCATION", "label":"지원 장소", "placeholder":"지원 장소를 입력하세요.", "group":"relation_group_001", "x":2, "y":4, "cols":6, "rows": 1, "width":"100px", "def_val":"#{row.support_location}", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"" },
        { "id":"customer_contact", "fld_id":"TAB_WORKORDER/CUSTOMER_CONTACT", "label":"고객 담당자", "placeholder":"고객 담당자를 입력하세요.", "group":"relation_group_001", "x":1, "y":5, "cols":12, "rows": 1, "width":"100px", "def_val":"#{row.customer_contact}", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"" },

        { "id":"plan_start_date", "fld_id":"TAB_WORKORDER/PLAN_START_DATE", "label":"작업 예정일시", "placeholder":"작업 예정일시를 입력하세요.", "group":"relation_group_001", "x":1, "y":6, "cols":12, "rows": 1, "width":"200px", "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"plan_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30} },
        { "id":"act_start_date", "fld_id":"TAB_WORKORDER/ACT_START_DATE", "label":"작업 실제일시", "placeholder":"작업 실제일시를 입력하세요.", "group":"relation_group_001", "x":1, "y":7, "cols":12, "rows": 1, "width":"200px", "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Date.Range.DTTM", "config":{\"target_id\":\"act_finish_date\", \"target_def_val\":\"\", \"time_interval\": 30} },
        { "id":"actions", "fld_id":"", "label":"Actions", "group":"relation_group_001", "x":1, "y":8, "cols":12, "rows": 1, "width":"85px", "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"Action", "config":"", "buttons": [{ "type":"create", "label":"할당", "ctl_id":"CTL_WOR_M_001" }, { "type":"update", "label":"수정", "ctl_id":"CTL_WOR_M_006" }, { "type":"delete", "label":"할당취소", "ctl_id":"CTL_WOR_M_008" }] }
    ],
    "script": "
        if(typeof checkWorkorderStatus === \'function\') {
			checkWorkorderStatus();
		}
    "
}');	/* 정기점검 내역서 */

