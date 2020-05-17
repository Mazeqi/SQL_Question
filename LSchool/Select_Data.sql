
---- 2
--select COUNT(*) as Student_num from student ;

---- 3
--select St.sid, St.sname from student as St, score as Sc, 
--course as Co where Sc.sid = St.sid and Sc.cid = Co.cid and 
-- (Co.cname = '生物' or Co.cname = '物理') and Sc.score >= 60;

---- 4
--select top 3 count(*) as class_num,
--grade_id from class group by grade_id order by class_num desc;

---- 5
--select top 1 AVG(Sc.score) as Score_avg, Sc.sid, max(St.sname) as sname
--from score as Sc, student as St where St.sid = Sc.sid
--group by (Sc.sid)
--order by (Score_avg) desc;

---- 6
--select count(St.sid) from student as St,  class_grade as Cg, class as Cl
--where St.class_id = Cl.cid and Cl.grade_id = Cg.gid 
--group by (Cg.gid);

---- 7
--select max(St.sid) as sid,max(St.sname) as sname, AVG(Sc.score) as score ,count(Sc.cid) as count_co
--from student as St, score as Sc
--where Sc.sid = St.sid group by Sc.sid;

---- 8
--select max(St.sname) as student_name, MAX(Sc.score) as max_socre, MAX(Co.cname) as course_name
--from student as St, score as Sc, course as Co
--where St.sid = '2' and Co.cid = Sc.cid;

---- 9
--select COUNT(Tea.tid) as num_Li,count(Tcl.cid) as D_class
--from teacher as Tea ,teach2cls as Tcl
--where Tea.tname like '李%' and Tea.tid = Tcl.cid
--group by (Tcl.cid);

---- 10
--select COUNT(Cl.cid) as Class_num ,MAX(Cl.grade_id) as grade_id
--from class as Cl group by(Cl.grade_id) 
--having COUNT(Cl.cid) >= 3;

---- 12
--select max(St.sid) as sid ,max(St.sname) as sname
--from student as St, teacher as Tea,teach2cls as Tcl, score as Sc
--where Tea.tname = '张三' and Tea.tid = Tcl.tid and Tcl.cid = Sc.cid 
--and St.sid = Sc.sid
--group by Sc.sid
--having COUNT(Sc.cid) >= 2;

---- 13
--select max(Tea.tid) as tid, max(Tea.tname) as tname
--from teacher as Tea, teach2cls as Tecl
--where Tea.tid = Tecl.tid
--group by Tecl.tid
--having COUNT(Tecl.tcid) >= 2;

---- 14
--select  max(St.sid) as sid, max(St.sname) as sname
--from student as St , score as Sc
-- where St.class_id = Sc.cid  and Sc.cid in ('1' , '2')
-- group by St.sid
-- having COUNT(St.sid) = 2;


---- 15
--select tid,tname 
--from  teacher
--where tid  not in(
--		select  Tecl.tid as tid
--		from teacher as Tea, teach2cls as Tecl, class as Cl
--		where Cl.grade_id >= 5 and Tea.tid = Tecl.tid and Tecl.cid = Cl.cid
--);

---- 16
--select St.sid as sid, St.sname as sname , St.class_id
--from student as St, teacher as Tea, teach2cls as Tcl
--where Tea.tname = '张三' and Tea.tid = Tcl.tid and St.class_id = Tcl.cid;


---- 17
--select max(Tea.tid) as tid, max(Tea.tname) as tname
--from teacher as Tea, teach2cls as Tcl
--where Tea.tid = Tcl.tid 
--group by Tea.tid
--having COUNT(Tea.tid) >= 2;


---- 18
-- select student.sname, student.sid 
-- from student 
-- where student.sid in(
--	select t1.sid 
--	from 
--		(select St.sid, Sc.score
--		from student as St, score as Sc
--		where Sc.cid = '1' and St.sid = Sc.sid) as t1,

--		(select St.sid,Sc.score
--		from student as St, score as Sc
--		where Sc.cid = '2' and St.sid = Sc.sid) as t2
--	where t1.sid = t2.sid and t1.score >= t2.score

--);


---- 20
--select distinct St.sid, St.sname
--from student as St, score as Sc
--where St.sid = Sc.sid and Sc.score < 60;


---- 21
--select max(St.sid) as sid, max(St.sname) sname
--from student as St, score as Sc
--where St.sid = Sc.sid 
--group by Sc.sid
--having count(Sc.cid) < (select count(*) from course);

---- 22
--select distinct St.sid, St.sname
--from student as St, score as Sc
--where St.sid = Sc.sid and Sc.cid in(
--	select Sc.cid
--	from score as Sc
--	where Sc.sid = '1'
--);


