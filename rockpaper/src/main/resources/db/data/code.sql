/**
 * Code Type / Code Table Initialize Data
 */
/* 엔티티 타입 */
INSERT INTO RSHM.TAB_CODE_TYPE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 HIERARCHY )
VALUES
('ENT_TYPE', '엔티티 타입', '엔티티 타입', '엔티티 타입', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 false);

INSERT INTO RSHM.TAB_CODE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 VAL, CTY_ID, SID, PID, LEVEL )
VALUES
('ENT_TYPE_SYSTEM', '시스템', '시스템', '시스템', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'ENT_TYPE_SYSTEM', 'ENT_TYPE', null, null, 1), 	/* 엔티티 타입 - 시스템 */
('ENT_TYPE_WORKFLOW', '워크플로우', '워크플로우', '워크플로우', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'ENT_TYPE_WORKFLOW', 'ENT_TYPE', null, null, 1);	/* 엔티티 타입 - 워크플로우 */
/* //////////////////// */

/* 테이블 타입 */
INSERT INTO RSHM.TAB_CODE_TYPE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 HIERARCHY )
VALUES
('TAB_TYPE', '테이블 타입', '테이블 타입', '테이블 타입', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 false);

INSERT INTO RSHM.TAB_CODE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 VAL, CTY_ID, SID, PID, LEVEL )
VALUES
('TAB_TYPE_SYSTEM', '시스템', '시스템', '시스템', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'TAB_TYPE_SYSTEM', 'TAB_TYPE', null, null, 1), 	/* 테이블 타입 - 시스템 */
('TAB_TYPE_WORKFLOW', '워크플로우', '워크플로우', '워크플로우', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'TAB_TYPE_WORKFLOW', 'TAB_TYPE', null, null, 1),	/* 테이블 타입 - 워크플로우 */
('TAB_TYPE_CUSTOM', '커스텀', '커스텀', '커스텀', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'TAB_TYPE_CUSTOM', 'TAB_TYPE', null, null, 1); 	/* 테이블 타입 - 커스텀 */
/* //////////////////// */

/* 필드 타입 */
INSERT INTO RSHM.TAB_CODE_TYPE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 HIERARCHY )
VALUES
('FLT_TYPE', '필드 타입', '필드 타입', '필드 타입', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 true);

