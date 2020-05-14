
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
