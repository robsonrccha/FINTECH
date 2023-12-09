-- Gerado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   em:        2023-11-02 22:50:12 BRT
--   site:      Oracle Database 12c
--   tipo:      Oracle Database 12c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_bnc (
    cd_bnc        NUMBER(2)
        CONSTRAINT nnc_banco_cd_bnc NOT NULL,
    t_pssa_nr_cpf NUMBER(11)
        CONSTRAINT nnc_banco_t_fnc_pssa_nr_cpf NOT NULL,
    t_bnc_nr_cpf  NUMBER(11) 
         --  ERROR: Column T_BNC.T_BNC_nr_cpf check constraint name length exceeds maximum allowed length(30) 
        CONSTRAINT nnc_banco_t_fnc_cnta_t_fnc_pssa_nr_cpf NOT NULL,
    t_bnc_cd_bnc  NUMBER(2) 
         --  ERROR: Column T_BNC.T_BNC_cd_bnc check constraint name length exceeds maximum allowed length(30) 
        CONSTRAINT nnc_banco_t_fnc_cnta_t_fnc_bnc_cd_bnc NOT NULL,
    nm_bnc        VARCHAR2(10 CHAR)
        CONSTRAINT nnc_banco_nm_bnc NOT NULL,
    nr_cnta       NUMBER(10)
        CONSTRAINT nnc_banco_nr_cnta NOT NULL,
    ds_tp_cnta    VARCHAR2(10 CHAR)
);

CREATE UNIQUE INDEX t_bnc_nr_cpf_idx ON
    t_bnc (
        t_bnc_nr_cpf
    ASC,
        t_bnc_cd_bnc
    ASC );

CREATE UNIQUE INDEX t_bnc_cd_bnc_idx ON
    t_bnc (
        t_bnc_nr_cpf
    ASC,
        t_bnc_cd_bnc
    ASC );

ALTER TABLE t_bnc ADD CONSTRAINT t_bnc_pk PRIMARY KEY ( cd_bnc,
                                                        t_pssa_nr_cpf );

CREATE TABLE t_cnta (
    t_pssa_nr_cpf NUMBER(12) NOT NULL,
    t_bnc_cd_bnc  NUMBER(2) NOT NULL,
    t_crt_nr_crt  NUMBER(15) NOT NULL,
    nr_cnta       NUMBER(10) NOT NULL,
    nr_digito     NUMBER(2) NOT NULL,
    vl_saldo      FLOAT(15) NOT NULL,
    nr_cpf        NUMBER(12) NOT NULL
);

CREATE UNIQUE INDEX t_cnta__idxv1 ON
    t_cnta (
        t_pssa_nr_cpf
    ASC );

CREATE UNIQUE INDEX t_cnta__idxv2 ON
    t_cnta (
        t_crt_nr_crt
    ASC );

ALTER TABLE t_cnta ADD CONSTRAINT t_cnta_pk PRIMARY KEY ( t_pssa_nr_cpf,
                                                          t_bnc_cd_bnc );

CREATE TABLE t_crt (
    nr_crt        NUMBER(12) NOT NULL,
    t_cnta_nr_cpf NUMBER(11) NOT NULL,
    t_cnta_cd_bnc NUMBER(2) NOT NULL,
    t_pssa_nr_cpf NUMBER(12) NOT NULL,
    t_bnc_cd_bnc  NUMBER(2) NOT NULL,
    dt_vcto       DATE NOT NULL,
    nr_cvv        NUMBER(3) NOT NULL,
    nm_crt        VARCHAR2(30 CHAR) NOT NULL,
    ds_tp_crt     VARCHAR2(10 CHAR) NOT NULL,
    nr_cnta       NUMBER(10) NOT NULL
);

CREATE UNIQUE INDEX t_crt__idx ON
    t_crt (
        t_pssa_nr_cpf
    ASC,
        t_bnc_cd_bnc
    ASC );

CREATE UNIQUE INDEX t_crt__idxv1 ON
    t_crt (
        t_pssa_nr_cpf
    ASC,
        t_bnc_cd_bnc
    ASC );

CREATE UNIQUE INDEX t_crt__idxv2 ON
    t_crt (
        t_cnta_nr_cpf
    ASC,
        t_cnta_cd_bnc
    ASC );

ALTER TABLE t_crt ADD CONSTRAINT t_crt_pk PRIMARY KEY ( nr_crt );

CREATE TABLE t_dpsa (
    cd_dpsa        NUMBER(2) NOT NULL,
    t_lcmt_cd_lcmt NUMBER(2) NOT NULL
);

CREATE UNIQUE INDEX t_dpsa_idx ON
    t_dpsa (
        t_lcmt_cd_lcmt
    ASC );

ALTER TABLE t_dpsa ADD CONSTRAINT t_dpsa_pk PRIMARY KEY ( cd_dpsa,
                                                          t_lcmt_cd_lcmt );

CREATE TABLE t_invto (
    cd_invmto    NUMBER(2) NOT NULL,
    t_bnc_nr_cpf NUMBER(11) NOT NULL,
    t_bnc_cd_bnc NUMBER(2) NOT NULL,
    vl_invmto    FLOAT(15) NOT NULL,
    nr_cnta      NUMBER NOT NULL
);

