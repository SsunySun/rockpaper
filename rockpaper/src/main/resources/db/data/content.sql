/**
 * Content Table Initialize Data
 */
INSERT INTO RSHM.TAB_CONTENT
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 SUBJECT, CONTENT, TO_SQL, CONTENT_SQL )
VALUES
('CTN_SHM_LEADER_SAVE', '컨텐츠 저장 정보', '컨텐츠 저장 정보', '컨텐츠 저장 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">요청자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select ass_emp_id
   from tab_shm
  where id = \'#{id}\'',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = shm.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = shm.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = shm.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = shm.cat_cd) cat_name
  from tab_shm shm
  where id = \'#{id}\''),

('CTN_SHM_LEADER_REG', '컨텐츠 등록 정보', '컨텐츠 등록 정보', '컨텐츠 등록 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">요청자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select ass_emp_id
   from tab_shm
  where id = \'#{id}\'',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = shm.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = shm.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = shm.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = shm.cat_cd) cat_name
  from tab_shm shm
  where id = \'#{id}\''),

('CTN_SHM_LEADER_ASSIGN', '컨텐츠 할당 정보', '컨텐츠 할당 정보', '컨텐츠 할당 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
       <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">요청자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select ass_emp_id
   from tab_shm
  where id = \'#{id}\'',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = shm.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = shm.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = shm.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = shm.cat_cd) cat_name
  from tab_shm shm
  where id = \'#{id}\''),

('CTN_SHM_LEADER_CLOSE', '컨텐츠 종료 정보', '컨텐츠 종료 정보', '컨텐츠 종료 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">요청자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select clo_emp_id
   from tab_shm
  where id = \'#{id}\'',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = shm.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = shm.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = shm.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = shm.cat_cd) cat_name
  from tab_shm shm
  where id = \'#{id}\''),

('CTN_SHM_LEADER_CANCEL', '컨텐츠 취소 정보', '컨텐츠 취소 정보', '컨텐츠 취소 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">요청자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select clo_emp_id
   from tab_shm
  where id = \'#{id}\'',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = shm.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = shm.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = shm.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = shm.cat_cd) cat_name
  from tab_shm shm
  where id = \'#{id}\''),



('CTN_SHM_MA_SAVE', '컨텐츠 저장 정보', '컨텐츠 저장 정보', '컨텐츠 저장 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">등록일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{create_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">등록자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{create_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select ass_emp_id
   from tab_shm
  where id = \'#{id}\'',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = shm.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = shm.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = shm.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = shm.cat_cd) cat_name
  from tab_shm shm
  where id = \'#{id}\''),

('CTN_SHM_MA_ASSIGN', '컨텐츠 할당 정보', '컨텐츠 할당 정보', '컨텐츠 할당 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">등록일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{create_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">등록자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{create_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select ass_emp_id
   from tab_shm
  where id = \'#{id}\'',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = shm.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = shm.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = shm.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = shm.cat_cd) cat_name
  from tab_shm shm
  where id = \'#{id}\''),

('CTN_SHM_MA_CLOSE', '컨텐츠 종료 정보', '컨텐츠 종료 정보', '컨텐츠 종료 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">요청자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select clo_emp_id
   from tab_shm
  where id = \'#{id}\'',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = shm.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = shm.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = shm.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = shm.cat_cd) cat_name
  from tab_shm shm
  where id = \'#{id}\''),

('CTN_SHM_MA_CANCEL', '컨텐츠 취소 정보', '컨텐츠 취소 정보', '컨텐츠 취소 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">요청자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select clo_emp_id
   from tab_shm
  where id = \'#{id}\'',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = shm.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = shm.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = shm.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = shm.cat_cd) cat_name
  from tab_shm shm
  where id = \'#{id}\''),

('CTN_WOR_T_SAVE', '컨텐츠 저장 정보', '컨텐츠 저장 정보', '컨텐츠 저장 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">요청자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">담당자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{ass_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">예정 시작시간</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{plan_start_date}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">예정 종료시간</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{plan_finish_date}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select ass_emp_id
   from tab_workorder
  where id = \'#{id}\'',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = wor.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = wor.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = wor.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = wor.cat_cd) cat_name,
       plan_start_date,
       plan_finish_date,
       act_start_date,
       act_finish_date
  from tab_workorder wor
  where id = \'#{id}\''),

('CTN_WOR_T_REG', '컨텐츠 등록 정보', '컨텐츠 등록 정보', '컨텐츠 등록 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">요청자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">예정 시작시간</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{plan_start_date}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">예정 종료시간</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{plan_finish_date}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select ass_emp_id
   from tab_workorder
  where id = \'#{id}\'',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = wor.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = wor.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = wor.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = wor.cat_cd) cat_name,
       plan_start_date,
       plan_finish_date,
       act_start_date,
       act_finish_date
  from tab_workorder wor
  where id = \'#{id}\''),

