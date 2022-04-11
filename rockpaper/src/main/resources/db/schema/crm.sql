CREATE TABLE IF NOT EXISTS RSHM.TAB_CRM (
    -- SYSTEM COLUMN
    id VARCHAR(255) NOT NULL,       -- 영업기회코드
    name VARCHAR(255) NOT NULL,     -- 영업기회 이름
    label VARCHAR(255),
    descr LONGTEXT,
    used BIT,
    order_by INTEGER,
    create_date DATETIME NOT NULL,
    create_emp_id VARCHAR(255) NOT NULL,
    update_date DATETIME,
    update_emp_id VARCHAR(255),

    -- CRM 정보
    opp_sales VARCHAR(255),             -- 영업 담당자
    opp_account	VARCHAR(255),           -- 거래처 이름
    opp_customer VARCHAR(255),          -- 고객사
    opp_enduser_customer VARCHAR(255),  -- enduser 고객명
    opp_enduser_project VARCHAR(255),   -- enduser 프로젝트명
    opp_enduser_charge VARCHAR(255),    -- enduser 담당자
    opp_enduser_phone VARCHAR(255),     -- enduser 연락처
    opp_enduser_email VARCHAR(255),     -- enduser 이메일
    opp_enduser_address VARCHAR(255),   -- enduser 주소
    opp_service_start DATE,             -- 서비스 시작일
    opp_service_end DATE,               -- 서비스 종료일

    PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS RSHM.TAB_CRM_PROD (
    -- SYSTEM COLUMN
    id VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,     -- quoted line items (제품 이름)
    label VARCHAR(255),
    descr LONGTEXT,
    used BIT,
    order_by INTEGER,
    create_date DATETIME NOT NULL,
    create_emp_id VARCHAR(255) NOT NULL,
    update_date DATETIME,
    update_emp_id VARCHAR(255),

    -- RELATION TABLE COLUMN
    ent_id VARCHAR(255) NOT NULL,   -- 엔티티 ID
    tas_id VARCHAR(255),            -- 단계
    req_date DATE,                  -- 요청일
    req_emp_id VARCHAR(255),        -- 요청자
    clo_date DATE,                  -- 종료일
    clo_emp_id VARCHAR(255),        -- 종료자
    ass_emp_id VARCHAR(255),        -- 현재 담당자
    src_id VARCHAR(255),            -- 상위 ID(영업기회코드)
    src_ent_id VARCHAR(255),        -- 상위 Entity ID
    content LONGTEXT,               -- 설명

    -- CRM 제품 정보
    product_quantity DECIMAL(12,2), -- 수량
    product_description	LONGTEXT,   -- 상세설명
    product_type VARCHAR(255),      -- Type (제품 타입)
    product_category VARCHAR(255),   -- Category Name (제품 카테고리)

    PRIMARY KEY (id)
) ENGINE=InnoDB;
