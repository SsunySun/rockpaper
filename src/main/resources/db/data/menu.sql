/**
 * Menu Table Initialize Data
 */
INSERT INTO RSHM.TAB_MENU
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 PID, LEVEL, URL, ICON, ASIDE, NEW, LEADER, ADMIN )
VALUES
/* index */
('MEN_INDEX', 'Index', 'Index', 'Index', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, false, 0, 
 null, 1, '/', 0, true, false, false, false),	/* index */

/* Dashboard */
('MEN_DASHBOARD', 'Dashboard', 'Dashboard', 'Dashboard', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, false, 0, 
 null, 1, '/dashboard', 0, true, false, false, false),	/* Dashboard */

 /* 시스템 관리 */
('MEN_ADMIN', '시스템 관리', '시스템 관리', '시스템 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 99, 
 null, 1, null, null, true, false, false, true),	/* 시스템 관리 */

('MEN_ADMIN001', 'AdminConsole', 'AdminConsole', 'AdminConsole', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'MEN_ADMIN', 2, '/admin/console', 5, false, true, false, true),	/* AdminConsole */
('MEN_ADMIN002', '테이블 필드 관리', '테이블 필드 관리', '테이블 필드 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'MEN_ADMIN', 2, '/admin/tablefield', 5, false, true, false, true),	/* 테이블 필드 관리 */
('MEN_ADMIN003', '엔티티 관리', '엔티티 관리', '엔티티 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'MEN_ADMIN', 2, '/common/list?lstId=LST_ENT001', 5, true, false, false, true),	/* 엔티티 관리 */
('MEN_ADMIN004', '테이블 관리', '테이블 관리', '테이블 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'MEN_ADMIN', 2, '/common/list?lstId=LST_TAB001', 6, true, false, false, true),	/* 테이블 관리 */
('MEN_ADMIN005', '시퀀스 관리', '시퀀스 관리', '시퀀스 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'MEN_ADMIN', 2, '/common/list?lstId=LST_SEQ001', 7, true, false, false, true),	/* 시퀀스 관리 */

('MEN_ADMIN006', '코드 타입 관리', '코드 타입 관리', '코드 타입 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'MEN_ADMIN', 2, '/common/list?lstId=LST_CTY001', 8, true, false, false, true),	/* 코드 타입 관리 */
('MEN_ADMIN007', '코드 관리', '코드 관리', '코드 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'MEN_ADMIN', 2, '/common/list?lstId=LST_COD001', 9, true, false, false, true),	/* 코드 관리 */

('MEN_ADMIN008', '메뉴 관리', '메뉴 관리', '메뉴 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'MEN_ADMIN', 2, '/common/list?lstId=LST_MEN001', 10, true, false, false, true),	/* 메뉴 관리 */
('MEN_ADMIN009', '로그 관리', '로그 관리', '로그 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'MEN_ADMIN', 2, '/common/list?lstId=LST_LOG001', 11, true, false, false, true),	/* 로그 관리 */
('MEN_ADMIN010', '휴일 관리', '휴일 관리', '휴일 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'MEN_ADMIN', 2, '/common/list?lstId=LST_HOD001', 12, true, false, false, true),	/* 휴일 관리 */

('MEN_ADMIN011', 'SQL 관리', 'SQL 관리', 'SQL 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'MEN_ADMIN', 2, '/common/list?lstId=LST_SQL001', 13, true, false, false, true),	/* SQL 관리 */
('MEN_ADMIN012', '리스트 관리', '리스트 관리', '리스트 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'MEN_ADMIN', 2, '/common/list?lstId=LST_LST001', 14, true, false, false, true),	/* 리스트 관리 */
('MEN_ADMIN013', '릴레이션 관리', '릴레이션 관리', '릴레이션 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'MEN_ADMIN', 2, '/common/list?lstId=LST_RLT001', 15, true, false, false, true),	/* 릴레이션 관리 */
('MEN_ADMIN014', '컨텐츠 관리', '컨텐츠 관리', '컨텐츠 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 14, 
 'MEN_ADMIN', 2, '/common/list?lstId=LST_CTN001', 16, true, false, false, true),	/* 컨텐츠 관리 */

('MEN_ADMIN015', '필드 타입 관리', '필드 타입 관리', '필드 타입 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 15, 
 'MEN_ADMIN', 2, '/common/list?lstId=LST_FLT001', 17, true, false, false, true),	/* 필드 타입 관리 */

('MEN_ADMIN016', '조직 관리', '조직 관리', '조직 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 16, 
 'MEN_ADMIN', 2, '/common/list?lstId=LST_ORG001', 18, true, false, false, true),	/* 조직 관리 */
('MEN_ADMIN017', '부서 관리', '부서 관리', '부서 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 17, 
 'MEN_ADMIN', 2, '/common/list?lstId=LST_DPT001', 19, true, false, false, true),	/* 부서 관리 */
('MEN_ADMIN018', '직원 관리', '직원 관리', '직원 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 18, 
 'MEN_ADMIN', 2, '/common/list?lstId=LST_EMP001', 0, true, false, false, true),	/* 직원 관리 */

('MEN_ADMIN019', '워크플로우 관리', '워크플로우 관리', '워크플로우 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 19, 
 'MEN_ADMIN', 2, '/common/list?lstId=LST_WOF001', 1, true, false, false, true),	/* 워크플로우 관리 */
('MEN_ADMIN020', '액티비티 관리', '액티비티 관리', '액티비티 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 20, 
 'MEN_ADMIN', 2, '/common/list?lstId=LST_ACT001', 2, true, false, false, true),	/* 액티비티 관리 */
('MEN_ADMIN021', '테스크 관리', '테스크 관리', '테스크 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 21, 
 'MEN_ADMIN', 2, '/common/list?lstId=LST_TAS001', 3, true, false, false, true),	/* 테스크 관리 */
('MEN_ADMIN022', '제어 관리', '제어 관리', '제어 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 22, 
 'MEN_ADMIN', 2, '/common/list?lstId=LST_CTL001', 4, true, false, false, true),	/* 제어 관리 */
('MEN_ADMIN023', '폼 관리', '폼 관리', '폼 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 23, 
 'MEN_ADMIN', 2, '/common/list?lstId=LST_FRM001', 5, true, false, false, true);	/* 폼 관리 */