INSERT INTO RSHM.TAB_CODE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 VAL, CTY_ID, SID, PID, LEVEL )
VALUES
('FLT_TYPE_STRING', 'String', 'String', 'String', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'String', 'FLT_TYPE', null, null, 1), 	/* 필드 타입(Level 1) - String */
('FLT_TYPE_STRING_TEXT', 'String.Text', 'String.Text', 'String.Text', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'String.Text', 'FLT_TYPE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING', 2), 	/* 필드 타입(Level 2) - String.Text */
('FLT_TYPE_STRING_TEXTAREA', 'String.TextArea', 'String.TextArea', 'String.TextArea', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'String.TextArea', 'FLT_TYPE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING', 2), 	/* 필드 타입(Level 2) - String.TextArea */
('FLT_TYPE_STRING_JSON_EDITOR', 'String.JsonEditor', 'String.JsonEditor', 'String.JsonEditor', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'String.JsonEditor', 'FLT_TYPE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING', 2), 	/* 필드 타입(Level 2) - String.JsonEditor */
('FLT_TYPE_STRING_ID', 'String.ID', 'String.ID', 'String.ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'String.ID', 'FLT_TYPE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING', 2), 	/* 필드 타입(Level 2) - String.ID */
('FLT_TYPE_STRING_SUMMERNOTE', 'String.Summernote', 'String.Summernote', 'String.Summernote', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'String.Summernote', 'FLT_TYPE', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING', 2), 	/* 필드 타입(Level 2) - String.Summernote */

('FLT_TYPE_NUMBER', 'Number', 'Number', 'Number', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'Number', 'FLT_TYPE', null, null, 1), 	/* 필드 타입(Level 1) - Number */
('FLT_TYPE_NUMBER_DEF', 'Number.Def', 'Number.Def', 'Number.Def', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'Number.Def', 'FLT_TYPE', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER', 2), 	/* 필드 타입(Level 2) - Number.Def */
('FLT_TYPE_NUMBER_POINT', 'Number.Point', 'Number.Point', 'Number.Point', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'Number.Point', 'FLT_TYPE', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER', 2), 	/* 필드 타입(Level 2) - Number.Point */

('FLT_TYPE_DATE', 'Date', 'Date', 'Date', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'Date', 'FLT_TYPE', null, null, 1), 	/* 필드 타입(Level 1) - Date */
('FLT_TYPE_DATE_DTTM', 'Date.DTTM', 'Date.DTTM', 'Date.DTTM', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'Date.DTTM', 'FLT_TYPE', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE', 2), 	/* 필드 타입(Level 2) - Date.DTTM */
('FLT_TYPE_DATE_RANGE_DTTM', 'Date.Range.DTTM', 'Date.Range.DTTM', 'Date.Range.DTTM', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'Date.Range.DTTM', 'FLT_TYPE', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE', 2), 	/* 필드 타입(Level 2) - Date.Range.DTTM */
('FLT_TYPE_DATE_DT', 'Date.DT', 'Date.DT', 'Date.DT', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'Date.DT', 'FLT_TYPE', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE', 2), 	/* 필드 타입(Level 2) - Date.DT */
('FLT_TYPE_DATE_RANGE_DT', 'Date.Range.DT', 'Date.Range.DT', 'Date.Range.DT', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'Date.Range.DT', 'FLT_TYPE', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE', 2), 	/* 필드 타입(Level 2) - Date.Range.DT */

('FLT_TYPE_BOOLEAN', 'Boolean', 'Boolean', 'Boolean', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'Boolean', 'FLT_TYPE', null, null, 1), 	/* 필드 타입(Level 1) - Boolean */
('FLT_TYPE_BOOLEAN_SELECT', 'Boolean.Select', 'Boolean.Select', 'Boolean.Select', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'Boolean.Select', 'FLT_TYPE', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN', 2), 	/* 필드 타입(Level 2) - Boolean.Select */
('FLT_TYPE_BOOLEAN_RADIO', 'Boolean.Radio', 'Boolean.Radio', 'Boolean.Radio', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'Boolean.Radio', 'FLT_TYPE', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN', 2), 	/* 필드 타입(Level 2) - Boolean.Radio */

('FLT_TYPE_CODE', 'Code', 'Code', 'Code', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'Code', 'FLT_TYPE', null, null, 1), 	/* 필드 타입(Level 1) - Code */
('FLT_TYPE_CODE_SELECT', 'Code.Select', 'Code.Select', 'Code.Select', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'Code.Select', 'FLT_TYPE', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE', 2), 	/* 필드 타입(Level 2) - Code.Select */
('FLT_TYPE_CODE_SEARCHSELECT', 'Code.SearchSelect', 'Code.SearchSelect', 'Code.SearchSelect', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'Code.SearchSelect', 'FLT_TYPE', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE', 2), 	/* 필드 타입(Level 2) - Code.SearchSelect */
('FLT_TYPE_CODE_RADIO', 'Code.Radio', 'Code.Radio', 'Code.Radio', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'Code.Radio', 'FLT_TYPE', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE', 2), 	/* 필드 타입(Level 2) - Code.Radio */

('FLT_TYPE_ENTITY', 'Entity', 'Entity', 'Entity', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'Entity', 'FLT_TYPE', null, null, 1), 	/* 필드 타입(Level 1) - Entity */
('FLT_TYPE_ENTITY_SELECT', 'Entity.Selct', 'Entity.Select', 'Entity.Select', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'Entity.Select', 'FLT_TYPE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY', 2), 	/* 필드 타입(Level 2) - Entity.Select */
('FLT_TYPE_ENTITY_SEARCH_SELECT', 'Entity.SearchSelct', 'Entity.SearchSelect', 'Entity.SearchSelect', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'Entity.SearchSelct', 'FLT_TYPE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY', 2), 	/* 필드 타입(Level 2) - Entity.SearchSelct */
('FLT_TYPE_ENTITY_SEARCH_SELECT_CRM', 'Entity.SearchSelectCRM', 'Entity.SearchSelectCRM', 'Entity.SearchSelectCRM', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'Entity.SearchSelectCRM', 'FLT_TYPE', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY', 2), 	/* 필드 타입(Level 2) - Entity.SearchSelectCRM */

('FLT_TYPE_CUSTOM', 'Custom', 'Custom', 'Custom', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'Custom', 'FLT_TYPE', null, null, 1), 	/* 필드 타입(Level 1) - Custom */
('FLT_TYPE_CUSTOM_RELATION', 'Custom.Relation', 'Custom.Relation', 'Custom.Relation', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'Custom.Relation', 'FLT_TYPE', 'FLT_TYPE_CUSTOM', 'FLT_TYPE_CUSTOM', 2); 	/* 필드 타입(Level 2) - Custom.Relation */
/* //////////////////// */

/* 직위/직책 코드 */
INSERT INTO RSHM.TAB_CODE_TYPE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 HIERARCHY )
VALUES
('POSITION', '직위', '직위', '직위', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 false),
 ('DUTY_POSITION', '직책', '직책', '직책', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 false);
/* //////////////////// */

/* 테스크 타입 */
INSERT INTO RSHM.TAB_CODE_TYPE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 HIERARCHY )
VALUES
('TAS_TYPE', '테스크 타입', '테스크 타입', '테스크 타입', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 false);

INSERT INTO RSHM.TAB_CODE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 VAL, CTY_ID, SID, PID, LEVEL )
VALUES
('TAS_TYPE_DRAFT', '임시저장', '임시저장', '임시저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'TAS_TYPE_DRAFT', 'TAS_TYPE', null, null, 1), 	/* 테스크 타입 - 임시저장 */
('TAS_TYPE_REG', '등록', '등록', '등록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'TAS_TYPE_REG', 'TAS_TYPE', null, null, 1), 	/* 테스크 타입 - 등록 */
('TAS_TYPE_ACP', '접수', '접수', '접수', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'TAS_TYPE_ACP', 'TAS_TYPE', null, null, 1), 	/* 테스크 타입 - 접수 */
('TAS_TYPE_PROC', '처리', '처리', '처리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'TAS_TYPE_PROC', 'TAS_TYPE', null, null, 1), 	/* 테스크 타입 - 처리 */
('TAS_TYPE_COMP', '완료', '완료', '완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'TAS_TYPE_COMP', 'TAS_TYPE', null, null, 1), 	/* 테스크 타입 - 완료 */
('TAS_TYPE_CANCEL', '취소', '취소', '취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'TAS_TYPE_CANCEL', 'TAS_TYPE', null, null, 1); 	/* 테스크 타입 - 취소 */
/* //////////////////// */

/* 제어 타입 */
INSERT INTO RSHM.TAB_CODE_TYPE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 HIERARCHY )
VALUES
('CTL_TYPE', '제어 타입', '제어 타입', '제어 타입', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 false);

INSERT INTO RSHM.TAB_CODE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 VAL, CTY_ID, SID, PID, LEVEL )
VALUES
('CTL_TYPE_PRIMARY', 'PRIMARY', 'PRIMARY', 'PRIMARY', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'btn-primary', 'CTL_TYPE', null, null, 1), 	/* 제어 타입 - PRIMARY */
('CTL_TYPE_SECONDARY', 'SECONDARY', 'SECONDARY', 'SECONDARY', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'btn-secondary', 'CTL_TYPE', null, null, 1), 	/* 제어 타입 - SECONDARY */
('CTL_TYPE_DANGER', 'DANGER', 'DANGER', 'DANGER', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'btn-danger', 'CTL_TYPE', null, null, 1); 	/* 제어 타입 - DANGER */
/* //////////////////// */

/* 로그 타입 */
INSERT INTO RSHM.TAB_CODE_TYPE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 HIERARCHY )
VALUES
('LOG_TYPE', '로그 타입', '로그 타입', '로그 타입', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 false);

INSERT INTO RSHM.TAB_CODE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 VAL, CTY_ID, SID, PID, LEVEL )
VALUES
('LOG_TYPE_MAIL', '메일', '메일', '메일', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'LOG_TYPE_MAIL', 'LOG_TYPE', null, null, 1), 	/* 로그 타입 - 메일 */
('LOG_TYPE_CODE', '인사-코드', '인사-코드', '인사-코드', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'LOG_TYPE_CODE', 'LOG_TYPE', null, null, 1), 	/* 로그 타입 - 인사-코드 */
('LOG_TYPE_ORG', '인사-조직', '인사-조직', '인사-조직', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'LOG_TYPE_ORG', 'LOG_TYPE', null, null, 1), 	/* 로그 타입 - 인사-조직 */
('LOG_TYPE_DPT', '인사-부서', '인사-부서', '인사-부서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'LOG_TYPE_DPT', 'LOG_TYPE', null, null, 1), 	/* 로그 타입 - 인사-부서 */
('LOG_TYPE_EMP', '인사-직원', '인사-직원', '인사-직원', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'LOG_TYPE_EMP', 'LOG_TYPE', null, null, 1), 	/* 로그 타입 - 인사-직원 */
('LOG_TYPE_CRM', 'CRM', 'CRM', 'CRM', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'LOG_TYPE_CRM', 'LOG_TYPE', null, null, 1), 	/* 로그 타입 - CRM */
('LOG_TYPE_CRM_M', 'CRM(수동)', 'CRM(수동)', 'CRM(수동)', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'LOG_TYPE_CRM', 'LOG_TYPE', null, null, 1), 	/* 로그 타입 - CRM(수동) */
('LOG_TYPE_CRM_PROD', 'CRM-PROD', 'CRM-PROD', 'CRM-PROD', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'LOG_TYPE_CRM_PROD', 'LOG_TYPE', null, null, 1), 	/* 로그 타입 - CRM-PROD */
('LOG_TYPE_CRM_PROD_M', 'CRM-PROD(수동)', 'CRM-PROD(수동)', 'CRM-PROD(수동)', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'LOG_TYPE_CRM_PROD_M', 'LOG_TYPE', null, null, 1), 	/* 로그 타입 - CRM-PROD(수동) */

('LOG_TYPE_MA_MONTH', '정기점검-월간', '정기점검-월간', '정기점검-월간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'LOG_TYPE_MA_MONTH', 'LOG_TYPE', null, null, 1), 	/* 로그 타입 - 정기점검-월간 */
('LOG_TYPE_MA_BIMONTH', '정기점검-격월', '정기점검-격월', '정기점검-격월', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 15, 
 'LOG_TYPE_MA_BIMONTH', 'LOG_TYPE', null, null, 1), 	/* 로그 타입 - 정기점검-격월 */
('LOG_TYPE_MA_QUARTER', '정기점검-분기', '정기점검-분기', '정기점검-분기', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'LOG_TYPE_MA_QUARTER', 'LOG_TYPE', null, null, 1), 	/* 로그 타입 - 정기점검-분기 */
('LOG_TYPE_MA_HALF', '정기점검-반기', '정기점검-반기', '정기점검-반기', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'LOG_TYPE_MA_HALF', 'LOG_TYPE', null, null, 1), 	/* 로그 타입 - 정기점검-반기 */
('LOG_TYPE_MA_YEAR', '정기점검-년간', '정기점검-년간', '정기점검-년간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'LOG_TYPE_MA_YEAR', 'LOG_TYPE', null, null, 1), 	/* 로그 타입 - 정기점검-년간 */

('LOG_TYPE_HOLIDAY', '공휴일 수집', '공휴일 수집', '공휴일 수집', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 14, 
 'LOG_TYPE_HOLIDAY', 'LOG_TYPE', null, null, 1), 	/* 로그 타입 - 공휴일 수집 */

('LOG_TYPE_VACATION_CODE', '인사-휴가코드', '인사-휴가코드', '인사-휴가코드', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 15, 
 'LOG_TYPE_EMP', 'LOG_TYPE', null, null, 1), 	/* 로그 타입 - 인사-휴가코드 */
('LOG_TYPE_VACATION', '인사-휴가', '인사-휴가', '인사-휴가', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 16, 
 'LOG_TYPE_VACATION', 'LOG_TYPE', null, null, 1), 	/* 로그 타입 - 인사-휴가 */

 ('LOG_TYPE_CLOSE_TICKET', '티켓 종료', '티켓 종료', '티켓 종료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 16, 
 'LOG_TYPE_CLOSE_TICKET', 'LOG_TYPE', null, null, 1); 	/* 로그 타입 - 티켓 종료 */
/* //////////////////// */