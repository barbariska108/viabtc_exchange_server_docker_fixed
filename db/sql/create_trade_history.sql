create database trade_history;
USE trade_history;


CREATE SEQUENCE balance_history_example_seq;

CREATE TABLE balance_history_example (
    id            BIGINT CHECK (id > 0) NOT NULL PRIMARY KEY DEFAULT NEXTVAL ('balance_history_example_seq'),
    time          DOUBLE PRECISION NOT NULL,
    user_id       INT CHECK (user_id > 0) NOT NULL,
    asset         VARCHAR(30) NOT NULL,
    business      VARCHAR(30) NOT NULL,
    change        DECIMAL(30,8) NOT NULL,
    balance       DECIMAL(30,16) NOT NULL,
    detail        TEXT NOT NULL
) ;

CREATE INDEX idx_user_asset ON balance_history_example (user_id, asset);
CREATE INDEX idx_user_asset_business ON balance_history_example (user_id, asset, business);

-- split by user_id
CREATE TABLE order_history_example (
    id            BIGINT CHECK (id > 0) NOT NULL PRIMARY KEY,
    create_time   DOUBLE PRECISION NOT NULL,
    finish_time   DOUBLE PRECISION NOT NULL,
    user_id       INT CHECK (user_id > 0) NOT NULL,
    market        VARCHAR(30) NOT NULL,
    source        VARCHAR(30) NOT NULL,
    t             SMALLINT CHECK (t > 0) NOT NULL,
    side          SMALLINT CHECK (side > 0) NOT NULL,
    price         DECIMAL(30,8) NOT NULL,
    amount        DECIMAL(30,8) NOT NULL,
    taker_fee     DECIMAL(30,4) NOT NULL,
    maker_fee     DECIMAL(30,4) NOT NULL,
    deal_stock    DECIMAL(30,8) NOT NULL,
    deal_money    DECIMAL(30,16) NOT NULL,
    deal_fee      DECIMAL(30,16) NOT NULL
) ;

CREATE INDEX idx_user_market ON order_history_example (user_id, market);

-- split by id, aka orer_id
CREATE TABLE order_detail_example (
    id            BIGINT CHECK (id > 0) NOT NULL PRIMARY KEY,
    create_time   DOUBLE PRECISION NOT NULL,
    finish_time   DOUBLE PRECISION NOT NULL,
    user_id       INT CHECK (user_id > 0) NOT NULL,
    market        VARCHAR(30) NOT NULL,
    source        VARCHAR(30) NOT NULL,
    t             SMALLINT CHECK (t > 0) NOT NULL,
    side          SMALLINT CHECK (side > 0) NOT NULL,
    price         DECIMAL(30,8) NOT NULL,
    amount        DECIMAL(30,8) NOT NULL,
    taker_fee     DECIMAL(30,4) NOT NULL,
    maker_fee     DECIMAL(30,4) NOT NULL,
    deal_stock    DECIMAL(30,8) NOT NULL,
    deal_money    DECIMAL(30,16) NOT NULL,
    deal_fee      DECIMAL(30,16) NOT NULL
) ;

CREATE INDEX idx_user_market ON order_detail_example (user_id, market);

-- split by order_id
CREATE SEQUENCE deal_history_example_seq;

CREATE TABLE deal_history_example (
    id            BIGINT CHECK (id > 0) NOT NULL PRIMARY KEY DEFAULT NEXTVAL ('deal_history_example_seq'),
    time          DOUBLE PRECISION NOT NULL,
    user_id       INT CHECK (user_id > 0) NOT NULL,
    deal_id       BIGINT CHECK (deal_id > 0) NOT NULL,
    order_id      BIGINT CHECK (order_id > 0) NOT NULL,
    deal_order_id BIGINT CHECK (deal_order_id > 0) NOT NULL,
    role          SMALLINT CHECK (role > 0) NOT NULL,
    price         DECIMAL(30,8) NOT NULL,
    amount        DECIMAL(30,8) NOT NULL,
    deal          DECIMAL(30,16) NOT NULL,
    fee           DECIMAL(30,16) NOT NULL,
    deal_fee      DECIMAL(30,16) NOT NULL
) ;

CREATE INDEX idx_order_id ON deal_history_example (order_id);

-- split by user_id
CREATE SEQUENCE user_deal_history_example_seq;

CREATE TABLE user_deal_history_example (
    id            BIGINT CHECK (id > 0) NOT NULL PRIMARY KEY DEFAULT NEXTVAL ('user_deal_history_example_seq'),
    time          DOUBLE PRECISION NOT NULL,
    user_id       INT CHECK (user_id > 0) NOT NULL,
    market        VARCHAR(30) NOT NULL,
    deal_id       BIGINT CHECK (deal_id > 0) NOT NULL,
    order_id      BIGINT CHECK (order_id > 0) NOT NULL,
    deal_order_id BIGINT CHECK (deal_order_id > 0) NOT NULL,
    side          SMALLINT CHECK (side > 0) NOT NULL,
    role          SMALLINT CHECK (role > 0) NOT NULL,
    price         DECIMAL(30,8) NOT NULL,
    amount        DECIMAL(30,8) NOT NULL,
    deal          DECIMAL(30,16) NOT NULL,
    fee           DECIMAL(30,16) NOT NULL,
    deal_fee      DECIMAL(30,16) NOT NULL
) ;

CREATE INDEX idx_user_market ON user_deal_history_example (user_id, market);
