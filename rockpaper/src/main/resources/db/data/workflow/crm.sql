/* Entity */
INSERT INTO RSHM.TAB_ENTITY
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 PREFIX, TYPE_CD )
VALUES
('CRM', 'CRM', 'CRM', 'CRM', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'CRM', 'ENT_TYPE_WORKFLOW');	/* CRM */

/* Table */
INSERT INTO RSHM.TAB_TABLE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TYPE_CD )
VALUES
('TAB_CRM', 'CRM', 'CRM', 'CRM', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'CRM', 'TAB_TYPE_WORKFLOW'),	/* CRM  */
('TAB_CRM_PROD', 'CRM-제품', 'CRM-제품', 'CRM-제품', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'CRM', 'TAB_TYPE_CUSTOM');	/* CRM - 제품  */

/* Table Field */
INSERT INTO RSHM.TAB_TABLE_FIELD
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TAB_ID, TFD_ID, TYPE_CD, REF_ENT_ID, REF_CTY_ID, PRODUCT)
VALUES
('TAB_CRM/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'CRM', 'TAB_CRM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_CRM/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'CRM', 'TAB_CRM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_CRM/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'CRM', 'TAB_CRM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_CRM/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'CRM', 'TAB_CRM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_CRM/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'CRM', 'TAB_CRM', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_CRM/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'CRM', 'TAB_CRM', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_CRM/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'CRM', 'TAB_CRM', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_CRM/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'CRM', 'TAB_CRM', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_CRM/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'CRM', 'TAB_CRM', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_CRM/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'CRM', 'TAB_CRM', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */

('TAB_CRM/OPP_SALES', 'OPP_SALES', '영업 담당자', '영업 담당자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'CRM', 'TAB_CRM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 영업 담당자 */
('TAB_CRM/OPP_ACCOUNT', 'OPP_ACCOUNT', '거래처 이름', '거래처 이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'CRM', 'TAB_CRM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 거래처 이름 */
('TAB_CRM/OPP_CUSTOMER', 'OPP_CUSTOMER', '고객사', '고객사', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'CRM', 'TAB_CRM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 고객사 */
('TAB_CRM/OPP_ENDUSER_CUSTOMER', 'OPP_ENDUSER_CUSTOMER', 'enduser 고객명', 'enduser 고객명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 14, 
 'CRM', 'TAB_CRM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 담당자 */
('TAB_CRM/OPP_ENDUSER_PROJECT', 'OPP_ENDUSER_PROJECT', 'enduser 프로젝트명', 'enduser 프로젝트명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 15, 
 'CRM', 'TAB_CRM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* enduser 프로젝트명 */
('TAB_CRM/OPP_ENDUSER_CHARGE', 'OPP_ENDUSER_CHARGE', 'enduser 담당자', 'enduser 담당자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 16, 
 'CRM', 'TAB_CRM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* enduser 담당자 */
('TAB_CRM/OPP_ENDUSER_PHONE', 'OPP_ENDUSER_PHONE', 'enduser 연락처', 'enduser 연락처', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 17, 
 'CRM', 'TAB_CRM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* enduser 연락처 */
('TAB_CRM/OPP_ENDUSER_EMAIL', 'OPP_ENDUSER_EMAIL', 'enduser 이메일', 'enduser 이메일', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 18, 
 'CRM', 'TAB_CRM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* enduser 이메일 */
('TAB_CRM/OPP_ENDUSER_ADDRESS', 'OPP_ENDUSER_ADDRESS', 'enduser 주소', 'enduser 주소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 19, 
 'CRM', 'TAB_CRM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* enduser 주소 */
('TAB_CRM/OPP_SERVICE_START', 'OPP_SERVICE_START', '서비스시작일', '서비스시작일', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 20, 
 'CRM', 'TAB_CRM', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DT', null, null, true),	/* 서비스시작일 */
('TAB_CRM/OPP_SERVICE_END', 'OPP_SERVICE_END', '서비스종료일', '서비스종료일', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 21, 
 'CRM', 'TAB_CRM', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DT', null, null, true),	/* 서비스종료일 */

-- 제폼 정보
('TAB_CRM_PROD/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_CRM_PROD/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_CRM_PROD/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_CRM_PROD/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_CRM_PROD/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_CRM_PROD/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_CRM_PROD/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_CRM_PROD/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_CRM_PROD/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_CRM_PROD/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */

('TAB_CRM_PROD/ENT_ID', 'ENT_ID', '엔티티 ID', '엔티티 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ENT', null, true),	/* 엔티티 ID */
('TAB_CRM_PROD/TAS_ID', 'TAS_ID', '단계', '단계', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'TAS', null, true),	/* 단계 */
('TAB_CRM_PROD/REQ_DATE', 'REQ_DATE', '요청일', '요청일', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DT', null, null, true),	/* 요청일 */
('TAB_CRM_PROD/REQ_EMP_ID', 'REQ_EMP_ID', '요청자', '요청자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 14, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 요청자 */
('TAB_CRM_PROD/CLO_DATE', 'CLO_DATE', '종료일', '종료일', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 15, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 종료일 */
('TAB_CRM_PROD/CLO_EMP_ID', 'CLO_EMP_ID', '종료자', '종료자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 16, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 종료자 */
('TAB_CRM_PROD/ASS_EMP_ID', 'ASS_EMP_ID', '현재 담당자', '현재 담당자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 17, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 현재 담당자 */
('TAB_CRM_PROD/SRC_ID', 'SRC_ID', '상위 ID', '상위 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 18, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 상위 ID */
('TAB_CRM_PROD/SRC_ENT_ID', 'SRC_ENT_ID', '상위 Entity ID', '상위 Entity ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 19, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ENT', null, true),	/* 상위 Entity ID */
('TAB_CRM_PROD/CONTENT', 'CONTENT', '지원 내역', '지원 내역', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 20, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 지원 내역 */

('TAB_CRM_PROD/PRODUCT_QUANTITY', 'PRODUCT_QUANTITY', '수량', '수량', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 21, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 수량 */
('TAB_CRM_PROD/PRODUCT_DESCRIPTION', 'PRODUCT_DESCRIPTION', '상세설명', '상세설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 22, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 상세설명 */
('TAB_CRM_PROD/PRODUCT_TYPE', 'PRODUCT_TYPE', '제품 타입', '제품 타입', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 23, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 제품 타입 */
('TAB_CRM_PROD/PRODUCT_CATEGORY', 'PRODUCT_CATEGORY', '제품 카테고리', '제품 카테고리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 24, 
 'CRM', 'TAB_CRM_PROD', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true);	/* 제품 카테고리 */


/* Menu */
INSERT INTO RSHM.TAB_MENU
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 PID, LEVEL, URL, ICON, ASIDE, NEW, LEADER, ADMIN )
VALUES
('MEN_CRM', 'CRM', 'CRM', 'CRM', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 null, 1, null, null, true, false, false, false),	/* CRM */

('MEN_CRM_001', 'CRM 목록', 'CRM 목록', 'CRM 목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'MEN_CRM', 2, '/common/list?lstId=LST_CRM_001', 2, true, false, false, false);	/* CRM 목록 */

/* Form */
INSERT INTO RSHM.TAB_FORM
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TAS_ID, CONFIG, SCRIPT )
VALUES
('FRM_CRM001', 'CRM', 'CRM', 'CRM', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'CRM', null,
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/crm/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_CRM/ID", "label":"영업기회코드", "placeholder":"영업기회코드를 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_CRM/NAME", "label":"영업기회 이름", "placeholder":"영업기회 이름을 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"opp_sales", "fld_id":"TAB_CRM/OPP_SALES", "label":"영업 담당자", "placeholder":"영업 담당자를 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"opp_account", "fld_id":"TAB_CRM/OPP_ACCOUNT", "label":"거래처 이름", "placeholder":"거래처 이름을 입력하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"opp_customer", "fld_id":"TAB_CRM/OPP_CUSTOMER", "label":"고객사", "placeholder":"고객사를 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"opp_enduser_customer", "fld_id":"TAB_CRM/OPP_ENDUSER_CUSTOMER", "label":"영업 담당자", "placeholder":"영업 담당자를 입력하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"opp_enduser_project", "fld_id":"TAB_CRM/OPP_ENDUSER_PROJECT", "label":"enduser enduser 프로젝트명", "placeholder":"enduser enduser 프로젝트명를 입력하세요.", "group":"group_001", "x":1, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"opp_enduser_charge", "fld_id":"TAB_CRM/OPP_ENDUSER_CHARGE", "label":"enduser 담당자", "placeholder":"enduser 담당자를 입력하세요.", "group":"group_001", "x":2, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"opp_enduser_phone", "fld_id":"TAB_CRM/OPP_ENDUSER_PHONE", "label":"enduser 연락처", "placeholder":"enduser 연락처를 입력하세요.", "group":"group_001", "x":1, "y":5, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"opp_enduser_email", "fld_id":"TAB_CRM/OPP_ENDUSER_EMAIL", "label":"enduser 이메일", "placeholder":"enduser 이메일을 입력하세요.", "group":"group_001", "x":2, "y":5, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"opp_enduser_address", "fld_id":"TAB_CRM/OPP_ENDUSER_ADDRESS", "label":"enduser 주소", "placeholder":"enduser 주소를 입력하세요.", "group":"group_001", "x":1, "y":6, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"opp_service_start", "fld_id":"TAB_CRM/OPP_SERVICE_START", "label":"서비스 시작일", "placeholder":"서비스 시작일을 입력하세요.", "group":"group_001", "x":1, "y":7, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"opp_service_end", "fld_id":"TAB_CRM/OPP_SERVICE_END", "label":"서비스 종료일", "placeholder":"서비스 종료일을 입력하세요.", "group":"group_001", "x":2, "y":7, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"relation", "fld_id":"", "label":"제품정보", "placeholder":"", "group":"group_001", "x":1, "y":8, "cols":12, "rows": 3, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Custom.Relation", "config":"RLT_CRM001", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/crm/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', '');	/* CRM */

/* List */
INSERT INTO RSHM.TAB_LIST
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 QUERY, CONFIG, SCRIPT )
VALUES
('LST_CRM_001', 'CRM', 'CRM', 'CRM', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
       name
  from tab_crm',
 '{
    "sql": {
        "where": false,
        "stmts": [
            { "stmt":"id like concat(\'%\', ?, \'%\')", "id":"id", "param": "id", "type": "text", "require": false},
            { "stmt":"name like concat(\'%\', ?, \'%\')", "id":"name", "param": "name", "type": "text", "require": false},
            { "stmt":"label like concat(\'%\', ?, \'%\')", "id":"label", "param": "label", "type": "text", "require": false},
            { "stmt":"descr like concat(\'%\', ?, \'%\')", "id":"descr", "param": "descr", "type": "text", "require": false},
            { "stmt":"used = ?", "id":"used", "param": "used", "type": "boolean", "require": false},
            { "stmt":"order_by = ?", "id":"order_by", "param": "order_by", "type": "integer", "require": false},
            { "stmt":"create_date between str_to_date(? \'000000\', \'%y-%m-%d  %h%i%s\') and str_to_date(? \'235959\', \'%y-%m-%d  %h%i%s\')", "id":"create_date", "param": "start_create_date,end_create_date", "type": "range-date", "require": false},
            { "stmt":"create_emp_id like concat(\'%\', ?, \'%\')", "id":"create_emp_id", "param": "create_emp_id", "type": "text", "require": false},
            { "stmt":"update_date between str_to_date(? \'000000\', \'%y-%m-%d  %h%i%s\') and str_to_date(? \'235959\', \'%y-%m-%d  %h%i%s\')", "id":"update_date", "param": "start_update_date,end_update_date", "type": "range-date", "require": false},
            { "stmt":"update_emp_id like concat(\'%\', ?, \'%\')", "id":"update_emp_id", "param": "update_emp_id", "type": "text", "require": false}
        ]
    },
    "action": {
        "create_btn": {
            "use": false,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_CRM001",
            "modal_title": "CRM 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_CRM001&auth=false"
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
            { "id": "id", "label": "영업기회코드", "uiitem":"String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "name", "label": "영업기회 이름", "uiitem": "String.Text", "width": 3, "index": 1, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "영업기회코드", "data": "id", "type": "view" },
        { "name": "영업기회 이름", "data": "name", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ]
}', '');	/* CRM */

/* Relation */
INSERT INTO RSHM.TAB_RELATION
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TAB_ID, QUERY, CONFIG )
VALUES
('RLT_CRM001', '제품정보', '제품정보', '제품정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'CRM', 'TAB_CRM_PROD',
 'select *,
         \'false\' as is_edit
   from tab_crm_prod
  where src_id = \'#{key}\'', 
 '{
    "mode": "horizontal",
    "groupds": [
        { "id": "relation_group_001", "title": "기본 정보", "index": 1, "expand": true }
    ],
    "fields": [
        { "id":"id", "fld_id":"TAB_CRM_PROD/ID", "label":"ID", "placeholder":"미입력시 자동으로 입력됩니다.", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"100%", "def_val":"", "readonly":true, "hidden":true, "require":false, "uiitem":"String.ID", "config":"" },
        { "id":"product_quantity", "fld_id":"TAB_CRM_PROD/PRODUCT_QUANTITY", "label":"수량", "placeholder":"수량을 입력하세요.", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"100%", "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"" },
        { "id":"product_description", "fld_id":"TAB_CRM_PROD/PRODUCT_DESCRIPTION", "label":"상세설명", "placeholder":"상세설명을 입력하세요.", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"100%", "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"" },
        { "id":"product_type", "fld_id":"TAB_CRM_PROD/PRODUCT_TYPE", "label":"제품 타입", "placeholder":"제품 타입을 입력하세요.", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"100%", "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"" },
        { "id":"product_category", "fld_id":"TAB_CRM_PROD/PRODUCT_CATEGORY", "label":"제품 카테고리", "placeholder":"제품 카테고리를 입력하세요.", "group":"relation_group_001", "x":1, "y":1, "cols":12, "rows": 1, "width":"100%", "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"" }
    ]
}');	/* 제품정보 */
