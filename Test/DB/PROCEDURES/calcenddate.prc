CREATE OR REPLACE PROCEDURE calcenddate
  (
    vpingu_id NUMBER)
AS
  vid number;
  vnumberofpeople       NUMBER;
  vassignedhoursperorde NUMBER;
  vstartdate DATE default trunc(sysdate);
  vpcnkey               NUMBER;
  vcount  number;
  venddate date;
  CURSOR c1
  IS
     SELECT id            ,
      numberofpeople      ,
      assignedhoursperorde,
      startdate           ,
      pcnkey
       FROM capampweek
      WHERE capamp_id=vpingu_id;
BEGIN
  open c1;
  LOOP
     fetch c1 INTO vid,vnumberofpeople,vassignedhoursperorde,vstartdate,vpcnkey;
    EXIT
  WHEN c1%notfound;
     UPDATE capampweek
    SET
      (
        enddate
      )
      =(addworkingdays(decode(vnumberofpeople,0,0,vassignedhoursperorde)/ (vnumberofpeople *7), vstartdate))
      where id=vid;
      --where pcnkey=vpcnkey;
      
      commit; -- WK, 06.08.2009
      
      select count(*) into vcount from capampweek where pcnkey = vpcnkey;
      if (vcount > 1) then
        select enddate into venddate from capampweek where id=vid;
        update capampweek set enddate = venddate
        where pcnkey = vpcnkey and id != vid;
        commit;
      end if;
      
      
     
  END LOOP;
  close c1;
END;
/

