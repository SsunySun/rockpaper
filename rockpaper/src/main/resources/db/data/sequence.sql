/**
 * Sequence Table Initialize Data
 */
INSERT INTO RSHM.TAB_SEQUENCE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, MID_TYPE, MID_NUM, CUR_NUM, LENGTH )
VALUES
('SEQ_ENT', '엔티티 관리', '엔티티 관리', '엔티티 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 'ENT', '', 0, 0, 5),	/* 엔티티 관리 */
('SEQ_TAB', '테이블 관리', '테이블 관리', '테이블 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 'TAB', '', 0, 0, 5),	/* 테이블 관리 */
('SEQ_SEQ', '시퀀스 관리', '시퀀스 관리', '시퀀스 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 'SEQ', '', 0, 0, 5),	/* 시퀀스 관리 */

('SEQ_MEN', '메뉴 관리', '메뉴 관리', '메뉴 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 'MEN', '', 0, 0, 5),	/* 메뉴 관리 */
-- ('SEQ_LOG', '로그 관리', '로그 관리', '로그 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
--  'LOG', '', 0, 0, 5),	/* 로그 관리 */
-- ('SEQ_HOD', '휴일 관리', '휴일 관리', '휴일 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
--  'HOD', '', 0, 0, 5),	/* 휴일 관리 */

('SEQ_SQL', 'SQL 관리', 'SQL 관리', 'SQL 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 'SQL', '', 0, 0, 5),	/* SQL 관리 */
('SEQ_LST', '리스트 관리', '리스트 관리', '리스트 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 'LST', '', 0, 0, 5),	/* 리스트 관리 */
('SEQ_RLT', '릴레이션 관리', '릴레이션 관리', '릴레이션 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 'RLT', '', 0, 0, 5),	/* 릴레이션 관리 */
('SEQ_CTN', '컨텐츠 관리', '컨텐츠 관리', '컨텐츠 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 'CTN', '', 0, 0, 5),	/* 컨텐츠 관리 */

('SEQ_FLT', '필드 타입 관리', '필드 타입 관리', '필드 타입 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 'FLT', '', 0, 0, 5),	/* 필드 타입 관리 */
 
('SEQ_WOF', '워크플로우 관리', '워크플로우 관리', '워크플로우 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 'WOF', '', 0, 0, 5),	/* 워크플로우 관리 */
('SEQ_ACT', '액티비티 관리', '액티비티 관리', '액티비티 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 'ACT', '', 0, 0, 5),	/* 액티비티 관리 */
('SEQ_TAS', '테스크 관리', '테스크 관리', '테스크 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 'TAS', '', 0, 0, 5),	/* 테스크 관리 */
('SEQ_CTL', '제어 관리', '제어 관리', '제어 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 'CTL', '', 0, 0, 5),	/* 제어 관리 */
('SEQ_FRM', '폼 관리', '폼 관리', '폼 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 'FRM', '', 0, 0, 5),	/* 폼 관리 */
-- ('SEQ_WFF', '워크플로우 플루오', '워크플로우 플루오', '워크플로우 플루오', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
--  'WFF', 'yyyyMMdd', 0, 0, 5),	/* 워크플로우 플루오 */

('SEQ_ORG', '조직 관리', '조직 관리', '조직 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 'ORG', '', 0, 0, 5),	/* 조직 관리 */
('SEQ_DPT', '부서 관리', '부서 관리', '부서 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 'DPT', '', 0, 0, 5),	/* 부서 관리 */
('SEQ_EMP', '직원 관리', '직원 관리', '직원 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 'EMP', '', 0, 0, 5);	/* 직원 관리 */