('CTN_WOR_T_ASSIGN', '컨텐츠 할당 정보', '컨텐츠 할당 정보', '컨텐츠 할당 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">요청자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">예정 시작시간</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{plan_start_date}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">예정 종료시간</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{plan_finish_date}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select ass_emp_id
   from tab_workorder
  where id = \'#{id}\'
  union
  select ass_emp_id
    from tab_shm
   where id = (select src_id from tab_workorder where id = \'#{id}\')
  union
  select req_emp_id
    from tab_shm
   where id = (select src_id from tab_workorder where id = \'#{id}\')',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = wor.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = wor.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = wor.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = wor.cat_cd) cat_name,
       plan_start_date,
       plan_finish_date,
       act_start_date,
       act_finish_date
  from tab_workorder wor
  where id = \'#{id}\''),

('CTN_WOR_T_CLOSE', '컨텐츠 종료 정보', '컨텐츠 종료 정보', '컨텐츠 종료 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">요청자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">예정 시작시간</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{plan_start_date}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">예정 종료시간</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{plan_finish_date}</td>
                    </tr>
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">실제 시작시간</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{act_start_date}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">실제 종료시간</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{act_finish_date}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select clo_emp_id
   from tab_workorder
  where id = \'#{id}\'
  union
  select ass_emp_id
    from tab_shm
   where id = (select src_id from tab_workorder where id = \'#{id}\')
  union
  select req_emp_id
    from tab_shm
   where id = (select src_id from tab_workorder where id = \'#{id}\')',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = wor.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = wor.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = wor.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = wor.cat_cd) cat_name,
       plan_start_date,
       plan_finish_date,
       act_start_date,
       act_finish_date
  from tab_workorder wor
  where id = \'#{id}\''),

('CTN_WOR_T_CANCEL', '컨텐츠 취소 정보', '컨텐츠 취소 정보', '컨텐츠 취소 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">요청자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select clo_emp_id
   from tab_workorder
  where id = \'#{id}\'
  union
  select ass_emp_id
    from tab_shm
   where id = (select src_id from tab_workorder where id = \'#{id}\')
  union
  select req_emp_id
    from tab_shm
   where id = (select src_id from tab_workorder where id = \'#{id}\')',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = wor.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = wor.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = wor.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = wor.cat_cd) cat_name,
       plan_start_date,
       plan_finish_date,
       act_start_date,
       act_finish_date
  from tab_workorder wor
  where id = \'#{id}\''),
  
('CTN_WOR_I_SAVE', '컨텐츠 저장 정보', '컨텐츠 저장 정보', '컨텐츠 저장 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">요청자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select ass_emp_id
   from tab_workorder
  where id = \'#{id}\'',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = wor.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = wor.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = wor.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = wor.cat_cd) cat_name,
       plan_start_date,
       plan_finish_date,
       act_start_date,
       act_finish_date
  from tab_workorder wor
  where id = \'#{id}\''),

('CTN_WOR_I_REG', '컨텐츠 등록 정보', '컨텐츠 등록 정보', '컨텐츠 등록 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">요청자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select ass_emp_id
   from tab_workorder
  where id = \'#{id}\'',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = wor.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = wor.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = wor.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = wor.cat_cd) cat_name,
       plan_start_date,
       plan_finish_date,
       act_start_date,
       act_finish_date
  from tab_workorder wor
  where id = \'#{id}\''),

('CTN_WOR_I_ASSIGN', '컨텐츠 할당 정보', '컨텐츠 할당 정보', '컨텐츠 할당 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">요청자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select ass_emp_id
   from tab_workorder
  where id = \'#{id}\'',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = wor.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = wor.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = wor.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = wor.cat_cd) cat_name,
       plan_start_date,
       plan_finish_date,
       act_start_date,
       act_finish_date
  from tab_workorder wor
  where id = \'#{id}\''),

('CTN_WOR_I_CLOSE', '컨텐츠 종료 정보', '컨텐츠 종료 정보', '컨텐츠 종료 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">요청자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select clo_emp_id
   from tab_workorder
  where id = \'#{id}\'',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = wor.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = wor.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = wor.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = wor.cat_cd) cat_name,
       plan_start_date,
       plan_finish_date,
       act_start_date,
       act_finish_date
  from tab_workorder wor
  where id = \'#{id}\''),

