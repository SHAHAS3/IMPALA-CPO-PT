CREATE OR REPLACE PROCEDURE calcenddate_test
  (
    vpingu_id NUMBER)
AS
  vid number;
  vnumberofpeople       NUMBER;
  vassignedhoursperorde NUMBER;
  vstartdate DATE default trunc(sysdate);
  CURSOR c1
  IS
     SELECT id            ,
      numberofpeople      ,
      assignedhoursperorde,
      startdate
       FROM capampweek
      WHERE capamp_id=vpingu_id and startdate is not null;
BEGIN
  open c1;
  LOOP
     fetch c1 INTO vid,vnumberofpeople,vassignedhoursperorde,vstartdate;
    EXIT
  WHEN c1%notfound;
      UPDATE capampweek
    SET
      (
        enddate
      )
      =(addworkingdays(vassignedhoursperorde/ (vnumberofpeople *8), vstartdate))
      --CTS--=(addworkingdays(vassignedhoursperorde/ (vnumberofpeople *7), vstartdate))
      where id=vid;
      
      commit; -- WK, 06.08.2009
  END LOOP;
  close c1;
END;
/

