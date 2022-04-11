/**
 * Table Table Initialize Data
 */
INSERT INTO RSHM.TAB_TABLE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TYPE_CD )
VALUES
('TAB_ENTITY', '엔티티 관리', '엔티티 관리', '엔티티 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'ENT', 'TAB_TYPE_SYSTEM'),	/* 엔티티 관리 */
('TAB_TABLE', '테이블 관리', '테이블 관리', '테이블 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'TAB', 'TAB_TYPE_SYSTEM'),	/* 테이블 관리 */
('TAB_SEQUENCE', '시퀀스 관리', '시퀀스 관리', '코드 타입 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SEQ', 'TAB_TYPE_SYSTEM'),	/* 시퀀스 관리 */
 
('TAB_CODE_TYPE', '코드 타입 관리', '코드 타입 관리', '코드 타입 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'CTY', 'TAB_TYPE_SYSTEM'),	/* 코드 타입 관리 */
('TAB_CODE', '코드 관리', '코드 관리', '코드 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'COD', 'TAB_TYPE_SYSTEM'),	/* 코드 관리 */
 
('TAB_MENU', '메뉴 관리', '메뉴 관리', '메뉴 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'MEN', 'TAB_TYPE_SYSTEM'),	/* 메뉴 관리 */
('TAB_LOG', '로그 관리', '로그 관리', '로그 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'LOG', 'TAB_TYPE_SYSTEM'),	/* 로그 관리 */
('TAB_HOLIDAY', '휴일 관리', '휴일 관리', '휴일 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'HOD', 'TAB_TYPE_SYSTEM'),	/* 휴일 관리 */

('TAB_SQL', 'SQL 관리', 'SQL 관리', 'SQL 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SQL', 'TAB_TYPE_SYSTEM'),	/* SQL 관리 */
('TAB_LIST', '리스트 관리', '리스트 관리', '리스트 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'LST', 'TAB_TYPE_SYSTEM'),	/* 리스트 관리 */
('TAB_RELATION', '릴레이션 관리', '릴레이션 관리', '릴레이션 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'RLT', 'TAB_TYPE_SYSTEM'),	/* 릴레이션 관리 */
('TAB_CONTENT', '컨텐츠 관리', '컨텐츠 관리', '컨텐츠 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'CTN', 'TAB_TYPE_SYSTEM'),	/* 컨텐츠 관리 */

('TAB_FIELD_TYPE', '필드 타입 관리', '필드 타입 관리', '필드 타입 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'FLT', 'TAB_TYPE_SYSTEM'),	/* 필드 타입 관리 */
('TAB_TABLE_FIELD', '테이블 필드 관리', '테이블 필드 관리', '테이블 필드 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'TFD', 'TAB_TYPE_SYSTEM'),	/* 테이블 타입 관리 */

('TAB_WORKFLOW', '워크플로우 관리', '워크플로우 관리', '워크플로우 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOF', 'TAB_TYPE_SYSTEM'),	/* 워크플로우 관리 */
('TAB_ACTIVITY', '액티비티 관리', '액티비티 관리', '액티비티 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'ACT', 'TAB_TYPE_SYSTEM'),	/* 액티비티 관리 */
('TAB_TASK', '테스크 관리', '테스크 관리', '테스크 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'TAS', 'TAB_TYPE_SYSTEM'),	/* 테스크 관리 */
('TAB_CONTROL', '제어 관리', '제어 관리', '제어 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'CTL', 'TAB_TYPE_SYSTEM'),	/* 제어 관리 */
('TAB_FORM', '폼 관리', '폼 관리', '폼 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'FRM', 'TAB_TYPE_SYSTEM'),	/* 폼 관리 */
('TAB_WFF', '워크플로우 플로우', '워크플로우 플로우', '워크플로우 플로우', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WFF', 'TAB_TYPE_SYSTEM'),	/* 워크플로우 플로우 */
 
('TAB_ORG', '조직 관리', '조직 관리', '조직 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'ORG', 'TAB_TYPE_SYSTEM'),	/* 조직 관리 */
('TAB_DEPT', '부서 관리', '부서 관리', '부서 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'DPT', 'TAB_TYPE_SYSTEM'),	/* 부서 관리 */
('TAB_EMPLOYEE', '직원 관리', '직원 관리', '직원 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'EMP', 'TAB_TYPE_SYSTEM');	/* 직원 관리 */
