ALTER TABLE dbo.CHECKINOUT ADD checksum varchar(32) NULL go

CREATE TRIGGER dbo.tr_checksum ON dbo.CHECKINOUT
    AFTER INSERT
    AS
    BEGIN
      UPDATE dbo.CHECKINOUT
      SET checksum = SUBSTRING(master.dbo.fn_varbintohexstr(hashbytes('SHA2_256',CONCAT(CONVERT(varchar(10),inserted.USERID),CONVERT(varchar(10),inserted.CHECKTIME),inserted.CHECKTYPE))),3,32)
      FROM inserted
      WHERE CHECKINOUT.USERID = inserted.USERID
      AND CHECKINOUT.CHECKTIME = inserted.CHECKTIME
      AND CHECKINOUT.CHECKTYPE = inserted.CHECKTYPE;
    END
   GO
