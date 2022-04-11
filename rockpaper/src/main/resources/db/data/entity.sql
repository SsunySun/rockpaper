/**
 * Entity Table Initialize Data
 */
INSERT INTO RSHM.TAB_ENTITY
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 PREFIX, TYPE_CD )
VALUES
('ENT', '엔티티 관리', '엔티티 관리', '엔티티 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'ENT', 'ENT_TYPE_SYSTEM'),	/* 엔티티 관리 */
('TAB', '테이블 관리', '테이블 관리', '테이블 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'TAB', 'ENT_TYPE_SYSTEM'),	/* 테이블 관리 */
('SEQ', '시퀀스 관리', '시퀀스 관리', '시퀀스 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SEQ', 'ENT_TYPE_SYSTEM'),	/* 시퀀스 관리 */
 
('CTY', '코드 타입 관리', '코드 타입 관리', '코드 타입 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'CTY', 'ENT_TYPE_SYSTEM'),	/* 코드 타입 관리 */
('COD', '코드 관리', '코드 관리', '코드 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'COD', 'ENT_TYPE_SYSTEM'),	/* 코드 관리 */

('MEN', '메뉴 관리', '메뉴 관리', '메뉴 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'MEN', 'ENT_TYPE_SYSTEM'),	/* 메뉴 관리 */
('LOG', '로그 관리', '로그 관리', '로그 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'LOG', 'ENT_TYPE_SYSTEM'),	/* 로그 관리 */
('HOD', '휴일 관리', '휴일 관리', '휴일 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'HOD', 'ENT_TYPE_SYSTEM'),	/* 휴일 관리 */

('SQL', 'SQL 관리', 'SQL 관리', 'SQL 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SQL', 'ENT_TYPE_SYSTEM'),	/* SQL 관리 */
('LST', '리스트 관리', '리스트 관리', '리스트 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'LST', 'ENT_TYPE_SYSTEM'),	/* 리스트 관리 */
('RLT', '릴레이션 관리', '릴레이션 관리', '릴레이션 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'RLT', 'ENT_TYPE_SYSTEM'),	/* 릴레이션 관리 */
('CTN', '컨텐츠 관리', '컨텐츠 관리', '컨텐츠 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'CTN', 'ENT_TYPE_SYSTEM'),	/* 컨텐츠 관리 */

('FLT', '필드 타입 관리', '필드 타입 관리', '필드 타입 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'FLT', 'ENT_TYPE_SYSTEM'),	/* 필드 타입 관리 */
('TFD', '테이블 필드 관리', '테이블 필드 관리', '테이블 필드 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'TFD', 'ENT_TYPE_SYSTEM'),	/* 테이블 필드 관리 */

('WOF', '워크플로우 관리', '워크플로우 관리', '워크플로우 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOF', 'ENT_TYPE_SYSTEM'),	/* 워크플로우 관리 */
('ACT', '액티비티 관리', '액티비티 관리', '액티비티 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'ACT', 'ENT_TYPE_SYSTEM'),	/* 액티비티 관리 */
('TAS', '테스크 관리', '테스크 관리', '테스크 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'TAS', 'ENT_TYPE_SYSTEM'),	/* 테스크 관리 */
('CTL', '제어 관리', '제어 관리', '제어 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'CTL', 'ENT_TYPE_SYSTEM'),	/* 제어 관리 */
('FRM', '폼 관리', '폼 관리', '폼 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'FRM', 'ENT_TYPE_SYSTEM'),	/* 폼 관리 */
('WFF', '워크플로우 플로우', '워크플로우 플로우', '워크플로우 플로우', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WFF', 'ENT_TYPE_SYSTEM'),	/* 워크플로우 플로우 */

 ('ORG', '조직 관리', '조직 관리', '조직 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'ORG', 'ENT_TYPE_SYSTEM'),	/* 조직 관리 */
('DPT', '부서 관리', '부서 관리', '부서 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'DPT', 'ENT_TYPE_SYSTEM'),	/* 부서 관리 */
('EMP', '직원 관리', '직원 관리', '직원 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'EMP', 'ENT_TYPE_SYSTEM');	/* 직원 관리 */