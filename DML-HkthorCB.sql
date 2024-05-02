use quanlydiemthi;

#Thêm dữ liệu vào Bảng STUDENT

insert into student(studentId , studentName, birthday, gender, address, phoneNumber)
    value ('S001','Nguyễn Thế Anh','1999-01-11',0,'Hà Nội','0984678082'),
    ('S002','Đặng Bảo Trâm','1998-12-22',1,'Lào Cai','0904982654'),
    ('S003','Trần Hà Phương','2000-05-05',1,'Nghệ An','0947645363'),
    ('S004','Đỗ Tiến Mạnh','1999-03-26',1,'Hà Nội','0983665353'),
    ('S005','Phạm Duy Nhất','1998-10-04',0,'Tuyên Quang','0987242678'),
    ('S006','Mai Văn Thái','2002-06-22',0,'Nam Định','0982654268'),
    ('S007','Giang Gia Hân','1996-11-10',1,'Phú Thọ','0982364753'),
    ('S008','Nguyễn Ngọc Bảo My','1999-01-22',1,'Hà Nam','0927867454'),
    ('S009','Nguyễn Tiến Đạt','1998-08-07',0,'Tuyên Quang','0989274673'),
    ('S010','Nguyễn Thiều Quang','2000-09-18',0,'Hà Nội','0984378291');



#Thêm dữ liệu vào Bảng SUBJECT

insert into subject(subjectId, subjectName, priority)
value ('MH01','Toán',2),
      ('MH02','Vật Lý',2),
      ('MH03','Hóa Học',1),
      ('MH04','Ngữ Văn',1),
      ('MH05','Tiếng Anh',2);

#Thêm dữ liệu vào Bảng MARK

insert into mark(studentId,subjectId,point)
value ('S001', 'MH01', 8.5),
    ('S001', 'MH02', 7),
    ('S001', 'MH03', 9),
    ('S001', 'MH04', 9),
    ('S001', 'MH05', 5),
    ('S002', 'MH01', 9),
    ('S002', 'MH02', 8),
    ('S002', 'MH03', 6.5),
    ('S002', 'MH04', 8),
    ('S002', 'MH05', 6),
    ('S003', 'MH01', 7.5),
    ('S003', 'MH02', 6.5),
    ('S003', 'MH03', 8),
    ('S003', 'MH04', 7),
    ('S003', 'MH05', 7),
    ('S004', 'MH01', 6),
    ('S004', 'MH02', 7),
    ('S004', 'MH03', 5),
    ('S004', 'MH04', 6.5),
    ('S004', 'MH05', 8),
    ('S005', 'MH01', 5.5),
    ('S005', 'MH02', 8),
    ('S005', 'MH03', 7.5),
    ('S005', 'MH04', 8.5),
    ('S005', 'MH05', 9),
    ('S006', 'MH01', 8),
    ('S006', 'MH02', 10),
    ('S006', 'MH03', 9),
    ('S006', 'MH04', 7.5),
    ('S006', 'MH05', 6.5),
    ('S007', 'MH01', 9.5),
    ('S007', 'MH02', 9),
    ('S007', 'MH03', 6),
    ('S007', 'MH04', 9),
    ('S007', 'MH05', 4),
    ('S008', 'MH01', 10),
    ('S008', 'MH02', 8.5),
    ('S008', 'MH03', 8.5),
    ('S008', 'MH04', 6),
    ('S008', 'MH05', 9.5),
    ('S009', 'MH01', 7.5),
    ('S009', 'MH02', 7),
    ('S009', 'MH03', 9),
    ('S009', 'MH04', 5),
    ('S009', 'MH05', 10),
    ('S010', 'MH01', 6.5),
    ('S010', 'MH02', 8),
    ('S010', 'MH03', 5.5),
    ('S010', 'MH04', 4),
    ('S010', 'MH05', 7);

#Cập nhật dữ liệu [10 điểm]:
#- Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”.
    update student
    set studentName = 'Đỗ Đức Mạnh'
    where studentId = 'S004';

#- Sửa tên và hệ số môn học có mã `MH05` thành “Ngoại Ngữ” và hệ số là 1.

    update subject
    set subjectName = 'Ngoại Ngữ',priority = 1
    where subjectId = 'MH05';