('CTN_WOR_I_CANCEL', '컨텐츠 취소 정보', '컨텐츠 취소 정보', '컨텐츠 취소 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">요청자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select clo_emp_id
   from tab_workorder
  where id = \'#{id}\'',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = wor.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = wor.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = wor.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = wor.cat_cd) cat_name,
       plan_start_date,
       plan_finish_date,
       act_start_date,
       act_finish_date
  from tab_workorder wor
  where id = \'#{id}\''),
  
  ('CTN_WOR_M_SAVE', '컨텐츠 저장 정보', '컨텐츠 저장 정보', '컨텐츠 저장 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">요청자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select ass_emp_id
   from tab_workorder
  where id = \'#{id}\'',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = wor.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = wor.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = wor.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = wor.cat_cd) cat_name,
       plan_start_date,
       plan_finish_date,
       act_start_date,
       act_finish_date
  from tab_workorder wor
  where id = \'#{id}\''),

('CTN_WOR_M_REG', '컨텐츠 등록 정보', '컨텐츠 등록 정보', '컨텐츠 등록 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">요청자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select ass_emp_id
   from tab_workorder
  where id = \'#{id}\'',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = wor.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = wor.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = wor.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = wor.cat_cd) cat_name,
       plan_start_date,
       plan_finish_date,
       act_start_date,
       act_finish_date
  from tab_workorder wor
  where id = \'#{id}\''),

('CTN_WOR_M_ASSIGN', '컨텐츠 할당 정보', '컨텐츠 할당 정보', '컨텐츠 할당 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">요청자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select clo_emp_id
   from tab_workorder
  where id = \'#{id}\'
  union
  select ass_emp_id
    from tab_shm
   where id = (select src_id from tab_workorder where id = \'#{id}\')
  union
  select req_emp_id
    from tab_shm
   where id = (select src_id from tab_workorder where id = \'#{id}\')',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = wor.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = wor.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = wor.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = wor.cat_cd) cat_name,
       plan_start_date,
       plan_finish_date,
       act_start_date,
       act_finish_date
  from tab_workorder wor
  where id = \'#{id}\''),

('CTN_WOR_M_CLOSE', '컨텐츠 종료 정보', '컨텐츠 종료 정보', '컨텐츠 종료 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">요청자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select clo_emp_id
   from tab_workorder
  where id = \'#{id}\'',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = wor.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = wor.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = wor.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = wor.cat_cd) cat_name,
       plan_start_date,
       plan_finish_date,
       act_start_date,
       act_finish_date
  from tab_workorder wor
  where id = \'#{id}\''),

('CTN_WOR_M_CANCEL', '컨텐츠 취소 정보', '컨텐츠 취소 정보', '컨텐츠 취소 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">요청자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select clo_emp_id
   from tab_workorder
  where id = \'#{id}\'
  union
  select ass_emp_id
    from tab_shm
   where id = (select src_id from tab_workorder where id = \'#{id}\')
  union
  select req_emp_id
    from tab_shm
   where id = (select src_id from tab_workorder where id = \'#{id}\')',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = wor.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = wor.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = wor.req_emp_id) req_emp_name,
       content,
       cat_cd,
       (select name from tab_code where id = wor.cat_cd) cat_name,
       plan_start_date,
       plan_finish_date,
       act_start_date,
       act_finish_date
  from tab_workorder wor
  where id = \'#{id}\''),

('CTN_REQ_CLOSE', '컨텐츠 종료 정보', '컨텐츠 종료 정보', '컨텐츠 종료 정보', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 '[Rockpaper] #{name}(#{id})이 #{tas_name}되었습니다.',
 '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rockpaper Mail</title>
</head>
<body style="font-size: 13px; font-family: 돋움; color: #777777;">
    <table>
        <tr>
            <td>
                <a href="#{url}/common/form?key=#{id}&entId=#{ent_id}">
                    상세보기
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 0; background-color: #E3E3E3;">
                    <tr>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">접수번호</td>
                        <td width="26%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{id}</td>
                        <td width="14%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7;">단계</td>
                        <td width="46%" style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;">#{tas_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">등록일시</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_date}</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #f7f7f7;">등록자</td>
                        <td style="text-align: left; padding-left:8px; font-weight: bold; background-color: #ffffff;">#{req_emp_name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">제목</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{name}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #f7f7f7; height: 28px;">요청내용 답변</td>
                        <td style="text-align: left; padding-left: 8px; font-weight: bold; background-color: #ffffff;" colspan="3">#{answer_content}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>',
 'select create_emp_id
   from tab_req
  where id = \'#{id}\'',
 'select id,
       name,
       create_date,
       create_emp_id,
       (select name from tab_employee where id = req.create_emp_id) create_emp_name,
       ent_id,
       tas_id,
       (select name from tab_task where id = req.tas_id) tas_name,
       req_date,
       req_emp_id,
       (select name from tab_employee where id = req.req_emp_id) req_emp_name,
       request_content,
       answer_content
  from tab_req req
  where id = \'#{id}\'');

