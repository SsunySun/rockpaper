/**
 * Employee Table Initialize Data
 */

/* Admin User */

/* Organization */
INSERT INTO RSHM.TAB_ORG
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY )
VALUES
('ORG_ROCKPLACE', 'Rockplace', 'Rockplace', 'Rockplace', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1),  /* 락플레이스 */
('ORG_OSZONE', 'OSZone', 'OSZone', 'OSZone', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1);    /* 오에스존 */

/* Department */
INSERT INTO RSHM.TAB_DEPT
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY,
 PID, LEVEL ,ORG_ID)
VALUES
('DPT_ROCKPLACE', 'Rockplace', 'Rockplace', 'Rockplace', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 null, 1, 'ORG_ROCKPLACE'),  /* 락플레이스 */
('DPT_OSZONE', 'OSZone', 'OSZone', 'OSZone', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 null, 1, 'ORG_OSZONE');  /* 오에스존 */


 /* Employee */
INSERT INTO RSHM.TAB_EMPLOYEE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY,
 ORG_ID, DPT_ID, NUMBER, HPHONE, JOB_TEL, POSITION_CD, DUTY_POSITION_CD, 
 MGR_EMP_ID, MAIL_USED, AGC_EMP_ID, AGC_START_DATE, AGC_END_DATE, PASSWD)
VALUES
('rshmadmin@rockplace.co.kr', '관리자', '관리자', '관리자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 'ORG_ROCKPLACE', 'DPT_ROCKPLACE', '000', '', '', null, null,
 null, false, null, null, null, null);  /* 관리자 */


