create database trade_log;
USE trade_log;

CREATE SEQUENCE slice_balance_example_seq;

CREATE TABLE slice_balance_example (
    id            INT CHECK (id > 0) NOT NULL PRIMARY KEY DEFAULT NEXTVAL ('slice_balance_example_seq'),
    user_id       INT CHECK (user_id > 0) NOT NULL,
    asset         VARCHAR(30) NOT NULL,
    t             SMALLINT CHECK (t > 0) NOT NULL,
    balance       DECIMAL(30,16) NOT NULL
) ;

CREATE TABLE slice_order_example (
    id            BIGINT CHECK (id > 0) NOT NULL PRIMARY KEY,
    t             SMALLINT CHECK (t > 0) NOT NULL,
    side          SMALLINT CHECK (side > 0) NOT NULL,
    create_time   DOUBLE PRECISION NOT NULL,
    update_time   DOUBLE PRECISION NOT NULL,
    user_id       INT CHECK (user_id > 0) NOT NULL,
    market        VARCHAR(30) NOT NULL,
    price         DECIMAL(30,8) NOT NULL,
    amount        DECIMAL(30,8) NOT NULL,
    taker_fee     DECIMAL(30,4) NOT NULL,
    maker_fee     DECIMAL(30,4) NOT NULL,
    left          DECIMAL(30,8) NOT NULL,
    freeze        DECIMAL(30,8) NOT NULL,
    deal_stock    DECIMAL(30,8) NOT NULL,
    deal_money    DECIMAL(30,16) NOT NULL,
    deal_fee      DECIMAL(30,12) NOT NULL
) ;

CREATE SEQUENCE slice_history_seq;

CREATE TABLE slice_history (
    id            INT CHECK (id > 0) NOT NULL PRIMARY KEY DEFAULT NEXTVAL ('slice_history_seq'),
    time          BIGINT NOT NULL,
    end_oper_id   BIGINT CHECK (end_oper_id > 0) NOT NULL,
    end_order_id  BIGINT CHECK (end_order_id > 0) NOT NULL,
    end_deals_id  BIGINT CHECK (end_deals_id > 0) NOT NULL
) ;

CREATE TABLE operlog_example (
    id            BIGINT CHECK (id > 0) NOT NULL PRIMARY KEY,
    time          DOUBLE PRECISION NOT NULL,
    detail        TEXT
) ;
