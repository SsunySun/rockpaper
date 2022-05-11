/**
 * SQL Table Initialize Data
 */
INSERT INTO RSHM.TAB_SQL
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 QUERY, CONFIG )
VALUES
('CODE_BY_PID', '코드 하위 값 가져오기', '코드 하위 값 가져오기', '코드 하위 값 가져오기', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select * 
   from tab_code',
 '{
    "where": false,
    "stmts": [
        { "stmt":"PID = ?", "id":"pid", "param": "pid", "type": "text", "require": true}
    ]
}'),	/* 코드 하위 값 가져오기 */
('ENTITY_SEARCH_SELECT', 'Entity.SearchSelect 값 가져오기', 'Entity.SearchSelect 값 가져오기', 'Entity.SearchSelect 값 가져오기', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id, concat(name, \'(\', id, \')\') as text
   from #{table}',
 '{
    "where": false,
    "stmts": [
        { "stmt":"(name like concat(\'%\', ?, \'%\') or id like concat(\'%\', ?, \'%\'))", "id":"search", "param": "search,search", "type": "text", "require": true}
    ],
    "orderBy": ""
}'),	/* Entity.SearchSelect 값 가져오기 */
('PORTAL_ASSIGN_LIST', '대시보드 업무리스트 가져오기', '대시보드 업무리스트 가져오기', '대시보드 업무리스트 가져오기', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select *
from (select id,
		     name,
		     ass_emp_id,
		     (select name
			    from tab_employee
			   where id = wor.ass_emp_id) as ass_emp_name,
		     ent_id,
		     plan_start_date,
		     plan_finish_date,
		     cat_cd,
		     (select name 
			    from tab_code
			   where id = wor.cat_cd) as cat_name,
		     crm_id,
		     (select name
			    from tab_crm
			   where id = wor.crm_id) as crm_name,
             (case type_cd
				when \'SHM_TYPE_LEADER\' then (select content 
											   from tab_shm 
											  where id = wor.src_id)
                when \'SHM_TYPE_MAINTENANCE\' then (select content 
													from tab_shm 
												   where id = wor.src_id)
                when \'SHM_TYPE_INTERNAL\' then content
				 end) as content
		from tab_workorder wor
		where tas_id not in (select id from tab_task where ent_id = \'WOR\' and type_cd in (\'TAS_TYPE_CANCEL\', \'TAS_TYPE_COMP\'))
		union
		select id,
			   name,
			   ass_emp_id,
			   (select name
				  from tab_employee
				 where id = shm.ass_emp_id) as ass_emp_name,
			   ent_id,
			   \'\' plan_start_date,
			   \'\' plan_finish_date,
			   cat_cd,
			   (select name 
				  from tab_code
				 where id = shm.cat_cd) as cat_name,
			   crm_id,
			   (select name
				  from tab_crm
				 where id = shm.crm_id) as crm_name,
			   content as content 
		from tab_shm shm
		where tas_id not in (select id from tab_task where ent_id = \'SHM\' and type_cd in (\'TAS_TYPE_CANCEL\', \'TAS_TYPE_COMP\'))
) as tab',
 '{
    "where": false,
    "stmts": [
        { "stmt":"ass_emp_id = ?", "id":"user.id", "param": "user.id", "type": "text", "require": true}
    ],
    "orderBy": "plan_start_date asc"
}'),	/* 대시보드 업무리스트 가져오기 */
('CHECK_WORKORDER_STATUS', '하위 작업계획서 상태 체크', '하위 작업계획서 상태 체크', '하위 작업계획서 상태 체크', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select count(*) as cnt
  from tab_workorder
 where tas_id in ( select id
				     from tab_task
				    where ent_id = \'WOR\'
					  and type_cd not in (\'TAS_TYPE_CANCEL\', \'TAS_TYPE_COMP\'))',
 '{
    "where": true,
    "stmts": [
        { "stmt":"src_id = ?", "id":"src_id", "param": "src_id", "type": "text", "require": true}
    ]
}'),	/* 하위 작업계획서 상태 체크 */
('CHECK_WORKORDER_COUNT', '하위 작업계획서 갯수 체크', '하위 작업계획서 갯수 체크', '하위 작업계획서 갯수 체크', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select count(*) as cnt
  from tab_workorder',
 '{
    "where": false,
    "stmts": [
        { "stmt":"src_id = ?", "id":"src_id", "param": "src_id", "type": "text", "require": true}
    ]
}'),	/* 하위 작업계획서 갯수 체크 */
('SHM_MA_LIST', '정기점검 목록', '정기점검 목록', '정기점검 목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
       name,
       date_format(create_date, \'%Y-%m-%d %H:%i\') create_date,
       create_emp_id,
       (select name
         from tab_employee
        where id = shm.create_emp_id) as create_emp_name,
       ent_id,
       tas_id,
       (select name
		  from tab_task
         where id = shm.tas_id) as tas_name,
       date_format(req_date, \'%Y-%m-%d\') req_date,
       req_emp_id,
       (select name
         from tab_employee
        where id = shm.req_emp_id) as req_emp_name,
       cat_cd,
       (select name
         from tab_code
        where id = shm.cat_cd) as cat_name,
       content,
       crm_id,
       (select name
          from tab_crm
         where id = shm.crm_id) as crm_name,
       product_cd,
       (select name
         from tab_code
        where id = shm.product_cd) as product_name,
       customer_cd,
       (select name
         from tab_code
        where id = shm.customer_cd) as customer_name,
       customer,
       ma_cycle_cd,
       (select name
		  from tab_code
         where id = shm.ma_cycle_cd) as ma_cycle_name,
       date_format(ma_work_date, \'%Y-%m-%d\') ma_work_date,
       ma_charge_emp_id,
       (select name
         from tab_employee
        where id = shm.ma_charge_emp_id) as ma_charge_emp_name
from tab_shm shm
where type_cd = \'SHM_TYPE_MAINTENANCE\'
  and tas_id in (
      select id
          from tab_task 
        where type_cd = \'TAS_TYPE_PROC\'
          and ent_id = \'SHM\'
  )',
 '{
    "where": true,
    "stmts": [
        { "stmt":"ma_cycle_cd = ?", "id":"ma_cycle_cd", "param": "ma_cycle_cd", "type": "text", "require": true}
    ]
}'),	/* 정기점검 목록 */
('Filter.SQL.Product.Level1', '제품 레벨1 목록', '제품 레벨1 목록', '제품 레벨1 목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id, name
from tab_code
where cty_id = \'SHM_PRODUCT\'
  and level = 1
order by id asc',
 '{
    "where": false,
    "stmts": [
        
    ]
}'),	/* 제품 레벨1 목록 */
('WORKORDER_WORKING_COUNT', '진행중인 작업계확서 갯수', '진행중인 작업계확서 갯수', '진행중인 작업계확서 갯수', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select count(*) as cnt
  from tab_workorder wor
 where tas_id in (
					select id 
					  from tab_task 
                     where ent_id = \'WOR\'
                       and type_cd not in (\'TAS_TYPE_COMP\', \'TAS_TYPE_CANCEL\'))',
 '{
    "where": true,
    "stmts": [
        { "stmt":"src_id = ?", "id":"src_id", "param": "src_id", "type": "text", "require": true}
    ]
}'),	/* 진행중인 작업계확서 갯수 */
('WORKORDER_PROCEEDING_COUNT', '진행(완료포함)중인 작업계확서 갯수', '진행(완료포함)중인 작업계확서 갯수', '진행(완료포함)중인 작업계확서 갯수', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select count(*) as cnt
  from tab_workorder wor
 where tas_id in (
					select id 
					  from tab_task 
                     where ent_id = \'WOR\'
                       and type_cd in (\'TAS_TYPE_REG\', \'TAS_TYPE_PROC\', \'TAS_TYPE_COMP\'))',
 '{
    "where": true,
    "stmts": [
        { "stmt":"src_id = ?", "id":"src_id", "param": "src_id", "type": "text", "require": true}
    ]
}'),	/* 진행(완료포함)중인 작업계확서 갯수 */
('WORKORDER_COMPLETE_COUNT', '완료된 작업계획서 갯수', '완료된 작업계획서 갯수', '완료된 작업계획서 갯수', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select count(*) as cnt
  from tab_workorder wor
 where tas_id in (
					select id 
                      from tab_task 
					where ent_id = \'WOR\'
                      and type_cd = \'TAS_TYPE_COMP\')',
 '{
    "where": true,
    "stmts": [
        { "stmt":"src_id = ?", "id":"src_id", "param": "src_id", "type": "text", "require": true}
    ]
}'),	/* 완료된 작업계획서 갯수 */
('TODO_COMP_LIST', '나의 할일 - 완료된 목록', '나의 할일 - 완료된 목록', '나의 할일 - 완료된 목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id as id,
       name as title,
       act_start_date as start,
       act_finish_date as end,
       ent_id as ent_id,
       name as description,
       \'btn-secondary fc-event-light fc-event-solid-secondary\' as className
  from tab_workorder
 where tas_id in (select id from tab_task where type_cd = \'TAS_TYPE_COMP\')
   and charge_emp_id = \'#{user.id}\'',
 '{
    "where": true,
    "stmts": [
        { "stmt":"act_start_date between ? and ?", "id":"start", "param": "start,end", "type": "range-date", "require": true}
    ]
}'),	/* 나의 할일 - 완료된 목록 */
('TODO_PROC_LIST', '나의 할일 - 진행중인 목록', '나의 할일 - 진행중인 목록', '나의 할일 - 진행중인 목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id as id,
       name as title,
       plan_start_date as start,
       plan_finish_date as end,
       ent_id as ent_id,
       name as description,
       \'btn-primary fc-event-light fc-event-solid-primary\' as className
  from tab_workorder
 where tas_id not in (select id from tab_task where type_cd in (\'TAS_TYPE_COMP\', \'TAS_TYPE_CANCEL\'))
   and charge_emp_id = \'#{user.id}\'',
 '{
    "where": true,
    "stmts": [
        { "stmt":"plan_start_date between ? and ?", "id":"start", "param": "start,end", "type": "range-date", "require": true}
    ]
}'),	/* 나의 할일 - 진행중인 목록 */
('EMP_WORK_LIST', '엔지니어별 근무현황', '엔지니어별 근무현황', '엔지니어별 근무현황', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select tab.id,
       tab.title,
       tab.start,
       tab.end,
       tab.description,
       tab.className,
       tab.emp_id
  from (
		select id as id,
			   concat(\'(\', (select name from tab_employee where id = wor.charge_emp_id), \')\', name) as title,
			   act_start_date as start,
			   act_finish_date as end,
			   name as description,
			   \'btn-secondary fc-event-light fc-event-solid-secondary\' as className,
			   charge_emp_id as emp_id
		  from tab_workorder wor
		 where tas_id in (select id from tab_task where type_cd = \'TAS_TYPE_COMP\')
		union all
		select id as id,
			   concat(\'(\', (select name from tab_employee where id = wor.charge_emp_id), \')\', name) as title,
			   plan_start_date as start,
			   plan_finish_date as end,
			   name as description,
			   \'btn-primary fc-event-light fc-event-solid-primary\' as className,
			   charge_emp_id as emp_id
		  from tab_workorder wor
		 where tas_id not in (select id from tab_task where type_cd in (\'TAS_TYPE_COMP\', \'TAS_TYPE_CANCEL\'))
		) as tab',
 '{
    "where": false,
    "stmts": [
        { "stmt":"start between ? and ?", "id":"start", "param": "start,end", "type": "range-date", "require": true},
        { "stmt":"tab.emp_id in (select id from tab_employee where dpt_id in (select id from tab_dept where id = ?))", "id":"dpt_id", "param": "dpt_id", "type": "text", "require": true},
        { "stmt":"tab.emp_id in (select id from tab_employee where name = ?)", "id":"emp_name", "param": "emp_name", "type": "text", "require": false}
    ]
}'),	/* 엔지니어별 근무현황 */
('Filter.SQL.Dept.Level3', '부서 레벨1 목록', '부서 레벨1 목록', '부서 레벨1 목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id, concat(name, \'(\', (select name from tab_org where id = dept.org_id), \')\') as name
from tab_dept dept
where level = 3
  and used = true
order by name asc',
 '{
    "where": true,
    "stmts": [
        
    ]
}'),	/* 부서 레벨3 목록 */

('TODO_HOLIDAY_LIST', '공휴일 목록', '공휴일 목록', '공휴일 목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select name as title,
       date(id) as start,
       date(id) as end,
       name as description,
       \'btn-danger fc-event-light fc-event-solid-danger\' as className
  from tab_holiday',
 '{
    "where": false,
    "stmts": [
        { "stmt":"date(id) between ? and ?", "id":"start", "param": "start,end", "type": "range-date", "require": true}
    ]
}'),  /* 공휴일 목록 */

('CHECK_VACATION', '휴가가 기존에 등록되어 있는지 확인', '휴가가 기존에 등록되어 있는지 확인', '휴가가 기존에 등록되어 있는지 확인', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id as id
  from tab_workorder wor
 where type_cd = \'SHM_TYPE_VACATION\'',
 '{
    "where": true,
    "stmts": [
        { "stmt":"charge_emp_id = ?", "id":"emp_id", "param": "emp_id", "type": "text", "require": true},
        { "stmt":"date(act_start_date) = ?", "id":"day", "param": "day", "type": "text", "require": true},
        { "stmt":"vacation_cd = ?", "id":"vacation_cd", "param": "vacation_cd", "type": "text", "require": true}
    ]
}'),	/* 휴가가 기존에 등록되어 있는지 확인 */
('TODO_VACATION_LIST', '휴가 목록', '휴가 목록', '휴가 목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id as id,
       name as title,
       act_start_date as start,
       act_finish_date as end,
       ent_id as ent_id,
       \'FRM_WOR_V_001\' as form_id,
       name as description,
       \'btn-success fc-event-light fc-event-solid-success\' as className,
       type_cd as type
  from tab_workorder
 where type_cd = \'SHM_TYPE_VACATION\'
   and charge_emp_id = \'#{user.id}\'',
 '{
    "where": true,
    "stmts": [
        { "stmt":"act_start_date between ? and ?", "id":"start", "param": "start,end", "type": "range-date", "require": true}
    ]
}'),  /* 휴가 목록 */
('WORKTIME_OBJECT', '작업시간(인정휴가) 등록 정보', '작업시간(인정휴가) 등록 정보', '작업시간(인정휴가) 등록 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select id,
       name,
       used_work_time,
       compensation_time
from tab_worktime',
 '{
    "where": false,
    "stmts": [
        { "stmt":"work_date = ?", "id":"work_date", "param": "work_date", "type": "text", "require": true},
        { "stmt":"charge_emp_id = ?", "id":"charge_emp_id", "param": "charge_emp_id", "type": "text", "require": true}
    ]
}'),	/* 작업시간(인정휴가) 등록 정보 */
('CLOSED_SHM_LIST', '종료된 작업요청 목록', '종료된 작업요청 목록', '종료된 작업요청 목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select *
  from tab_shm
 where tas_id in (select id from tab_task where type_cd = \'TAS_TYPE_COMP\')
   and ass_emp_id is not null',
 '{
    "where": true,
    "stmts": [
        { "stmt":"date(clo_date) between ? and ?", "id":"start", "param": "start,end", "type": "range-date", "require": true}
    ]
}'),	/* 종료된 작업요청 목록 */
('CLOSED_WORKORDER_LIST', '종료된 작업처리 목록', '종료된 작업처리 목록', '종료된 작업처리 목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'select *
  from tab_workorder
 where tas_id in (select id from tab_task where type_cd = \'TAS_TYPE_COMP\')
   and ass_emp_id is not null',
 '{
    "where": true,
    "stmts": [
        { "stmt":"date(clo_date) between ? and ?", "id":"start", "param": "start,end", "type": "range-date", "require": true}
    ]
}');	/* 종료된 작업처리 목록 */