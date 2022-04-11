/* Entity */
INSERT INTO RSHM.TAB_ENTITY
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 PREFIX, TYPE_CD )
VALUES
('REQ', '개선요청', '개선요청', '개선요청', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'REQ', 'ENT_TYPE_WORKFLOW');	/* 개선요청 */

/* Table */
INSERT INTO RSHM.TAB_TABLE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TYPE_CD )
VALUES
('TAB_REQ', '개선요청', '개선요청', '개선요청', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'REQ', 'TAB_TYPE_WORKFLOW');	/* 개선요청 */

/* Table Field */
INSERT INTO RSHM.TAB_TABLE_FIELD
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TAB_ID, TFD_ID, TYPE_CD, REF_ENT_ID, REF_CTY_ID, PRODUCT)
VALUES
('TAB_REQ/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'REQ', 'TAB_REQ', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_REQ/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'REQ', 'TAB_REQ', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_REQ/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'REQ', 'TAB_REQ', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_REQ/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'REQ', 'TAB_REQ', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_REQ/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'REQ', 'TAB_REQ', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_REQ/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'REQ', 'TAB_REQ', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_REQ/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'REQ', 'TAB_REQ', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_REQ/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'REQ', 'TAB_REQ', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_REQ/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'REQ', 'TAB_REQ', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_REQ/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'REQ', 'TAB_REQ', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_REQ/ENT_ID', 'ENT_ID', '엔티티 ID', '엔티티 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'REQ', 'TAB_REQ', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ENT', null, true),	/* 엔티티 ID */
('TAB_REQ/TAS_ID', 'TAS_ID', '단계', '단계', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'REQ', 'TAB_REQ', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'TAS', null, true),	/* 단계 */
('TAB_REQ/REQ_DATE', 'REQ_DATE', '요청일', '요청일', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'REQ', 'TAB_REQ', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DT', null, null, true),	/* 요청일 */
('TAB_REQ/REQ_EMP_ID', 'REQ_EMP_ID', '요청자', '요청자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 14, 
 'REQ', 'TAB_REQ', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 요청자 */
('TAB_REQ/CLO_DATE', 'CLO_DATE', '종료일', '종료일', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 15, 
 'REQ', 'TAB_REQ', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 종료일 */
('TAB_REQ/CLO_EMP_ID', 'CLO_EMP_ID', '종료자', '종료자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 16, 
 'REQ', 'TAB_REQ', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 종료자 */
('TAB_REQ/ASS_EMP_ID', 'ASS_EMP_ID', '현재 담당자', '현재 담당자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 17, 
 'REQ', 'TAB_REQ', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 현재 담당자 */
('TAB_REQ/SRC_ID', 'SRC_ID', '상위 ID', '상위 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 18, 
 'REQ', 'TAB_REQ', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 상위 ID */
('TAB_REQ/SRC_ENT_ID', 'SRC_ENT_ID', '상위 Entity ID', '상위 Entity ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 19, 
 'REQ', 'TAB_REQ', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ENT', null, true),	/* 상위 Entity ID */
('TAB_REQ/REQUEST_CONTENT', 'REQUEST_CONTENT', '요청내용', '요청내용', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 20, 
 'REQ', 'TAB_REQ', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 요청내용 */
('TAB_REQ/ANSWER_CONTENT', 'ANSWER_CONTENT', '요청내용 답변', '요청내용 답변', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 21, 
 'REQ', 'TAB_REQ', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true);	/* 요청내용 답변 */

/* Sequence */
INSERT INTO RSHM.TAB_SEQUENCE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, MID_TYPE, MID_NUM, CUR_NUM, LENGTH )
VALUES
('SEQ_REQ', '기술지원', '기술지원', '기술지원', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 'REQ', 'yyyyMM', 0, 0, 5);	/* 기술지원 */

/* Menu */
INSERT INTO RSHM.TAB_MENU
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 PID, LEVEL, URL, ICON, ASIDE, NEW, LEADER, ADMIN )
VALUES
('MEN_REQ', '개선요청', '개선요청', '개선요청', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 null, 1, null, null, true, false, false, false),	/* 개선요청 */

('MEN_REQ_001', '개선요청', '개선요청', '개선요청', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'MEN_REQ', 2, '/common/list?lstId=LST_REQ_001', 2, true, false, false, false);	/* 개선요청 */

/* Workflow */
INSERT INTO RSHM.TAB_WORKFLOW
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID )
VALUES
('WOF_REQ_001', '개선요청', '개선요청', '개선요청', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'REQ');	/* 개선요청 */

/* Activity */
INSERT INTO RSHM.TAB_ACTIVITY
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, WOF_ID )
VALUES
/* 개선요청 */
('ACT_REQ_001', '등록', '등록', '등록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'REQ', 'WOF_REQ_001'),	/* 등록 */
('ACT_REQ_002', '진행', '진행', '진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'REQ', 'WOF_REQ_001'),	/* 진행 */
('ACT_REQ_003', '완료', '완료', '완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'REQ', 'WOF_REQ_001');	/* 완료 */

/* Task */
INSERT INTO RSHM.TAB_TASK
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, ACT_ID, TYPE_CD )
VALUES
/* 개선요청 */
('TAS_REQ_001', '등록', '등록', '등록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'REQ', 'ACT_REQ_001', 'TAS_TYPE_REG'),	/* 등록 */
('TAS_REQ_002', '임시저장', '임시저장', '임시저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'REQ', 'ACT_REQ_001', 'TAS_TYPE_REG'),	/* 임시저장 */
('TAS_REQ_003', '진행', '진행', '진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'REQ', 'ACT_REQ_002', 'TAS_TYPE_PROC'),	/* 진행 */
('TAS_REQ_004', '완료', '완료', '완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'REQ', 'ACT_REQ_003', 'TAS_TYPE_COMP'),	/* 완료 */
('TAS_REQ_005', '취소', '취소', '취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'REQ', 'ACT_REQ_003', 'TAS_TYPE_CANCEL');	/* 취소 */

/* Control */
INSERT INTO RSHM.TAB_CONTROL
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TAS_ID, NEXT_TAS_ID, TYPE_CD, DATA_UPDATE, CONTENT_ID)
VALUES
/* 개선요청 */
('CTL_REQ_001', '임시저장', '임시저장', '임시저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'REQ', 'TAS_REQ_001', 'TAS_REQ_002', 'CTL_TYPE_SECONDARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"}
]', null),	/* 등록 -> 임시저장 */
('CTL_REQ_002', '진행', '진행', '진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'REQ', 'TAS_REQ_001', 'TAS_REQ_003', 'CTL_TYPE_PRIMARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"}
]', null),	/* 등록 -> 진행 */

('CTL_REQ_003', '저장', '저장', '저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'REQ', 'TAS_REQ_002', 'TAS_REQ_002', 'CTL_TYPE_SECONDARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"}
]', null),	/* 임시저장 -> 임시저장 */
('CTL_REQ_004', '진행', '진행', '진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'REQ', 'TAS_REQ_002', 'TAS_REQ_003', 'CTL_TYPE_PRIMARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"}
]', null),	/* 임시저장 -> 진행 */
('CTL_REQ_005', '등록취소', '등록취소', '등록취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'REQ', 'TAS_REQ_002', 'TAS_REQ_005', 'CTL_TYPE_DANGER', '[
    {"field":"ass_emp_id", "value":""},
    {"field":"clo_emp_id", "value":"#{user.id}"},
    {"field":"clo_date", "value":"#{date.curDTTM}"}
]', null),	/* 임시저장 - 등록취소 */

('CTL_REQ_006', '저장', '저장', '저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'REQ', 'TAS_REQ_003', 'TAS_REQ_003', 'CTL_TYPE_SECONDARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"}
]', null),	/* 진행 -> 진행 */
('CTL_REQ_007', '완료', '완료', '완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'REQ', 'TAS_REQ_003', 'TAS_REQ_004', 'CTL_TYPE_PRIMARY', '[
    {"field":"ass_emp_id", "value":""},
    {"field":"clo_emp_id", "value":"#{user.id}"},
    {"field":"clo_date", "value":"#{date.curDTTM}"}
]', 'CTN_REQ_CLOSE'),	/* 진행 -> 완료 */
('CTL_REQ_008', '등록취소', '등록취소', '등록취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'REQ', 'TAS_REQ_003', 'TAS_REQ_005', 'CTL_TYPE_DANGER', '[
    {"field":"ass_emp_id", "value":""},
    {"field":"clo_emp_id", "value":"#{user.id}"},
    {"field":"clo_date", "value":"#{date.curDTTM}"}
]', null);	/* 진행 -> 등록취소 */

/* Form */
INSERT INTO RSHM.TAB_FORM
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TAS_ID, CONFIG, SCRIPT )
VALUES
('FRM_REQ_001', '개선요청 - 등록', '개선요청 - 등록', '개선요청 - 등록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'REQ', 'TAS_REQ_001',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/req/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true }
    ],
     "fields": [ 
        {"id":"req_date", "fld_id":"TAB_REQ/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"#{date.curDT}", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_REQ/REQ_EMP_ID", "label":"등록자", "placeholder":"등록자를 선택하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"#{user.id}", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_REQ/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"request_content", "fld_id":"TAB_REQ/REQUEST_CONTENT", "label":"요청내용", "placeholder":"요청 내용을 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/req/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 개선요청 - 등록 */
('FRM_REQ_002', '개선요청 - 임시저장', '개선요청 - 임시저장', '개선요청 - 임시저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'REQ', 'TAS_REQ_002',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/req/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_REQ/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_date", "fld_id":"TAB_REQ/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"#{date.curDT}", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_REQ/REQ_EMP_ID", "label":"등록자", "placeholder":"등록자를 선택하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"#{user.id}", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_REQ/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"request_content", "fld_id":"TAB_REQ/REQUEST_CONTENT", "label":"요청내용", "placeholder":"요청 내용을 입력하세요.", "group":"group_001", "x":1, "y":4, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/req/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 개선요청 - 임시저장 */
('FRM_REQ_003', '개선요청 - 진행', '개선요청 - 진행', '개선요청 - 진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'REQ', 'TAS_REQ_003',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/req/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_REQ/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_date", "fld_id":"TAB_REQ/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"#{date.curDT}", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_REQ/REQ_EMP_ID", "label":"등록자", "placeholder":"등록자를 선택하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"#{user.id}", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_REQ/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"request_content", "fld_id":"TAB_REQ/REQUEST_CONTENT", "label":"요청내용", "placeholder":"요청 내용을 입력하세요.", "group":"group_001", "x":1, "y":4, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },

        {"id":"answer_content", "fld_id":"TAB_REQ/ANSWER_CONTENT", "label":"요청내용 답변", "placeholder":"요청내용 답변을 입력하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/req/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 개선요청 - 진행 */
('FRM_REQ_004', '개선요청 - 완료', '개선요청 - 완료', '개선요청 - 완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'REQ', 'TAS_REQ_004',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/req/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_REQ/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_date", "fld_id":"TAB_REQ/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"#{date.curDT}", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_REQ/REQ_EMP_ID", "label":"등록자", "placeholder":"등록자를 선택하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"#{user.id}", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_REQ/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"request_content", "fld_id":"TAB_REQ/REQUEST_CONTENT", "label":"요청내용", "placeholder":"요청 내용을 입력하세요.", "group":"group_001", "x":1, "y":4, "cols":12, "rows": 3, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },

        {"id":"answer_content", "fld_id":"TAB_REQ/ANSWER_CONTENT", "label":"요청내용 답변", "placeholder":"요청내용 답변을 입력하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 3, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/req/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 업무지원 - 완료 */
('FRM_REQ_005', '업무지원 - 취소', '업무지원 - 취소', '업무지원 - 취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'REQ', 'TAS_REQ_005',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/req/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_REQ/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_date", "fld_id":"TAB_REQ/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"#{date.curDT}", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_REQ/REQ_EMP_ID", "label":"등록자", "placeholder":"등록자를 선택하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"#{user.id}", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_REQ/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"request_content", "fld_id":"TAB_REQ/REQUEST_CONTENT", "label":"요청내용", "placeholder":"요청 내용을 입력하세요.", "group":"group_001", "x":1, "y":4, "cols":12, "rows": 3, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },

        {"id":"answer_content", "fld_id":"TAB_REQ/ANSWER_CONTENT", "label":"요청내용 답변", "placeholder":"요청내용 답변을 입력하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 3, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/req/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', '');	/* 업무지원 - 취소 */

/* List */
INSERT INTO RSHM.TAB_LIST
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 QUERY, CONFIG, SCRIPT )
VALUES
('LST_REQ_001', '개선요청', '개선요청', '개선요청', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = req.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       (select name
		  from tab_task
         where id = req.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = req.req_emp_id) as req_emp_name
  from tab_req req', 
 '{
    "sql": {
        "where": false,
        "stmts": [
            { "stmt":"id like concat(\'%\', ?, \'%\')", "id":"id", "param": "id", "type": "text", "require": false},
            { "stmt":"name like concat(\'%\', ?, \'%\')", "id":"name", "param": "name", "type": "text", "require": false},
            { "stmt":"date_format(req_date, \'%Y-%m-%d\') between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"req_date", "param": "start_req_date,end_req_date", "type": "range-date", "require": true}
        ]
    },
    "action": {
        "create_btn": {
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_REQ_001",
            "modal_title": "개선사항 등록"
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
            { "id": "req_date", "label": "요청일", "uiitem": "Date.Range.DT", "width": 6, "index": 3, "def_val": "m-1,d+0", "config": "" },
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "name", "label": "제목", "uiitem": "String.Text", "width": 3, "index": 1, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "제목", "data": "name", "type": "view" },
        { "name": "단계", "data": "tas_name", "type": "view" },
        { "name": "요청일", "data": "req_date", "type": "view" },
        { "name": "요청자", "data": "req_emp_name", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "desc" }
}', '');