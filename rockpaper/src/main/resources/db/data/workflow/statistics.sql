/* Menu */
INSERT INTO RSHM.TAB_MENU
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 PID, LEVEL, URL, ICON, ASIDE, NEW, LEADER, ADMIN )
VALUES
('MEN_STA', '통계', '통계', '통계', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 null, 1, null, null, true, false, false, false),	/* 통계 */

('MEN_STA_001', '경영관리(경비지급용)', '경영관리(경비지급용)', '경영관리(경비지급용)', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'MEN_STA', 2, '/common/list?lstId=LST_STA_001', 2, true, false, false, false),	/* 경영관리(경비지급용) */
('MEN_STA_002', '영업본부(고객사별 지원시간)', '영업본부(고객사별 지원시간)', '영업본부(고객사별 지원시간)', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'MEN_STA', 2, '/common/list?lstId=LST_STA_002', 3, true, false, false, false),	/* 영업본부(고객사별 지원시간) */
('MEN_STA_003', '주간업무보고', '주간업무보고', '주간업무보고', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'MEN_STA', 2, '/common/list?lstId=LST_STA_003', 4, true, false, false, false);	/* 주간업무보고 */
-- ('MEN_STA_004', '근무시간(엑셀변환용)', '근무시간(엑셀변환용)', '근무시간(엑셀변환용)', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
--  'MEN_STA', 2, '/common/list?lstId=LST_STA_004', 5, true, false, false, false),	/* 근무시간(엑셀변환용) */
('MEN_STA_004', '근무시간(엑셀변환용)', '근무시간(엑셀변환용)', '근무시간(엑셀변환용)', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'MEN_STA', 2, '/common/child_list?lstId=LST_STA_007', 5, true, false, false, false),	/* 근무시간(엑셀변환용) */
('MEN_STA_005', '엔지니어별 근무현황', '엔지니어별 근무현황', '엔지니어별 근무현황', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'MEN_STA', 2, '/common/calendar?lstId=EMP_WORK_LIST', 6, true, false, false, false),	/* 엔지니어별 근무현황 */
('MEN_STA_006', '엔지니어별 휴가현황', '엔지니어별 휴가현황', '엔지니어별 휴가현황', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'MEN_STA', 2, '/common/list?lstId=LST_STA_006', 7, true, false, false, false),	/* 엔지니어별 휴가현황 */
 ('MEN_STA_007', '부서별 근무시간', '부서별 근무시간', '부서별 근무시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'MEN_STA', 2, '/common/child_list?lstId=LST_STA_008', 8, true, false, false, false);	/* 부서별 근무시간(엑셀변환용) */



/* List */
INSERT INTO RSHM.TAB_LIST
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 QUERY, CONFIG, SCRIPT )
VALUES
('LST_STA_001', '경영관리(경비지급용)', '경영관리(경비지급용)', '경영관리(경비지급용)', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = wor.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       (select name
		  from tab_task
         where id = wor.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = wor.req_emp_id) as req_emp_name,
       ass_emp_id,
       (select name
         from tab_employee
        where id = wor.ass_emp_id) as ass_emp_name,
       src_id,
       src_ent_id,
       content,
       type_cd,
       (select name
         from tab_code
        where id = wor.type_cd) as type_name,
       cat_cd,
       (select name
         from tab_code
        where id = wor.cat_cd) as cat_name,
       crm_id,
       (select name
          from tab_crm
         where id = wor.crm_id) as crm_name,
       product_cd,
       (select name
          from tab_code
         where id = wor.product_cd) as product_name,
       support_city,
       support_location,
       customer,
       customer_contact,
       etc_content,
       charge_emp_id,
       (select name
         from tab_employee
        where id = wor.charge_emp_id) as charge_emp_name,
       date_format(plan_start_date, \'%Y-%m-%d %H:%i\') plan_start_date,
       date_format(plan_finish_date, \'%Y-%m-%d %H:%i\') plan_finish_date,
       date_format(act_start_date, \'%Y-%m-%d %H:%i\') act_start_date,
       date_format(act_finish_date, \'%Y-%m-%d %H:%i\') act_finish_date
  from tab_workorder wor
where tas_id in ( select id from tab_task where ent_id = \'WOR\' and type_cd = \'TAS_TYPE_COMP\')', 
 '{
    "sql": {
        "where": true,
        "stmts": [
            { "stmt":"date_format(act_start_date, \'%Y-%m-%d\') between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"act_start_date", "param": "start_act_start_date,end_act_start_date", "type": "range-date", "require": true},
            { "stmt":"charge_emp_id in (select id from tab_employee where name like concat(\'%\', ?, \'%\'))", "id":"charge_emp_name", "param": "charge_emp_name", "type": "text", "require": false}
        ]
    },
    "action": {
        "create_btn": {
            "use": false,
            "title": "등록",
            "url": "",
            "modal_title": ""
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
            { "id": "act_start_date", "label": "작업 시작일", "uiitem": "Date.Range.DT", "width": 6, "index": 0, "def_val": "m-1,d+0", "config": "" },
            { "id": "charge_emp_name", "label": "엔지니어", "uiitem": "String.Text", "width": 6, "index": 11, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "작업 시작일", "data": "act_start_date", "type": "view" },
        { "name": "작업 종료일", "data": "act_finish_date", "type": "view" },
        { "name": "고객명", "data": "customer", "type": "view" },
        { "name": "지원도시", "data": "support_city", "type": "view" },
        { "name": "지원장소", "data": "support_location", "type": "view" },
        { "name": "고객 담당자", "data": "customer_contact", "type": "view" },
        { "name": "지원 유형", "data": "cat_name", "type": "view" },
        { "name": "영업코드", "data": "crm_id", "type": "view" },
        { "name": "영업기회명", "data": "crm_name", "type": "view" },
        { "name": "지원내역", "data": "content", "type": "view" },
        { "name": "담당영업", "data": "req_emp_name", "type": "view" },
        { "name": "엔지니어", "data": "charge_emp_name", "type": "view" },
        { "name": "제품명", "data": "product_name", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),  /* 경영관리(경비지급용) */
('LST_STA_002', '영업본부(고객사별 지원시간)', '영업본부(고객사별 지원시간)', '영업본부(고객사별 지원시간)', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = wor.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       (select name
		  from tab_task
         where id = wor.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = wor.req_emp_id) as req_emp_name,
       ass_emp_id,
       (select name
         from tab_employee
        where id = wor.ass_emp_id) as ass_emp_name,
       src_id,
       src_ent_id,
       content,
       type_cd,
       (select name
         from tab_code
        where id = wor.type_cd) as type_name,
       cat_cd,
       (select name
         from tab_code
        where id = wor.cat_cd) as cat_name,
       crm_id,
       (select name
          from tab_crm
         where id = wor.crm_id) as crm_name,
       product_cd,
       (select name
          from tab_code
         where id = wor.product_cd) as product_name,
       support_city,
       support_location,
       customer,
       customer_contact,
       etc_content,
       charge_emp_id,
       (select name
         from tab_employee
        where id = wor.charge_emp_id) as charge_emp_name,
       date_format(plan_start_date, \'%Y-%m-%d %H:%i\') plan_start_date,
       date_format(plan_finish_date, \'%Y-%m-%d %H:%i\') plan_finish_date,
       date_format(act_start_date, \'%Y-%m-%d %H:%i\') act_start_date,
       date_format(act_finish_date, \'%Y-%m-%d %H:%i\') act_finish_date
  from tab_workorder wor
where tas_id in ( select id from tab_task where ent_id = \'WOR\' and type_cd = \'TAS_TYPE_COMP\')
  and type_cd in (\'SHM_TYPE_LEADER\', \'SHM_TYPE_MAINTENANCE\')', 
 '{
    "sql": {
        "where": true,
        "stmts": [
            { "stmt":"date_format(act_start_date, \'%Y-%m-%d\') between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"act_start_date", "param": "start_act_start_date,end_act_start_date", "type": "range-date", "require": true},
            { "stmt":"crm_id like concat(\'%\', ?, \'%\')", "id":"crm_id", "param": "crm_id", "type": "text", "require": false},
            { "stmt":"cat_cd = ?", "id":"cat_name", "param": "cat_name", "type": "text", "require": false},
            { "stmt":"customer like concat(\'%\', ?, \'%\')", "id":"customer", "param": "customer", "type": "text", "require": false},
            { "stmt":"customer_contact like concat(\'%\', ?, \'%\')", "id":"customer_contact", "param": "customer_contact", "type": "text", "require": false}
        ]
    },
    "action": {
        "create_btn": {
            "use": false,
            "title": "등록",
            "url": "",
            "modal_title": ""
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
            { "id": "act_start_date", "label": "작업 시작일", "uiitem": "Date.Range.DT", "width": 6, "index": 0, "def_val": "m-1,d+0", "config": "" },
            { "id": "crm_id", "label": "영업기회코드", "uiitem": "String.Text", "width": 3, "index": 6, "def_val": "", "config": "" },
            { "id": "cat_name", "label": "지원유형", "uiitem": "Code.Select", "width": 3, "index": 10, "def_val": "", "config": "SHM_CATALOG" },
            { "id": "customer", "label": "고객명", "uiitem": "String.Text", "width": 3, "index": 2, "def_val": "", "config": "SHM_CATALOG" },
            { "id": "customer_contact", "label": "고객담당자", "uiitem": "String.Text", "width": 3, "index": 5, "def_val": "", "config": "SHM_CATALOG" }
        ]
    ],
    "column": [
        { "name": "작업 시작일", "data": "act_start_date", "type": "view" },
        { "name": "작업 종료일", "data": "act_finish_date", "type": "view" },
        { "name": "고객명", "data": "customer", "type": "view" },
        { "name": "지원도시", "data": "support_city", "type": "view" },
        { "name": "지원장소", "data": "support_location", "type": "view" },
        { "name": "고객 담당자", "data": "customer_contact", "type": "view" },
        { "name": "영업코드", "data": "crm_id", "type": "view" },
        { "name": "영업기회명", "data": "crm_name", "type": "view" },
        { "name": "담당영업", "data": "req_emp_name", "type": "view" },
        { "name": "지원내역", "data": "content", "type": "view" },
        { "name": "지원 유형", "data": "cat_name", "type": "view" },
        { "name": "엔지니어", "data": "charge_emp_name", "type": "view" },
        { "name": "제품명", "data": "product_name", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),  /* 영업본부(고객사별 지원시간) */
('LST_STA_003', '주간업무보고', '주간업무보고', '주간업무보고', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = wor.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       (select name
		  from tab_task
         where id = wor.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = wor.req_emp_id) as req_emp_name,
       ass_emp_id,
       (select name
         from tab_employee
        where id = wor.ass_emp_id) as ass_emp_name,
       src_id,
       src_ent_id,
       content,
       type_cd,
       (select name
         from tab_code
        where id = wor.type_cd) as type_name,
       cat_cd,
       (select name
         from tab_code
        where id = wor.cat_cd) as cat_name,
       crm_id,
       (select name
          from tab_crm
         where id = wor.crm_id) as crm_name,
       product_cd,
       (select name
          from tab_code
         where id = wor.product_cd) as product_name,
       support_city,
       support_location,
       customer,
       customer_contact,
       etc_content,
       charge_emp_id,
       (select name
         from tab_employee
        where id = wor.charge_emp_id) as charge_emp_name,
       date_format(plan_start_date, \'%Y-%m-%d %H:%i\') plan_start_date,
       date_format(plan_finish_date, \'%Y-%m-%d %H:%i\') plan_finish_date,
       date_format(act_start_date, \'%Y-%m-%d %H:%i\') act_start_date,
       date_format(act_finish_date, \'%Y-%m-%d %H:%i\') act_finish_date
  from tab_workorder wor
where tas_id in ( select id from tab_task where ent_id = \'WOR\' and type_cd = \'TAS_TYPE_COMP\')
  and type_cd in (\'SHM_TYPE_LEADER\', \'SHM_TYPE_MAINTENANCE\')', 
 '{
    "sql": {
        "where": true,
        "stmts": [
            { "stmt":"date_format(act_start_date, \'%Y-%m-%d\') between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"act_start_date", "param": "start_act_start_date,end_act_start_date", "type": "range-date", "require": true},
            { "stmt":"product_cd in (select id from tab_code where sid = ?)", "id":"product_name", "param": "product_name", "type": "text", "require": true}
        ]
    },
    "action": {
        "create_btn": {
            "use": false,
            "title": "등록",
            "url": "",
            "modal_title": ""
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
            { "id": "act_start_date", "label": "지원 시작일", "uiitem": "Date.Range.DT", "width": 6, "index": 0, "def_val": "m-1,d+0", "config": "" },
            { "id": "product_name", "label": "본부", "uiitem": "Code.SQL", "width": 3, "index": 6, "def_val": "", "config": {"sql": "Filter.SQL.Product.Level1"} }
        ]
    ],
    "column": [
        { "name": "작업 시작일", "data": "act_start_date", "type": "view" },
        { "name": "고객명", "data": "customer", "type": "view" },
        { "name": "지원유형", "data": "cat_name", "type": "view" },
        { "name": "지원내역", "data": "content", "type": "view" },
        { "name": "엔지니어", "data": "charge_emp_name", "type": "view" },
        { "name": "담당영업", "data": "req_emp_name", "type": "view" },
        { "name": "제품명", "data": "product_name", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "asc" }
}', ''),  /* 주간업무보고 */
('LST_STA_004', '근무시간(엑셀변환용)', '근무시간(엑셀변환용)', '근무시간(엑셀변환용)', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select t.*
from (
select id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = wor.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       (select name
		  from tab_task
         where id = wor.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = wor.req_emp_id) as req_emp_name ,
       ass_emp_id,
       (select name
         from tab_employee
        where id = wor.ass_emp_id) as ass_emp_name,
       src_id,
       src_ent_id,
       type_cd,
       (select name
         from tab_code
        where id = wor.type_cd) as type_name,
       cat_cd,
       (select name
         from tab_code
        where id = wor.cat_cd) as cat_name,
       content,
       crm_id,
       (select name
          from tab_crm
         where id = wor.crm_id) as crm_name,
       product_cd,
       (select name
          from tab_code
         where id = wor.product_cd) as product_name,
       support_city,
       support_location,
       customer,
       customer_contact,
       charge_emp_id,
       (select name
         from tab_employee
        where id = wor.charge_emp_id) as charge_emp_name,
       act_start_date,
       act_finish_date
  from tab_workorder wor
 where tas_id in ( select id from tab_task where type_cd = \'TAS_TYPE_COMP\')
 union all
select id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = wor.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       (select name
		  from tab_task
         where id = wor.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = wor.req_emp_id) as req_emp_name ,
       ass_emp_id,
       (select name
         from tab_employee
        where id = wor.ass_emp_id) as ass_emp_name,
       src_id,
       src_ent_id,
       type_cd,
       (select name
         from tab_code
        where id = wor.type_cd) as type_name,
       cat_cd,
       (select name
         from tab_code
        where id = wor.cat_cd) as cat_name,
       content,
       crm_id,
       (select name
          from tab_crm
         where id = wor.crm_id) as crm_name,
       product_cd,
       (select name
          from tab_code
         where id = wor.product_cd) as product_name,
       support_city,
       support_location,
       customer,
       customer_contact,
       charge_emp_id,
       (select name
         from tab_employee
        where id = wor.charge_emp_id) as charge_emp_name,
       act_start_date,
       act_finish_date
  from tab_workorder wor 
 where type_cd = \'SHM_TYPE_VACATION\'
 ) t', 
 '{
    "sql": {
        "where": false,
        "stmts": [
            { "stmt":"date_format(act_start_date, \'%Y-%m-%d\') between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"start_date", "param": "start_start_date,end_start_date", "type": "range-date", "require": true},
            { "stmt":"charge_emp_id in (select id from tab_employee where name = ?)", "id":"charge_emp_name", "param": "charge_emp_name", "type": "text", "require": true}
        ]
    },
    "action": {
        "create_btn": {
            "use": false,
            "title": "등록",
            "url": "",
            "modal_title": ""
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
        "list": "/api/common/worktime-tablelist",
        "excel": "/api/common/worktime-excel"
    },
    "filter": [
        [
            { "id": "start_date", "label": "지원 시작일", "uiitem": "Date.Range.DT", "width": 6, "index": 1, "def_val": "m-1,d+0", "config": "" },
            { "id": "charge_emp_name", "label": "엔지니어", "uiitem": "String.Text", "width": 6, "index": 0, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "엔지니어", "data": "charge_emp_name", "type": "view" },
        { "name": "지원 시작일", "data": "start_date", "type": "view" },
        { "name": "휴계시간", "data": "rest_time", "type": "view" },
        { "name": "총 시간", "data": "total_time", "type": "view" },
        { "name": "총 시간(휴계제외)", "data": "calc_total_time", "type": "view" },
        { "name": "소정 근로시간", "data": "work_time", "type": "view" },
        { "name": "연장 근로시간", "data": "over_time", "type": "view" },
        { "name": "야간 근로시간", "data": "night_time", "type": "view" },
        { "name": "휴일 근로시간", "data": "holiday_time", "type": "view" },
        { "name": "소정근로", "data": "weight_work_time", "type": "view" },
        { "name": "연장근로", "data": "weight_over_time", "type": "view" },
        { "name": "야간근로", "data": "weight_night_time", "type": "view" },
        { "name": "휴일근로", "data": "weight_holiday_time", "type": "view" },
        { "name": "합계", "data": "weight_total_time", "type": "view" }
    ],
    "order": ""
}', ''),  /* 근무시간(엑셀변환용) */
('EMP_WORK_LIST', '엔지니어별 근무현황', '엔지니어별 근무현황', '엔지니어별 근무현황', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '', 
 '{
    "action": {
        "search_btn": {
            "use": true,
            "title": "조회"
        }
    },
    "filter": [
        [
            { "id": "dpt_id", "label": "부서", "uiitem": "Entity.SearchSelect", "width": 6, "index": 1, "def_val": "#{user.deptId}", "config": "DPT" },
            { "id": "charge_emp_name", "label": "엔지니어", "uiitem": "String.Text", "width": 6, "index": 1, "def_val": "", "config": "" }
        ]
    ]
}', ''),  /* 엔지니어별 근무현황 */
('LST_STA_006', '엔지니어별 휴가현황', '엔지니어별 휴가현황', '엔지니어별 휴가현황', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id, 
       name,
       charge_emp_id,
       (select name
	      from tab_employee
         where id = wor.charge_emp_id) as charge_emp_name,
       date_format(act_start_date, \'%Y-%m-%d %H:%i\') vacation_date,
       act_start_date,
       act_finish_date,
       vacation_cd,
       (select name
          from tab_code
         where id = wor.vacation_cd) vacation_name
from tab_workorder wor
where type_cd = \'SHM_TYPE_VACATION\'
  and (select name from tab_employee where id = wor.charge_emp_id) is not null', 
 '{
    "sql": {
        "where": true,
        "stmts": [
            { "stmt":"date_format(act_start_date, \'%Y-%m-%d\') between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"vacation_date", "param": "start_vacation_date,end_vacation_date", "type": "range-date", "require": true},
            { "stmt":"charge_emp_id in (select id from tab_employee where name = ?)", "id":"charge_emp_name", "param": "charge_emp_name", "type": "text", "require": false}
        ]
    },
    "action": {
        "create_btn": {
            "use": false,
            "title": "등록",
            "url": "",
            "modal_title": ""
        },
        "list_action_btn": {
            "url": "/common/modal/form?formId=FRM_WOR_V_001"
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
            { "id": "vacation_date", "label": "휴가일", "uiitem": "Date.Range.DT", "width": 6, "index": 1, "def_val": "m-1,d+0", "config": "" },
            { "id": "charge_emp_name", "label": "엔지니어", "uiitem": "String.Text", "width": 6, "index": 0, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "엔지니어", "data": "charge_emp_name", "type": "view" },
        { "name": "휴가일", "data": "vacation_date", "type": "view" },
        { "name": "휴가 유형", "data": "vacation_name", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 1, "type": "asc" }
}', ''),  /* 엔지니어별 휴가현황 */
('LST_STA_007', '근무시간(엑셀변환용)', '근무시간(엑셀변환용)', '근무시간(엑셀변환용)', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select t.*
from (
select id as rownum,
       id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = wor.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       (select name
		  from tab_task
         where id = wor.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = wor.req_emp_id) as req_emp_name ,
       ass_emp_id,
       (select name
         from tab_employee
        where id = wor.ass_emp_id) as ass_emp_name,
       src_id,
       src_ent_id,
       type_cd,
       (select name
         from tab_code
        where id = wor.type_cd) as type_name,
       cat_cd,
       (select name
         from tab_code
        where id = wor.cat_cd) as cat_name,
       content,
       crm_id,
       (select name
          from tab_crm
         where id = wor.crm_id) as crm_name,
       product_cd,
       (select name
          from tab_code
         where id = wor.product_cd) as product_name,
       support_city,
       support_location,
       customer,
       customer_contact,
       charge_emp_id,
       (select name
         from tab_employee
        where id = wor.charge_emp_id) as charge_emp_name,
       act_start_date,
       act_finish_date
  from tab_workorder wor
 where tas_id in ( select id from tab_task where type_cd = \'TAS_TYPE_COMP\')
 union all
select id as rownum,
       id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = wor.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       (select name
		  from tab_task
         where id = wor.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = wor.req_emp_id) as req_emp_name ,
       ass_emp_id,
       (select name
         from tab_employee
        where id = wor.ass_emp_id) as ass_emp_name,
       src_id,
       src_ent_id,
       type_cd,
       (select name
         from tab_code
        where id = wor.type_cd) as type_name,
       cat_cd,
       (select name
         from tab_code
        where id = wor.cat_cd) as cat_name,
       content,
       crm_id,
       (select name
          from tab_crm
         where id = wor.crm_id) as crm_name,
       product_cd,
       (select name
          from tab_code
         where id = wor.product_cd) as product_name,
       support_city,
       support_location,
       customer,
       customer_contact,
       charge_emp_id,
       (select name
         from tab_employee
        where id = wor.charge_emp_id) as charge_emp_name,
       act_start_date,
       act_finish_date
  from tab_workorder wor 
 where type_cd = \'SHM_TYPE_VACATION\'
 ) t', 
 '{
    "sql": {
        "where": false,
        "stmts": [
            { "stmt":"date_format(act_start_date, \'%Y-%m-%d\') between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"start_date", "param": "start_start_date,end_start_date", "type": "range-date", "require": true},
            { "stmt":"charge_emp_id in (select id from tab_employee where name = ?)", "id":"charge_emp_name", "param": "charge_emp_name", "type": "text", "require": true}
        ]
    },
    "action": {
        "create_btn": {
            "use": false,
            "title": "등록",
            "url": "",
            "modal_title": ""
        },
        "list_action_btn": {
            "url": "/common/modal/form"
        },
        "export_btn": {
            "use": true,
            "title": "출력",
            "print": false,
            "copy": false,
            "excel": false,
            "csv": false,
            "pdf": false,
            "excel_all": true
        }
    },
    "layout": {
        "list": "/api/common/worktime-childtablelist",
        "excel": "/api/common/worktime-excel"
    },
    "filter": [
        [
            { "id": "start_date", "label": "지원 시작일", "uiitem": "Date.Range.DT", "width": 6, "index": 1, "def_val": "m-1,d+0", "config": "" },
            { "id": "charge_emp_name", "label": "엔지니어", "uiitem": "String.Text", "width": 6, "index": 0, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "엔지니어", "data": "charge_emp_name", "type": "view" },
        { "name": "지원일", "data": "start_date", "type": "view" },
        { "name": "휴계시간", "data": "rest_time", "type": "excel" },
        { "name": "총 시간", "data": "total_time", "type": "excel" },
        { "name": "총 시간(근무시간)", "data": "calc_total_time", "type": "view" },
        { "name": "소정 근로시간", "data": "work_time", "type": "excel" },
        { "name": "연장 근로시간", "data": "over_time", "type": "excel" },
        { "name": "야간 근로시간", "data": "night_time", "type": "excel" },
        { "name": "휴일 근로시간", "data": "holiday_time", "type": "excel" },
        { "name": "소정근로", "data": "weight_work_time", "type": "excel" },
        { "name": "연장근로", "data": "weight_over_time", "type": "excel" },
        { "name": "야간근로", "data": "weight_night_time", "type": "excel" },
        { "name": "휴일근로", "data": "weight_holiday_time", "type": "excel" },
        { "name": "합계", "data": "weight_total_time", "type": "excel" },
        { "name": "보상 발생시간", "data": "weight_compensation_total_time", "type": "view" },
        { "name": "기사용시간", "data": "used_work_time_str", "type": "view" },
        { "name": "잔여시간", "data": "compensation_rest_time", "type": "view" },
        { "name": "Actions", "data": "worktime", "type": "action" }
    ],
    "order": "act_start_date desc",
    "child_list": "LST_STA_007_CHILD"
}', ''),    /* 근무시간(엑셀변환용) */
('LST_STA_007_CHILD', '근무시간(엑셀변환용)(서브)', '근무시간(엑셀변환용)(서브)', '근무시간(엑셀변환용)(서브)', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select t.*
from (
select id as rownum,
       id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = wor.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       \'\' as form_id,
       (select name
		  from tab_task
         where id = wor.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = wor.req_emp_id) as req_emp_name ,
       ass_emp_id,
       (select name
         from tab_employee
        where id = wor.ass_emp_id) as ass_emp_name,
       src_id,
       src_ent_id,
       type_cd,
       (select name
         from tab_code
        where id = wor.type_cd) as type_name,
       cat_cd,
       (select name
         from tab_code
        where id = wor.cat_cd) as cat_name,
       content,
       crm_id,
       (select name
          from tab_crm
         where id = wor.crm_id) as crm_name,
       product_cd,
       (select name
          from tab_code
         where id = wor.product_cd) as product_name,
       support_city,
       support_location,
       customer,
       customer_contact,
       charge_emp_id,
       (select name
         from tab_employee
        where id = wor.charge_emp_id) as charge_emp_name,
       date_format(act_start_date, \'%Y-%m-%d %H:%i\') act_start_date,
       date_format(act_finish_date, \'%Y-%m-%d %H:%i\') act_finish_date
  from tab_workorder wor
 where tas_id in ( select id from tab_task where type_cd = \'TAS_TYPE_COMP\')
 union all
select id as rownum,
       id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = wor.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       \'FRM_WOR_V_001\' as form_id,
       (select name
		  from tab_task
         where id = wor.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = wor.req_emp_id) as req_emp_name ,
       ass_emp_id,
       (select name
         from tab_employee
        where id = wor.ass_emp_id) as ass_emp_name,
       src_id,
       src_ent_id,
       type_cd,
       (select name
         from tab_code
        where id = wor.type_cd) as type_name,
       cat_cd,
       (select name
         from tab_code
        where id = wor.cat_cd) as cat_name,
       content,
       crm_id,
       (select name
          from tab_crm
         where id = wor.crm_id) as crm_name,
       product_cd,
       (select name
          from tab_code
         where id = wor.product_cd) as product_name,
       support_city,
       support_location,
       customer,
       customer_contact,
       charge_emp_id,
       (select name
         from tab_employee
        where id = wor.charge_emp_id) as charge_emp_name,
       date_format(act_start_date, \'%Y-%m-%d %H:%i\') act_start_date,
       date_format(act_finish_date, \'%Y-%m-%d %H:%i\') act_finish_date
  from tab_workorder wor 
 where type_cd = \'SHM_TYPE_VACATION\'
 ) t', 
 '{
    "sql": {
        "where": false,
        "stmts": [
            { "stmt":"date_format(act_start_date, \'%Y-%m-%d\') between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"work_date", "param": "work_date,work_date", "type": "range-date", "require": true},
            { "stmt":"charge_emp_id in (select id from tab_employee where name = ?)", "id":"charge_emp_name", "param": "charge_emp_name", "type": "text", "require": true}
        ]
    },
    "action": {
        "create_btn": {
            "use": false,
            "title": "등록",
            "url": "",
            "modal_title": ""
        },
        "list_action_btn": {
            "url": "/common/modal/form"
        },
        "export_btn": {
            "use": false,
            "title": "출력",
            "print": false,
            "copy": false,
            "excel": false,
            "csv": false,
            "pdf": false,
            "excel_all": true
        }
    },
    "layout": {
        "list": "/api/common/childtablelist",
        "excel": "/api/common/excel"
    },
    "filter": [
        [
            { "id": "work_date", "label": "지원 시작일", "uiitem": "Date.Range.DT", "width": 6, "index": 1, "def_val": "m-1,d+0", "config": "" },
            { "id": "charge_emp_name", "label": "엔지니어", "uiitem": "String.Text", "width": 6, "index": 0, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "제목", "data": "name", "type": "view" },
        { "name": "엔지니어", "data": "charge_emp_name", "type": "view" },
        { "name": "작업 실제일시(시작)", "data": "act_start_date", "type": "view" },
        { "name": "작업 실제일시(종료)", "data": "act_finish_date", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "desc" }
}', ''),    /* 근무시간(엑셀변환용)(서브) */
('LST_STA_008', '부서별 근무시간', '부서별 근무시간', '부서별 근무시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select t.*
from (
select id as rownum,
       id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = wor.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       (select name
		  from tab_task
         where id = wor.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = wor.req_emp_id) as req_emp_name,
       ass_emp_id,
       (select name
         from tab_employee
        where id = wor.ass_emp_id) as ass_emp_name,
       src_id,
       src_ent_id,
       type_cd,
       (select name
         from tab_code
        where id = wor.type_cd) as type_name,
       cat_cd,
       (select name
         from tab_code
        where id = wor.cat_cd) as cat_name,
       content,
       crm_id,
       (select name
          from tab_crm
         where id = wor.crm_id) as crm_name,
       product_cd,
       (select name
          from tab_code
         where id = wor.product_cd) as product_name,
       support_city,
       support_location,
       customer,
       customer_contact,
       charge_emp_id,
       (select name
         from tab_employee
        where id = wor.charge_emp_id) as charge_emp_name,
       (select org_id
         from tab_employee
        where id = wor.charge_emp_id) as charge_org_id,
       (select name
         from tab_org
        where id = (select org_id from tab_employee where id = wor.charge_emp_id)) as charge_org_name,
       (select dpt_id
         from tab_employee
        where id = wor.charge_emp_id) as charge_dpt_id,
       (select name
         from tab_dept
        where id = (select dpt_id from tab_employee where id = wor.charge_emp_id)) as charge_dpt_name,
       act_start_date,
       act_finish_date,
       date_format(act_start_date, \'%Y-%m-%d %H:%i\') convert_act_start_date,
       date_format(act_finish_date, \'%Y-%m-%d %H:%i\') convert_act_finish_date
  from tab_workorder wor
 where tas_id in ( select id from tab_task where type_cd = \'TAS_TYPE_COMP\')
 union all
select id as rownum,
       id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = wor.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       (select name
		  from tab_task
         where id = wor.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = wor.req_emp_id) as req_emp_name ,
       ass_emp_id,
       (select name
         from tab_employee
        where id = wor.ass_emp_id) as ass_emp_name,
       src_id,
       src_ent_id,
       type_cd,
       (select name
         from tab_code
        where id = wor.type_cd) as type_name,
       cat_cd,
       (select name
         from tab_code
        where id = wor.cat_cd) as cat_name,
       content,
       crm_id,
       (select name
          from tab_crm
         where id = wor.crm_id) as crm_name,
       product_cd,
       (select name
          from tab_code
         where id = wor.product_cd) as product_name,
       support_city,
       support_location,
       customer,
       customer_contact,
       charge_emp_id,
       (select name
         from tab_employee
        where id = wor.charge_emp_id) as charge_emp_name,
       (select org_id
         from tab_employee
        where id = wor.charge_emp_id) as charge_org_id,
       (select name
         from tab_org
        where id = (select org_id from tab_employee where id = wor.charge_emp_id)) as charge_org_name,
       (select dpt_id
         from tab_employee
        where id = wor.charge_emp_id) as charge_dpt_id,
       (select name
         from tab_dept
        where id = (select dpt_id from tab_employee where id = wor.charge_emp_id)) as charge_dpt_name,
       act_start_date,
       act_finish_date,
       date_format(act_start_date, \'%Y-%m-%d %H:%i\') convert_act_start_date,
       date_format(act_finish_date, \'%Y-%m-%d %H:%i\') convert_act_finish_date
  from tab_workorder wor 
 where type_cd = \'SHM_TYPE_VACATION\'
 ) t', 
 '{
    "sql": {
        "where": false,
        "stmts": [
            { "stmt":"date_format(act_start_date, \'%Y-%m-%d\') between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"search_date", "param": "start_search_date,end_search_date", "type": "range-date", "require": true}
        ]
    },
    "action": {
        "create_btn": {
            "use": false,
            "title": "등록",
            "url": "",
            "modal_title": ""
        },
        "list_action_btn": {
            "url": "/common/modal/form"
        },
        "export_btn": {
            "use": true,
            "title": "출력",
            "print": false,
            "copy": false,
            "excel": false,
            "csv": false,
            "pdf": false,
            "excel_all": true
        }
    },
    "layout": {
        "list": "/api/common/team-worktime-childtablelist",
        "excel": "/api/common/team-worktime-excel"
    },
    "filter": [
        [
            { "id": "search_date", "label": "지원일", "uiitem": "Date.Range.DT", "width": 6, "index": 2, "def_val": "m-1,d+0", "config": "" }
        ]
    ],
    "column": [
        { "name": "회사", "data": "charge_org_name", "type": "view" },
        { "name": "부서(팀)", "data": "charge_dpt_name", "type": "view" },
        { "name": "지원일", "data": "search_date", "type": "view" },
        { "name": "인원", "data": "employee_count", "type": "view" },
        { "name": "소정 근로시간", "data": "stand_work_time_str", "type": "view" },
        { "name": "총 근무시간", "data": "work_time_str", "type": "view" },
        { "name": "연장 근로시간", "data": "over_time_str", "type": "view" },
        { "name": "야간 근로시간", "data": "night_time_str", "type": "view" },
        { "name": "휴일 근로시간", "data": "holiday_time_str", "type": "view" },
        { "name": "주 평균 근로시간", "data": "week_avg_work_time", "type": "view" },
        { "name": "소정 근로시간(분)", "data": "stand_work_time", "type": "excel" },
        { "name": "총 근무시간(분)", "data": "work_time", "type": "excel" },
        { "name": "연장 근로시간(분)", "data": "over_time", "type": "excel" },
        { "name": "야간 근로시간(분)", "data": "night_time", "type": "excel" },
        { "name": "휴일 근로시간(분)", "data": "holiday_time", "type": "excel" }
    ],
    "order": "",
    "child_list": "LST_STA_008_CHILD"
}', ''),    /* 부서별 근무시간 */
('LST_STA_008_CHILD', '부서별 근무시간(엔지니어)', '부서별 근무시간(엔지니어)', '부서별 근무시간(엔지니어)', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select t.*
from (
select id as rownum,
       id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = wor.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       \'\' as form_id,
       (select name
		  from tab_task
         where id = wor.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = wor.req_emp_id) as req_emp_name ,
       ass_emp_id,
       (select name
         from tab_employee
        where id = wor.ass_emp_id) as ass_emp_name,
       src_id,
       src_ent_id,
       type_cd,
       (select name
         from tab_code
        where id = wor.type_cd) as type_name,
       cat_cd,
       (select name
         from tab_code
        where id = wor.cat_cd) as cat_name,
       content,
       crm_id,
       (select name
          from tab_crm
         where id = wor.crm_id) as crm_name,
       product_cd,
       (select name
          from tab_code
         where id = wor.product_cd) as product_name,
       support_city,
       support_location,
       customer,
       customer_contact,
       charge_emp_id,
       (select name
         from tab_employee
        where id = wor.charge_emp_id) as charge_emp_name,
       (select org_id
         from tab_employee
        where id = wor.charge_emp_id) as charge_org_id,
       (select name
         from tab_org
        where id = (select org_id from tab_employee where id = wor.charge_emp_id)) as charge_org_name,
       (select dpt_id
         from tab_employee
        where id = wor.charge_emp_id) as charge_dpt_id,
       (select name
         from tab_dept
        where id = (select dpt_id from tab_employee where id = wor.charge_emp_id)) as charge_dpt_name,
       act_start_date,
       act_finish_date,
       date_format(act_start_date, \'%Y-%m-%d %H:%i\') convert_act_start_date,
       date_format(act_finish_date, \'%Y-%m-%d %H:%i\') convert_act_finish_date
  from tab_workorder wor
 where tas_id in ( select id from tab_task where type_cd = \'TAS_TYPE_COMP\')
 union all
select id as rownum,
       id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = wor.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       \'FRM_WOR_V_001\' as form_id,
       (select name
		  from tab_task
         where id = wor.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = wor.req_emp_id) as req_emp_name ,
       ass_emp_id,
       (select name
         from tab_employee
        where id = wor.ass_emp_id) as ass_emp_name,
       src_id,
       src_ent_id,
       type_cd,
       (select name
         from tab_code
        where id = wor.type_cd) as type_name,
       cat_cd,
       (select name
         from tab_code
        where id = wor.cat_cd) as cat_name,
       content,
       crm_id,
       (select name
          from tab_crm
         where id = wor.crm_id) as crm_name,
       product_cd,
       (select name
          from tab_code
         where id = wor.product_cd) as product_name,
       support_city,
       support_location,
       customer,
       customer_contact,
       charge_emp_id,
       (select name
         from tab_employee
        where id = wor.charge_emp_id) as charge_emp_name,
       (select org_id
         from tab_employee
        where id = wor.charge_emp_id) as charge_org_id,
       (select name
         from tab_org
        where id = (select org_id from tab_employee where id = wor.charge_emp_id)) as charge_org_name,
       (select dpt_id
         from tab_employee
        where id = wor.charge_emp_id) as charge_dpt_id,
       (select name
         from tab_dept
        where id = (select dpt_id from tab_employee where id = wor.charge_emp_id)) as charge_dpt_name,
       act_start_date,
       act_finish_date,
       date_format(act_start_date, \'%Y-%m-%d %H:%i\') convert_act_start_date,
       date_format(act_finish_date, \'%Y-%m-%d %H:%i\') convert_act_finish_date
  from tab_workorder wor 
 where type_cd = \'SHM_TYPE_VACATION\'
 ) t', 
 '{
    "sql": {
        "where": false,
        "stmts": [
            { "stmt":"charge_emp_id in (select id from tab_employee where dpt_id = ?)", "id":"charge_dpt_id", "param": "charge_dpt_id", "type": "text", "require": true},
            { "stmt":"date_format(act_start_date, \'%Y-%m-%d\') between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"search_date", "param": "start_search_date,end_search_date", "type": "range-date", "require": true}
        ]
    },
    "action": {
        "create_btn": {
            "use": false,
            "title": "등록",
            "url": "",
            "modal_title": ""
        },
        "list_action_btn": {
            "url": "/common/modal/form"
        },
        "export_btn": {
            "use": false,
            "title": "출력",
            "print": false,
            "copy": false,
            "excel": false,
            "csv": false,
            "pdf": false,
            "excel_all": true
        }
    },
    "layout": {
        "list": "/api/common/team-childtablelist",
        "excel": "/api/common/excel"
    },
    "filter": [
        [
            { "id": "charge_dpt_id", "label": "부서 ID", "uiitem": "String.Text", "width": 6, "index": 0, "def_val": "", "config": "" },
            { "id": "search_date", "label": "지원일", "uiitem": "Date.Range.DT", "width": 6, "index": 0, "def_val": "f-1,l-1", "config": "" }
        ]
    ],
    "column": [
        { "name": "엔지니어", "data": "charge_emp_name", "type": "view" },
        { "name": "소정 근로시간", "data": "stand_work_time_str", "type": "view" },
        { "name": "총 근무시간", "data": "work_time_str", "type": "view" },
        { "name": "연장 근로시간", "data": "over_time_str", "type": "view" },
        { "name": "야간 근로시간", "data": "night_time_str", "type": "view" },
        { "name": "휴일 근로시간", "data": "holiday_time_str", "type": "view" },
        { "name": "주 평균 근로시간", "data": "week_avg_work_time", "type": "view" },
        { "name": "소정 근로시간(분)", "data": "stand_work_time", "type": "excel" },
        { "name": "총 근무시간(분)", "data": "work_time", "type": "excel" },
        { "name": "연장 근로시간(분)", "data": "over_time", "type": "excel" },
        { "name": "야간 근로시간(분)", "data": "night_time", "type": "excel" },
        { "name": "휴일 근로시간(분)", "data": "holiday_time", "type": "excel" }
    ],
    "order": "",
    "child_list": "LST_STA_008_CHILD_DETAIL"
}', ''),    /* 부서별 근무시간(엔지니어) */
('LST_STA_008_CHILD_DETAIL', '엔지니어 상세 근무시간', '엔지니어 상세 근무시간', '엔지니어 상세 근무시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select t.*
from (
select id as rownum,
       id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = wor.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       \'\' as form_id,
       (select name
		  from tab_task
         where id = wor.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = wor.req_emp_id) as req_emp_name ,
       ass_emp_id,
       (select name
         from tab_employee
        where id = wor.ass_emp_id) as ass_emp_name,
       src_id,
       src_ent_id,
       type_cd,
       (select name
         from tab_code
        where id = wor.type_cd) as type_name,
       cat_cd,
       (select name
         from tab_code
        where id = wor.cat_cd) as cat_name,
       content,
       crm_id,
       (select name
          from tab_crm
         where id = wor.crm_id) as crm_name,
       product_cd,
       (select name
          from tab_code
         where id = wor.product_cd) as product_name,
       support_city,
       support_location,
       customer,
       customer_contact,
       charge_emp_id,
       (select name
         from tab_employee
        where id = wor.charge_emp_id) as charge_emp_name,
       (select org_id
         from tab_employee
        where id = wor.charge_emp_id) as charge_org_id,
       (select name
         from tab_org
        where id = (select org_id from tab_employee where id = wor.charge_emp_id)) as charge_org_name,
       (select dpt_id
         from tab_employee
        where id = wor.charge_emp_id) as charge_dpt_id,
       (select name
         from tab_dept
        where id = (select dpt_id from tab_employee where id = wor.charge_emp_id)) as charge_dpt_name,
       act_start_date,
       act_finish_date,
       date_format(act_start_date, \'%Y-%m-%d %H:%i\') convert_act_start_date,
       date_format(act_finish_date, \'%Y-%m-%d %H:%i\') convert_act_finish_date
  from tab_workorder wor
 where tas_id in ( select id from tab_task where type_cd = \'TAS_TYPE_COMP\')
 union all
select id as rownum,
       id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = wor.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       \'FRM_WOR_V_001\' as form_id,
       (select name
		  from tab_task
         where id = wor.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = wor.req_emp_id) as req_emp_name ,
       ass_emp_id,
       (select name
         from tab_employee
        where id = wor.ass_emp_id) as ass_emp_name,
       src_id,
       src_ent_id,
       type_cd,
       (select name
         from tab_code
        where id = wor.type_cd) as type_name,
       cat_cd,
       (select name
         from tab_code
        where id = wor.cat_cd) as cat_name,
       content,
       crm_id,
       (select name
          from tab_crm
         where id = wor.crm_id) as crm_name,
       product_cd,
       (select name
          from tab_code
         where id = wor.product_cd) as product_name,
       support_city,
       support_location,
       customer,
       customer_contact,
       charge_emp_id,
       (select name
         from tab_employee
        where id = wor.charge_emp_id) as charge_emp_name,
       (select org_id
         from tab_employee
        where id = wor.charge_emp_id) as charge_org_id,
       (select name
         from tab_org
        where id = (select org_id from tab_employee where id = wor.charge_emp_id)) as charge_org_name,
       (select dpt_id
         from tab_employee
        where id = wor.charge_emp_id) as charge_dpt_id,
       (select name
         from tab_dept
        where id = (select dpt_id from tab_employee where id = wor.charge_emp_id)) as charge_dpt_name,
       act_start_date,
       act_finish_date,
       date_format(act_start_date, \'%Y-%m-%d %H:%i\') convert_act_start_date,
       date_format(act_finish_date, \'%Y-%m-%d %H:%i\') convert_act_finish_date
  from tab_workorder wor 
 where type_cd = \'SHM_TYPE_VACATION\'
 ) t', 
 '{
    "sql": {
        "where": false,
        "stmts": [
            { "stmt":"charge_emp_id = ?", "id":"charge_emp_id", "param": "charge_emp_id", "type": "text", "require": true},
            { "stmt":"date_format(act_start_date, \'%Y-%m-%d\') between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"search_date", "param": "start_search_date,end_search_date", "type": "range-date", "require": true}
        ]
    },
    "action": {
        "create_btn": {
            "use": false,
            "title": "등록",
            "url": "",
            "modal_title": ""
        },
        "list_action_btn": {
            "url": "/common/modal/form"
        },
        "export_btn": {
            "use": false,
            "title": "출력",
            "print": false,
            "copy": false,
            "excel": false,
            "csv": false,
            "pdf": false,
            "excel_all": true
        }
    },
    "layout": {
        "list": "/api/common/childtablelist",
        "excel": "/api/common/excel"
    },
    "filter": [
        [
            { "id": "charge_emp_id", "label": "엔지니어 ID", "uiitem": "String.Text", "width": 6, "index": 0, "def_val": "", "config": "" },
            { "id": "search_date", "label": "지원일", "uiitem": "Date.Range.DT", "width": 6, "index": 0, "def_val": "m-0,d+0", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "제목", "data": "name", "type": "view" },
        { "name": "엔지니어", "data": "charge_emp_name", "type": "view" },
        { "name": "작업 실제일시(시작)", "data": "convert_act_start_date", "type": "view" },
        { "name": "작업 실제일시(종료)", "data": "convert_act_finish_date", "type": "view" }
    ],
    "order": ""
}', '');    /* 엔지니어 상세 근무시간 */