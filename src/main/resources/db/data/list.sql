/**
 * List Table Initialize Data
 */
INSERT INTO RSHM.TAB_LIST
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 QUERY, CONFIG, SCRIPT )
VALUES
('LST_ENT001', '엔티티 관리', '엔티티 관리', '엔티티 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id, 
        name,
        type_cd, 
        (select name 
        from tab_code 
        where id = ent.type_cd) as type_name, 
        prefix
   from tab_entity ent', 
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
            { "stmt":"create_date between str_to_date(? \'000000\', \'%Y-%m-%d  %H%i%s\') and str_to_date(? \'235959\', \'%Y-%m-%d  %H%i%s\')", "id":"create_date", "param": "start_create_date,end_create_date", "type": "range-date", "require": false},
            { "stmt":"create_emp_id like concat(\'%\', ?, \'%\')", "id":"create_emp_id", "param": "create_emp_id", "type": "text", "require": false},
            { "stmt":"update_date between str_to_date(? \'000000\', \'%Y-%m-%d  %H%i%s\') and str_to_date(? \'235959\', \'%Y-%m-%d  %H%i%s\')", "id":"update_date", "param": "start_update_date,end_update_date", "type": "range-date", "require": false},
            { "stmt":"update_emp_id like concat(\'%\', ?, \'%\')", "id":"update_emp_id", "param": "update_emp_id", "type": "text", "require": false},
            { "stmt":"type_cd like concat(\'%\', ?, \'%\')", "id":"type_cd", "param": "type_cd", "type": "text", "require": false}
        ]
    },
    "action": {
        "create_btn": {
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_ENT001",
            "modal_title": "엔티티 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_ENT001&auth=true"
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
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "name", "label": "이름", "uiitem": "String.Text", "width": 3, "index": 1, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "이름", "data": "name", "type": "view" },
        { "name": "유형", "data": "type_name", "type": "view" },
        { "name": "Prefix", "data": "prefix", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),	/* 엔티티 관리 */
('LST_TAB001', '테이블 관리', '테이블 관리', '테이블 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id, 
        name, 
        ent_id, 
        (select name 
           from tab_entity 
          where id = tab.ent_id) as ent_name, 
        type_cd, 
        (select name 
           from tab_code 
          where id = tab.type_cd) as type_name
   from tab_table tab',
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
            { "stmt":"create_date between str_to_date(? \'000000\', \'%Y-%m-%d  %H%i%s\') and str_to_date(? \'235959\', \'%Y-%m-%d  %H%i%s\')", "id":"create_date", "param": "start_create_date,end_create_date", "type": "range-date", "require": false},
            { "stmt":"create_emp_id like concat(\'%\', ?, \'%\')", "id":"create_emp_id", "param": "create_emp_id", "type": "text", "require": false},
            { "stmt":"update_date between str_to_date(? \'000000\', \'%Y-%m-%d  %H%i%s\') and str_to_date(? \'235959\', \'%Y-%m-%d  %H%i%s\')", "id":"update_date", "param": "start_update_date,end_update_date", "type": "range-date", "require": false},
            { "stmt":"update_emp_id like concat(\'%\', ?, \'%\')", "id":"update_emp_id", "param": "update_emp_id", "type": "text", "require": false}
        ]
    },
    "action": {
        "create_btn": {
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_TAB001",
            "modal_title": "테이블 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_TAB001&auth=true"
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
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "name", "label": "이름", "uiitem": "String.Text", "width": 3, "index": 1, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "이름", "data": "name", "type": "view" },
        { "name": "엔티티", "data": "ent_name", "type": "view" },
        { "name": "유형", "data": "type_name", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),	/* 테이블 관리 */
('LST_SEQ001', '시퀀스 관리', '시퀀스 관리', '코드 타입 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id, 
       name, 
       ent_id, 
       (select name 
          from tab_entity 
         where id = seq.ent_id) as ent_name, 
	   mid_type, 
       mid_num, 
       cur_num, 
       length as seq_length
  from tab_sequence seq',
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
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_SEQ001",
            "modal_title": "시퀀스 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_SEQ001&auth=true"
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
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "name", "label": "이름", "uiitem": "String.Text", "width": 3, "index": 1, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "이름", "data": "name", "type": "view" },
        { "name": "엔티티", "data": "ent_name", "type": "view" },
        { "name": "시퀀스 형식", "data": "mid_type", "type": "view" },
        { "name": "시퀀스 형식 값", "data": "mid_num", "type": "view" },
        { "name": "현재 값", "data": "cur_num", "type": "view" },
        { "name": "키 자리수", "data": "seq_length", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),	/* 시퀀스 관리 */

('LST_CTY001', '코드 타입 관리', '코드 타입 관리', '코드 타입 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id, 
       name,
       (case hierarchy
        when 1 then \'Y\'
        when 0 then \'N\'
         end) as hierarchy
 from tab_code_type cty',
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
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_CTY001",
            "modal_title": "코드 타입 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_CTY001&auth=true"
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
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "name", "label": "이름", "uiitem": "String.Text", "width": 3, "index": 1, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "이름", "data": "name", "type": "view" },
        { "name": "계층여부", "data": "hierarchy", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),	/* 코드 타입 관리 */
('LST_COD001', '코드 관리', '코드 관리', '코드 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
        name,
        cty_id,
        (select name
           from tab_code_type
		 where id = cod.cty_id) as cty_name,
        val,
        sid,
        (select name
          from tab_code
		 where id = cod.sid) as sid_name,
        pid,
        (select name
          from tab_code
		 where id = cod.pid) as pid_name,
		level
  from tab_code cod',
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
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_COD001",
            "modal_title": "코드 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_COD001&auth=true"
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
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "name", "label": "이름", "uiitem": "String.Text", "width": 3, "index": 1, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "이름", "data": "name", "type": "view" },
        { "name": "유형 타입", "data": "cty_name", "type": "view" },
        { "name": "코드 값", "data": "val", "type": "view" },
        { "name": "최상위 코드", "data": "sid_name", "type": "view" },
        { "name": "상위 코드", "data": "pid_name", "type": "view" },
        { "name": "레벨", "data": "level", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),	/* 코드 관리 */

('LST_MEN001', '메뉴 관리', '메뉴 관리', '메뉴 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
         name,
         pid,
        (select name
          from tab_menu
		 where id = men.pid) as pid_name,
        level,
        url,
        (case aside
        when 1 then \'Y\'
        when 0 then \'N\'
         end) as aside,
        (case new
        when 1 then \'Y\'
        when 0 then \'N\'
         end) as new,
        (case leader
        when 1 then \'Y\'
        when 0 then \'N\'
         end) as leader,
        (case admin
        when 1 then \'Y\'
        when 0 then \'N\'
         end) as admin
  from tab_menu men',
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
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_MEN001",
            "modal_title": "메뉴 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_MEN001&auth=true"
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
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "name", "label": "이름", "uiitem": "String.Text", "width": 3, "index": 1, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "이름", "data": "name", "type": "view" },
        { "name": "상위 메뉴", "data": "pid_name", "type": "view" },
        { "name": "레벨", "data": "level", "type": "view" },
        { "name": "URL", "data": "url", "type": "view" },
        { "name": "Aside 여부", "data": "aside", "type": "view" },
        { "name": "새창 여부", "data": "new", "type": "view" },
        { "name": "팀장 여부", "data": "leader", "type": "view" },
        { "name": "관리자 여부", "data": "admin", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),	/* 메뉴 관리 */
('LST_LOG001', '로그 관리', '로그 관리', '로그 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
        name,
        type_cd, 
        (select name 
        from tab_code 
        where id = log.type_cd) as type_name, 
        date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
        content,
        case result
		   when 0 then \'Fail\'
		   else \'Success\'
		   end as result 
  from tab_log log',
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
            { "stmt":"STR_TO_DATE(create_date, \'%Y-%m-%d\') between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"create_date", "param": "start_create_date,end_create_date", "type": "range-date", "require": false},
            { "stmt":"create_emp_id like concat(\'%\', ?, \'%\')", "id":"create_emp_id", "param": "create_emp_id", "type": "text", "require": false},
            { "stmt":"update_date between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"update_date", "param": "start_update_date,end_update_date", "type": "range-date", "require": false},
            { "stmt":"update_emp_id like concat(\'%\', ?, \'%\')", "id":"update_emp_id", "param": "update_emp_id", "type": "text", "require": false}
        ]
    },
    "action": {
        "create_btn": {
            "use": false,
            "title": "등록",
            "url": "",
            "modal_title": "등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_LOG001&auth=true"
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
            { "id": "create_date", "label": "등록시간", "uiitem": "Date.Range.DT", "width": 6, "index": 0, "def_val": "m-1,d+0", "config": "" }
        ]
    ],
    "column": [
        { "name": "등록시간", "data": "create_date", "type": "view" },
        { "name": "유형", "data": "type_name", "type": "view" },
        { "name": "메시지", "data": "name", "type": "view" },
        { "name": "성공여부", "data": "result", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "desc" }
}', ''),	/* 로그 관리 */
('LST_HOD001', '휴일 관리', '휴일 관리', '휴일 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
        name,
        case holiday
		   when 0 then \'평일\'
		   else \'휴일\'
		   end as holiday 
  from tab_holiday',
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
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_HOD001",
            "modal_title": "메뉴 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_HOD001&auth=true"
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
            { "id": "id", "label": "날짜", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "날짜", "data": "id", "type": "view" },
        { "name": "이름", "data": "name", "type": "view" },
        { "name": "휴일 여부", "data": "holiday", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),	/* 휴일 관리 */

('LST_SQL001', 'SQL 관리', 'SQL 관리', 'SQL 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
		 name
    from tab_sql',
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
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_SQL001",
            "modal_title": "SQL 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_SQL001&auth=true"
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
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "name", "label": "이름", "uiitem": "String.Text", "width": 3, "index": 1, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "이름", "data": "name", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),	/* SQL 관리 */
('LST_LST001', '리스트 관리', '리스트 관리', '리스트 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
		 name
    from tab_list',
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
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_LST001",
            "modal_title": "리스트 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_LST001&auth=true"
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
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "name", "label": "이름", "uiitem": "String.Text", "width": 3, "index": 1, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "이름", "data": "name", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),	/* 리스트 관리 */

('LST_RLT001', '릴레이션 관리', '릴레이션 관리', '릴레이션 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
		 name
    from tab_relation',
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
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_RLT001",
            "modal_title": "릴레이션 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_RLT001&auth=true"
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
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "name", "label": "이름", "uiitem": "String.Text", "width": 3, "index": 1, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "이름", "data": "name", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),	/* 릴레이션 관리 */

('LST_CTN001', '컨텐츠 관리', '컨텐츠 관리', '컨텐츠 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
		 name
    from tab_content',
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
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_CTN001",
            "modal_title": "릴레이션 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_CTN001&auth=true"
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
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "name", "label": "이름", "uiitem": "String.Text", "width": 3, "index": 1, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "이름", "data": "name", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),	/* 컨텐츠 관리 */

('LST_FLT001', '필드 타입 관리', '필드 타입 관리', '필드 타입 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
       name,
       def_uiitem,
       type_cd,
       (select name
         from tab_code
        where id = flt.type_cd ) as type_name
  from tab_field_type as flt',
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
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_FLT001",
            "modal_title": "필드 타입 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_FLT001&auth=true"
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
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "name", "label": "이름", "uiitem": "String.Text", "width": 3, "index": 1, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "이름", "data": "name", "type": "view" },
        { "name": "D.UIItem", "data": "def_uiitem", "type": "view" },
        { "name": "타입", "data": "type_name", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),	/* 필드 타입 관리 */

('LST_ORG001', '조직 관리', '조직 관리', '조직 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
       name
  from tab_org',
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
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_ORG001",
            "modal_title": "조직 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_ORG001&auth=true"
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
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "name", "label": "이름", "uiitem": "String.Text", "width": 3, "index": 1, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "이름", "data": "name", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),	/* 조직 관리 */
('LST_DPT001', '부서 관리', '부서 관리', '부서 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
       name,
       org_id,
       (select name
          from tab_org
         where id = dpt.org_id) as org_name,
       pid,
       (select name
		  from tab_dept
         where id = dpt.pid) as pid_name, 
       level
  from tab_dept dpt',
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
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_DPT001",
            "modal_title": "부서 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_DPT001&auth=true"
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
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "name", "label": "이름", "uiitem": "String.Text", "width": 3, "index": 1, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "이름", "data": "name", "type": "view" },
        { "name": "조직", "data": "org_name", "type": "view" },
        { "name": "상위 부서", "data": "pid_name", "type": "view" },
        { "name": "레벨", "data": "level", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),	/* 부서 관리 */
('LST_EMP001', '직원 관리', '직원 관리', '직원 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
       name,
       org_id,
       (select name
          from tab_org
         where id = emp.org_id) as org_name,
       dpt_id,
       (select name
          from tab_dept
         where id = emp.dpt_id) as dpt_name,
       number,
       hphone,
       job_tel,
       position_cd,
       (select name
          from tab_code
		 where id = emp.position_cd) as position_name,
       duty_position_cd,
       (select name
          from tab_code
		 where id = emp.duty_position_cd) as duty_position_name
  from tab_employee emp',
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
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_EMP001",
            "modal_title": "직원 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_EMP001&auth=true"
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
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "name", "label": "이름", "uiitem": "String.Text", "width": 3, "index": 1, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "이름", "data": "name", "type": "view" },
        { "name": "조직", "data": "org_name", "type": "view" },
        { "name": "부서", "data": "dpt_name", "type": "view" },
        { "name": "사번", "data": "number", "type": "view" },
        { "name": "연락처", "data": "hphone", "type": "view" },
        { "name": "회사 연락처", "data": "job_tel", "type": "view" },
        { "name": "직위", "data": "position_name", "type": "view" },
        { "name": "직책", "data": "duty_position_name", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),	/* 직원 관리 */

('LST_WOF001', '워크플로우 관리', '워크플로우 관리', '워크플로우 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
       name,
       ent_id,
       (select name
          from tab_entity
         where id = wof.ent_id ) as ent_name
  from tab_workflow as wof',
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
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_WOF001",
            "modal_title": "워크플로우 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_WOF001&auth=true"
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
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "name", "label": "이름", "uiitem": "String.Text", "width": 3, "index": 1, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "이름", "data": "name", "type": "view" },
        { "name": "엔티티", "data": "ent_name", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),	/* 워크플로우 관리 */
('LST_ACT001', '액티비티 관리', '액티비티 관리', '액티비티 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
       name,
       ent_id,
       (select name
          from tab_entity
         where id = act.ent_id ) as ent_name,
       wof_id,
       (select name
          from tab_workflow
         where id = act.wof_id ) as wof_name
  from tab_activity act',
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
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_ACT001",
            "modal_title": "액티비티 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_ACT001&auth=true"
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
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "name", "label": "이름", "uiitem": "String.Text", "width": 3, "index": 1, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "이름", "data": "name", "type": "view" },
        { "name": "엔티티", "data": "ent_name", "type": "view" },
        { "name": "워크플로우", "data": "ent_name", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),	/* 액티비티 관리 */
('LST_TAS001', '테스크 관리', '테스크 관리', '테스크 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
       name,
       ent_id,
       (select name
          from tab_entity
         where id = tas.ent_id ) as ent_name,
       act_id,
       (select name
          from tab_activity
         where id = tas.act_id ) as act_name,
       type_cd,
       (select name
          from tab_code
         where id = tas.type_cd ) as type_name  
  from tab_task tas',
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
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_TAS001",
            "modal_title": "테스크 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_TAS001&auth=true"
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
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "name", "label": "이름", "uiitem": "String.Text", "width": 3, "index": 1, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "이름", "data": "name", "type": "view" },
        { "name": "엔티티", "data": "ent_name", "type": "view" },
        { "name": "액티비티", "data": "act_name", "type": "view" },
        { "name": "유형", "data": "type_name", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),	/* 테스크 관리 */
('LST_CTL001', '제어 관리', '제어 관리', '제어 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
       name,
       ent_id,
       (select name
          from tab_entity
         where id = ctl.ent_id ) as ent_name,
       tas_id,
       (select name
          from tab_task
         where id = ctl.tas_id ) as tas_name,
       next_tas_id,
       (select name
          from tab_task
         where id = ctl.next_tas_id ) as next_tas_name,
       type_cd,
       (select name
          from tab_code
         where id = ctl.type_cd ) as type_name  
  from tab_control ctl',
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
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_CTL001",
            "modal_title": "제어 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_CTL001&auth=true"
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
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "name", "label": "이름", "uiitem": "String.Text", "width": 3, "index": 1, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "이름", "data": "name", "type": "view" },
        { "name": "엔티티", "data": "ent_name", "type": "view" },
        { "name": "테스크", "data": "tas_name", "type": "view" },
        { "name": "다음 테스크", "data": "next_tas_name", "type": "view" },
        { "name": "유형", "data": "type_name", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),	/* 제어 관리 */
('LST_FRM001', '폼 관리', '폼 관리', '폼 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
       name,
       ent_id,
       (select name
          from tab_entity
         where id = frm.ent_id ) as ent_name,
       tas_id,
       (select name
          from tab_task
         where id = frm.tas_id ) as tas_name
  from tab_form frm',
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
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_FRM001",
            "modal_title": "폼 등록"
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_FRM001&auth=true"
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
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id": "name", "label": "이름", "uiitem": "String.Text", "width": 3, "index": 1, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "이름", "data": "name", "type": "view" },
        { "name": "엔티티", "data": "ent_name", "type": "view" },
        { "name": "테스크", "data": "tas_name", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),	/* 폼 관리 */
('LST_TEST001', '테스트 관리', '테스트 관리', '테스트 관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select * from tab_form',
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
            { "stmt":"create_date between str_to_date(? \'000000\', \'%Y-%m-%d  %H%i%s\') and str_to_date(? \'235959\', \'%Y-%m-%d  %H%i%s\')", "id":"create_date", "param": "start_create_date,end_create_date", "type": "range-date", "require": false},
            { "stmt":"create_emp_id like concat(\'%\', ?, \'%\')", "id":"create_emp_id", "param": "create_emp_id", "type": "text", "require": false},
            { "stmt":"update_date between str_to_date(? \'000000\', \'%Y-%m-%d  %H%i%s\') AND STR_TO_DATE(? \'235959\', \'%Y-%m-%d  %H%i%s\')", "id":"update_date", "param": "start_update_date,end_update_date", "type": "range-date", "require": false},
            { "stmt":"update_emp_id like concat(\'%\', ?, \'%\')", "id":"update_emp_id", "param": "update_emp_id", "type": "text", "require": false}
        ]
    },
    "action": {
        "create_btn": {
            "use": true,
            "title": "등록",
            "url": "/admin/form/modal/create",
            "modal_title": "폼 등록"
        },
        "list_action_btn": {
            "url": "/admin/form/modal/update"
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
            { "id":"id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" },
            { "id":"name", "label": "Name", "uiitem": "String.Text", "width": 3, "index": 1, "def_val": "", "config": "" },
            { "id":"label", "label": "Label", "uiitem": "String.Text", "width": 3, "index": 2, "def_val": "", "config": "" },
            { "id":"descr", "label": "Descr", "uiitem": "String.Text", "width": 3, "index": 3, "def_val": "", "config": "" }
        ],
        [
            { "id":"create_date", "label": "Create Date", "uiitem": "Date.Range.DT", "width": 6, "index": 4, "def_val": "m-1,d+0", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "Name", "data": "name", "type": "view" },
        { "name": "Label", "data": "label", "type": "view" },
        { "name": "Descr", "data": "descr", "type": "view" },
        { "name": "Create Date", "data": "create_date", "type": "view" },
        { "name": "Create Emp ID", "data": "create_emp_id", "type": "view" },
        { "name": "Update Date", "data": "update_date", "type": "view" },
        { "name": "Update Emp ID", "data": "update_emp_id", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', '');	/* 테스트 관리 */
