-- DELETE FROM RSHM.TAB_WFF;


DELETE FROM RSHM.TAB_FORM;
DELETE FROM RSHM.TAB_CONTROL;
DELETE FROM RSHM.TAB_TASK;
DELETE FROM RSHM.TAB_ACTIVITY;
DELETE FROM RSHM.TAB_WORKFLOW;

DELETE FROM RSHM.TAB_CONTENT;

DELETE FROM RSHM.TAB_TABLE_FIELD;

DELETE FROM RSHM.TAB_RELATION;

DELETE FROM RSHM.TAB_TABLE;
DELETE FROM RSHM.TAB_SEQUENCE;
DELETE FROM RSHM.TAB_ENTITY;

DELETE FROM RSHM.TAB_FIELD_TYPE;

-- DELETE FROM RSHM.TAB_EMPLOYEE;
-- DELETE FROM RSHM.TAB_DEPT;
-- DELETE FROM RSHM.TAB_ORG;
-- DELETE FROM RSHM.TAB_CRM;
-- DELETE FROM RSHM.TAB_CRM_PROD;

DELETE FROM RSHM.TAB_CODE WHERE PID IS NOT NULL;
DELETE FROM RSHM.TAB_CODE WHERE PID IS NULL;
DELETE FROM RSHM.TAB_CODE_TYPE;

DELETE FROM RSHM.TAB_SQL;
DELETE FROM RSHM.TAB_LIST;
DELETE FROM RSHM.TAB_CONTENT;

DELETE FROM RSHM.TAB_MENU WHERE PID IS NOT NULL;
DELETE FROM RSHM.TAB_MENU WHERE PID IS NULL;

DELETE FROM RSHM.TAB_LIST;
DELETE FROM RSHM.TAB_SQL;
