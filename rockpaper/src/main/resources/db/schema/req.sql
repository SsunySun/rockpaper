CREATE TABLE IF NOT EXISTS RSHM.TAB_REQ (
    -- SYSTEM COLUMN
    id VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    label VARCHAR(255),
    descr LONGTEXT,
    used BIT,
    order_by INTEGER,
    create_date DATETIME NOT NULL,
    create_emp_id VARCHAR(255) NOT NULL,
    update_date DATETIME,
    update_emp_id VARCHAR(255),

    -- WORKFLOW SYSTEM COLUMN
    ent_id VARCHAR(255) NOT NULL,        -- 엔티티 ID
    tas_id VARCHAR(255),        -- 단계
    req_date DATE,     -- 요청일
    req_emp_id VARCHAR(255),        -- 요청자
    clo_date DATETIME,  -- 종료일
    clo_emp_id VARCHAR(255),        -- 종료자
    ass_emp_id VARCHAR(255),        -- 현재 담당자
    src_id VARCHAR(255),        -- 상위 ID
    src_ent_id VARCHAR(255),    -- 상위 Entity ID
    request_content LONGTEXT,  -- 요청내용
    answer_content LONGTEXT,  -- 요청내용 답변

    PRIMARY KEY (id)
) ENGINE=InnoDB;