ALTER TABLE t_invto ADD CONSTRAINT t_invt_pk PRIMARY KEY ( cd_invmto );

CREATE TABLE t_lcmt (
    cd_lcmt              NUMBER(2)
        CONSTRAINT nnc_lancamento_cd_lcmt NOT NULL,
    t_cnta_t_pssa_nr_cpf NUMBER(11)
        CONSTRAINT nnc_lancamento_t_pssa_nr_cpf NOT NULL,
    t_cnta_t_bnc_cd_bnc  NUMBER(2)
        CONSTRAINT nnc_lancamento_t_bnc_cd_bnc NOT NULL,
    vl_lcmnt             FLOAT(10)
        CONSTRAINT nnc_lancamento_vl_lcmnt NOT NULL,
    dt_lcmt              DATE
        CONSTRAINT nnc_lancamento_dt_lcmt NOT NULL,
    ds_lcmt              VARCHAR2(15 CHAR)
        CONSTRAINT nnc_lancamento_ds_lcmt NOT NULL
);

ALTER TABLE t_lcmt
    ADD CONSTRAINT dados_lov CHECK ( cd_lcmt IN ( 2, 2 ) );

ALTER TABLE t_lcmt ADD CONSTRAINT t_lcmt_pk PRIMARY KEY ( cd_lcmt );

CREATE TABLE t_lgn (
    t_pssa_nr_cpf NUMBER(11) NOT NULL,
    ps_psswrd     NUMBER(15) NOT NULL
);

ALTER TABLE t_lgn ADD CONSTRAINT t_lgn_pk PRIMARY KEY ( t_pssa_nr_cpf );

CREATE TABLE t_pssa (
    nr_cpf   NUMBER(11) NOT NULL,
    nm_nome  VARCHAR2(10 CHAR) NOT NULL,
    nm_sbnme VARCHAR2(10 CHAR) NOT NULL,
    ds_email VARCHAR2(30 CHAR) NOT NULL,
    dt_nmto  DATE NOT NULL,
    nr_tel   NUMBER(11) NOT NULL
);

ALTER TABLE t_pssa ADD CONSTRAINT t_pssa_pk PRIMARY KEY ( nr_cpf );

CREATE TABLE t_rcta (
    cd_rcta            NUMBER(2) NOT NULL,
    t_fnc_lcmt_cd_lcmt NUMBER(2) NOT NULL
);

CREATE UNIQUE INDEX t_fnc_rcta__idx ON
    t_rcta (
        t_fnc_lcmt_cd_lcmt
    ASC );

ALTER TABLE t_rcta ADD CONSTRAINT t_fnc_rcta_pk PRIMARY KEY ( cd_rcta,
                                                              t_fnc_lcmt_cd_lcmt );

CREATE TABLE t_spt (
    nr_ptclo     NUMBER(15) NOT NULL,
    t_bnc_cd_bnc NUMBER(2) NOT NULL,
    t_bnc_nr_cpf NUMBER(11) NOT NULL,
    dt_atdmto    DATE NOT NULL,
    nr_cnta      NUMBER(10) NOT NULL
);

CREATE UNIQUE INDEX t_spt__idx ON
    t_spt (
        t_bnc_cd_bnc
    ASC,
        t_bnc_nr_cpf
    ASC );

ALTER TABLE t_spt
    ADD CONSTRAINT t_spt_pk PRIMARY KEY ( nr_ptclo,
                                          t_bnc_cd_bnc,
                                          t_bnc_nr_cpf );

CREATE TABLE t_tp_dpsa (
    cd_tp_dpsa     NUMBER(2) NOT NULL,
    t_lcmt_cd_lcmt NUMBER(2) NOT NULL,
    t_dpsa_cd_dpsa NUMBER(2) NOT NULL,
    ds_tp_dpsa     VARCHAR2(10 CHAR) NOT NULL
);

ALTER TABLE t_tp_dpsa ADD CONSTRAINT t_tp_dpsa_pk PRIMARY KEY ( cd_tp_dpsa );

CREATE TABLE t_tp_invto (
    cd_tp_invto       NUMBER(2) NOT NULL,
    t_invto_cd_invmto NUMBER(2) NOT NULL,
    ds_tp_invto       VARCHAR2(15 CHAR) NOT NULL,
    dt_resgate        DATE NOT NULL
);

ALTER TABLE t_tp_invto ADD CONSTRAINT t_invto_pkv1 PRIMARY KEY ( cd_tp_invto );

CREATE TABLE t_tp_rcta (
    cd_tp_rcta     NUMBER(2) NOT NULL,
    t_rcta_cd_rcta NUMBER(2) NOT NULL,
    t_lcmt_cd_lcmt NUMBER(2) NOT NULL,
    ds_tp_rcta     VARCHAR2(10 CHAR) NOT NULL
);

ALTER TABLE t_tp_rcta ADD CONSTRAINT t_tip_rcta_pk PRIMARY KEY ( cd_tp_rcta );