---- 23
--select distinct St.sid, St.sname
--from student as St, score as Sc
--where St.sid != '1' and St.sid = Sc.sid and Sc.cid in(
--	select Sc.cid
--	from score as Sc
--	where Sc.sid = '1'
--);

---- 24
--select max(St.sid) as sid , max(St.sname) as sname
--from student as St ,score as Sc, (select Sc.cid from score as Sc where Sc.sid = '2') as t1
--where St.sid = Sc.sid and St.sid != '2' and t1.cid = Sc.cid
--group by Sc.sid 
--having COUNT(Sc.cid) = (select COUNT(*) from score  as Sc where Sc.sid = '2');


---- 25
--delete  from score 
--where score.cid in (
--	 select teach2cls.cid 
--	 from teach2cls,teacher
--	 where teacher.tname = '张三' and teacher.tid = teach2cls.tid
--);

---- 29
--select Sc.cid,avg(Sc.score) as avg_score,
--(cast(sum(case when Sc.score>= 60 then 1 else 0 end) as float)/cast(count(*) as float)*100.0) as per
--from score as Sc
--group by Sc.cid
--order by AVG(Sc.score)asc , per  desc;
--select * from score;

---- 30
--select Sc.cid,avg(Sc.score) as avg_score
--from score as Sc
--group by Sc.cid
--order by AVG(Sc.score) desc ;


---- 32
--select Co.cid, t1.num_Co
--from course as Co left join (select COUNT(Sc.sid) as num_Co, Sc.cid from score as Sc group by Sc.cid) as t1 
--on Co.cid = t1.cid;


---- 33
--select max(St.sid) sid, max(St.sname) sname,COUNT(Sc.cid) num_co
--from student as St, score as Sc
--where St.sid = Sc.sid
--group by Sc.sid
--having COUNT(Sc.cid) >= 2;


---- 34
--select St.gender,count(St.gender) num_gender
--from student as St
--group by St.gender;

---- 35
--select COUNT(St.sid) num_z, max(St.sname) sname
--from student as St
--where St.sname like '张%';


---- 36
--select  max(St.sname) sname, COUNT(St.sid) num_R
--from student as St
--group by St.sname
--having COUNT(St.sid)>1;


---- 37
--select AVG(Sc.score) as Score_c, Sc.cid
--from score as Sc
--group by Sc.cid
--order by AVG(Sc.score) asc, Sc.cid desc;

---- 38
--select St.sid, Sc.score, St.sname
--from student as St,score as Sc, course as Co
--where St.sid = Sc.sid and Co.cid = Sc.cid and Co.cname = '数学' and Sc.score < 60;


---- 39
--select St.sid, St.sname
--from student as St , score as Sc
--where St.sid = Sc.sid and Sc.score > 80 and Sc.cid = '3';


---- 42
--select max(Co.cid) as cid,COUNT(Sc.cid) as num
--from course as Co left join score as Sc
--on Co.cid = Sc.cid
--group by Sc.cid;


---- 43
--select St.sid,Sc.cid,Sc.score
--from student as St, score as Sc,(select Sc.cid,Sc.sid, Sc.score from score as Sc) as t1
--where Sc.score = t1.score and Sc.cid <> t1.cid and St.sid = Sc.sid and Sc.sid = t1.sid;

---- 45
--select max(St.sid) sid, max(St.sname) sname, COUNT(Sc.cid) num_co 
--from score as Sc , student as St 
--where Sc.sid = St.sid
--group by Sc.sid
--having COUNT(Sc.cid) > 2;


---- 46
--select max(Co.cid) cid ,max(Co.cname) cname
--from  course as Co left join  score as Sc
--on Co.cid = Sc.cid
--group by Co.cid
--having COUNT(Sc.sid) < 1;


---- 47
--select max(Tea.tid)tid, max(Tea.tname) tname
--from teacher as Tea left join teach2cls as Tcl
--on Tea.tid = Tcl.tid
--group by Tcl.tid
--having COUNT(Tcl.tcid) <= 1;

---- 48
--select Sc.sid, AVG(Sc.score) avg_score
--from score as Sc
--where  Sc.score > 80
--group by Sc.sid
--having COUNT(Sc.cid) >= 2

---- 49
--select Sc.sid, Sc.score
--from score as Sc 
--where Sc.cid = '3' and Sc.score <= 100
--order by Sc.score desc;

---- 50
--delete from score where score.cid = '1' and score.sid ='1';

---- 51
--select distinct  max(St.sid) sid, max(St.sname) sname
--from student as St, score as Sc,(
--	  select Sc.sid,Sc.cid from score as Sc where Sc.cid in(
--		   select Co.cid from course as Co where Co.cname in ('物理','生物')
--	  ) 
--) as t1 
--where St.sid = t1.sid and Sc.cid = t1.cid and St.sid = Sc.sid
--group by Sc.sid
--having COUNT(Sc.cid) = 2 ;