#- Cập nhật lại điểm của học sinh có mã `S009` thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6, MH05 : 9).

    update mark
    set point = case
                when subjectId = 'MH01' then 8.5
                when subjectId = 'MH02' then 7
                when subjectId = 'MH03' then 5.5
                when subjectId = 'MH04' then 6
                when subjectId = 'MH05' then 9
                else point
    end
    where studentId = 'S009';


#Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK
# và thông tin học sinh này ở bảng STUDENT

-- Xóa điểm thi của học sinh có mã S010 trong bảng MARK
delete from mark where studentId = 'S010';

-- Xóa thông tin của học sinh có mã S010 trong bảng STUDENT
delete from student where studentId = 'S010';

#1. Lấy ra tất cả thông tin của sinh viên trong bảng Student . [4 điểm]

    select * from student;

#2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1. [4 điểm]

    select subjectName as 'Tên môn học', subjectId as 'Mã môn học'
    from subject
    where priority = 1;
#3. Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ
#năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh. [4 điểm]

    select studentId 'mã học sinh',studentName 'tên học sinh',
           year(curdate())-year(birthday) as tuổi ,
           case when gender = 0 then 'Nam' else 'Nữ' end as 'giới tính' ,
           address as 'quê quán'
            from student;
#. Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn
#Toán và sắp xếp theo điểm giảm dần. [4 điểm]

    select s.studentName 'tên học sinh',sj.subjectName 'tên môn học' ,m.point 'điểm thi'
    from mark m
    join student s on s.studentId = m.studentId
    join subject sj on sj.subjectId = m.subjectId
    where sj.subjectName = 'Toán'
    order by m.point desc ;


#5. Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng).

    select case when gender = 0 then 'Nam' else 'Nữ' end as 'Giới tính', count(*) as 'Số lượng'
    from student
    group by gender;

#6. Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm
#để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình. [5 điểm

    select s.studentId, s.studentName,
       sum(m.point) as 'Tổng Điểm',
       avg(m.point) as 'Trung bình môn'
    from Mark m
         inner join student s on m.studentId = s.studentId
    group by s.studentId, s.studentName;

#Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học
#sinh, giới tính , quê quán . [3 điểm]

    create view STUDENT_VIEW as
        select studentId 'mã học sinh',studentName 'tên học sinh',
               case when gender = 0 then 'Nam' else 'Nữ' end as 'giới tính' ,
               address as 'quê quán'
            from student;

#2. Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh,
#điểm trung bình các môn học . [3 điểm]
    create view AVERAGE_MARK_VIEW as
    select s.studentId 'mã học sinh', s.studentName 'tên học sinh',
       avg(m.point) as 'Trung bình môn'
    from mark m
         inner join student s on m.studentId = s.studentId
    group by s.studentId, s.studentName;

#3. Đánh Index cho trường `phoneNumber` của bảng STUDENT. [2 điểm]

    create index index_phoneNumber on student(phoneNumber);

#4. Tạo các PROCEDURE sau:
#Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả
#thông tin học sinh đó. [3 điểm]
    delimiter //
    create procedure PROC_INSERTSTUDENT(
        IN_studentId varchar(4),
        IN_studentName varchar(100) ,
        IN_birthday date,
        IN_gender bit,
        IN_address text,
        IN_phoneNumber varchar(45)
    )
    begin
        insert into student(studentId, studentName, birthday, gender, address, phoneNumber)
            value (IN_studentId,IN_studentName,IN_birthday,IN_gender,IN_address,IN_phoneNumber);
    end //
    delimiter ;

#Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học.

    delimiter //
    create procedure PROC_UPDATESUBJECT(
        IN_subjectId VARCHAR(4),
        IN_subjectName VARCHAR(45)
    )
    begin
        update subject
            set subjectName = IN_subjectName
        where subjectId = IN_subjectId;
    end //
    delimiter ;

# Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học sinh.

    delimiter //

    create procedure PROC_DELETEMARK(
        IN_studentId varchar(4)
    )
    begin
        delete from mark
            where subjectId = IN_studentId;
    end //
    delimiter ;
