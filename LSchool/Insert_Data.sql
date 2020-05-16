
--insert into class_grade(gid, gname)
--values
--(1, '一年级'),
--(2, '二年级'),
--(3, '三年级'),
--(4, '四年级'),
--(5 , '五年级'),
--(6, '六年级');

-- select * from class;
--insert into class (cid, caption, grade_id)
--values
--(1, '一年一班', 1),
--(2, '二年一班', 2),
--(3, '三年二班', 3),
--(4, '四年一班', 4),
--(5, '五年三班', 5),
--(6, '六年二班', 6),
--(7, '一年二班', 1),
--(8, '二年四班', 2),
--(9, '三年三班', 3),
--(10, '四年五班', 4),
--(11, '五年一班', 5),
--(12, '六年一班', 6);
--(13, '六年二班', 6);


--insert into student (sid, sname, gender, class_id)
--values
--(1, '乔丹', '女', 1),
--(2, '艾佛森', '女', 1),
--(3, '科比', '女', 2),
--(4, '李冬梅', '女', 3),
--(5, '王璐', '女', 4),
--(6, '周慧敏', '女', 5),
--(7, '王菲', '女', 6);
--(8, '小强', '女', 6);

-- select * from teacher;
--insert into teacher(tid, tname)
--values
--(1, '张三'),
--(2, '李四'),
--(3, '王五')
--(4,'李白');

--insert into course(cid, cname, teacher_id)
--values
--(1, '生物', 1),
--(2, '体育', 1),
--(3, '物理', 2);

--select * from score;
--insert into score(sid, cid, score)
--values(3,1,50),
--(2,1,90),
--(4,3,100)
--(2,3,90)
--(1,1,60),
--(1,2,59),
--(2,2,99)

--select * from teach2cls;
--insert into teach2cls(tcid, tid, cid)
--values
--(6,2,12)
--(7,4,2)
--(1,1,1),
--(2,1,2),
--(3,2,1),
--(4,3,2)
--(5,2,3)
