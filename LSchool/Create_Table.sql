create table class(
	cid int not null,
	caption varchar(30) not null,
	grade_id int not null,
	primary key(cid),
	foreign key(grade_id) references class_grade(gid)
	on delete cascade
	on update cascade
);

create table student(
	sid int not null,
	sname varchar(20) not null,
	gender varchar(2) check( gender in ('ÄÐ','Å®')),
	class_id int,
	primary key(sid),
	foreign key(class_id) references class(cid)
	on delete cascade
	on update cascade
);

create table teacher(
	tid int,
	tname varchar(20) not null,
	primary key(tid)
);

create table course(
    cid int,
    cname varchar(30) not null,
    teacher_id int ,
    primary key(cid),
    constraint teacher_name foreign key(teacher_id) references teacher(tid)
    on delete cascade
    on update cascade
);

create table score(

	sid int,
	cid int,
	score int not null,
	primary key(sid, cid),
	foreign key(sid) references student(sid)
	on delete cascade
	on update cascade,
	foreign key(cid) references course(cid)
	on delete cascade
	on update cascade
);


create table teach2cls(
	tcid int,
	tid int,
	cid int,
	primary key(tcid),
	foreign key(tid) references teacher(tid),
	foreign key(cid) references course(cid)
	on delete cascade
	on update cascade,
);