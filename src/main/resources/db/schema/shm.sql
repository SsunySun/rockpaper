CREATE TABLE IF NOT EXISTS RSHM.TAB_SHM (
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
    content LONGTEXT,  -- 설명

    -- SHM 공통 컬럼
    type_cd VARCHAR(255),          -- 등록 유형(Code Type: SHM_TYPE, 팀장/내부업무/유지보수)
    cat_cd VARCHAR(255),        -- 지원 유형(Code Type: SHM_CAT_CD, 방문지원/원격지원/점검지원/파견지원...)
    crm_id VARCHAR(255),        -- CRM ID(영업기회 코드)
    product_cd VARCHAR(255),  -- 제품 유형(Code Type: SHM_PRODUCT, RHEL/OpenStack/SteelEye...)
    customer_cd VARCHAR(255),  -- 고객 분류(Code Type: SHM_CUSTOMER, 통신/제조/정보통신...)
    customer VARCHAR(255),  -- 고객명

    support_city VARCHAR(255),  -- 지원 도시
    support_location VARCHAR(255),  -- 지원 장소
    customer_contact VARCHAR(255),  -- 고객 담당자
    workday_cd VARCHAR(255),  -- 근무일 유형

    -- 정기점검
    ma_cycle_cd VARCHAR(255),  -- (정기점검) 주기(코드값 - 월간/분기/반기/년간)
    ma_work_date DATE,  -- (정기점검) 작업일
    ma_charge_emp_id VARCHAR(255),     -- (정기점검) 업무 담당자
    PRIMARY KEY (id)
) ENGINE=InnoDB;
