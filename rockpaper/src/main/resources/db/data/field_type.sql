/**
 * Field Type Table Initialize Data
 */
INSERT INTO RSHM.TAB_FIELD_TYPE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 TYPE_CD, DEF_UIITEM )
VALUES
('FLT00001', 'Text', 'Text', 'Text', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'FLT_TYPE_STRING', 'String.Text'),	/* String */
('FLT00002', 'Number', 'Number', 'Number', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'FLT_TYPE_NUMBER', 'Number'),	/* Number */
('FLT00003', 'Date', 'Date', 'Date', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'FLT_TYPE_DATE', 'Date.DTTM'),	/* Date */
('FLT00004', 'Boolean', 'Boolean', 'Boolean', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'FLT_TYPE_BOOLEAN', 'Boolean.Select'),	/* Boolean */
('FLT00005', 'Code', 'Code', 'Code', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'FLT_TYPE_CODE', 'Code.Select'),	/* Code */
('FLT00006', 'Custom', 'Custom', 'Custom', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'FLT_TYPE_CUSTOM', 'Custom.Relation');	/* Custom */

