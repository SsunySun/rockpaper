/* Entity */
INSERT INTO RSHM.TAB_ENTITY
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 PREFIX, TYPE_CD )
VALUES
('WOT', '근로시간', '근로시간', '근로시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOT', 'ENT_TYPE_WORKFLOW');	/* 근로시간 */

/* Table */
INSERT INTO RSHM.TAB_TABLE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TYPE_CD )
VALUES
('TAB_WORKTIME', '근로시간', '근로시간', '근로시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOT', 'TAB_TYPE_WORKFLOW');	/* 근로시간 */

/* Table Field */
INSERT INTO RSHM.TAB_TABLE_FIELD
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TAB_ID, TFD_ID, TYPE_CD, REF_ENT_ID, REF_CTY_ID, PRODUCT)
VALUES
('TAB_WORKTIME/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_WORKTIME/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_WORKTIME/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_WORKTIME/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_WORKTIME/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_WORKTIME/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_WORKTIME/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_WORKTIME/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_WORKTIME/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_WORKTIME/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_WORKTIME/ENT_ID', 'ENT_ID', '엔티티 ID', '엔티티 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ENT', null, true),	/* 엔티티 ID */
('TAB_WORKTIME/TAS_ID', 'TAS_ID', '단계', '단계', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'TAS', null, true),	/* 단계 */
('TAB_WORKTIME/REQ_DATE', 'REQ_DATE', '요청일', '요청일', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DT', null, null, true),	/* 요청일 */
('TAB_WORKTIME/REQ_EMP_ID', 'REQ_EMP_ID', '요청자', '요청자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 14, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 요청자 */
('TAB_WORKTIME/CLO_DATE', 'CLO_DATE', '종료일', '종료일', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 15, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 종료일 */
('TAB_WORKTIME/CLO_EMP_ID', 'CLO_EMP_ID', '종료자', '종료자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 16, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 종료자 */
('TAB_WORKTIME/ASS_EMP_ID', 'ASS_EMP_ID', '현재 담당자', '현재 담당자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 17, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 현재 담당자 */
('TAB_WORKTIME/SRC_ID', 'SRC_ID', '상위 ID', '상위 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 18, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 상위 ID */
('TAB_WORKTIME/SRC_ENT_ID', 'SRC_ENT_ID', '상위 Entity ID', '상위 Entity ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 19, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ENT', null, true),	/* 상위 Entity ID */
('TAB_WORKTIME/CONTENT', 'CONTENT', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 20, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */

 ('TAB_WORKTIME/WORK_DATE', 'WORK_DATE', '작업일', '작업일', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 21, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DT', null, null, true),	/* 작업일 */
 ('TAB_WORKTIME/CHARGE_EMP_ID', 'CHARGE_EMP_ID', '엔지니어', '엔지니어', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 22, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 엔지니어 */
 ('TAB_WORKTIME/USED_WORK_TIME', 'USED_WORK_TIME', '사용시간', '사용시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 23, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_POINT', null, null, true),	/* 사용시간 */
 ('TAB_WORKTIME/COMPENSATION_TIME', 'COMPENSATION_TIME', '보상시간', '사용시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 24, 
 'WOT', 'TAB_WORKTIME', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_POINT', null, null, true);	/* 보상 발생시간 */


/* Sequence */
INSERT INTO RSHM.TAB_SEQUENCE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, MID_TYPE, MID_NUM, CUR_NUM, LENGTH )
VALUES
('SEQ_WOT', '근로시간', '근로시간', '근로시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 'WOT', 'yyyyMM', 0, 0, 5);	/* 근로시간 */

/* Form */
INSERT INTO RSHM.TAB_FORM
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TAS_ID, CONFIG, SCRIPT )
VALUES
('FRM_WOT_001', '근로시간', '근로시간', '근로시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOT', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/wot/saveForm"
    },
    "external": {
        "timeline": true
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_WORKTIME/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"#{box.key}", "readonly":true, "hidden":false, "require":true, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_WORKTIME/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"#{box.work_date}", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"work_date", "fld_id":"TAB_WORKTIME/WORK_DATE", "label":"작업일", "placeholder":"작업일을 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"#{box.work_date}", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"charge_emp_id", "fld_id":"TAB_WORKTIME/CHARGE_EMP_ID", "label":"엔지니어", "placeholder":"엔지니어를 선택하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"#{box.charge_emp_id}", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"used_work_time", "fld_id":"TAB_WORKTIME/USED_WORK_TIME", "label":"사용시간(시간 단위)", "placeholder":"사용시간(시간 단위)을 입력하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"Number.Point", "config": "", "action": { "type":"", "event":""} },
        {"id":"compensation_time", "fld_id":"TAB_WORKTIME/COMPENSATION_TIME", "label":"보상 발생시간(시간 단위)", "placeholder":"보상 발생시간(시간 단위)을 입력하세요.", "group":"group_002", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"#{box.compensation_time}", "readonly":false, "hidden":false, "require":false, "uiitem":"Number.Point", "config": "", "action": { "type":"", "event":""} },
        {"id":"content", "fld_id":"TAB_WORKTIME/CONTENT", "label":"기타", "placeholder":"기타을 입력하세요.", "group":"group_002", "x":1, "y":3, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": true },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": true, "action": "/api/common/wot/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', '');	/* 근로시간 */