ALTER TABLE t_invto
    ADD CONSTRAINT t_bnc_fk FOREIGN KEY ( t_bnc_cd_bnc,
                                          t_bnc_nr_cpf )
        REFERENCES t_bnc ( cd_bnc,
                           t_pssa_nr_cpf );

ALTER TABLE t_bnc
    ADD CONSTRAINT t_cnta_fk FOREIGN KEY ( t_bnc_nr_cpf,
                                           t_bnc_cd_bnc )
        REFERENCES t_cnta ( t_pssa_nr_cpf,
                            t_bnc_cd_bnc );

ALTER TABLE t_crt
    ADD CONSTRAINT t_cnta_fkv2 FOREIGN KEY ( t_cnta_nr_cpf,
                                             t_cnta_cd_bnc )
        REFERENCES t_cnta ( t_pssa_nr_cpf,
                            t_bnc_cd_bnc );

ALTER TABLE t_tp_dpsa
    ADD CONSTRAINT t_dpsa_fk FOREIGN KEY ( t_dpsa_cd_dpsa,
                                           t_lcmt_cd_lcmt )
        REFERENCES t_dpsa ( cd_dpsa,
                            t_lcmt_cd_lcmt );

ALTER TABLE t_cnta
    ADD CONSTRAINT t_fnc_cnta_t_fnc_pssa_fk FOREIGN KEY ( t_pssa_nr_cpf )
        REFERENCES t_pssa ( nr_cpf );

ALTER TABLE t_spt
    ADD CONSTRAINT t_fnc_spt_t_fnc_bnc_fk FOREIGN KEY ( t_bnc_cd_bnc,
                                                        t_bnc_nr_cpf )
        REFERENCES t_bnc ( cd_bnc,
                           t_pssa_nr_cpf );

ALTER TABLE t_tp_invto
    ADD CONSTRAINT t_invto_fk FOREIGN KEY ( t_invto_cd_invmto )
        REFERENCES t_invto ( cd_invmto );

ALTER TABLE t_dpsa
    ADD CONSTRAINT t_lcmt_fk FOREIGN KEY ( t_lcmt_cd_lcmt )
        REFERENCES t_lcmt ( cd_lcmt );

ALTER TABLE t_rcta
    ADD CONSTRAINT t_lcmt_fkv1 FOREIGN KEY ( t_fnc_lcmt_cd_lcmt )
        REFERENCES t_lcmt ( cd_lcmt );

ALTER TABLE t_lcmt
    ADD CONSTRAINT t_lcmt_t_cnta_fk FOREIGN KEY ( t_cnta_t_pssa_nr_cpf,
                                                  t_cnta_t_bnc_cd_bnc )
        REFERENCES t_cnta ( t_pssa_nr_cpf,
                            t_bnc_cd_bnc );

ALTER TABLE t_lgn
    ADD CONSTRAINT t_pssa_fk FOREIGN KEY ( t_pssa_nr_cpf )
        REFERENCES t_pssa ( nr_cpf );

ALTER TABLE t_bnc
    ADD CONSTRAINT t_pssa_fkv2 FOREIGN KEY ( t_pssa_nr_cpf )
        REFERENCES t_pssa ( nr_cpf );

ALTER TABLE t_tp_rcta
    ADD CONSTRAINT t_tp_rcta_fk FOREIGN KEY ( t_rcta_cd_rcta,
                                              t_lcmt_cd_lcmt )
        REFERENCES t_rcta ( cd_rcta,
                            t_fnc_lcmt_cd_lcmt );

CREATE OR REPLACE TRIGGER arc_dados_t_dpsa BEFORE
    INSERT OR UPDATE OF t_lcmt_cd_lcmt ON t_dpsa
    FOR EACH ROW
DECLARE
    d NUMBER(2);
BEGIN
    SELECT
        a.cd_lcmt
    INTO d
    FROM
        t_lcmt a
    WHERE
        a.cd_lcmt = :new.t_lcmt_cd_lcmt;

    IF ( d IS NULL OR d <> 2 ) THEN
        raise_application_error(-20223, 'FK T_LCMT_FK in Table T_DPSA violates Arc constraint on Table T_LCMT - discriminator column cd_lcmt doesn''t have value 2'
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE TRIGGER arc_dados_t_rcta BEFORE
    INSERT OR UPDATE OF t_fnc_lcmt_cd_lcmt ON t_rcta
    FOR EACH ROW
DECLARE
    d NUMBER(2);
BEGIN
    SELECT
        a.cd_lcmt
    INTO d
    FROM
        t_lcmt a
    WHERE
        a.cd_lcmt = :new.t_fnc_lcmt_cd_lcmt;

    IF ( d IS NULL OR d <> 2 ) THEN
        raise_application_error(-20223, 'FK T_LCMT_FKv1 in Table T_RCTA violates Arc constraint on Table T_LCMT - discriminator column cd_lcmt doesn''t have value 2'
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                            10
-- ALTER TABLE                             27
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           2
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   2
-- WARNINGS                                 0
