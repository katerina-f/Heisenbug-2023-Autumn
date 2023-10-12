ALTER DATABASE db_dev SET TIMEZONE = 'Europe/Moscow';
ALTER DATABASE db_dev SET gp_default_storage_options = 'appendonly=true,blocksize=32768,compresstype=quicklz,compresslevel=1,checksum=true,orientation=column';
ALTER DATABASE db_dev SET standard_conforming_strings = OFF;
ALTER DATABASE db_dev SET gp_enable_relsize_collection = ON;
CREATE SCHEMA test_kafka;

CREATE ROLE gr_etl LOGIN SUPERUSER;

CREATE USER ${DOCKER_TEST_GP_USER} WITH PASSWORD '${DOCKER_TEST_GP_PASS}' NOSUPERUSER;
GRANT gr_etl TO ${DOCKER_TEST_GP_USER};
ALTER USER ${DOCKER_TEST_GP_USER} CREATEEXTTABLE(type='writable', protocol='gpfdist');

GRANT USAGE ON SCHEMA test_kafka TO gr_etl;
