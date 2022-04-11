/**
 * Form Table Initialize Data
 */
INSERT INTO RSHM.TAB_FORM
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TAS_ID, CONFIG, SCRIPT )
VALUES
('FRM_ENT001', '엔티티 관리', '엔티티 관리', '엔티티 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'ENT', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/ent/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_ENTITY/ID", "label":"ID", "placeholder":"ID를 입력하세요. 미입력시 자동으로 입력됩니다.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"name", "fld_id":"TAB_ENTITY/NAME", "label":"이름", "placeholder":"이름을 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"label", "fld_id":"TAB_ENTITY/LABEL", "label":"라벨", "placeholder":"라벨를 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"descr", "fld_id":"TAB_ENTITY/DESCR", "label":"설명", "placeholder":"설명을 입력하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"used", "fld_id":"TAB_ENTITY/USED", "label":"사용 여부", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"order_by", "fld_id":"TAB_ENTITY/ORDER_BY", "label":"순서", "placeholder":"순서를 입력하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },

        {"id":"prefix", "fld_id":"TAB_ENTITY/PREFIX", "label":"엔티티 Prefix값", "placeholder":"엔티티 Prefix값을 입력하세요.", "group":"group_002", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"type_cd", "fld_id":"TAB_ENTITY/TYPE_CD", "label":"유형", "placeholder":"유형을 선택하세요.", "group":"group_002", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.Select", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": true },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": true, "action": "/api/common/ent/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 엔티티 관리 */

('FRM_TAB001', '테이블 관리', '테이블 관리', '테이블 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'TAB', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/tab/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_TABLE/ID", "label":"ID", "placeholder":"ID를 입력하세요. 미입력시 자동으로 입력됩니다.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"name", "fld_id":"TAB_TABLE/NAME", "label":"이름", "placeholder":"이름을 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"label", "fld_id":"TAB_TABLE/LABEL", "label":"라벨", "placeholder":"라벨를 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"descr", "fld_id":"TAB_TABLE/DESCR", "label":"설명", "placeholder":"설명을 입력하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"used", "fld_id":"TAB_TABLE/USED", "label":"사용 여부", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"order_by", "fld_id":"TAB_TABLE/ORDER_BY", "label":"순서", "placeholder":"순서를 입력하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },

        {"id":"ent_id", "fld_id":"TAB_TABLE/ENT_ID", "label":"엔티티 ID", "placeholder":"엔티티 ID를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"type_cd", "fld_id":"TAB_TABLE/TYPE_CD", "label":"유형", "placeholder":"유형을 선택하세요.", "group":"group_002", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.Select", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": true },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": true, "action": "/api/common/tab/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 테이블 관리 */

('FRM_SEQ001', '시퀀스 관리', '시퀀스 관리', '시퀀스 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SEQ', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/seq/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_SEQUENCE/ID", "label":"ID", "placeholder":"ID를 입력하세요. 미입력시 자동으로 입력됩니다.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"name", "fld_id":"TAB_SEQUENCE/NAME", "label":"이름", "placeholder":"이름을 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"label", "fld_id":"TAB_SEQUENCE/LABEL", "label":"라벨", "placeholder":"라벨를 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"descr", "fld_id":"TAB_SEQUENCE/DESCR", "label":"설명", "placeholder":"설명을 입력하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"used", "fld_id":"TAB_SEQUENCE/USED", "label":"사용 여부", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"order_by", "fld_id":"TAB_SEQUENCE/ORDER_BY", "label":"순서", "placeholder":"순서를 입력하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },

        {"id":"ent_id", "fld_id":"TAB_SEQUENCE/ENT_ID", "label":"엔티티 ID", "placeholder":"엔티티 ID를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"mid_type", "fld_id":"TAB_SEQUENCE/MID_TYPE", "label":"시퀀스 형식", "placeholder":"시퀀스 형식을 입력하세요.(ex: yyyyMM)", "group":"group_002", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"mid_num", "fld_id":"TAB_SEQUENCE/MID_NUM", "label":"시퀀스 형식 값", "placeholder":"시퀀스 형식 값을 입력하세요.(ex: 0)", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"0", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },
        {"id":"cur_num", "fld_id":"TAB_SEQUENCE/CUR_NUM", "label":"현재 값", "placeholder":"현재 값을 입력하세요.(ex: 0)", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"0", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },
        {"id":"length", "fld_id":"TAB_SEQUENCE/LENGTH", "label":"시퀀스의 키 자리수", "placeholder":"시퀀스의 키 자리수를 입력하세요.(ex: 5)", "group":"group_002", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"5", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": true },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": true, "action": "/api/common/seq/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 시퀀스 관리 */

('FRM_CTY001', '코드 타입 관리', '코드 타입 관리', '코드 타입 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'CTY', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/cty/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_CODE_TYPE/ID", "label":"ID", "placeholder":"ID를 입력하세요. 미입력시 자동으로 입력됩니다.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"name", "fld_id":"TAB_CODE_TYPE/NAME", "label":"이름", "placeholder":"이름을 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"label", "fld_id":"TAB_CODE_TYPE/LABEL", "label":"라벨", "placeholder":"라벨를 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"descr", "fld_id":"TAB_CODE_TYPE/DESCR", "label":"설명", "placeholder":"설명을 입력하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"used", "fld_id":"TAB_CODE_TYPE/USED", "label":"사용 여부", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"order_by", "fld_id":"TAB_CODE_TYPE/ORDER_BY", "label":"순서", "placeholder":"순서를 입력하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },

        {"id":"hierarchy", "fld_id":"TAB_CODE_TYPE/HIERARCHY", "label":"계층 여부", "group":"group_002", "x":1, "y":1, "cols":6, "rows": 1, "def_val":false, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": true },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": true, "action": "/api/common/cty/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 코드 타입 관리 */

('FRM_COD001', '코드 관리', '코드 관리', '코드 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'COD', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/cod/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_CODE/ID", "label":"ID", "placeholder":"ID를 입력하세요. 미입력시 자동으로 입력됩니다.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"name", "fld_id":"TAB_CODE/NAME", "label":"이름", "placeholder":"이름을 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"label", "fld_id":"TAB_CODE/LABEL", "label":"라벨", "placeholder":"라벨를 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"descr", "fld_id":"TAB_CODE/DESCR", "label":"설명", "placeholder":"설명을 입력하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"used", "fld_id":"TAB_CODE/USED", "label":"사용 여부", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"order_by", "fld_id":"TAB_CODE/ORDER_BY", "label":"순서", "placeholder":"순서를 입력하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },

        {"id":"cty_id", "fld_id":"TAB_CODE/CTY_ID", "label":"코드 타입", "placeholder":"코드 타입을 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"val", "fld_id":"TAB_CODE/VAL", "label":"코드 값", "placeholder":"유형을 입력하세요.", "group":"group_002", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"sid", "fld_id":"TAB_CODE/SID", "label":"최상위 코드", "placeholder":"최상위 코드를 입력하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"Entity.Select", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"pid", "fld_id":"TAB_CODE/PID", "label":"상위 코드", "placeholder":"상위 코드를 입력하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"Entity.Select", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"level", "fld_id":"TAB_CODE/LEVEL", "label":"레벨", "placeholder":"레벨을 입력하세요.", "group":"group_002", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": true },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": true, "action": "/api/common/cod/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 코드 관리 */

('FRM_MEN001', '메뉴 관리', '메뉴 관리', '메뉴 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'MEN', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/men/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_MENU/ID", "label":"ID", "placeholder":"ID를 입력하세요. 미입력시 자동으로 입력됩니다.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"name", "fld_id":"TAB_MENU/NAME", "label":"이름", "placeholder":"이름을 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"label", "fld_id":"TAB_MENU/LABEL", "label":"라벨", "placeholder":"라벨를 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"descr", "fld_id":"TAB_MENU/DESCR", "label":"설명", "placeholder":"설명을 입력하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"used", "fld_id":"TAB_MENU/USED", "label":"사용 여부", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"order_by", "fld_id":"TAB_MENU/ORDER_BY", "label":"순서", "placeholder":"순서를 입력하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },

        {"id":"pid", "fld_id":"TAB_MENU/PID", "label":"상위 메뉴", "placeholder":"상위 메뉴를 입력하세요.", "group":"group_002", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"level", "fld_id":"TAB_MENU/LEVEL", "label":"레벨", "placeholder":"레벨을 입력하세요.", "group":"group_002", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },
        {"id":"url", "fld_id":"TAB_MENU/URL", "label":"URL", "placeholder":"URL을 입력하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"icon", "fld_id":"TAB_MENU/ICON", "label":"아이콘", "placeholder":"아이콘 값을 입력하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },
        {"id":"aside", "fld_id":"TAB_MENU/ASIDE", "label":"Aside 여부", "group":"group_002", "x":1, "y":3, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"new", "fld_id":"TAB_MENU/NEW", "label":"새창 여부", "group":"group_002", "x":2, "y":3, "cols":6, "rows": 1, "def_val":false, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"leader", "fld_id":"TAB_MENU/LEADER", "label":"팀장 여부", "group":"group_002", "x":1, "y":4, "cols":6, "rows": 1, "def_val":false, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"admin", "fld_id":"TAB_MENU/ADMIN", "label":"관리자 여부", "group":"group_002", "x":2, "y":4, "cols":6, "rows": 1, "def_val":false, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": true },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": true, "action": "/api/common/men/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 메뉴 관리 */

('FRM_LOG001', '로그 관리', '로그 관리', '로그 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'LOG', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/log/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"used", "fld_id":"TAB_LOG/USED", "label":"사용 여부", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":true, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"order_by", "fld_id":"TAB_LOG/ORDER_BY", "label":"순서", "placeholder":"순서를 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":true, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },
        {"id":"id", "fld_id":"TAB_LOG/ID", "label":"ID", "placeholder":"ID를 입력하세요. 미입력시 자동으로 입력됩니다.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"name", "fld_id":"TAB_LOG/NAME", "label":"이름", "placeholder":"이름을 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"content", "fld_id":"TAB_LOG/CONTENT", "label":"내용", "placeholder":"설명을 입력하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"type_cd", "fld_id":"TAB_LOG/TYPE_CD", "label":"유형", "placeholder":"유형을 선택하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"result", "fld_id":"TAB_LOG/RESULT", "label":"성공 여부", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": true },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": true, "action": "/api/common/log/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 로그 관리 */

('FRM_HOD001', '휴일 관리', '휴일 관리', '휴일 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'HOD', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/hod/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true }
    ],
     "fields": [ 
        {"id":"used", "fld_id":"TAB_HOLIDAY/USED", "label":"사용 여부", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":true, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"order_by", "fld_id":"TAB_HOLIDAY/ORDER_BY", "label":"순서", "placeholder":"순서를 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":true, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },
        {"id":"id", "fld_id":"TAB_HOLIDAY/ID", "label":"ID", "placeholder":"ID를 입력하세요. 미입력시 자동으로 입력됩니다.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"name", "fld_id":"TAB_HOLIDAY/NAME", "label":"이름", "placeholder":"이름을 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"label", "fld_id":"TAB_HOLIDAY/LABEL", "label":"라벨", "placeholder":"라벨를 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"descr", "fld_id":"TAB_HOLIDAY/DESCR", "label":"설명", "placeholder":"설명을 입력하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"holiday", "fld_id":"TAB_HOLIDAY/HOLIDAY", "label":"휴일 여부", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":false, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": true },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": true, "action": "/api/common/hod/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 휴일 관리 */

('FRM_SQL001', 'SQL 관리', 'SQL 관리', 'SQL 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SQL', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/sql/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_SQL/ID", "label":"ID", "placeholder":"ID를 입력하세요. 미입력시 자동으로 입력됩니다.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"name", "fld_id":"TAB_SQL/NAME", "label":"이름", "placeholder":"이름을 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"label", "fld_id":"TAB_SQL/LABEL", "label":"라벨", "placeholder":"라벨를 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"descr", "fld_id":"TAB_SQL/DESCR", "label":"설명", "placeholder":"설명을 입력하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"used", "fld_id":"TAB_SQL/USED", "label":"사용 여부", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"order_by", "fld_id":"TAB_SQL/ORDER_BY", "label":"순서", "placeholder":"순서를 입력하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },

        {"id":"query", "fld_id":"TAB_SQL/QUERY", "label":"Query", "placeholder":"Query를 입력하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"config", "fld_id":"TAB_SQL/CONFIG", "label":"Config", "placeholder":"Config를 입력하세요.", "group":"group_002", "x":1, "y":2, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.JsonEditor", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": true },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": true, "action": "/api/common/sql/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* SQL 관리 */

('FRM_LST001', '리스트 관리', '리스트 관리', '리스트 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'LST', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/lst/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_LIST/ID", "label":"ID", "placeholder":"ID를 입력하세요. 미입력시 자동으로 입력됩니다.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"name", "fld_id":"TAB_LIST/NAME", "label":"이름", "placeholder":"이름을 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"label", "fld_id":"TAB_LIST/LABEL", "label":"라벨", "placeholder":"라벨를 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"descr", "fld_id":"TAB_LIST/DESCR", "label":"설명", "placeholder":"설명을 입력하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"used", "fld_id":"TAB_LIST/USED", "label":"사용 여부", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"order_by", "fld_id":"TAB_LIST/ORDER_BY", "label":"순서", "placeholder":"순서를 입력하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },

        {"id":"query", "fld_id":"TAB_LIST/QUERY", "label":"Query", "placeholder":"Query를 입력하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"config", "fld_id":"TAB_LIST/CONFIG", "label":"Config", "placeholder":"Config를 입력하세요.", "group":"group_002", "x":1, "y":2, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.JsonEditor", "config":"", "action": { "type":"", "event":""} },
        {"id":"script", "fld_id":"TAB_LIST/SCRIPT", "label":"Script", "placeholder":"Script를 입력하세요.", "group":"group_002", "x":1, "y":3, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": true },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": true, "action": "/api/common/lst/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 리스트 관리 */

('FRM_RLT001', '릴레이션 관리', '릴레이션 관리', '릴레이션 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'RLT', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/rlt/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_RELATION/ID", "label":"ID", "placeholder":"ID를 입력하세요. 미입력시 자동으로 입력됩니다.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"name", "fld_id":"TAB_RELATION/NAME", "label":"이름", "placeholder":"이름을 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"label", "fld_id":"TAB_RELATION/LABEL", "label":"라벨", "placeholder":"라벨를 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"descr", "fld_id":"TAB_RELATION/DESCR", "label":"설명", "placeholder":"설명을 입력하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"used", "fld_id":"TAB_RELATION/USED", "label":"사용 여부", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"order_by", "fld_id":"TAB_RELATION/ORDER_BY", "label":"순서", "placeholder":"순서를 입력하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },

        {"id":"ent_id", "fld_id":"TAB_RELATION/ENT_ID", "label":"엔티티 ID", "placeholder":"엔티티를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"tab_id", "fld_id":"TAB_RELATION/TAB_ID", "label":"테이블 ID", "placeholder":"테이블을 선택하세요.", "group":"group_002", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"query", "fld_id":"TAB_RELATION/QUERY", "label":"Query", "placeholder":"Query를 입력하세요.", "group":"group_002", "x":1, "y":2, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"config", "fld_id":"TAB_RELATION/CONFIG", "label":"Config", "placeholder":"Config를 입력하세요.", "group":"group_002", "x":1, "y":3, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.JsonEditor", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": true },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": true, "action": "/api/common/rlt/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 릴레이션 관리 */

('FRM_CTN001', '컨텐츠 관리', '컨텐츠 관리', '컨텐츠 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'CTN', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/ctn/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_CONTENT/ID", "label":"ID", "placeholder":"ID를 입력하세요. 미입력시 자동으로 입력됩니다.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"name", "fld_id":"TAB_CONTENT/NAME", "label":"이름", "placeholder":"이름을 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"label", "fld_id":"TAB_CONTENT/LABEL", "label":"라벨", "placeholder":"라벨를 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"descr", "fld_id":"TAB_CONTENT/DESCR", "label":"설명", "placeholder":"설명을 입력하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"used", "fld_id":"TAB_CONTENT/USED", "label":"사용 여부", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"order_by", "fld_id":"TAB_CONTENT/ORDER_BY", "label":"순서", "placeholder":"순서를 입력하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },

        {"id":"subject", "fld_id":"TAB_CONTENT/SUBJECT", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"content", "fld_id":"TAB_CONTENT/CONTENT", "label":"Content 본문", "placeholder":"Content 본분을 입력하세요.", "group":"group_002", "x":1, "y":2, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"to_sql", "fld_id":"TAB_CONTENT/TO_SQL", "label":"Content 받는 사람(SQL)", "placeholder":"받는 사람 SQL을 입력하세요.", "group":"group_002", "x":1, "y":3, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"content_sql", "fld_id":"TAB_CONTENT/CONTENT_SQL", "label":"Content 본문의 내용(SQL)", "placeholder":"본문 내용 SQL을 입력하세요.", "group":"group_002", "x":1, "y":4, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": true },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": true, "action": "/api/common/ctn/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 컨텐츠 관리 */

('FRM_FLT001', '필드 타입 관리', '필드 타입 관리', '필드 타입 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'FLT', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/flt/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_FIELD_TYPE/ID", "label":"ID", "placeholder":"ID를 입력하세요. 미입력시 자동으로 입력됩니다.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"name", "fld_id":"TAB_FIELD_TYPE/NAME", "label":"이름", "placeholder":"이름을 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"label", "fld_id":"TAB_FIELD_TYPE/LABEL", "label":"라벨", "placeholder":"라벨를 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"descr", "fld_id":"TAB_FIELD_TYPE/DESCR", "label":"설명", "placeholder":"설명을 입력하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"used", "fld_id":"TAB_FIELD_TYPE/USED", "label":"사용 여부", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"order_by", "fld_id":"TAB_FIELD_TYPE/ORDER_BY", "label":"순서", "placeholder":"순서를 입력하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },

        {"id":"def_uiitem", "fld_id":"TAB_FIELD_TYPE/DEF_UIITEM", "label":"Default UIItem", "placeholder":"Default UIItem을 입력하세요.", "group":"group_002", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"type_cd", "fld_id":"TAB_FIELD_TYPE/TYPE_CD", "label":"유형", "placeholder":"유형을 선택하세요.", "group":"group_002", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.Select", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": true },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": true, "action": "/api/common/flt/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 필드 타입 관리 */

('FRM_WOF001', '워크플로우 관리', '워크플로우 관리', '워크플로우 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOF', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/wof/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_WORKFLOW/ID", "label":"ID", "placeholder":"ID를 입력하세요. 미입력시 자동으로 입력됩니다.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"name", "fld_id":"TAB_WORKFLOW/NAME", "label":"이름", "placeholder":"이름을 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"label", "fld_id":"TAB_WORKFLOW/LABEL", "label":"라벨", "placeholder":"라벨를 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"descr", "fld_id":"TAB_WORKFLOW/DESCR", "label":"설명", "placeholder":"설명을 입력하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"used", "fld_id":"TAB_WORKFLOW/USED", "label":"사용 여부", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"order_by", "fld_id":"TAB_WORKFLOW/ORDER_BY", "label":"순서", "placeholder":"순서를 입력하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },

        {"id":"ent_id", "fld_id":"TAB_WORKFLOW/ENT_ID", "label":"엔티티 ID", "placeholder":"엔티티를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.Select", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": true },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": true, "action": "/api/common/wof/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 워크플로우 관리 */

('FRM_ACT001', '액티비티 관리', '액티비티 관리', '액티비티 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'ACT', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/act/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_ACTIVITY/ID", "label":"ID", "placeholder":"ID를 입력하세요. 미입력시 자동으로 입력됩니다.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"name", "fld_id":"TAB_ACTIVITY/NAME", "label":"이름", "placeholder":"이름을 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"label", "fld_id":"TAB_ACTIVITY/LABEL", "label":"라벨", "placeholder":"라벨를 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"descr", "fld_id":"TAB_ACTIVITY/DESCR", "label":"설명", "placeholder":"설명을 입력하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"used", "fld_id":"TAB_ACTIVITY/USED", "label":"사용 여부", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"order_by", "fld_id":"TAB_ACTIVITY/ORDER_BY", "label":"순서", "placeholder":"순서를 입력하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },

        {"id":"ent_id", "fld_id":"TAB_ACTIVITY/ENT_ID", "label":"엔티티 ID", "placeholder":"엔티티를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"wof_id", "fld_id":"TAB_ACTIVITY/WOF_ID", "label":"워크플로우 ID", "placeholder":"워크플로우를 선택하세요.", "group":"group_002", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.Select", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": true },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": true, "action": "/api/common/act/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 액티비티 관리 */

('FRM_TAS001', '테스크 관리', '테스크 관리', '테스크 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'TAS', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/tas/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_TASK/ID", "label":"ID", "placeholder":"ID를 입력하세요. 미입력시 자동으로 입력됩니다.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"name", "fld_id":"TAB_TASK/NAME", "label":"이름", "placeholder":"이름을 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"label", "fld_id":"TAB_TASK/LABEL", "label":"라벨", "placeholder":"라벨를 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"descr", "fld_id":"TAB_TASK/DESCR", "label":"설명", "placeholder":"설명을 입력하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"used", "fld_id":"TAB_TASK/USED", "label":"사용 여부", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"order_by", "fld_id":"TAB_TASK/ORDER_BY", "label":"순서", "placeholder":"순서를 입력하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },

        {"id":"ent_id", "fld_id":"TAB_TASK/ENT_ID", "label":"엔티티 ID", "placeholder":"엔티티를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"act_id", "fld_id":"TAB_TASK/ACT_ID", "label":"액티비티 ID", "placeholder":"액티비티를 선택하세요.", "group":"group_002", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.Select", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": true },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": true, "action": "/api/common/tas/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 테스크 관리 */

('FRM_CTL001', '제어 관리', '제어 관리', '제어 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'CTL', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/ctl/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_CONTROL/ID", "label":"ID", "placeholder":"ID를 입력하세요. 미입력시 자동으로 입력됩니다.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"name", "fld_id":"TAB_CONTROL/NAME", "label":"이름", "placeholder":"이름을 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"label", "fld_id":"TAB_CONTROL/LABEL", "label":"라벨", "placeholder":"라벨를 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"descr", "fld_id":"TAB_CONTROL/DESCR", "label":"설명", "placeholder":"설명을 입력하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"used", "fld_id":"TAB_CONTROL/USED", "label":"사용 여부", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"order_by", "fld_id":"TAB_CONTROL/ORDER_BY", "label":"순서", "placeholder":"순서를 입력하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },

        {"id":"ent_id", "fld_id":"TAB_CONTROL/ENT_ID", "label":"엔티티 ID", "placeholder":"엔티티를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"tas_id", "fld_id":"TAB_CONTROL/TAS_ID", "label":"테스크 ID", "placeholder":"테스크를 선택하세요.", "group":"group_002", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"next_tas_id", "fld_id":"TAB_CONTROL/NEXT_TAS_ID", "label":"다음 테스크 ID", "placeholder":"다음 테스크를 선택하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"type_cd", "fld_id":"TAB_CONTROL/TYPE_CD", "label":"유형", "placeholder":"유형을 선택하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"CTL_TYPE_PRIMARY", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"data_update", "fld_id":"TAB_CONTROL/DATA_UPDATE", "label":"데이터 업데이트", "placeholder":"데이터 업데이트을 입력하세요.", "group":"group_002", "x":1, "y":3, "cols":12, "rows": 3, "def_val":"{}", "readonly":false, "hidden":false, "require":true, "uiitem":"String.JsonEditor", "config":"", "action": { "type":"", "event":""} },
        {"id":"content_id", "fld_id":"TAB_CONTROL/CONTENT_ID", "label":"컨텐츠 ID", "placeholder":"컨텐츠를 선택하세요.", "group":"group_002", "x":1, "y":4, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"Entity.Select", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": true },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": true, "action": "/api/common/ctl/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 제어 관리 */

('FRM_FRM001', '폼 관리', '폼 관리', '폼 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'FRM', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/frm/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_FORM/ID", "label":"ID", "placeholder":"ID를 입력하세요. 미입력시 자동으로 입력됩니다.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"name", "fld_id":"TAB_FORM/NAME", "label":"이름", "placeholder":"이름을 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"label", "fld_id":"TAB_FORM/LABEL", "label":"라벨", "placeholder":"라벨를 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"descr", "fld_id":"TAB_FORM/DESCR", "label":"설명", "placeholder":"설명을 입력하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"used", "fld_id":"TAB_FORM/USED", "label":"사용 여부", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"order_by", "fld_id":"TAB_FORM/ORDER_BY", "label":"순서", "placeholder":"순서를 입력하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },

        {"id":"ent_id", "fld_id":"TAB_FORM/ENT_ID", "label":"엔티티 ID", "placeholder":"엔티티를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"tas_id", "fld_id":"TAB_FORM/TAS_ID", "label":"테스크 ID", "placeholder":"테스크를 선택하세요.", "group":"group_002", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"Entity.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"config", "fld_id":"TAB_FORM/CONFIG", "label":"Config", "placeholder":"Config를 입력하세요.", "group":"group_002", "x":1, "y":2, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.JsonEditor", "config":"", "action": { "type":"", "event":""} },
        {"id":"script", "fld_id":"TAB_FORM/SCRIPT", "label":"Script", "placeholder":"Script를 입력하세요.", "group":"group_002", "x":1, "y":3, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": true },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": true, "action": "/api/common/frm/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 폼 관리 */

('FRM_ORG001', '조직 관리', '조직 관리', '조직 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'ORG', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/org/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_ORG/ID", "label":"ID", "placeholder":"ID를 입력하세요. 미입력시 자동으로 입력됩니다.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"name", "fld_id":"TAB_ORG/NAME", "label":"이름", "placeholder":"이름을 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"label", "fld_id":"TAB_ORG/LABEL", "label":"라벨", "placeholder":"라벨를 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"descr", "fld_id":"TAB_ORG/DESCR", "label":"설명", "placeholder":"설명을 입력하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"used", "fld_id":"TAB_ORG/USED", "label":"사용 여부", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"order_by", "fld_id":"TAB_ORG/ORDER_BY", "label":"순서", "placeholder":"순서를 입력하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": true },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": true, "action": "/api/common/org/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 조직 관리 */

('FRM_DPT001', '부서 관리', '부서 관리', '부서 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'DPT', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/dpt/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_DEPT/ID", "label":"ID", "placeholder":"ID를 입력하세요. 미입력시 자동으로 입력됩니다.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"name", "fld_id":"TAB_DEPT/NAME", "label":"이름", "placeholder":"이름을 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"label", "fld_id":"TAB_DEPT/LABEL", "label":"라벨", "placeholder":"라벨를 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"descr", "fld_id":"TAB_DEPT/DESCR", "label":"설명", "placeholder":"설명을 입력하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"used", "fld_id":"TAB_DEPT/USED", "label":"사용 여부", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"order_by", "fld_id":"TAB_DEPT/ORDER_BY", "label":"순서", "placeholder":"순서를 입력하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },

        {"id":"org_id", "fld_id":"TAB_DEPT/ORG_ID", "label":"조직", "placeholder":"조직을 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"pid", "fld_id":"TAB_DEPT/PID", "label":"상위 부서", "placeholder":"상위 부서를 입력하세요.", "group":"group_002", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"level", "fld_id":"TAB_DEPT/LEVEL", "label":"레벨", "placeholder":"레벨를 입력하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": true },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": true, "action": "/api/common/dpt/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 부서 관리 */

('FRM_EMP001', '직원 관리', '직원 관리', '직원 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'EMP', null,  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/emp/saveForm"
    },
    "external": {
        "timeline": false
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_EMPLOYEE/ID", "label":"ID", "placeholder":"ID를 입력하세요. 미입력시 자동으로 입력됩니다.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.ID", "config":"", "action": { "type":"oninput", "event":"toUpperCase(this);"} },
        {"id":"name", "fld_id":"TAB_EMPLOYEE/NAME", "label":"이름", "placeholder":"이름을 입력하세요.", "group":"group_001", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"label", "fld_id":"TAB_EMPLOYEE/LABEL", "label":"라벨", "placeholder":"라벨를 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"descr", "fld_id":"TAB_EMPLOYEE/DESCR", "label":"설명", "placeholder":"설명을 입력하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"used", "fld_id":"TAB_EMPLOYEE/USED", "label":"사용 여부", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"order_by", "fld_id":"TAB_EMPLOYEE/ORDER_BY", "label":"순서", "placeholder":"순서를 입력하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"1", "readonly":false, "hidden":false, "require":true, "uiitem":"Number.Def", "config":"", "action": { "type":"", "event":""} },

        {"id":"org_id", "fld_id":"TAB_EMPLOYEE/ORG_ID", "label":"조직", "placeholder":"조직을 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"dpt_id", "fld_id":"TAB_EMPLOYEE/DPT_ID", "label":"부서", "placeholder":"부서를 선택하세요.", "group":"group_002", "x":2, "y":1, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"number", "fld_id":"TAB_EMPLOYEE/NUMBER", "label":"사번", "placeholder":"사번을 입력하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"hphone", "fld_id":"TAB_EMPLOYEE/HPHONE", "label":"연락처", "placeholder":"연락처를 입력하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"job_tel", "fld_id":"TAB_EMPLOYEE/JOB_TEL", "label":"회사 연락처", "placeholder":"회사 연락처를 입력하세요.", "group":"group_002", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"position_cd", "fld_id":"TAB_EMPLOYEE/POSITION_CD", "label":"직위", "placeholder":"직위을 선택하세요.", "group":"group_002", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"duty_position_cd", "fld_id":"TAB_EMPLOYEE/DUTY_POSITION_CD", "label":"직책", "placeholder":"직책을 선택하세요.", "group":"group_002", "x":1, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"mgr_emp_id", "fld_id":"TAB_EMPLOYEE/MGR_EMP_ID", "label":"관리자", "placeholder":"관리자를 입력하세요.", "group":"group_002", "x":2, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"Entity.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"mail_used", "fld_id":"TAB_EMPLOYEE/MAIL_USED", "label":"이메일 발송 여부", "group":"group_002", "x":1, "y":5, "cols":6, "rows": 1, "def_val":true, "readonly":false, "hidden":false, "require":true, "uiitem":"Boolean.Radio", "config":"", "action": { "type":"", "event":""} },
        {"id":"agc_emp_id", "fld_id":"TAB_EMPLOYEE/AGC_EMP_ID", "label":"대직자", "placeholder":"대직자를 입력하세요.", "group":"group_002", "x":2, "y":5, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"Entity.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"agc_start_date", "fld_id":"TAB_EMPLOYEE/AGC_START_DATE", "label":"대직 시작일", "placeholder":"대직 시작일을 입력하세요.", "group":"group_002", "x":1, "y":6, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"agc_end_date", "fld_id":"TAB_EMPLOYEE/AGC_END_DATE", "label":"대직 종료일", "placeholder":"대직 종료일을 입력하세요.", "group":"group_002", "x":2, "y":6, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": true },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": true },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/emp/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', '');	/* 직원 관리 */