--------------------------------------------------------
--  File created - четверг-января-21-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence CB_FILE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CLOUDBOX"."CB_FILE_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence CB_ROLE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CLOUDBOX"."CB_ROLE_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence CB_TEMPLINK_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CLOUDBOX"."CB_TEMPLINK_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence CB_USER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CLOUDBOX"."CB_USER_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table CB_FILE
--------------------------------------------------------

  CREATE TABLE "CLOUDBOX"."CB_FILE" 
   (	"FILEID" NUMBER(*,0), 
	"FILEUSERID" NUMBER(*,0), 
	"FILENAME" VARCHAR2(500 BYTE), 
	"FILEEXT" VARCHAR2(15 BYTE), 
	"FILEDATE" TIMESTAMP (6), 
	"FILEHASH" VARCHAR2(100 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CB_ROLE
--------------------------------------------------------

  CREATE TABLE "CLOUDBOX"."CB_ROLE" 
   (	"ROLEID" NUMBER(*,0), 
	"ROLELABEL" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CB_TEMPLINK
--------------------------------------------------------

  CREATE TABLE "CLOUDBOX"."CB_TEMPLINK" 
   (	"TLINKID" NUMBER(*,0), 
	"TLINKFILEID" NUMBER(*,0), 
	"TLINKPATH" VARCHAR2(100 BYTE), 
	"TLINKEXPIRE" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CB_USER
--------------------------------------------------------

  CREATE TABLE "CLOUDBOX"."CB_USER" 
   (	"USERID" NUMBER(*,0), 
	"USERMAIL" VARCHAR2(70 BYTE), 
	"USERPASSHASH" VARCHAR2(150 BYTE), 
	"USERSALT" VARCHAR2(200 BYTE), 
	"USERNAME" VARCHAR2(70 BYTE), 
	"USERNOTES" VARCHAR2(100 BYTE), 
	"USERPIC" VARCHAR2(100 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CB_USERFILE
--------------------------------------------------------

  CREATE TABLE "CLOUDBOX"."CB_USERFILE" 
   (	"UF_USERID" NUMBER(*,0), 
	"UF_FILEID" NUMBER(*,0), 
	"UF_DEL" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CB_USERROLE
--------------------------------------------------------

  CREATE TABLE "CLOUDBOX"."CB_USERROLE" 
   (	"UR_ROLEID" NUMBER(*,0), 
	"UR_USERID" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into CLOUDBOX.CB_FILE
SET DEFINE OFF;
Insert into CLOUDBOX.CB_FILE (FILEID,FILEUSERID,FILENAME,FILEEXT,FILEDATE,FILEHASH) values ('1','4','Все пароли','txt',to_timestamp('21.01.16 11:04:57,915000000','DD.MM.RR HH24:MI:SSXFF'),'4tygh34yrwtg356yhu');
Insert into CLOUDBOX.CB_FILE (FILEID,FILEUSERID,FILENAME,FILEEXT,FILEDATE,FILEHASH) values ('2','4','Порнуха','mpg',to_timestamp('16.01.16 11:06:03,687000000','DD.MM.RR HH24:MI:SSXFF'),'42y3y356yu4jty56u5u53');
REM INSERTING into CLOUDBOX.CB_ROLE
SET DEFINE OFF;
Insert into CLOUDBOX.CB_ROLE (ROLEID,ROLELABEL) values ('1','Администратор');
Insert into CLOUDBOX.CB_ROLE (ROLEID,ROLELABEL) values ('2','Модератор');
Insert into CLOUDBOX.CB_ROLE (ROLEID,ROLELABEL) values ('3','Пользователь');
REM INSERTING into CLOUDBOX.CB_TEMPLINK
SET DEFINE OFF;
REM INSERTING into CLOUDBOX.CB_USER
SET DEFINE OFF;
Insert into CLOUDBOX.CB_USER (USERID,USERMAIL,USERPASSHASH,USERSALT,USERNAME,USERNOTES,USERPIC) values ('5','usermail@mail.com','04f8996da763b7a969b1028ee3007569eaf3a635486ddab211d512c85b9df8fb','user.getSalt','user','user.getNotes','user.getPic');
Insert into CLOUDBOX.CB_USER (USERID,USERMAIL,USERPASSHASH,USERSALT,USERNAME,USERNOTES,USERPIC) values ('4','adminmail@gmail.com','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','user.getSalt','admin','user.getNotes','user.getPic');
REM INSERTING into CLOUDBOX.CB_USERFILE
SET DEFINE OFF;
Insert into CLOUDBOX.CB_USERFILE (UF_USERID,UF_FILEID,UF_DEL) values ('4','1',null);
Insert into CLOUDBOX.CB_USERFILE (UF_USERID,UF_FILEID,UF_DEL) values ('4','2',to_date('18.01.16','DD.MM.RR'));
REM INSERTING into CLOUDBOX.CB_USERROLE
SET DEFINE OFF;
Insert into CLOUDBOX.CB_USERROLE (UR_ROLEID,UR_USERID) values ('1','4');
Insert into CLOUDBOX.CB_USERROLE (UR_ROLEID,UR_USERID) values ('2','4');
Insert into CLOUDBOX.CB_USERROLE (UR_ROLEID,UR_USERID) values ('3','4');
Insert into CLOUDBOX.CB_USERROLE (UR_ROLEID,UR_USERID) values ('3','5');
--------------------------------------------------------
--  DDL for Index CB_FILE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CLOUDBOX"."CB_FILE_PK" ON "CLOUDBOX"."CB_FILE" ("FILEID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CB_ROLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CLOUDBOX"."CB_ROLE_PK" ON "CLOUDBOX"."CB_ROLE" ("ROLEID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CB_TEMPLINK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CLOUDBOX"."CB_TEMPLINK_PK" ON "CLOUDBOX"."CB_TEMPLINK" ("TLINKID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CB_USERFILE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CLOUDBOX"."CB_USERFILE_PK" ON "CLOUDBOX"."CB_USERFILE" ("UF_USERID", "UF_FILEID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CB_USER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CLOUDBOX"."CB_USER_PK" ON "CLOUDBOX"."CB_USER" ("USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CB_USERROLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CLOUDBOX"."CB_USERROLE_PK" ON "CLOUDBOX"."CB_USERROLE" ("UR_ROLEID", "UR_USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table CB_FILE
--------------------------------------------------------

  ALTER TABLE "CLOUDBOX"."CB_FILE" ADD CONSTRAINT "CB_FILE_PK" PRIMARY KEY ("FILEID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "CLOUDBOX"."CB_FILE" MODIFY ("FILEID" NOT NULL ENABLE);
 
  ALTER TABLE "CLOUDBOX"."CB_FILE" MODIFY ("FILEUSERID" NOT NULL ENABLE);
 
  ALTER TABLE "CLOUDBOX"."CB_FILE" MODIFY ("FILENAME" NOT NULL ENABLE);
 
  ALTER TABLE "CLOUDBOX"."CB_FILE" MODIFY ("FILEEXT" NOT NULL ENABLE);
 
  ALTER TABLE "CLOUDBOX"."CB_FILE" MODIFY ("FILEDATE" NOT NULL ENABLE);
 
  ALTER TABLE "CLOUDBOX"."CB_FILE" MODIFY ("FILEHASH" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CB_ROLE
--------------------------------------------------------

  ALTER TABLE "CLOUDBOX"."CB_ROLE" ADD CONSTRAINT "CB_ROLE_PK" PRIMARY KEY ("ROLEID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "CLOUDBOX"."CB_ROLE" MODIFY ("ROLEID" NOT NULL ENABLE);
 
  ALTER TABLE "CLOUDBOX"."CB_ROLE" MODIFY ("ROLELABEL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CB_TEMPLINK
--------------------------------------------------------

  ALTER TABLE "CLOUDBOX"."CB_TEMPLINK" ADD CONSTRAINT "CB_TEMPLINK_PK" PRIMARY KEY ("TLINKID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "CLOUDBOX"."CB_TEMPLINK" MODIFY ("TLINKID" NOT NULL ENABLE);
 
  ALTER TABLE "CLOUDBOX"."CB_TEMPLINK" MODIFY ("TLINKFILEID" NOT NULL ENABLE);
 
  ALTER TABLE "CLOUDBOX"."CB_TEMPLINK" MODIFY ("TLINKPATH" NOT NULL ENABLE);
 
  ALTER TABLE "CLOUDBOX"."CB_TEMPLINK" MODIFY ("TLINKEXPIRE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CB_USER
--------------------------------------------------------

  ALTER TABLE "CLOUDBOX"."CB_USER" ADD CONSTRAINT "CB_USER_PK" PRIMARY KEY ("USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "CLOUDBOX"."CB_USER" MODIFY ("USERID" NOT NULL ENABLE);
 
  ALTER TABLE "CLOUDBOX"."CB_USER" MODIFY ("USERMAIL" NOT NULL ENABLE);
 
  ALTER TABLE "CLOUDBOX"."CB_USER" MODIFY ("USERPASSHASH" NOT NULL ENABLE);
 
  ALTER TABLE "CLOUDBOX"."CB_USER" MODIFY ("USERSALT" NOT NULL ENABLE);
 
  ALTER TABLE "CLOUDBOX"."CB_USER" MODIFY ("USERNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CB_USERFILE
--------------------------------------------------------

  ALTER TABLE "CLOUDBOX"."CB_USERFILE" ADD CONSTRAINT "CB_USERFILE_PK" PRIMARY KEY ("UF_USERID", "UF_FILEID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "CLOUDBOX"."CB_USERFILE" MODIFY ("UF_USERID" NOT NULL ENABLE);
 
  ALTER TABLE "CLOUDBOX"."CB_USERFILE" MODIFY ("UF_FILEID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CB_USERROLE
--------------------------------------------------------

  ALTER TABLE "CLOUDBOX"."CB_USERROLE" ADD CONSTRAINT "CB_USERROLE_PK" PRIMARY KEY ("UR_ROLEID", "UR_USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "CLOUDBOX"."CB_USERROLE" MODIFY ("UR_ROLEID" NOT NULL ENABLE);
 
  ALTER TABLE "CLOUDBOX"."CB_USERROLE" MODIFY ("UR_USERID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table CB_FILE
--------------------------------------------------------

  ALTER TABLE "CLOUDBOX"."CB_FILE" ADD CONSTRAINT "CB_FILE_FK1" FOREIGN KEY ("FILEUSERID")
	  REFERENCES "CLOUDBOX"."CB_USER" ("USERID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CB_TEMPLINK
--------------------------------------------------------

  ALTER TABLE "CLOUDBOX"."CB_TEMPLINK" ADD CONSTRAINT "CB_TEMPLINK_FK1" FOREIGN KEY ("TLINKFILEID")
	  REFERENCES "CLOUDBOX"."CB_FILE" ("FILEID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CB_USERFILE
--------------------------------------------------------

  ALTER TABLE "CLOUDBOX"."CB_USERFILE" ADD CONSTRAINT "CB_USERFILE_FK1" FOREIGN KEY ("UF_FILEID")
	  REFERENCES "CLOUDBOX"."CB_FILE" ("FILEID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "CLOUDBOX"."CB_USERFILE" ADD CONSTRAINT "CB_USERFILE_FK2" FOREIGN KEY ("UF_USERID")
	  REFERENCES "CLOUDBOX"."CB_USER" ("USERID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CB_USERROLE
--------------------------------------------------------

  ALTER TABLE "CLOUDBOX"."CB_USERROLE" ADD CONSTRAINT "CB_USERROLE_FK1" FOREIGN KEY ("UR_ROLEID")
	  REFERENCES "CLOUDBOX"."CB_ROLE" ("ROLEID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "CLOUDBOX"."CB_USERROLE" ADD CONSTRAINT "CB_USERROLE_FK2" FOREIGN KEY ("UR_USERID")
	  REFERENCES "CLOUDBOX"."CB_USER" ("USERID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  DDL for Trigger CB_FILE_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CLOUDBOX"."CB_FILE_TRG" 
BEFORE INSERT ON CLOUDBOX.CB_FILE 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.FILEID IS NULL THEN
      SELECT CB_FILE_SEQ.NEXTVAL INTO :NEW.FILEID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CLOUDBOX"."CB_FILE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CB_ROLE_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CLOUDBOX"."CB_ROLE_TRG" 
BEFORE INSERT ON CLOUDBOX.CB_ROLE 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ROLEID IS NULL THEN
      SELECT CB_ROLE_SEQ.NEXTVAL INTO :NEW.ROLEID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CLOUDBOX"."CB_ROLE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CB_TEMPLINK_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CLOUDBOX"."CB_TEMPLINK_TRG" 
BEFORE INSERT ON CB_TEMPLINK 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.TLINKID IS NULL THEN
      SELECT CB_TEMPLINK_SEQ.NEXTVAL INTO :NEW.TLINKID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CLOUDBOX"."CB_TEMPLINK_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CB_USER_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CLOUDBOX"."CB_USER_TRG" 
BEFORE INSERT ON CLOUDBOX.CB_USER 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.USERID IS NULL THEN
      SELECT CB_USER_SEQ.NEXTVAL INTO :NEW.USERID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CLOUDBOX"."CB_USER_TRG" ENABLE;
