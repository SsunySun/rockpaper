/* Code - 기술지원 등록 유형, 기술지원 지원 유형 */
INSERT INTO RSHM.TAB_CODE_TYPE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 HIERARCHY )
VALUES
('SHM_TYPE', '기술지원 등록 유형', '기술지원 등록 유형', '기술지원 등록 유형', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 false),
('SHM_CATALOG', '기술지원 유형', '기술지원 유형', '기술지원 유형', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 false),
('SHM_PRODUCT', '제품 유형', '제품 유형', '제품 유형', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 true),
('SHM_CUSTOMER_TYPE', '고객 분류', '고객 분류', '고객 분류', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 false),
('SHM_MA_CYCLE', '정기점검 주기', '정기점검 주기', '정기점검 주기', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 false),
 ('WOR_WORKDAY', '근무일 유형', '근무일 유형', '근무일 유형', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 false);

INSERT INTO RSHM.TAB_CODE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 VAL, CTY_ID, SID, PID, LEVEL )
VALUES
('SHM_TYPE_LEADER', '기술지원', '기술지원', '기술지원', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_TYPE_LEADER', 'SHM_TYPE', null, null, 1), 	/* 기술지원 등록 유형 - 팀장 */
('SHM_TYPE_INTERNAL', '내부업무', '내부업무', '내부업무', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_TYPE_INTERNAL', 'SHM_TYPE', null, null, 1), 	/* 기술지원 등록 유형 - 내부업무 */
('SHM_TYPE_MAINTENANCE', '정기점검', '정기점검', '정기점검', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM_TYPE_MAINTENANCE', 'SHM_TYPE', null, null, 1), 	/* 기술지원 등록 유형 - 정기점검 */
('SHM_TYPE_VACATION', '휴가', '휴가', '휴가', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'SHM_TYPE_VACATION', 'SHM_TYPE', null, null, 1), 	/* 기술지원 등록 유형 - 휴가 */

('SHM_CATALOG_001', '방문지원', '방문지원', '방문지원', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_CATALOG_001', 'SHM_CATALOG', null, null, 1), 	/* 기술지원 유형 - 방문지원 */
('SHM_CATALOG_002', '원격지원', '원격지원', '원격지원', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_CATALOG_002', 'SHM_CATALOG', null, null, 1), 	/* 기술지원 유형 - 원격지원 */
('SHM_CATALOG_003', '점검지원', '점검지원', '점검지원', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM_CATALOG_003', 'SHM_CATALOG', null, null, 1), 	/* 기술지원 유형 - 점검지원 */
('SHM_CATALOG_004', 'Presale', 'Presale', 'Presale', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'SHM_CATALOG_004', 'SHM_CATALOG', null, null, 1), 	/* 기술지원 유형 - Presale */
('SHM_CATALOG_005', '내부교육', '내부교육', '내부교육', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'SHM_CATALOG_005', 'SHM_CATALOG', null, null, 1), 	/* 기술지원 유형 - 내부교육 */
('SHM_CATALOG_006', '외부교육', '외부교육', '외부교육', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'SHM_CATALOG_006', 'SHM_CATALOG', null, null, 1), 	/* 기술지원 유형 - 외부교육 */
('SHM_CATALOG_007', '교육지원', '교육지원', '교육지원', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'SHM_CATALOG_007', 'SHM_CATALOG', null, null, 1), 	/* 기술지원 유형 - 교육지원 */
('SHM_CATALOG_008', '역량강화', '역량강화', '역량강화', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'SHM_CATALOG_008', 'SHM_CATALOG', null, null, 1), 	/* 기술지원 유형 - 역량강화 */
('SHM_CATALOG_009', '지원대기', '지원대기', '지원대기', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'SHM_CATALOG_009', 'SHM_CATALOG', null, null, 1), 	/* 기술지원 유형 - 지원대기 */
('SHM_CATALOG_010', '사내전산관리', '사내전산관리', '사내전산관리', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'SHM_CATALOG_010', 'SHM_CATALOG', null, null, 1), 	/* 기술지원 유형 - 사내전산관리 */
('SHM_CATALOG_011', '내부업무', '내부업무', '내부업무', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'SHM_CATALOG_011', 'SHM_CATALOG', null, null, 1), 	/* 기술지원 유형 - 내부업무 */
 
/* 제품유형 */
/* PS본부 */
('SHM_PRODUCT_PS', 'PS본부', 'PS본부', 'PS본부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_PS', 'SHM_PRODUCT', null, null, 1), 	/* 제품 유형 - PS본부 */
/* PS본부 - WEB/WAS */
('SHM_PRODUCT_PS_001', 'WEB/WAS', 'WEB/WAS', 'WEB/WAS', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'SHM_PRODUCT_PS_001', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS', 2), 	/* 제품 유형 - PS본부 - WEB/WAS */
('SHM_PRODUCT_PS_001_001', 'Apache/Tomcat', 'Apache/Tomcat', 'Apache/Tomcat', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_PS_001_001', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS_001', 3), 	/* 제품 유형 - PS본부 - WEB/WAS - Apache/Tomcat */
('SHM_PRODUCT_PS_001_002', 'Apache/Wildfly', 'Apache/Wildfly', 'Apache/Wildfly', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_PRODUCT_PS_001_002', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS_001', 3), 	/* 제품 유형 - PS본부 - WEB/WAS - Apache/Wildfly */
('SHM_PRODUCT_PS_001_003', 'Apache/Jboss EAP', 'Apache/Jboss EAP', 'Apache/Jboss EAP', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM_PRODUCT_PS_001_003', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS_001', 3), 	/* 제품 유형 - PS본부 - WEB/WAS - Apache/Jboss EAP */
('SHM_PRODUCT_PS_001_004', 'Nginx/Tomcat', 'Nginx/Tomcat', 'Nginx/Tomcat', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'SHM_PRODUCT_PS_001_004', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS_001', 3), 	/* 제품 유형 - PS본부 - WEB/WAS - Nginx/Tomcat */
('SHM_PRODUCT_PS_001_005', 'Nginx/Wildfly', 'Nginx/Wildfly', 'Nginx/Wildfly', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'SHM_PRODUCT_PS_001_005', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS_001', 3), 	/* 제품 유형 - PS본부 - WEB/WAS - Nginx/Wildfly */
('SHM_PRODUCT_PS_001_006', 'Nginx/Jboss EAP', 'Nginx/Jboss EAP', 'Nginx/Jboss EAP', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'SHM_PRODUCT_PS_001_006', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS_001', 3), 	/* 제품 유형 - PS본부 - WEB/WAS - Nginx/Jboss EAP */

/* PS본부 - WAS */
('SHM_PRODUCT_PS_002', 'WAS', 'WAS', 'WAS', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'SHM_PRODUCT_PS_002', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS', 2), 	/* 제품 유형 - PS본부 - WAS */
('SHM_PRODUCT_PS_002_001', 'Jboss EAP', 'Jboss EAP', 'Jboss EAP', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_PS_002_001', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS_002', 3), 	/* 제품 유형 - PS본부 - WAS - Jboss EAP */
('SHM_PRODUCT_PS_002_002', 'Wildfly', 'Wildfly', 'Wildfly', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_PRODUCT_PS_002_002', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS_002', 3), 	/* 제품 유형 - PS본부 - WAS - Wildfly */
('SHM_PRODUCT_PS_002_003', 'Tomcat', 'Tomcat', 'Tomcat', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM_PRODUCT_PS_002_003', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS_002', 3), 	/* 제품 유형 - PS본부 - WAS - Tomcat */

/* PS본부 - WEB */
('SHM_PRODUCT_PS_003', 'WEB', 'WEB', 'WEB', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'SHM_PRODUCT_PS_003', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS', 2), 	/* 제품 유형 - PS본부 - WEB */
('SHM_PRODUCT_PS_003_001', 'Apache', 'Apache', 'Apache', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_PS_003_001', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS_003', 3), 	/* 제품 유형 - PS본부 - WEB - Apache */
('SHM_PRODUCT_PS_003_002', 'JWS', 'JWS', 'JWS', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_PRODUCT_PS_003_002', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS_003', 3), 	/* 제품 유형 - PS본부 - WEB - JWS */
('SHM_PRODUCT_PS_003_003', 'Nginx', 'Nginx', 'Nginx', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM_PRODUCT_PS_003_003', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS_003', 3), 	/* 제품 유형 - PS본부 - WEB - Nginx */

/* PS본부 - Application Service */
('SHM_PRODUCT_PS_004', 'Application Service', 'Application Service', 'Application Service', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 14, 
 'SHM_PRODUCT_PS_004', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS', 2), 	/* 제품 유형 - PS본부 - Application Service */
('SHM_PRODUCT_PS_004_001', '3Scale', '3Scale', '3Scale', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_PS_004_001', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS_004', 3), 	/* 제품 유형 - PS본부 - Application Service - 3Scale */
('SHM_PRODUCT_PS_004_002', 'FUSE', 'FUSE', 'FUSE', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_PRODUCT_PS_004_002', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS_004', 3), 	/* 제품 유형 - PS본부 - Application Service - FUSE */
('SHM_PRODUCT_PS_004_003', 'AMQ', 'AMQ', 'AMQ', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM_PRODUCT_PS_004_003', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS_004', 3), 	/* 제품 유형 - PS본부 - Application Service - AMQ */
('SHM_PRODUCT_PS_004_004', 'JDG', 'JDG', 'JDG', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'SHM_PRODUCT_PS_004_004', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS_004', 3), 	/* 제품 유형 - PS본부 - Application Service - JDG */

/* PS본부 - Automation */
('SHM_PRODUCT_PS_005', 'Automation', 'Automation', 'Automation', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 15, 
 'SHM_PRODUCT_PS_005', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS', 2), 	/* 제품 유형 - PS본부 - Automation */
('SHM_PRODUCT_PS_005_001', 'Ansible Tower', 'Ansible Tower', 'Ansible Tower', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_PS_005_001', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS_005', 3), 	/* 제품 유형 - PS본부 - Automation - Ansible Tower */

/* PS본부 - Platform */
('SHM_PRODUCT_PS_006', 'Platform', 'Platform', 'Platform', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 16, 
 'SHM_PRODUCT_PS_006', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS', 2), 	/* 제품 유형 - PS본부 - Platform */
('SHM_PRODUCT_PS_006_001', 'OpenShift', 'OpenShift', 'OpenShift', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_PS_006_001', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS_006', 3), 	/* 제품 유형 - PS본부 - Platform - OpenShift */
('SHM_PRODUCT_PS_006_002', 'OKD', 'OKD', 'OKD', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_PRODUCT_PS_006_002', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS_006', 3), 	/* 제품 유형 - PS본부 - Platform - OKD */
('SHM_PRODUCT_PS_006_003', 'Kubernetes', 'Kubernetes', 'Kubernetes', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM_PRODUCT_PS_006_003', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS_006', 3), 	/* 제품 유형 - PS본부 - Platform - Kubernetes */

/* PS본부 - APM */
('SHM_PRODUCT_PS_007', 'APM', 'APM', 'APM', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 17, 
 'SHM_PRODUCT_PS_007', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS', 2), 	/* 제품 유형 - PS본부 - APM */
('SHM_PRODUCT_PS_007_001', 'rockPM', 'rockPM', 'rockPM', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_PS_007_001', 'SHM_PRODUCT', 'SHM_PRODUCT_PS', 'SHM_PRODUCT_PS_007', 3), 	/* 제품 유형 - PS본부 - APM - rockPM */


/* IS본부 */
('SHM_PRODUCT_IS', 'IS본부', 'IS본부', 'IS본부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_PRODUCT_IS', 'SHM_PRODUCT', null, null, 1), 	/* 제품 유형 - IS본부 */
/* IS본부 - Linux */
('SHM_PRODUCT_IS_001', 'Linux', 'Linux', 'Linux', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 21, 
 'SHM_PRODUCT_IS_001', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS', 2), 	/* 제품 유형 - IS본부 - Linux */
('SHM_PRODUCT_IS_001_001', 'RHEL', 'RHEL', 'RHEL', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_IS_001_001', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS_001', 3), 	/* 제품 유형 - IS본부 - Linux - RHEL */
('SHM_PRODUCT_IS_001_002', 'CENTOS', 'CENTOS', 'CENTOS', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_PRODUCT_IS_001_002', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS_001', 3), 	/* 제품 유형 - IS본부 - Linux - CENTOS */
('SHM_PRODUCT_IS_001_003', 'OEL', 'OEL', 'OEL', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM_PRODUCT_IS_001_003', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS_001', 3), 	/* 제품 유형 - IS본부 - Linux - OEL */
('SHM_PRODUCT_IS_001_004', 'UBUNTU', 'UBUNTU', 'UBUNTU', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'SHM_PRODUCT_IS_001_004', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS_001', 3), 	/* 제품 유형 - IS본부 - Linux - UBUNTU */

/* IS본부 - Virt */
('SHM_PRODUCT_IS_002', 'Virt', 'Virt', 'Virt', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 22, 
 'SHM_PRODUCT_IS_002', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS', 2), 	/* 제품 유형 - IS본부 - Virt */
('SHM_PRODUCT_IS_002_001', 'KVM', 'KVM', 'KVM', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_IS_002_001', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS_002', 3), 	/* 제품 유형 - IS본부 - Virt - KVM */
('SHM_PRODUCT_IS_002_002', 'RHV', 'RHV', 'RHV', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_PRODUCT_IS_002_002', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS_002', 3), 	/* 제품 유형 - IS본부 - Virt - RHV */

/* IS본부 - Cloud */
('SHM_PRODUCT_IS_003', 'Cloud', 'Cloud', 'Cloud', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 23, 
 'SHM_PRODUCT_IS_003', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS', 2), 	/* 제품 유형 - IS본부 - Cloud */
('SHM_PRODUCT_IS_003_001', 'RHOSP', 'RHOSP', 'RHOSP', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_IS_003_001', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS_003', 3), 	/* 제품 유형 - IS본부 - Cloud - RHOSP */
('SHM_PRODUCT_IS_003_002', 'OSP', 'OSP', 'OSP', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_PRODUCT_IS_003_002', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS_003', 3), 	/* 제품 유형 - IS본부 - Cloud - OSP */
('SHM_PRODUCT_IS_003_003', 'RHCEPH', 'RHCEPH', 'RHCEPH', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM_PRODUCT_IS_003_003', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS_003', 3), 	/* 제품 유형 - IS본부 - Cloud - RHCEPH */
('SHM_PRODUCT_IS_003_004', 'CEPH', 'CEPH', 'CEPH', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'SHM_PRODUCT_IS_003_004', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS_003', 3), 	/* 제품 유형 - IS본부 - Cloud - CEPH */

/* IS본부 - HA */
('SHM_PRODUCT_IS_004', 'HA', 'HA', 'HA', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 24, 
 'SHM_PRODUCT_IS_004', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS', 2), 	/* 제품 유형 - IS본부 - HA */
('SHM_PRODUCT_IS_004_001', 'SIOS/Lifekeeper', 'SIOS/Lifekeeper', 'SIOS/Lifekeeper', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_IS_004_001', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS_004', 3), 	/* 제품 유형 - IS본부 - HA - SIOS/Lifekeeper */
('SHM_PRODUCT_IS_004_002', 'SIOS/Datakeeper', 'SIOS/Datakeeper', 'SIOS/Datakeeper', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_PRODUCT_IS_004_002', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS_004', 3), 	/* 제품 유형 - IS본부 - HA - SIOS/Datakeeper */
('SHM_PRODUCT_IS_004_003', 'RHCS/Pacemaker', 'RHCS/Pacemaker', 'RHCS/Pacemaker', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM_PRODUCT_IS_004_003', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS_004', 3), 	/* 제품 유형 - IS본부 - HA - RHCS/Pacemaker */
('SHM_PRODUCT_IS_004_004', 'RHCS/Rgmanager', 'RHCS/Rgmanager', 'RHCS/Rgmanager', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'SHM_PRODUCT_IS_004_004', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS_004', 3), 	/* 제품 유형 - IS본부 - HA - RHCS/Rgmanager */
('SHM_PRODUCT_IS_004_005', 'RHCS/GFS', 'RHCS/GFS', 'RHCS/GFS', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'SHM_PRODUCT_IS_004_005', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS_004', 3), 	/* 제품 유형 - IS본부 - HA - RHCS/GFS */

/* IS본부 - Logging */
('SHM_PRODUCT_IS_005', 'Logging', 'Logging', 'Logging', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 25, 
 'SHM_PRODUCT_IS_005', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS', 2), 	/* 제품 유형 - IS본부 - Logging */
('SHM_PRODUCT_IS_005_001', 'ELK', 'ELK', 'ELK', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_IS_005_001', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS_005', 3), 	/* 제품 유형 - IS본부 - Logging - ELK */
('SHM_PRODUCT_IS_005_002', 'EFK', 'EFK', 'EFK', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_PRODUCT_IS_005_002', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS_005', 3), 	/* 제품 유형 - IS본부 - Logging - EFK */
('SHM_PRODUCT_IS_005_003', 'RSYSLOG', 'RSYSLOG', 'RSYSLOG', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM_PRODUCT_IS_005_003', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS_005', 3), 	/* 제품 유형 - IS본부 - Logging - RSYSLOG */

/* IS본부 - ETC */
('SHM_PRODUCT_IS_006', 'ETC', 'ETC', 'ETC', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 26, 
 'SHM_PRODUCT_IS_006', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS', 2), 	/* 제품 유형 - IS본부 - ETC */
('SHM_PRODUCT_IS_006_001', 'ETC', 'ETC', 'ETC', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_IS_006_001', 'SHM_PRODUCT', 'SHM_PRODUCT_IS', 'SHM_PRODUCT_IS_006', 3), 	/* 제품 유형 - IS본부 - ETC - ETC */


/* DB기술1본부 */
('SHM_PRODUCT_DB1', 'DB기술1본부', 'DB기술1본부', 'DB기술1본부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM_PRODUCT_DB1', 'SHM_PRODUCT', null, null, 1), 	/* 제품 유형 - DB기술1본부 */
/* DB기술1본부 - NoSQL */
('SHM_PRODUCT_DB1_001', 'NoSQL', 'NoSQL', 'NoSQL', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 31, 
 'SHM_PRODUCT_DB1_001', 'SHM_PRODUCT', 'SHM_PRODUCT_DB1', 'SHM_PRODUCT_DB1', 2), 	/* 제품 유형 - DB기술1본부 - NoSQL */
('SHM_PRODUCT_DB1_001_001', 'MongoDB Community', 'MongoDB Community', 'MongoDB Community', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_DB1_001_001', 'SHM_PRODUCT', 'SHM_PRODUCT_DB1', 'SHM_PRODUCT_DB1_001', 3), 	/* 제품 유형 - DB기술1본부 - NoSQL - MongoDB Community */
('SHM_PRODUCT_DB1_001_002', 'MongoDB Enterprise', 'MongoDB Enterprise', 'MongoDB Enterprise', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_PRODUCT_DB1_001_002', 'SHM_PRODUCT', 'SHM_PRODUCT_DB1', 'SHM_PRODUCT_DB1_001', 3), 	/* 제품 유형 - DB기술1본부 - NoSQL - MongoDB Enterprise */
('SHM_PRODUCT_DB1_001_003', 'Redis', 'Redis', 'Redis', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM_PRODUCT_DB1_001_003', 'SHM_PRODUCT', 'SHM_PRODUCT_DB1', 'SHM_PRODUCT_DB1_001', 3), 	/* 제품 유형 - DB기술1본부 - NoSQL - Redis */

/* DB기술1본부 - RDBMS */
('SHM_PRODUCT_DB1_002', 'RDBMS', 'RDBMS', 'RDBMS', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 32, 
 'SHM_PRODUCT_DB1_002', 'SHM_PRODUCT', 'SHM_PRODUCT_DB1', 'SHM_PRODUCT_DB1', 2), 	/* 제품 유형 - DB기술1본부 - RDBMS */
('SHM_PRODUCT_DB1_002_001', 'SQL Server Standard', 'SQL Server Standard', 'SQL Server Standard', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_DB1_002_001', 'SHM_PRODUCT', 'SHM_PRODUCT_DB1', 'SHM_PRODUCT_DB1_002', 3), 	/* 제품 유형 - DB기술1본부 - RDBMS - SQL Server Standard */
('SHM_PRODUCT_DB1_002_002', 'SQL Server Enterprise', 'SQL Server Enterprise', 'SQL Server Enterprise', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_PRODUCT_DB1_002_002', 'SHM_PRODUCT', 'SHM_PRODUCT_DB1', 'SHM_PRODUCT_DB1_002', 3), 	/* 제품 유형 - DB기술1본부 - RDBMS - SQL Server Enterprise */
('SHM_PRODUCT_DB1_002_003', 'SQL Server on Linux Standard', 'SQL Server on Linux Standard', 'SQL Server on Linux Standard', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM_PRODUCT_DB1_002_003', 'SHM_PRODUCT', 'SHM_PRODUCT_DB1', 'SHM_PRODUCT_DB1_002', 3), 	/* 제품 유형 - DB기술1본부 - RDBMS - SQL Server on Linux Standard */
('SHM_PRODUCT_DB1_002_004', 'SQL Server on Linux Enterprise', 'SQL Server on Linux Enterprise', 'SQL Server on Linux Enterprise', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'SHM_PRODUCT_DB1_002_004', 'SHM_PRODUCT', 'SHM_PRODUCT_DB1', 'SHM_PRODUCT_DB1_002', 3), 	/* 제품 유형 - DB기술1본부 - RDBMS - SQL Server on Linux Enterprise */


/* DB기술1본부 - CRM */
('SHM_PRODUCT_DB1_003', 'CRM', 'CRM', 'CRM', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 33, 
 'SHM_PRODUCT_DB1_003', 'SHM_PRODUCT', 'SHM_PRODUCT_DB1', 'SHM_PRODUCT_DB1', 2), 	/* 제품 유형 - DB기술1본부 - CRM */
('SHM_PRODUCT_DB1_003_001', 'SugarCRM(SaaS)', 'SugarCRM(SaaS)', 'SugarCRM(SaaS)', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_DB1_003_001', 'SHM_PRODUCT', 'SHM_PRODUCT_DB1', 'SHM_PRODUCT_DB1_003', 3), 	/* 제품 유형 - DB기술1본부 - CRM - SugarCRM(SaaS) */
('SHM_PRODUCT_DB1_003_002', 'SugarCRM(On-prem)', 'SugarCRM(On-prem)', 'SugarCRM(On-prem)', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_PRODUCT_DB1_003_002', 'SHM_PRODUCT', 'SHM_PRODUCT_DB1', 'SHM_PRODUCT_DB1_003', 3), 	/* 제품 유형 - DB기술1본부 - CRM - SugarCRM(On-prem) */

/* DB기술1본부 - Azure */
('SHM_PRODUCT_DB1_004', 'Azure', 'Azure', 'Azure', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 34, 
 'SHM_PRODUCT_DB1_004', 'SHM_PRODUCT', 'SHM_PRODUCT_DB1', 'SHM_PRODUCT_DB1', 2), 	/* 제품 유형 - DB기술1본부 - Azure */
('SHM_PRODUCT_DB1_004_001', 'SQL Server(IaaS)', 'SQL Server(IaaS)', 'SQL Server(IaaS)', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_DB1_004_001', 'SHM_PRODUCT', 'SHM_PRODUCT_DB1', 'SHM_PRODUCT_DB1_004', 3), 	/* 제품 유형 - DB기술1본부 - Azure - SQL Server(IaaS) */
('SHM_PRODUCT_DB1_004_002', 'SQL Server(PaaS)', 'SQL Server(PaaS)', 'SQL Server(PaaS)', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_PRODUCT_DB1_004_002', 'SHM_PRODUCT', 'SHM_PRODUCT_DB1', 'SHM_PRODUCT_DB1_004', 3), 	/* 제품 유형 - DB기술1본부 - Azure - SQL Server(PaaS) */


/* DB기술2본부 */
('SHM_PRODUCT_DB2', 'DB기술2본부', 'DB기술2본부', 'DB기술2본부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'SHM_PRODUCT_DB2', 'SHM_PRODUCT', null, null, 1), 	/* 제품 유형 - DB기술2본부 */
/* DB기술2본부 - RDBMS */
('SHM_PRODUCT_DB2_001', 'RDBMS', 'RDBMS', 'RDBMS', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 41, 
 'SHM_PRODUCT_DB2_001', 'SHM_PRODUCT', 'SHM_PRODUCT_DB2', 'SHM_PRODUCT_DB2', 2), 	/* 제품 유형 - DB기술2본부 - RDBMS */
('SHM_PRODUCT_DB2_001_001', 'MySQL Community', 'MySQL Community', 'MySQL Community', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_DB2_001_001', 'SHM_PRODUCT', 'SHM_PRODUCT_DB2', 'SHM_PRODUCT_DB2_001', 3), 	/* 제품 유형 - DB기술2본부 - RDBMS - MySQL Community */
('SHM_PRODUCT_DB2_001_002', 'MySQL Standard', 'MySQL Standard', 'MySQL Standard', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_PRODUCT_DB2_001_002', 'SHM_PRODUCT', 'SHM_PRODUCT_DB2', 'SHM_PRODUCT_DB2_001', 3), 	/* 제품 유형 - DB기술2본부 - RDBMS - MySQL Standard */
('SHM_PRODUCT_DB2_001_003', 'MySQL Enterprise', 'MySQL Enterprise', 'MySQL Enterprise', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM_PRODUCT_DB2_001_003', 'SHM_PRODUCT', 'SHM_PRODUCT_DB2', 'SHM_PRODUCT_DB2_001', 3), 	/* 제품 유형 - DB기술2본부 - RDBMS - MySQL Enterprise */
('SHM_PRODUCT_DB2_001_004', 'MariaDB Community', 'MariaDB Community', 'MariaDB Community', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'SHM_PRODUCT_DB2_001_004', 'SHM_PRODUCT', 'SHM_PRODUCT_DB2', 'SHM_PRODUCT_DB2_001', 3), 	/* 제품 유형 - DB기술2본부 - RDBMS - MariaDB Community */
('SHM_PRODUCT_DB2_001_005', 'MariaDB Enterprise', 'MariaDB Enterprise', 'MariaDB Enterprise', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'SHM_PRODUCT_DB2_001_005', 'SHM_PRODUCT', 'SHM_PRODUCT_DB2', 'SHM_PRODUCT_DB2_001', 3), 	/* 제품 유형 - DB기술2본부 - RDBMS - MariaDB Enterprise */
('SHM_PRODUCT_DB2_001_006', 'MariaDB Xpand', 'MariaDB Xpand', 'MariaDB Xpand', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'SHM_PRODUCT_DB2_001_006', 'SHM_PRODUCT', 'SHM_PRODUCT_DB2', 'SHM_PRODUCT_DB2_001', 3), 	/* 제품 유형 - DB기술2본부 - RDBMS - MariaDB Xpand */
('SHM_PRODUCT_DB2_001_007', 'PostgreSQL', 'PostgreSQL', 'PostgreSQL', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'SHM_PRODUCT_DB2_001_007', 'SHM_PRODUCT', 'SHM_PRODUCT_DB2', 'SHM_PRODUCT_DB2_001', 3), 	/* 제품 유형 - DB기술2본부 - RDBMS - PostgreSQL */
('SHM_PRODUCT_DB2_001_008', 'EDB PAS Community', 'EDB PAS Community', 'EDB PAS Community', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'SHM_PRODUCT_DB2_001_008', 'SHM_PRODUCT', 'SHM_PRODUCT_DB2', 'SHM_PRODUCT_DB2_001', 3), 	/* 제품 유형 - DB기술2본부 - RDBMS - EDB PAS Community */
('SHM_PRODUCT_DB2_001_009', 'EDB PAS Standard', 'EDB PAS Standard', 'EDB PAS Standard', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'SHM_PRODUCT_DB2_001_009', 'SHM_PRODUCT', 'SHM_PRODUCT_DB2', 'SHM_PRODUCT_DB2_001', 3), 	/* 제품 유형 - DB기술2본부 - RDBMS - EDB PAS Standard */
('SHM_PRODUCT_DB2_001_010', 'EDB PAS Enterprise', 'EDB PAS Enterprise ', 'EDB PAS Enterprise ', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'SHM_PRODUCT_DB2_001_010', 'SHM_PRODUCT', 'SHM_PRODUCT_DB2', 'SHM_PRODUCT_DB2_001', 3), 	/* 제품 유형 - DB기술2본부 - RDBMS - EDB PAS Enterprise  */
('SHM_PRODUCT_DB2_001_011', 'FUJITSU Enterprise Postgre', 'FUJITSU Enterprise Postgre', 'FUJITSU Enterprise Postgre', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'SHM_PRODUCT_DB2_001_011', 'SHM_PRODUCT', 'SHM_PRODUCT_DB2', 'SHM_PRODUCT_DB2_001', 3), 	/* 제품 유형 - DB기술2본부 - RDBMS - FUJITSU Enterprise Postgre */

/* DB기술2본부 - Azure */
('SHM_PRODUCT_DB2_002', 'Azure', 'Azure', 'Azure', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 42, 
 'SHM_PRODUCT_DB2_002', 'SHM_PRODUCT', 'SHM_PRODUCT_DB2', 'SHM_PRODUCT_DB2', 2), 	/* 제품 유형 - DB기술2본부 - Azure */
('SHM_PRODUCT_DB2_002_001', 'Azure Database for MySQL', 'Azure Database for MySQL', 'Azure Database for MySQL', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_DB2_002_001', 'SHM_PRODUCT', 'SHM_PRODUCT_DB2', 'SHM_PRODUCT_DB2_002', 3), 	/* 제품 유형 - DB기술2본부 - Azure - Azure Database for MySQL */
('SHM_PRODUCT_DB2_002_002', 'Azure Database for MariaDB', 'Azure Database for MariaDB', 'Azure Database for MariaDB', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_PRODUCT_DB2_002_002', 'SHM_PRODUCT', 'SHM_PRODUCT_DB2', 'SHM_PRODUCT_DB2_002', 3), 	/* 제품 유형 - DB기술2본부 - Azure - Azure Database for MariaDB */
('SHM_PRODUCT_DB2_002_003', 'Azure Database for PostgreSQL', 'Azure Database for PostgreSQL', 'Azure Database for PostgreSQL', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM_PRODUCT_DB2_002_003', 'SHM_PRODUCT', 'SHM_PRODUCT_DB2', 'SHM_PRODUCT_DB2_002', 3), 	/* 제품 유형 - DB기술2본부 - Azure - Azure Database for PostgreSQL */

 /* DB기술2본부 - AWS */
('SHM_PRODUCT_DB2_003', 'AWS', 'AWS', 'AWS', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 43, 
 'SHM_PRODUCT_DB2_003', 'SHM_PRODUCT', 'SHM_PRODUCT_DB2', 'SHM_PRODUCT_DB2', 2), 	/* 제품 유형 - DB기술2본부 - AWS */
('SHM_PRODUCT_DB2_003_001', 'RDS for MySQL', 'RDS for MySQL', 'RDS for MySQL', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_DB2_003_001', 'SHM_PRODUCT', 'SHM_PRODUCT_DB2', 'SHM_PRODUCT_DB2_003', 3), 	/* 제품 유형 - DB기술2본부 - AWS - RDS for MySQL */
('SHM_PRODUCT_DB2_003_002', 'RDS for MariaDB', 'RDS for MariaDB', 'RDS for MariaDB', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_PRODUCT_DB2_003_002', 'SHM_PRODUCT', 'SHM_PRODUCT_DB2', 'SHM_PRODUCT_DB2_003', 3), 	/* 제품 유형 - DB기술2본부 - AWS - RDS for MariaDB */
('SHM_PRODUCT_DB2_003_003', 'RDS for PostgreSQL', 'RDS for PostgreSQL', 'RDS for PostgreSQL', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM_PRODUCT_DB2_003_003', 'SHM_PRODUCT', 'SHM_PRODUCT_DB2', 'SHM_PRODUCT_DB2_003', 3), 	/* 제품 유형 - DB기술2본부 - AWS - RDS for PostgreSQL */
('SHM_PRODUCT_DB2_003_004', 'Aurora', 'Aurora', 'Aurora', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'SHM_PRODUCT_DB2_003_004', 'SHM_PRODUCT', 'SHM_PRODUCT_DB2', 'SHM_PRODUCT_DB2_003', 3), 	/* 제품 유형 - DB기술2본부 - AWS - Aurora */
 

/* 클라우드사업팀 */
('SHM_PRODUCT_CLOUD', '클라우드사업팀', '클라우드사업팀', '클라우드사업팀', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'SHM_PRODUCT_CLOUD', 'SHM_PRODUCT', null, null, 1), 	/* 제품 유형 - 클라우드사업팀 */
/* 클라우드사업팀 - Microsoft Azure */
('SHM_PRODUCT_CLOUD_001', 'Microsoft Azure', 'Microsoft Azure', 'Microsoft Azure', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 51, 
 'SHM_PRODUCT_CLOUD_001', 'SHM_PRODUCT', 'SHM_PRODUCT_CLOUD', 'SHM_PRODUCT_CLOUD', 2), 	/* 제품 유형 - 클라우드사업팀 - Microsoft Azure */
('SHM_PRODUCT_CLOUD_001_001', 'IaaS', 'IaaS', 'IaaS', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_CLOUD_001_001', 'SHM_PRODUCT', 'SHM_PRODUCT_CLOUD', 'SHM_PRODUCT_CLOUD_001', 3), 	/* 제품 유형 - 클라우드사업팀 - Microsoft Azure - IaaS */
('SHM_PRODUCT_CLOUD_001_002', 'PaaS', 'PaaS', 'PaaS', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_PRODUCT_CLOUD_001_002', 'SHM_PRODUCT', 'SHM_PRODUCT_CLOUD', 'SHM_PRODUCT_CLOUD_001', 3), 	/* 제품 유형 - 클라우드사업팀 - Microsoft Azure - PaaS */
('SHM_PRODUCT_CLOUD_001_003', 'AzureStack', 'AzureStack', 'AzureStack', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM_PRODUCT_CLOUD_001_003', 'SHM_PRODUCT', 'SHM_PRODUCT_CLOUD', 'SHM_PRODUCT_CLOUD_001', 3), 	/* 제품 유형 - 클라우드사업팀 - Microsoft Azure - AzureStack */
('SHM_PRODUCT_CLOUD_001_004', 'ETC', 'ETC', 'ETC', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'SHM_PRODUCT_CLOUD_001_004', 'SHM_PRODUCT', 'SHM_PRODUCT_CLOUD', 'SHM_PRODUCT_CLOUD_001', 3), 	/* 제품 유형 - 클라우드사업팀 - Microsoft Azure - ETC */

/* 클라우드사업팀 - Microsoft M365 */
('SHM_PRODUCT_CLOUD_002', 'Microsoft M365', 'Microsoft M365', 'Microsoft M365', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 52, 
 'SHM_PRODUCT_CLOUD_002', 'SHM_PRODUCT', 'SHM_PRODUCT_CLOUD', 'SHM_PRODUCT_CLOUD', 2), 	/* 제품 유형 - 클라우드사업팀 - Microsoft M365 */
('SHM_PRODUCT_CLOUD_002_001', 'Exchange Online', 'Exchange Online', 'Exchange Online', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_CLOUD_002_001', 'SHM_PRODUCT', 'SHM_PRODUCT_CLOUD', 'SHM_PRODUCT_CLOUD_002', 3), 	/* 제품 유형 - 클라우드사업팀 - Microsoft M365 - Exchange Online */
('SHM_PRODUCT_CLOUD_002_002', 'SharePoint Online', 'SharePoint Online', 'SharePoint Online', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_PRODUCT_CLOUD_002_002', 'SHM_PRODUCT', 'SHM_PRODUCT_CLOUD', 'SHM_PRODUCT_CLOUD_002', 3), 	/* 제품 유형 - 클라우드사업팀 - Microsoft M365 - SharePoint Online */
('SHM_PRODUCT_CLOUD_002_003', 'OneDrive', 'OneDrive', 'OneDrive', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM_PRODUCT_CLOUD_002_003', 'SHM_PRODUCT', 'SHM_PRODUCT_CLOUD', 'SHM_PRODUCT_CLOUD_002', 3), 	/* 제품 유형 - 클라우드사업팀 - Microsoft M365 - OneDrive */
('SHM_PRODUCT_CLOUD_002_004', 'Teams', 'Teams', 'Teams', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'SHM_PRODUCT_CLOUD_002_004', 'SHM_PRODUCT', 'SHM_PRODUCT_CLOUD', 'SHM_PRODUCT_CLOUD_002', 3), 	/* 제품 유형 - 클라우드사업팀 - Microsoft M365 - Teams */
('SHM_PRODUCT_CLOUD_002_005', 'ETC', 'ETC', 'ETC', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'SHM_PRODUCT_CLOUD_002_005', 'SHM_PRODUCT', 'SHM_PRODUCT_CLOUD', 'SHM_PRODUCT_CLOUD_002', 3), 	/* 제품 유형 - 클라우드사업팀 - Microsoft M365 - ETC */


/* OSS사업본부 */
('SHM_PRODUCT_OSS', 'OSS사업본부', 'OSS사업본부', 'OSS사업본부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'SHM_PRODUCT_OSS', 'SHM_PRODUCT', null, null, 1), 	/* 제품 유형 - OSS사업본부 */
/* OSS사업본부 - Azure */
('SHM_PRODUCT_OSS_001', 'Azure', 'Azure', 'Azure', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 61, 
 'SHM_PRODUCT_OSS_001', 'SHM_PRODUCT', 'SHM_PRODUCT_OSS', 'SHM_PRODUCT_OSS', 2), 	/* 제품 유형 - OSS사업본부 - Azure */
('SHM_PRODUCT_OSS_001_001', 'Azure', 'Azure', 'Azure', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_OSS_001_001', 'SHM_PRODUCT', 'SHM_PRODUCT_OSS', 'SHM_PRODUCT_OSS_001', 3), 	/* 제품 유형 - OSS사업본부 - Azure - Azure */

/* OSS사업본부 - O365&M365 */
('SHM_PRODUCT_OSS_002', 'O365&M365', 'O365&M365', 'O365&M365', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 62, 
 'SHM_PRODUCT_OSS_002', 'SHM_PRODUCT', 'SHM_PRODUCT_OSS', 'SHM_PRODUCT_OSS', 2), 	/* 제품 유형 - OSS사업본부 - O365&M365 */
('SHM_PRODUCT_OSS_002_001', 'O365', 'O365', 'O365', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_OSS_002_001', 'SHM_PRODUCT', 'SHM_PRODUCT_OSS', 'SHM_PRODUCT_OSS_002', 3), 	/* 제품 유형 - OSS사업본부 - O365&M365 - O365 */
('SHM_PRODUCT_OSS_002_002', 'M365', 'M365', 'M365', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_PRODUCT_OSS_002_002', 'SHM_PRODUCT', 'SHM_PRODUCT_OSS', 'SHM_PRODUCT_OSS_002', 3), 	/* 제품 유형 - OSS사업본부 - O365&M365 - M365 */

 /* OSS사업본부 - OS */
('SHM_PRODUCT_OSS_003', 'OS', 'OS', 'OS', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 63, 
 'SHM_PRODUCT_OSS_003', 'SHM_PRODUCT', 'SHM_PRODUCT_OSS', 'SHM_PRODUCT_OSS', 2), 	/* 제품 유형 - OSS사업본부 - OS */
('SHM_PRODUCT_OSS_003_001', 'Windows Server', 'Windows Server', 'Windows Server', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_OSS_003_001', 'SHM_PRODUCT', 'SHM_PRODUCT_OSS', 'SHM_PRODUCT_OSS_003', 3), 	/* 제품 유형 - OSS사업본부 - OS - Windows Server */

 /* OSS사업본부 - ISV */
('SHM_PRODUCT_OSS_004', 'ISV', 'ISV', 'ISV', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 64, 
 'SHM_PRODUCT_OSS_004', 'SHM_PRODUCT', 'SHM_PRODUCT_OSS', 'SHM_PRODUCT_OSS', 2), 	/* 제품 유형 - OSS사업본부 - ISV */
('SHM_PRODUCT_OSS_004_001', 'ISV', 'ISV', 'ISV', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_OSS_004_001', 'SHM_PRODUCT', 'SHM_PRODUCT_OSS', 'SHM_PRODUCT_OSS_004', 3), 	/* 제품 유형 - OSS사업본부 - ISV - ISV */

 /* OSS사업본부 - Managed Service */
('SHM_PRODUCT_OSS_005', 'Managed Service', 'Managed Service', 'Managed Service', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 65, 
 'SHM_PRODUCT_OSS_005', 'SHM_PRODUCT', 'SHM_PRODUCT_OSS', 'SHM_PRODUCT_OSS', 2), 	/* 제품 유형 - OSS사업본부 - Managed Service */
('SHM_PRODUCT_OSS_005_001', 'Managed Service', 'Managed Service', 'Managed Service', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_PRODUCT_OSS_005_001', 'SHM_PRODUCT', 'SHM_PRODUCT_OSS', 'SHM_PRODUCT_OSS_005', 3), 	/* 제품 유형 - OSS사업본부 - Managed Service - Managed Service */



('SHM_CUSTOMER_TYPE_001', '통신', '통신', '통신', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_CUSTOMER_TYPE_001', 'SHM_CUSTOMER_TYPE', null, null, 1), 	/* 고객 분류 - 통신 */
('SHM_CUSTOMER_TYPE_002', '제조', '제조', '제조', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_CUSTOMER_TYPE_002', 'SHM_CUSTOMER_TYPE', null, null, 1), 	/* 고객 분류 - 제조 */
('SHM_CUSTOMER_TYPE_003', '정보통신', '정보통신', '정보통신', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM_CUSTOMER_TYPE_003', 'SHM_CUSTOMER_TYPE', null, null, 1), 	/* 고객 분류 - 정보통신 */
('SHM_CUSTOMER_TYPE_004', '유통', '유통', '유통', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'SHM_CUSTOMER_TYPE_004', 'SHM_CUSTOMER_TYPE', null, null, 1), 	/* 고객 분류 - 유통 */
('SHM_CUSTOMER_TYPE_005', '방송', '방송', '방송', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'SHM_CUSTOMER_TYPE_005', 'SHM_CUSTOMER_TYPE', null, null, 1), 	/* 고객 분류 - 방송 */
('SHM_CUSTOMER_TYPE_006', '공공', '공공', '공공', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'SHM_CUSTOMER_TYPE_006', 'SHM_CUSTOMER_TYPE', null, null, 1), 	/* 고객 분류 - 공공 */
('SHM_CUSTOMER_TYPE_007', '금융', '금융', '금융', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'SHM_CUSTOMER_TYPE_007', 'SHM_CUSTOMER_TYPE', null, null, 1), 	/* 고객 분류 - 금융 */
('SHM_CUSTOMER_TYPE_008', '운송', '운송', '운송', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'SHM_CUSTOMER_TYPE_008', 'SHM_CUSTOMER_TYPE', null, null, 1), 	/* 고객 분류 - 운송 */
('SHM_CUSTOMER_TYPE_009', '기타', '기타', '기타', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'SHM_CUSTOMER_TYPE_009', 'SHM_CUSTOMER_TYPE', null, null, 1), 	/* 고객 분류 - 기타 */

('SHM_MA_CYCLE_001', '월간', '월간', '월간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM_MA_CYCLE_001', 'SHM_MA_CYCLE', null, null, 1), 	/* 정기점검 주기 - 월간 */
('SHM_MA_CYCLE_002', '분기', '분기', '분기', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM_MA_CYCLE_002', 'SHM_MA_CYCLE', null, null, 1), 	/* 정기점검 주기 - 분기 */
('SHM_MA_CYCLE_003', '반기', '반기', '반기', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'SHM_MA_CYCLE_003', 'SHM_MA_CYCLE', null, null, 1), 	/* 정기점검 주기 - 반기 */
('SHM_MA_CYCLE_004', '년간', '년간', '년간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'SHM_MA_CYCLE_004', 'SHM_MA_CYCLE', null, null, 1), 	/* 정기점검 주기 - 년간 */
('SHM_MA_CYCLE_005', '격월', '격월', '격월', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM_MA_CYCLE_005', 'SHM_MA_CYCLE', null, null, 1), 	/* 정기점검 주기 - 격월 */


('WOR_WORKDAY_001', '평일', '평일', '평일', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'WOR_WORKDAY_001', 'WOR_WORKDAY', null, null, 1), 	/* 근무일 유형 - 평일 */
('WOR_WORKDAY_002', '휴일(대체휴무 적용)', '휴일(대체휴무 적용)', '휴일(대체휴무 적용)', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'WOR_WORKDAY_002', 'WOR_WORKDAY', null, null, 1), 	/* 근무일 유형 - 휴일(대체휴무 적용) */
('WOR_WORKDAY_003', '휴일(대체휴무 미적용)', '휴일(대체휴무 미적용)', '휴일(대체휴무 미적용)', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'WOR_WORKDAY_003', 'WOR_WORKDAY', null, null, 1); 	/* 근무일 유형 - 휴일(대체휴무 미적용) */


/* Entity */
INSERT INTO RSHM.TAB_ENTITY
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 PREFIX, TYPE_CD )
VALUES
('SHM', '기술지원', '기술지원', '기술지원', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'ENT_TYPE_WORKFLOW');	/* 기술지원 */

/* Table */
INSERT INTO RSHM.TAB_TABLE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TYPE_CD )
VALUES
('TAB_SHM', '기술지원', '기술지원', '기술지원', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'TAB_TYPE_WORKFLOW');	/* 기술지원 */

/* Table Field */
INSERT INTO RSHM.TAB_TABLE_FIELD
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TAB_ID, TFD_ID, TYPE_CD, REF_ENT_ID, REF_CTY_ID, PRODUCT)
VALUES
('TAB_SHM/ID', 'ID', 'ID', 'ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* ID */
('TAB_SHM/NAME', 'NAME', '이름', '이름', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 이름 */
('TAB_SHM/LABEL', 'LABEL', '라벨', '라벨', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 라벨 */
('TAB_SHM/DESCR', 'DESCR', '설명', '설명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 설명 */
('TAB_SHM/USED', 'USED', '사용 여부', '사용 여부', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_BOOLEAN', 'FLT_TYPE_BOOLEAN_RADIO', null, null, true),	/* 사용 여부 */
('TAB_SHM/ORDER_BY', 'ORDER_BY', '순서', '순서', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 6, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_NUMBER', 'FLT_TYPE_NUMBER_DEF', null, null, true),	/* 순서 */
('TAB_SHM/CREATE_DATE', 'CREATE_DATE', '등록시간', '등록시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 7, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 등록시간 */
('TAB_SHM/CREATE_EMP_ID', 'CREATE_EMP_ID', '등록자', '등록자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 8, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 등록자 */
('TAB_SHM/UPDATE_DATE', 'UPDATE_DATE', '수정시간', '수정시간', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 9, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 수정시간 */
('TAB_SHM/UPDATE_EMP_ID', 'UPDATE_EMP_ID', '수정자', '수정자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 10, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 수정자 */
 
('TAB_SHM/ENT_ID', 'ENT_ID', '엔티티 ID', '엔티티 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 11, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ENT', null, true),	/* 엔티티 ID */
('TAB_SHM/TAS_ID', 'TAS_ID', '단계', '단계', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 12, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'TAS', null, true),	/* 단계 */
('TAB_SHM/REQ_DATE', 'REQ_DATE', '요청일', '요청일', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 13, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DT', null, null, true),	/* 요청일 */
('TAB_SHM/REQ_EMP_ID', 'REQ_EMP_ID', '요청자', '요청자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 14, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 요청자 */
('TAB_SHM/CLO_DATE', 'CLO_DATE', '종료일', '종료일', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 15, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DTTM', null, null, true),	/* 종료일 */
('TAB_SHM/CLO_EMP_ID', 'CLO_EMP_ID', '종료자', '종료자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 16, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 종료자 */
('TAB_SHM/ASS_EMP_ID', 'ASS_EMP_ID', '현재 담당자', '현재 담당자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 17, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true),	/* 현재 담당자 */
('TAB_SHM/SRC_ID', 'SRC_ID', '상위 ID', '상위 ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 18, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 상위 ID */
('TAB_SHM/SRC_ENT_ID', 'SRC_ENT_ID', '상위 Entity ID', '상위 Entity ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 19, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'ENT', null, true),	/* 상위 Entity ID */
('TAB_SHM/CONTENT', 'CONTENT', '고객요청사항', '고객요청사항', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 20, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXTAREA', null, null, true),	/* 지원 내역 */

('TAB_SHM/TYPE_CD', 'TYPE_CD', '등록 유형', '등록 유형', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 21, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE_SELECT', null, 'SHM_TYPE', true),	/* 등록 유형 */
('TAB_SHM/CAT_CD', 'CAT_CD', '지원 유형', '지원 유형', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 22, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE_SELECT', null, 'SHM_CATALOG', true),	/* 지원 유형 */
('TAB_SHM/CRM_ID', 'CRM_ID', 'CRM ID', 'CRM ID', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 23, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'CRM', null, true),	/* CRM ID */
('TAB_SHM/PRODUCT_CD', 'PRODUCT_CD', '제품 유형', '제품 유형', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 24, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE_SELECT', null, 'SHM_PRODUCT', true),	/* 제품 유형 */
('TAB_SHM/CUSTOMER_CD', 'CUSTOMER_CD', '고객 분류', '고객 분류', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 25, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE_SELECT', null, 'SHM_CUSTOMER_TYPE', true),	/* 고객 분류 */
('TAB_SHM/CUSTOMER', 'CUSTOMER', '고객명', '고객명', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 26, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 고객명 */


('TAB_SHM/SUPPORT_CITY', 'SUPPORT_CITY', '지원 도시', '지원 도시', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 26, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 지원 도시 */
('TAB_SHM/SUPPORT_LOCATION', 'SUPPORT_LOCATION', '지원 장소', '지원 장소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 27, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 지원 장소 */
('TAB_SHM/CUSTOMER_CONTACT', 'CUSTOMER_CONTACT', '고객 담당자', '고객 담당자', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 28, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_STRING', 'FLT_TYPE_STRING_TEXT', null, null, true),	/* 고객 담당자 */
('TAB_SHM/WORKDAY_CD', 'WORKDAY_CD', '근무일 유형', '근무일 유형', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 29, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE_SELECT', null, 'WOR_WORKDAY', true),	/* 근무일 유형 */

('TAB_SHM/MA_CYCLE_CD', 'MA_CYCLE_CD', '정기점검 주기', '정기점검 주기', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 30, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_CODE', 'FLT_TYPE_CODE_SELECT', null, 'SHM_MA_CYCLE', true),	/* 정기점검 주기 */
('TAB_SHM/MA_WORK_DATE', 'MA_WORK_DATE', '정기점검 작업일', '정기점검 작업일', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 31, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_DATE', 'FLT_TYPE_DATE_DT', null, null, true),	/* 정기점검 작업일 */
('TAB_SHM/MA_CHARGE_EMP_ID', 'MA_CHARGE_EMP_ID', '정기점검 엔지니어', '정기점검 엔지니어', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 32, 
 'SHM', 'TAB_SHM', 'FLT_TYPE_ENTITY', 'FLT_TYPE_ENTITY_SELECT', 'EMP', null, true);	/*  정기점검 엔지니어 */

/* Sequence */
INSERT INTO RSHM.TAB_SEQUENCE
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, MID_TYPE, MID_NUM, CUR_NUM, LENGTH )
VALUES
('SEQ_SHM', '기술지원', '기술지원', '기술지원', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1,
 'SHM', 'yyyyMM', 0, 0, 5);	/* 기술지원 */

/* Menu */
INSERT INTO RSHM.TAB_MENU
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 PID, LEVEL, URL, ICON, ASIDE, NEW, LEADER, ADMIN )
VALUES
('MEN_SHM', '업무지원 요청', '업무지원 요청', '업무지원 요청', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 null, 1, null, null, true, false, true, false),	/* 업무지원 요청 */

('MEN_SHM_T_001', '(나의 업무)업무지원 요청목록', '(나의 업무)업무지원 요청목록', '(나의 업무)업무지원 요청목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'MEN_SHM', 2, '/common/list?lstId=LST_SHM_T_001', 1, true, false, false, false),	/* (나의 업무)업무지원 요청목록 */
('MEN_SHM_M_001', '(나의 업무)정기점검 요청목록', '(나의 업무)정기점검 요청목록', '(나의 업무)정기점검 요청목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'MEN_SHM', 2, '/common/list?lstId=LST_SHM_M_001', 2, true, false, false, false),	/* (나의 업무)정기점검 요청목록 */
('MEN_SHM_T_002', '(전체)업무지원 목록', '(전체)업무지원 요청목록', '(전체)업무지원 요청목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'MEN_SHM', 2, '/common/list?lstId=LST_SHM_T_002', 3, true, false, false, false),	/* (전체)업무지원 요청목록 */
('MEN_SHM_M_002', '(전체)정기점검 요청목록', '(전체)정기점검 요청목록', '(전체)정기점검 목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'MEN_SHM', 2, '/common/list?lstId=LST_SHM_M_002', 4, true, false, false, false);	/* (전체)정기점검 요청목록 */

/* Workflow */
INSERT INTO RSHM.TAB_WORKFLOW
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID )
VALUES
('WOF_SHM_T_001', '업무지원', '업무지원', '업무지원', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM'),	/* (기술지원)업무지원 */
('WOF_SHM_M_001', '정기점검', '정기점검', '정기점검', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM');	/* (기술지원)정기점검 */

/* Activity */
INSERT INTO RSHM.TAB_ACTIVITY
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, WOF_ID )
VALUES
/* (기술지원)업무지원 */
('ACT_SHM_T_001', '등록', '등록', '등록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'WOF_SHM_T_001'),	/* 등록 */
('ACT_SHM_T_002', '진행', '진행', '진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM', 'WOF_SHM_T_001'),	/* 진행 */
('ACT_SHM_T_003', '완료', '완료', '완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM', 'WOF_SHM_T_001'),	/* 완료 */

/* (기술지원)정기점검 */
('ACT_SHM_M_001', '등록', '등록', '등록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'WOF_SHM_M_001'),	/* 등록 */
('ACT_SHM_M_002', '진행', '진행', '진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM', 'WOF_SHM_M_001'),	/* 진행 */
('ACT_SHM_M_003', '완료', '완료', '완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM', 'WOF_SHM_M_001');	/* 완료 */

/* Task  */
INSERT INTO RSHM.TAB_TASK
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, ACT_ID, TYPE_CD)
VALUES
/* (기술지원)업무지원 */
('TAS_SHM_T_001', '등록', '등록', '등록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'ACT_SHM_T_001', 'TAS_TYPE_REG'),	/* 등록 */
('TAS_SHM_T_002', '임시저장', '임시저장', '임시저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM', 'ACT_SHM_T_001', 'TAS_TYPE_REG'),	/* 임시저장 */
('TAS_SHM_T_003', '진행', '진행', '진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM', 'ACT_SHM_T_002', 'TAS_TYPE_PROC'),	/* 진행 */
('TAS_SHM_T_004', '완료', '완료', '완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'SHM', 'ACT_SHM_T_003', 'TAS_TYPE_COMP'),	/* 완료 */
('TAS_SHM_T_005', '취소', '취소', '취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'SHM', 'ACT_SHM_T_003', 'TAS_TYPE_CANCEL'),	/* 취소 */

/* (기술지원)정기점검 */
('TAS_SHM_M_001', '등록', '등록', '등록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'ACT_SHM_M_001', 'TAS_TYPE_REG'),	/* 등록 */
('TAS_SHM_M_002', '임시저장', '임시저장', '임시저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM', 'ACT_SHM_M_001', 'TAS_TYPE_REG'),	/* 임시저장 */
('TAS_SHM_M_003', '진행', '진행', '진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM', 'ACT_SHM_M_002', 'TAS_TYPE_PROC'),	/* 진행 */
('TAS_SHM_M_004', '완료', '완료', '완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 4, 
 'SHM', 'ACT_SHM_M_003', 'TAS_TYPE_COMP'),	/* 완료 */
('TAS_SHM_M_005', '취소', '취소', '취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 5, 
 'SHM', 'ACT_SHM_M_003', 'TAS_TYPE_CANCEL');	/* 취소 */

/* Control */
INSERT INTO RSHM.TAB_CONTROL
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TAS_ID, NEXT_TAS_ID, TYPE_CD, DATA_UPDATE, CONTENT_ID)
VALUES
/* 업무지원 */
('CTL_SHM_T_001', '임시저장', '임시저장', '임시저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'TAS_SHM_T_001', 'TAS_SHM_T_002', 'CTL_TYPE_SECONDARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"}
]', null),	/* 등록 -> 임시저장 */
('CTL_SHM_T_002', '진행', '진행', '진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM', 'TAS_SHM_T_001', 'TAS_SHM_T_003', 'CTL_TYPE_PRIMARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"}
]', 'CTN_SHM_LEADER_ASSIGN'),	/* 등록 -> 진행 */

('CTL_SHM_T_003', '저장', '저장', '저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'TAS_SHM_T_002', 'TAS_SHM_T_002', 'CTL_TYPE_SECONDARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"}
]', null),	/* 임시저장 -> 임시저장 */
('CTL_SHM_T_004', '진행', '진행', '진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM', 'TAS_SHM_T_002', 'TAS_SHM_T_003', 'CTL_TYPE_PRIMARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"}
]', 'CTN_SHM_LEADER_ASSIGN'),	/* 임시저장 -> 진행 */
('CTL_SHM_T_005', '등록취소', '등록취소', '등록취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM', 'TAS_SHM_T_002', 'TAS_SHM_T_005', 'CTL_TYPE_DANGER', '[
    {"field":"ass_emp_id", "value":""},
    {"field":"clo_emp_id", "value":"#{user.id}"},
    {"field":"clo_date", "value":"#{date.curDTTM}"}
]', 'CTN_SHM_LEADER_CANCEL'),	/* 임시저장 -> 취소 */

('CTL_SHM_T_006', '저장', '저장', '저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'TAS_SHM_T_003', 'TAS_SHM_T_003', 'CTL_TYPE_SECONDARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"}
]', null),	/* 진행 -> 진행 */
('CTL_SHM_T_007', '완료', '완료', '완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM', 'TAS_SHM_T_003', 'TAS_SHM_T_004', 'CTL_TYPE_PRIMARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"},
    {"field":"clo_emp_id", "value":"#{user.id}"},
    {"field":"clo_date", "value":"#{date.curDTTM}"}
]', 'CTN_SHM_LEADER_CLOSE'),	/* 진행 -> 완료 */
('CTL_SHM_T_008', '등록취소', '등록취소', '등록취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM', 'TAS_SHM_T_003', 'TAS_SHM_T_005', 'CTL_TYPE_DANGER', '[
    {"field":"ass_emp_id", "value":""},
    {"field":"clo_emp_id", "value":"#{user.id}"},
    {"field":"clo_date", "value":"#{date.curDTTM}"}
]', 'CTN_SHM_LEADER_CANCEL'),	/* 진행 -> 취소 */

('CTL_SHM_T_009', '저장', '저장', '저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'TAS_SHM_T_004', 'TAS_SHM_T_004', 'CTL_TYPE_SECONDARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"}
]', null),	/* 완료 -> 완료 */
('CTL_SHM_T_010', '완료취소', '완료취소', '완료취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM', 'TAS_SHM_T_004', 'TAS_SHM_T_005', 'CTL_TYPE_DANGER', '[
    {"field":"ass_emp_id", "value":""}
]', 'CTN_SHM_LEADER_CANCEL'),	/* 완료 -> 취소 */

/* 정기점검 */
('CTL_SHM_M_001', '임시저장', '임시저장', '임시저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'TAS_SHM_M_001', 'TAS_SHM_M_002', 'CTL_TYPE_SECONDARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"}
]', null),	/* 등록 -> 임시저장 */
('CTL_SHM_M_002', '진행', '진행', '진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM', 'TAS_SHM_M_001', 'TAS_SHM_M_003', 'CTL_TYPE_PRIMARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"}
]', 'CTN_SHM_MA_ASSIGN'),	/* 등록 -> 진행 */

('CTL_SHM_M_003', '저장', '저장', '저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'TAS_SHM_M_002', 'TAS_SHM_M_002', 'CTL_TYPE_SECONDARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"}
]', null),	/* 임시저장 -> 임시저장 */
('CTL_SHM_M_004', '진행', '진행', '진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM', 'TAS_SHM_M_002', 'TAS_SHM_M_003', 'CTL_TYPE_PRIMARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"}
]', 'CTN_SHM_MA_ASSIGN'),	/* 임시저장 -> 진행 */
('CTL_SHM_M_005', '등록취소', '등록취소', '등록취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM', 'TAS_SHM_M_002', 'TAS_SHM_M_005', 'CTL_TYPE_DANGER', '[
    {"field":"ass_emp_id", "value":""},
    {"field":"clo_emp_id", "value":"#{user.id}"},
    {"field":"clo_date", "value":"#{date.curDTTM}"}
]', 'CTN_SHM_MA_CANCEL'),	/* 임시저장 -> 취소 */

('CTL_SHM_M_006', '저장', '저장', '저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'TAS_SHM_M_003', 'TAS_SHM_M_003', 'CTL_TYPE_SECONDARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"}
]', null),	/* 진행 -> 진행 */
('CTL_SHM_M_007', '완료', '완료', '완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM', 'TAS_SHM_M_003', 'TAS_SHM_M_004', 'CTL_TYPE_PRIMARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"},
    {"field":"clo_emp_id", "value":"#{user.id}"},
    {"field":"clo_date", "value":"#{date.curDTTM}"}
]', 'CTN_SHM_MA_CLOSE'),	/* 진행 -> 완료 */
('CTL_SHM_M_008', '등록취소', '등록취소', '등록취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 3, 
 'SHM', 'TAS_SHM_M_003', 'TAS_SHM_M_005', 'CTL_TYPE_DANGER', '[
    {"field":"ass_emp_id", "value":""},
    {"field":"clo_emp_id", "value":"#{user.id}"},
    {"field":"clo_date", "value":"#{date.curDTTM}"}
]', 'CTN_SHM_MA_CANCEL'),	/* 진행 -> 취소 */

('CTL_SHM_M_009', '저장', '저장', '저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'TAS_SHM_M_004', 'TAS_SHM_M_004', 'CTL_TYPE_SECONDARY', '[
    {"field":"ass_emp_id", "value":"#{user.id}"}
]', null),	/* 완료 -> 완료 */
('CTL_SHM_M_010', '완료취소', '완료취소', '완료취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 2, 
 'SHM', 'TAS_SHM_M_004', 'TAS_SHM_M_005', 'CTL_TYPE_DANGER', '[
    {"field":"ass_emp_id", "value":""}
]', 'CTN_SHM_MA_CANCEL');	/* 완료 -> 취소 */

/* Form */
INSERT INTO RSHM.TAB_FORM
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 ENT_ID, TAS_ID, CONFIG, SCRIPT )
VALUES
('FRM_SHM_T_001', '업무지원 - 등록', '업무지원 - 등록', '업무지원 - 등록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'TAS_SHM_T_001',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/shm/saveForm"
    },
    "external": {
        "timeline": true
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"type_cd", "fld_id":"TAB_SHM/TYPE_CD", "label":"등록 유형", "placeholder":"등록 유형을 선택하세요.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"SHM_TYPE_LEADER", "readonly":true, "hidden":true, "require":true, "uiitem":"Code.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_SHM/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_date", "fld_id":"TAB_SHM/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"#{date.curDT}", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_SHM/REQ_EMP_ID", "label":"요청자(담당영업)", "placeholder":"요청자(담당영업)를 선택하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"crm_id", "fld_id":"TAB_SHM/CRM_ID", "label":"영업기회 코드", "placeholder":"영업기회 코드를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.SearchSelectCRM", "config": [{\"id\":\"table\", \"value\": \"tab_crm\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"cat_cd", "fld_id":"TAB_SHM/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"product_cd", "fld_id":"TAB_SHM/PRODUCT_CD", "label":"제품", "placeholder":"제품을 선택하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.Group.SearchSelect", "config":"2", "action": { "type":"", "event":""} },
        {"id":"customer_cd", "fld_id":"TAB_SHM/CUSTOMER_CD", "label":"고객 분류", "placeholder":"고객 분류를 선택하세요.", "group":"group_002", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer", "fld_id":"TAB_SHM/CUSTOMER", "label":"고객명(회사명)", "placeholder":"고객명(회사명)를 입력하세요.", "group":"group_002", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"content", "fld_id":"TAB_SHM/CONTENT", "label":"고객요청사항", "placeholder":"고객요청사항을 입력하세요.", "group":"group_002", "x":1, "y":4, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/shm/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 업무지원 - 등록 */
('FRM_SHM_T_002', '업무지원 - 임시저장', '업무지원 - 임시저장', '업무지원 - 임시저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'TAS_SHM_T_002',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/shm/saveForm"
    },
    "external": {
        "timeline": true
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_SHM/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_SHM/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_date", "fld_id":"TAB_SHM/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"#{date.curDT}", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_SHM/REQ_EMP_ID", "label":"요청자(담당영업)", "placeholder":"요청자(담당영업)를 선택하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"crm_id", "fld_id":"TAB_SHM/CRM_ID", "label":"영업기회 코드", "placeholder":"영업기회 코드를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.SearchSelectCRM", "config": [{\"id\":\"table\", \"value\": \"tab_crm\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"cat_cd", "fld_id":"TAB_SHM/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"product_cd", "fld_id":"TAB_SHM/PRODUCT_CD", "label":"제품", "placeholder":"제품을 선택하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.Group.SearchSelect", "config":"2", "action": { "type":"", "event":""} },
        {"id":"customer_cd", "fld_id":"TAB_SHM/CUSTOMER_CD", "label":"고객 분류", "placeholder":"고객 분류를 선택하세요.", "group":"group_002", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer", "fld_id":"TAB_SHM/CUSTOMER", "label":"고객명(회사명)", "placeholder":"고객명(회사명)을 입력하세요.", "group":"group_002", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"content", "fld_id":"TAB_SHM/CONTENT", "label":"고객요청사항", "placeholder":"고객요청사항을 입력하세요.", "group":"group_002", "x":1, "y":4, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/shm/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 업무지원 - 임시저장 */
('FRM_SHM_T_003', '업무지원 - 진행', '업무지원 - 진행', '업무지원 - 진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'TAS_SHM_T_003',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/shm/saveForm"
    },
    "external": {
        "timeline": true
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_SHM/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_SHM/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_date", "fld_id":"TAB_SHM/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_SHM/REQ_EMP_ID", "label":"요청자(담당영업)", "placeholder":"요청자(담당영업)를 선택하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"crm_id", "fld_id":"TAB_SHM/CRM_ID", "label":"영업기회 코드", "placeholder":"영업기회 코드를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.SearchSelectCRM", "config": [{\"id\":\"table\", \"value\": \"tab_crm\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"cat_cd", "fld_id":"TAB_SHM/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"product_cd", "fld_id":"TAB_SHM/PRODUCT_CD", "label":"제품", "placeholder":"제품을 선택하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.Group.SearchSelect", "config":"2", "action": { "type":"", "event":""} },
        {"id":"customer_cd", "fld_id":"TAB_SHM/CUSTOMER_CD", "label":"고객 분류", "placeholder":"고객 분류를 선택하세요.", "group":"group_002", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer", "fld_id":"TAB_SHM/CUSTOMER", "label":"고객명(회사명)", "placeholder":"고객명(회사명)을 입력하세요.", "group":"group_002", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"content", "fld_id":"TAB_SHM/CONTENT", "label":"고객요청사항", "placeholder":"고객요청사항을 입력하세요.", "group":"group_002", "x":1, "y":4, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"relation", "fld_id":"", "label":"엔지니어 배정", "placeholder":"", "group":"group_002", "x":1, "y":5, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"Custom.Relation", "config":"RLT_SHM001", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/shm/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', '
var checkWorkorderStatus = function() {

    /* 등록취소 버튼 사용 여부 체크 */
    var result = getSqlResultMap(\'WORKORDER_PROCEEDING_COUNT\', [{name: \'src_id\', value: \'#{box.id}\'}]);
    if(result.cnt > 0) {
      hideControl(\'CTL_SHM_T_008\');   // 등록취소
    }

    /* 완료 버튼 사용 여부 체크 */
    var result = getSqlResultMap(\'WORKORDER_COMPLETE_COUNT\', [{name: \'src_id\', value: \'#{box.id}\'}]);
    if(result.cnt < 1) {
      hideControl(\'CTL_SHM_T_007\');   // 완료
    }

    /* 완료 버튼 사용 여부 체크 */
    var result = getSqlResultMap(\'WORKORDER_WORKING_COUNT\', [{name: \'src_id\', value: \'#{box.id}\'}]);
    if(result.cnt > 0) {
      hideControl(\'CTL_SHM_T_007\');   // 완료
    }
}
'),	/* 업무지원 - 진행 */
('FRM_SHM_T_004', '업무지원 - 완료', '업무지원 - 완료', '업무지원 - 완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'TAS_SHM_T_004',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/shm/saveForm"
    },
    "external": {
        "timeline": true
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_SHM/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_SHM/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_date", "fld_id":"TAB_SHM/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_SHM/REQ_EMP_ID", "label":"요청자(담당영업)", "placeholder":"요청자(담당영업)를 선택하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"crm_id", "fld_id":"TAB_SHM/CRM_ID", "label":"영업기회 코드", "placeholder":"영업기회 코드를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelectCRM", "config": [{\"id\":\"table\", \"value\": \"tab_crm\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"cat_cd", "fld_id":"TAB_SHM/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"product_cd", "fld_id":"TAB_SHM/PRODUCT_CD", "label":"제품", "placeholder":"제품을 선택하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Code.Group.SearchSelect", "config":"2", "action": { "type":"", "event":""} },
        {"id":"customer_cd", "fld_id":"TAB_SHM/CUSTOMER_CD", "label":"고객 분류", "placeholder":"고객 분류를 선택하세요.", "group":"group_002", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer", "fld_id":"TAB_SHM/CUSTOMER", "label":"고객명(회사명)", "placeholder":"고객명(회사명)을 입력하세요.", "group":"group_002", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"content", "fld_id":"TAB_SHM/CONTENT", "label":"고객요청사항", "placeholder":"고객요청사항을 입력하세요.", "group":"group_002", "x":1, "y":4, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"", "fld_id":"", "label":"엔지니어 배정", "placeholder":"", "group":"group_002", "x":1, "y":5, "cols":12, "rows": 3, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Custom.Relation", "config":"RLT_SHM001", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/shm/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 업무지원 - 완료 */
('FRM_SHM_T_005', '업무지원 - 취소', '업무지원 - 취소', '업무지원 - 취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'TAS_SHM_T_005',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/shm/saveForm"
    },
    "external": {
        "timeline": true
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_SHM/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_SHM/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_date", "fld_id":"TAB_SHM/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_SHM/REQ_EMP_ID", "label":"요청자(담당영업)", "placeholder":"요청자(담당영업)를 선택하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"crm_id", "fld_id":"TAB_SHM/CRM_ID", "label":"영업기회 코드", "placeholder":"영업기회 코드를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelectCRM", "config": [{\"id\":\"table\", \"value\": \"tab_crm\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"cat_cd", "fld_id":"TAB_SHM/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"product_cd", "fld_id":"TAB_SHM/PRODUCT_CD", "label":"제품", "placeholder":"제품을 선택하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Code.Group.SearchSelect", "config":"2", "action": { "type":"", "event":""} },
        {"id":"customer_cd", "fld_id":"TAB_SHM/CUSTOMER_CD", "label":"고객 분류", "placeholder":"고객 분류를 선택하세요.", "group":"group_002", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer", "fld_id":"TAB_SHM/CUSTOMER", "label":"고객명(회사명)", "placeholder":"고객명(회사명)을 입력하세요.", "group":"group_002", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"content", "fld_id":"TAB_SHM/CONTENT", "label":"고객요청사항", "placeholder":"고객요청사항을 입력하세요.", "group":"group_002", "x":1, "y":4, "cols":12, "rows": 3, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"", "fld_id":"", "label":"엔지니어 배정", "placeholder":"", "group":"group_002", "x":1, "y":5, "cols":12, "rows": 3, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Custom.Relation", "config":"RLT_SHM001", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/shm/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 업무지원 - 취소 */

('FRM_SHM_M_001', '정기점검 - 등록', '정기점검 - 등록', '정기점검 - 등록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'TAS_SHM_M_001',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/shm/saveForm"
    },
    "external": {
        "timeline": true
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"type_cd", "fld_id":"TAB_SHM/TYPE_CD", "label":"등록 유형", "placeholder":"등록 유형을 선택하세요.", "group":"group_001", "x":1, "y":1, "cols":6, "rows": 1, "def_val":"SHM_TYPE_MAINTENANCE", "readonly":true, "hidden":true, "require":true, "uiitem":"Code.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_SHM/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_date", "fld_id":"TAB_SHM/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"#{date.curDT}", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_SHM/REQ_EMP_ID", "label":"요청자(담당영업)", "placeholder":"요청자(담당영업)를 선택하세요.", "group":"group_001", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"crm_id", "fld_id":"TAB_SHM/CRM_ID", "label":"영업기회 코드", "placeholder":"영업기회 코드를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.SearchSelectCRM", "config": [{\"id\":\"table\", \"value\": \"tab_crm\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"cat_cd", "fld_id":"TAB_SHM/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"product_cd", "fld_id":"TAB_SHM/PRODUCT_CD", "label":"제품", "placeholder":"제품을 선택하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.Group.SearchSelect", "config":"2", "action": { "type":"", "event":""} },
        {"id":"customer_cd", "fld_id":"TAB_SHM/CUSTOMER_CD", "label":"고객 분류", "placeholder":"고객 분류를 선택하세요.", "group":"group_002", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer", "fld_id":"TAB_SHM/CUSTOMER", "label":"고객명(회사명)", "placeholder":"고객명(회사명)을 입력하세요.", "group":"group_002", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"ma_cycle_cd", "fld_id":"TAB_SHM/MA_CYCLE_CD", "label":"정기점검 주기", "placeholder":"정기점검 주기를 선택하세요.", "group":"group_002", "x":1, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"ma_charge_emp_id", "fld_id":"TAB_SHM/MA_CHARGE_EMP_ID", "label":"정기점검 엔지니어", "placeholder":"정기점검 엔지니어를 선택하세요.", "group":"group_002", "x":2, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"ma_work_date", "fld_id":"TAB_SHM/MA_WORK_DATE", "label":"정기점검 작업일", "placeholder":"정기점검 작업일을 입력하세요.", "group":"group_002", "x":1, "y":5, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        
        {"id":"support_city", "fld_id":"TAB_SHM/SUPPORT_CITY", "label":"지원 도시", "placeholder":"지원 도시를 입력하세요.", "group":"group_002", "x":1, "y":6, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"support_location", "fld_id":"TAB_SHM/SUPPORT_LOCATION", "label":"지원 장소", "placeholder":"지원 장소를 입력하세요.", "group":"group_002", "x":2, "y":6, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer_contact", "fld_id":"TAB_SHM/CUSTOMER_CONTACT", "label":"고객 담당자", "placeholder":"고객 담당자를 입력하세요.", "group":"group_002", "x":1, "y":7, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"content", "fld_id":"TAB_SHM/CONTENT", "label":"고객요청사항", "placeholder":"고객요청사항을 입력하세요.", "group":"group_002", "x":1, "y":8, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/shm/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 정기점검 - 등록 */
('FRM_SHM_M_002', '정기점검 - 임시저장', '정기점검 - 임시저장', '정기점검 - 임시저장', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'TAS_SHM_M_002',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/shm/saveForm"
    },
    "external": {
        "timeline": true
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_SHM/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_SHM/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_date", "fld_id":"TAB_SHM/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_SHM/REQ_EMP_ID", "label":"요청자(담당영업)", "placeholder":"요청자(담당영업)를 선택하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"#{date.curDT}", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"crm_id", "fld_id":"TAB_SHM/CRM_ID", "label":"영업기회 코드", "placeholder":"영업기회 코드를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.SearchSelectCRM", "config": [{\"id\":\"table\", \"value\": \"tab_crm\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"cat_cd", "fld_id":"TAB_SHM/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"product_cd", "fld_id":"TAB_SHM/PRODUCT_CD", "label":"제품", "placeholder":"제품을 선택하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.Group.SearchSelect", "config":"2", "action": { "type":"", "event":""} },
        {"id":"customer_cd", "fld_id":"TAB_SHM/CUSTOMER_CD", "label":"고객 분류", "placeholder":"고객 분류를 선택하세요.", "group":"group_002", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer", "fld_id":"TAB_SHM/CUSTOMER", "label":"고객명(회사명)", "placeholder":"고객명(회사명)을 입력하세요.", "group":"group_002", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"ma_cycle_cd", "fld_id":"TAB_SHM/MA_CYCLE_CD", "label":"정기점검 주기", "placeholder":"정기점검 주기를 선택하세요.", "group":"group_002", "x":1, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"ma_charge_emp_id", "fld_id":"TAB_SHM/MA_CHARGE_EMP_ID", "label":"정기점검 엔지니어", "placeholder":"정기점검 엔지니어를 선택하세요.", "group":"group_002", "x":2, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"ma_work_date", "fld_id":"TAB_SHM/MA_WORK_DATE", "label":"정기점검 작업일", "placeholder":"정기점검 작업일을 입력하세요.", "group":"group_002", "x":1, "y":5, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },

        {"id":"support_city", "fld_id":"TAB_SHM/SUPPORT_CITY", "label":"지원 도시", "placeholder":"지원 도시를 입력하세요.", "group":"group_002", "x":1, "y":6, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"support_location", "fld_id":"TAB_SHM/SUPPORT_LOCATION", "label":"지원 장소", "placeholder":"지원 장소를 입력하세요.", "group":"group_002", "x":2, "y":6, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer_contact", "fld_id":"TAB_SHM/CUSTOMER_CONTACT", "label":"고객 담당자", "placeholder":"고객 담당자를 입력하세요.", "group":"group_002", "x":1, "y":7, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"content", "fld_id":"TAB_SHM/CONTENT", "label":"고객요청사항", "placeholder":"고객요청사항을 입력하세요.", "group":"group_002", "x":1, "y":8, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/shm/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 정기점검 - 임시저장 */
('FRM_SHM_M_003', '정기점검 - 진행', '정기점검 - 진행', '정기점검 - 진행', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'TAS_SHM_M_003',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/shm/saveForm"
    },
    "external": {
        "timeline": true
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_SHM/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_SHM/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_date", "fld_id":"TAB_SHM/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_SHM/REQ_EMP_ID", "label":"요청자(담당영업)", "placeholder":"요청자(담당영업)를 선택하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"crm_id", "fld_id":"TAB_SHM/CRM_ID", "label":"영업기회 코드", "placeholder":"영업기회 코드를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.SearchSelectCRM", "config": [{\"id\":\"table\", \"value\": \"tab_crm\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"cat_cd", "fld_id":"TAB_SHM/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"product_cd", "fld_id":"TAB_SHM/PRODUCT_CD", "label":"제품", "placeholder":"제품을 선택하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.Group.SearchSelect", "config":"2", "action": { "type":"", "event":""} },
        {"id":"customer_cd", "fld_id":"TAB_SHM/CUSTOMER_CD", "label":"고객 분류", "placeholder":"고객 분류를 선택하세요.", "group":"group_002", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer", "fld_id":"TAB_SHM/CUSTOMER", "label":"고객명(회사명)", "placeholder":"고객명(회사명)을 입력하세요.", "group":"group_002", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"ma_cycle_cd", "fld_id":"TAB_SHM/MA_CYCLE_CD", "label":"정기점검 주기", "placeholder":"정기점검 주기를 선택하세요.", "group":"group_002", "x":1, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Code.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"ma_charge_emp_id", "fld_id":"TAB_SHM/MA_CHARGE_EMP_ID", "label":"정기점검 엔지니어", "placeholder":"정기점검 엔지니어를 선택하세요.", "group":"group_002", "x":2, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"ma_work_date", "fld_id":"TAB_SHM/MA_WORK_DATE", "label":"정기점검 작업일", "placeholder":"정기점검 작업일을 입력하세요.", "group":"group_002", "x":1, "y":5, "cols":12, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":true, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },

        {"id":"support_city", "fld_id":"TAB_SHM/SUPPORT_CITY", "label":"지원 도시", "placeholder":"지원 도시를 입력하세요.", "group":"group_002", "x":1, "y":6, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"support_location", "fld_id":"TAB_SHM/SUPPORT_LOCATION", "label":"지원 장소", "placeholder":"지원 장소를 입력하세요.", "group":"group_002", "x":2, "y":6, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer_contact", "fld_id":"TAB_SHM/CUSTOMER_CONTACT", "label":"고객 담당자", "placeholder":"고객 담당자를 입력하세요.", "group":"group_002", "x":1, "y":7, "cols":6, "rows": 1, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"content", "fld_id":"TAB_SHM/CONTENT", "label":"고객요청사항", "placeholder":"고객요청사항을 입력하세요.", "group":"group_002", "x":1, "y":8, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"relation", "fld_id":"", "label":"엔지니어 배정", "placeholder":"", "group":"group_002", "x":1, "y":9, "cols":12, "rows": 3, "def_val":"", "readonly":false, "hidden":false, "require":false, "uiitem":"Custom.Relation", "config":"RLT_SHM003", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/shm/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', '
var checkWorkorderStatus = function() {

    /* 등록취소 버튼 사용 여부 체크 */
    var result = getSqlResultMap(\'WORKORDER_PROCEEDING_COUNT\', [{name: \'src_id\', value: \'#{box.id}\'}]);
    if(result.cnt > 0) {
      hideControl(\'CTL_SHM_M_008\');   // 등록취소
    }

    /* 완료 버튼 사용 여부 체크 */
    var result = getSqlResultMap(\'WORKORDER_COMPLETE_COUNT\', [{name: \'src_id\', value: \'#{box.id}\'}]);
    if(result.cnt < 1) {
      hideControl(\'CTL_SHM_M_007\');   // 완료
    }

    /* 완료 버튼 사용 여부 체크 */
    var result = getSqlResultMap(\'WORKORDER_WORKING_COUNT\', [{name: \'src_id\', value: \'#{box.id}\'}]);
    if(result.cnt > 0) {
      hideControl(\'CTL_SHM_M_007\');   // 완료
    }
}
'),	/* 정기점검 - 진행 */
('FRM_SHM_M_004', '정기점검 - 완료', '정기점검 - 완료', '정기점검 - 완료', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'TAS_SHM_M_004',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/shm/saveForm"
    },
    "external": {
        "timeline": true
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_SHM/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_SHM/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_date", "fld_id":"TAB_SHM/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_SHM/REQ_EMP_ID", "label":"요청자(담당영업)", "placeholder":"요청자(담당영업)를 선택하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"crm_id", "fld_id":"TAB_SHM/CRM_ID", "label":"영업기회 코드", "placeholder":"영업기회 코드를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelectCRM", "config": [{\"id\":\"table\", \"value\": \"tab_crm\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"cat_cd", "fld_id":"TAB_SHM/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"product_cd", "fld_id":"TAB_SHM/PRODUCT_CD", "label":"제품", "placeholder":"제품을 선택하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Code.Group.SearchSelect", "config":"2", "action": { "type":"", "event":""} },
        {"id":"customer_cd", "fld_id":"TAB_SHM/CUSTOMER_CD", "label":"고객 분류", "placeholder":"고객 분류를 선택하세요.", "group":"group_002", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer", "fld_id":"TAB_SHM/CUSTOMER", "label":"고객명(회사명)", "placeholder":"고객명(회사명)을 입력하세요.", "group":"group_002", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"ma_cycle_cd", "fld_id":"TAB_SHM/MA_CYCLE_CD", "label":"정기점검 주기", "placeholder":"정기점검 주기를 선택하세요.", "group":"group_002", "x":1, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Code.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"ma_charge_emp_id", "fld_id":"TAB_SHM/MA_CHARGE_EMP_ID", "label":"정기점검 엔지니어", "placeholder":"정기점검 엔지니어를 선택하세요.", "group":"group_002", "x":2, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"ma_work_date", "fld_id":"TAB_SHM/MA_WORK_DATE", "label":"정기점검 작업일", "placeholder":"정기점검 작업일을 입력하세요.", "group":"group_002", "x":1, "y":5, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },

        {"id":"support_city", "fld_id":"TAB_SHM/SUPPORT_CITY", "label":"지원 도시", "placeholder":"지원 도시를 입력하세요.", "group":"group_002", "x":1, "y":6, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"support_location", "fld_id":"TAB_SHM/SUPPORT_LOCATION", "label":"지원 장소", "placeholder":"지원 장소를 입력하세요.", "group":"group_002", "x":2, "y":6, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer_contact", "fld_id":"TAB_SHM/CUSTOMER_CONTACT", "label":"고객 담당자", "placeholder":"고객 담당자를 입력하세요.", "group":"group_002", "x":1, "y":7, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"content", "fld_id":"TAB_SHM/CONTENT", "label":"고객요청사항", "placeholder":"고객요청사항을 입력하세요.", "group":"group_002", "x":1, "y":8, "cols":12, "rows": 3, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"relation", "fld_id":"", "label":"엔지니어 배정", "placeholder":"", "group":"group_002", "x":1, "y":9, "cols":12, "rows": 3, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Custom.Relation", "config":"RLT_SHM002", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/shm/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', ''),	/* 정기점검 - 완료 */
('FRM_SHM_M_005', '정기점검 - 취소', '정기점검 - 취소', '정기점검 - 취소', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
 'SHM', 'TAS_SHM_M_005',  
 '{
    "form": {
        "id": "ticket_form",
        "action": "/api/common/shm/saveForm"
    },
    "external": {
        "timeline": true
    },
    "groups": [
        { "id": "group_001", "title": "기본 정보", "index": 1, "expand": true },
        { "id": "group_002", "title": "추가 정보", "index": 2, "expand": true }
    ],
     "fields": [ 
        {"id":"id", "fld_id":"TAB_SHM/ID", "label":"ID", "placeholder":"ID를 입력하세요.", "group":"group_001", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.ID", "config":"", "action": { "type":"", "event":""} },
        {"id":"name", "fld_id":"TAB_SHM/NAME", "label":"제목", "placeholder":"제목을 입력하세요.", "group":"group_001", "x":1, "y":2, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_date", "fld_id":"TAB_SHM/REQ_DATE", "label":"요청일", "placeholder":"요청일을 입력하세요.", "group":"group_001", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },
        {"id":"req_emp_id", "fld_id":"TAB_SHM/REQ_EMP_ID", "label":"요청자(담당영업)", "placeholder":"요청자(담당영업)를 선택하세요.", "group":"group_001", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },

        {"id":"crm_id", "fld_id":"TAB_SHM/CRM_ID", "label":"영업기회 코드", "placeholder":"영업기회 코드를 선택하세요.", "group":"group_002", "x":1, "y":1, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelectCRM", "config": [{\"id\":\"table\", \"value\": \"tab_crm\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"cat_cd", "fld_id":"TAB_SHM/CAT_CD", "label":"지원 유형", "placeholder":"지원 유형을 선택하세요.", "group":"group_002", "x":1, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"product_cd", "fld_id":"TAB_SHM/PRODUCT_CD", "label":"제품", "placeholder":"제품을 선택하세요.", "group":"group_002", "x":2, "y":2, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Code.Group.SearchSelect", "config":"2", "action": { "type":"", "event":""} },
        {"id":"customer_cd", "fld_id":"TAB_SHM/CUSTOMER_CD", "label":"고객 분류", "placeholder":"고객 분류를 선택하세요.", "group":"group_002", "x":1, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Code.SearchSelect", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer", "fld_id":"TAB_SHM/CUSTOMER", "label":"고객명(회사명)", "placeholder":"고객명(회사명)을 입력하세요.", "group":"group_002", "x":2, "y":3, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"ma_cycle_cd", "fld_id":"TAB_SHM/MA_CYCLE_CD", "label":"정기점검 주기", "placeholder":"정기점검 주기를 선택하세요.", "group":"group_002", "x":1, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Code.Select", "config":"", "action": { "type":"", "event":""} },
        {"id":"ma_charge_emp_id", "fld_id":"TAB_SHM/MA_CHARGE_EMP_ID", "label":"정기점검 엔지니어", "placeholder":"정기점검 엔지니어를 선택하세요.", "group":"group_002", "x":2, "y":4, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Entity.SearchSelect", "config": [{\"id\":\"table\", \"value\": \"tab_employee\"},{\"id\":\"sqlId\", \"value\": \"ENTITY_SEARCH_SELECT\"}], "action": { "type":"", "event":""} },
        {"id":"ma_work_date", "fld_id":"TAB_SHM/MA_WORK_DATE", "label":"정기점검 작업일", "placeholder":"정기점검 작업일을 입력하세요.", "group":"group_002", "x":1, "y":5, "cols":12, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":true, "uiitem":"Date.DT", "config":"", "action": { "type":"", "event":""} },

        {"id":"support_city", "fld_id":"TAB_SHM/SUPPORT_CITY", "label":"지원 도시", "placeholder":"지원 도시를 입력하세요.", "group":"group_002", "x":1, "y":6, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"support_location", "fld_id":"TAB_SHM/SUPPORT_LOCATION", "label":"지원 장소", "placeholder":"지원 장소를 입력하세요.", "group":"group_002", "x":2, "y":6, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },
        {"id":"customer_contact", "fld_id":"TAB_SHM/CUSTOMER_CONTACT", "label":"고객 담당자", "placeholder":"고객 담당자를 입력하세요.", "group":"group_002", "x":1, "y":7, "cols":6, "rows": 1, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.Text", "config":"", "action": { "type":"", "event":""} },

        {"id":"content", "fld_id":"TAB_SHM/CONTENT", "label":"고객요청사항", "placeholder":"고객요청사항을 입력하세요.", "group":"group_002", "x":1, "y":8, "cols":12, "rows": 3, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"String.TextArea", "config":"", "action": { "type":"", "event":""} },
        {"id":"relation", "fld_id":"", "label":"엔지니어 배정", "placeholder":"", "group":"group_002", "x":1, "y":9, "cols":12, "rows": 3, "def_val":"", "readonly":true, "hidden":false, "require":false, "uiitem":"Custom.Relation", "config":"RLT_SHM002", "action": { "type":"", "event":""} }
    ],
    "buttons": [
        { "type": "submit", "label": "저장", "class": "btn-primary", "used": false },
        { "type": "reset", "label": "취소", "class": "btn-secondary", "used": false },
        { "type": "delete", "label": "삭제", "class": "btn-danger", "used": false, "action": "/api/common/shm/deleteForm" },
        { "type": "close", "label": "닫기", "class": "btn-secondary", "used": false },
        { "type": "clone", "label": "복제", "class": "btn-secondary", "used": false }
    ]
}', '');	/* 정기점검 - 취소 */

/* List */
INSERT INTO RSHM.TAB_LIST
(ID, NAME, LABEL, DESCR, CREATE_DATE, CREATE_EMP_ID, UPDATE_DATE, UPDATE_EMP_ID, USED, ORDER_BY, 
 QUERY, CONFIG, SCRIPT )
VALUES
('LST_SHM_T_001', '(나의 업무)업무지원 목록', '(나의 업무)업무지원 목록', '(나의 업무)업무지원 목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
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
       (select case count(*)
               when 0 then \'N\'
               else \'Y\'
               end
         from tab_workorder
        where src_id = shm.id) as cnt 
  from tab_shm shm
 where type_cd = \'SHM_TYPE_LEADER\'
   and tas_id not in (select id from tab_task where type_cd = \'TAS_TYPE_CANCEL\' and ent_id = \'SHM\')
   and create_emp_id = \'#{user.id}\'', 
 '{
    "sql": {
        "where": true,
        "stmts": [
            { "stmt":"req_date between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"req_date", "param": "start_req_date,end_req_date", "type": "range-date", "require": true},
            { "stmt":"id like concat(\'%\', ?, \'%\')", "id":"id", "param": "id", "type": "text", "require": false},
            { "stmt":"crm_id like concat(\'%\', ?, \'%\')", "id":"crm_id", "param": "crm_id", "type": "text", "require": false},
            { "stmt":"crm_id in (select id from tab_crm where name like concat(\'%\', ?, \'%\'))", "id":"crm_name", "param": "crm_name", "type": "text", "require": false}
        ]
    },
    "action": {
        "create_btn": {
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_SHM_T_001",
            "modal_title": "업무지원 등록"
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
            { "id": "req_date", "label": "요청일", "uiitem": "Date.Range.DT", "width": 6, "index": 5, "def_val": "m-1,d+0", "config": "" },
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" }
        ],
        [
            { "id": "crm_id", "label": "영업기회코드", "uiitem": "String.Text", "width": 3, "index": 3, "def_val": "", "config": "" },
            { "id": "crm_name", "label": "영업기회명", "uiitem": "String.Text", "width": 3, "index": 4, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "제목", "data": "name", "type": "view" },
        { "name": "단계", "data": "tas_name", "type": "view" },
        { "name": "영업기회코드", "data": "crm_id", "type": "view" },
        { "name": "영업기회명", "data": "crm_name", "type": "view" },
        { "name": "요청일", "data": "req_date", "type": "view" },
        { "name": "요청자", "data": "req_emp_name", "type": "view" },
        { "name": "등록자", "data": "create_emp_name", "type": "view" },
        { "name": "지원 유형", "data": "cat_name", "type": "view" },
        { "name": "제품명", "data": "product_name", "type": "view" },
        { "name": "할당여부", "data": "cnt", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "desc" }
}', ''),
('LST_SHM_T_002', '(전체)업무지원 목록', '(전체)업무지원 목록', '(전체)업무지원 목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
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
       customer
  from tab_shm shm
 where type_cd = \'SHM_TYPE_LEADER\'', 
 '{
    "sql": {
        "where": true,
        "stmts": [
            { "stmt":"req_date between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"req_date", "param": "start_req_date,end_req_date", "type": "range-date", "require": true},
            { "stmt":"id like concat(\'%\', ?, \'%\')", "id":"id", "param": "id", "type": "text", "require": false},
            { "stmt":"crm_id like concat(\'%\', ?, \'%\')", "id":"crm_id", "param": "crm_id", "type": "text", "require": false},
            { "stmt":"crm_id in (select id from tab_crm where name like concat(\'%\', ?, \'%\'))", "id":"crm_name", "param": "crm_name", "type": "text", "require": false}
        ]
    },
    "action": {
        "create_btn": {
            "use": false,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_SHM_T_001",
            "modal_title": "업무지원 등록"
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
            { "id": "req_date", "label": "요청일", "uiitem": "Date.Range.DT", "width": 6, "index": 5, "def_val": "m-1,d+0", "config": "" },
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" }
        ],
        [
            { "id": "crm_id", "label": "영업기회코드", "uiitem": "String.Text", "width": 3, "index": 3, "def_val": "", "config": "" },
            { "id": "crm_name", "label": "영업기회명", "uiitem": "String.Text", "width": 3, "index": 4, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "제목", "data": "name", "type": "view" },
        { "name": "단계", "data": "tas_name", "type": "view" },
        { "name": "영업기회코드", "data": "crm_id", "type": "view" },
        { "name": "영업기회명", "data": "crm_name", "type": "view" },
        { "name": "요청일", "data": "req_date", "type": "view" },
        { "name": "요청자", "data": "req_emp_name", "type": "view" },
        { "name": "등록자", "data": "create_emp_name", "type": "view" },
        { "name": "지원 유형", "data": "cat_name", "type": "view" },
        { "name": "제품명", "data": "product_name", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "desc" }
}', ''),
('LST_SHM_M_001', '(나의 업무)정기점검 요청목록', '(나의 업무)정기점검 요청목록', '(나의 업무)정기점검 요청목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
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
   and tas_id not in (select id from tab_task where type_cd = \'TAS_TYPE_CANCEL\' and ent_id = \'SHM\')
   and create_emp_id = \'#{user.id}\'', 
 '{
    "sql": {
        "where": true,
        "stmts": [
            { "stmt":"req_date between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"req_date", "param": "start_req_date,end_req_date", "type": "range-date", "require": true},
            { "stmt":"id like concat(\'%\', ?, \'%\')", "id":"id", "param": "id", "type": "text", "require": false},
            { "stmt":"crm_id like concat(\'%\', ?, \'%\')", "id":"crm_id", "param": "crm_id", "type": "text", "require": false},
            { "stmt":"crm_id in (select id from tab_crm where name like concat(\'%\', ?, \'%\'))", "id":"crm_name", "param": "crm_name", "type": "text", "require": false}
        ]
    },
    "action": {
        "create_btn": {
            "use": true,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_SHM_M_001",
            "modal_title": "정기점검 등록"
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
            { "id": "req_date", "label": "요청일", "uiitem": "Date.Range.DT", "width": 6, "index": 5, "def_val": "m-1,d+0", "config": "" },
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" }
        ],
        [
            { "id": "crm_id", "label": "영업기회코드", "uiitem": "String.Text", "width": 3, "index": 3, "def_val": "", "config": "" },
            { "id": "crm_name", "label": "영업기회명", "uiitem": "String.Text", "width": 3, "index": 4, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "제목", "data": "name", "type": "view" },
        { "name": "단계", "data": "tas_name", "type": "view" },
        { "name": "영업기회코드", "data": "crm_id", "type": "view" },
        { "name": "영업기회명", "data": "crm_name", "type": "view" },
        { "name": "요청일", "data": "req_date", "type": "view" },
        { "name": "요청자", "data": "req_emp_name", "type": "view" },
        { "name": "등록자", "data": "create_emp_name", "type": "view" },
        { "name": "지원 유형", "data": "cat_name", "type": "view" },
        { "name": "제품명", "data": "product_name", "type": "view" },
        { "name": "점검 주기", "data": "ma_cycle_name", "type": "view" },
        { "name": "엔지니어", "data": "ma_charge_emp_name", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "desc" }
}', ''),
('LST_SHM_M_002', '(전체)정기점검 요청목록', '(전체)정기점검 요청목록', '(전체)정기점검 요청목록', current_timestamp(), 'rshmadmin@rockplace.co.kr', null, null, true, 1, 
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
 where type_cd = \'SHM_TYPE_MAINTENANCE\'', 
 '{
    "sql": {
        "where": true,
        "stmts": [
            { "stmt":"req_date between str_to_date(?, \'%Y-%m-%d\') and str_to_date(?, \'%Y-%m-%d\')", "id":"req_date", "param": "start_req_date,end_req_date", "type": "range-date", "require": true},
            { "stmt":"id like concat(\'%\', ?, \'%\')", "id":"id", "param": "id", "type": "text", "require": false},
            { "stmt":"crm_id like concat(\'%\', ?, \'%\')", "id":"crm_id", "param": "crm_id", "type": "text", "require": false},
            { "stmt":"crm_id in (select id from tab_crm where name like concat(\'%\', ?, \'%\'))", "id":"crm_name", "param": "crm_name", "type": "text", "require": false}
        ]
    },
    "action": {
        "create_btn": {
            "use": false,
            "title": "등록",
            "url": "/common/modal/form?formId=FRM_SHM_M_001",
            "modal_title": "정기점검 등록"
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
            { "id": "req_date", "label": "요청일", "uiitem": "Date.Range.DT", "width": 6, "index": 5, "def_val": "m-1,d+0", "config": "" },
            { "id": "id", "label": "ID", "uiitem": "String.Text", "width": 3, "index": 0, "def_val": "", "config": "" }
        ],
        [
            { "id": "crm_id", "label": "영업기회코드", "uiitem": "String.Text", "width": 3, "index": 3, "def_val": "", "config": "" },
            { "id": "crm_name", "label": "영업기회명", "uiitem": "String.Text", "width": 3, "index": 4, "def_val": "", "config": "" }
        ]
    ],
    "column": [
        { "name": "ID", "data": "id", "type": "view" },
        { "name": "제목", "data": "name", "type": "view" },
        { "name": "단계", "data": "tas_name", "type": "view" },
        { "name": "영업기회코드", "data": "crm_id", "type": "view" },
        { "name": "영업기회명", "data": "crm_name", "type": "view" },
        { "name": "요청일", "data": "req_date", "type": "view" },
        { "name": "요청자", "data": "req_emp_name", "type": "view" },
        { "name": "등록자", "data": "create_emp_name", "type": "view" },
        { "name": "지원 유형", "data": "cat_name", "type": "view" },
        { "name": "제품명", "data": "product_name", "type": "view" },
        { "name": "점검 주기", "data": "ma_cycle_name", "type": "view" },
        { "name": "엔지니어", "data": "ma_charge_emp_name", "type": "view" },
        { "name": "Actions", "data": "actions", "type": "action" }
    ],
    "order": { "index": 0, "type": "desc" }
}', '');